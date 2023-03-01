import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hovering/hovering.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/overview/widgets/overview_large_screen_widget.dart';

import '../../../../app_common_widgets/large_screen.dart';
import '../../../../providers/entrepreneur/entrepreneur_screen_overview_provider.dart';
import '../../../../utils/styles.dart';

EntrepreneurOverviewScreenProvider? overviewScreenProvider;

class OverviewScreen extends StatefulWidget {
  final aurguments;

  const OverviewScreen({Key? key, this.aurguments}) : super(key: key);

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  void initState() {
    getinitData();
    super.initState();
  }

  Future getinitData() async {
    overviewScreenProvider = Provider.of<EntrepreneurOverviewScreenProvider>(context, listen: false);
    overviewScreenProvider!.getEntrepreneurRelationToWijLandDropDownData();
    overviewScreenProvider!.getPersonsDropDownData();
    overviewScreenProvider!.getOrganizationPerson(id: widget.aurguments["id"]);
    overviewScreenProvider!.getProjectsList();
    overviewScreenProvider!.getRelationToWijLandDropDownData();
    overviewScreenProvider!.getLegalStructureDropDownData();
    overviewScreenProvider!.getProductsList();
    overviewScreenProvider!.getFocusAreaDropDownData();
    overviewScreenProvider!.getOverviewData(
      widget.aurguments["id"],
      true,
      comingFromInitState: true,
    );
    overviewScreenProvider!.isFIlePicked = false;
    // mProvider.getOrganizationsDropDownData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurOverviewScreenProvider>(
      builder: (context, _provider, widget) {
        return Scaffold(
          body: Obx(
            () => _provider.showLoadingWidget.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Title(
                    title: '${_provider.detailsResponse.data!.entrepreneurName}',
                    color: Colors.black,
                    child: VisibilityDetector(
                      key: Key('OverviewScreen-key'),
                      onVisibilityChanged: (visibilityInfo) {
                        var visiblePercentage = visibilityInfo.visibleFraction * 100;
                        if (visiblePercentage > 50) {
                          global_entitiy.value = [
                            HoverWidget(
                              child: Text(
                                'Entrepreneurs / '.tr(),

                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: shineGrey,
                                  fontFamily: Montserrat_Medium,
                                ),
                              ),
                              hoverChild: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Entrepreneurs / '.tr(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: Montserrat_Medium,

                                    fontWeight: FontWeight.bold,
                                    color: shineGrey,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 2,
                                  ),
                                ),
                              ),
                              onHover: (event) {},
                            ),
                            Text(
                              '${_provider.detailsResponse.data!.entrepreneurName}',
                              style: TextStyle(
                                fontFamily: Montserrat_Medium,

                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: darkRed,
                              ),
                            ),
                          ];
                        }
                      },
                      child: OverviewLargeScreenWidget(
                        id: this.widget.aurguments["id"],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
