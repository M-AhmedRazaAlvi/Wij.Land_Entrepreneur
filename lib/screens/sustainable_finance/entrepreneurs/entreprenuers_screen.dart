import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:wij_land/app_common_widgets/large_screen.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/controllers/entrepreneurDropdownProvider.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/widgets/entreprenuer_large_screen_widget.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../providers/entrepreneur/entrepreneur_screen_provider.dart';
import '../../../utils/hex_color.dart';

EntrepreneurDropdownProvider? AllDropdown;

class EntrepreneurScreen extends StatefulWidget {
  const EntrepreneurScreen({Key? key}) : super(key: key);

  @override
  State<EntrepreneurScreen> createState() => _EntrepreneurScreenState();
}

class _EntrepreneurScreenState extends State<EntrepreneurScreen> {
  @override
  void initState() {
    callDropDownsFunctions();
    super.initState();
  }

  bool? load = false;
  callDropDownsFunctions() async {
    AllDropdown = EntrepreneurDropdownProvider();
    AllDropdown!.getAllDropDown();
    var mEntrepreneurScreenProvider = Provider.of<EntrepreneurScreenProvider>(context, listen: false);
    mEntrepreneurScreenProvider.isFIlePicked = false;
    await mEntrepreneurScreenProvider.getEntrepreneur(false);
    load = true;
    setState(() {});
    await mEntrepreneurScreenProvider.getProjectsDropDownData();
    await mEntrepreneurScreenProvider.getRelationToWijLandDropDownData();
    await mEntrepreneurScreenProvider.getLegalStructureDropDownData();
    await mEntrepreneurScreenProvider.getProductsDropDownData();
    await mEntrepreneurScreenProvider.getFocusAreaDropDownData();
    await mEntrepreneurScreenProvider.getEntrepreneurRelationToWijLandDropDownData();
    await mEntrepreneurScreenProvider.getOrganizationsDropDownData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurScreenProvider>(
      builder: (context, _provider, widget) {
        return Title(
          title: "Entrepreneurs".tr(),
          color: Colors.black,
          child: VisibilityDetector(
            key: Key('EntrepreneurScreen-key'),
            onVisibilityChanged: (visibilityInfo) {
              var visiblePercentage = visibilityInfo.visibleFraction * 100;
              if (visiblePercentage > 50) {
                global_entitiy.value = [
                  Text(
                    'Entrepreneurs'.tr(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: darkRed,fontFamily: Montserrat_Medium),
                  ),
                ];
              }
            },
            child: Scaffold(
              backgroundColor: HexColor("#F3F6F9"),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: EntrepreneurLargeScreenWidget(model: _provider.mEntrepreneurData, loadWidget: load),
              ),
            ),
          ),
        );
      },
    );
  }
}
