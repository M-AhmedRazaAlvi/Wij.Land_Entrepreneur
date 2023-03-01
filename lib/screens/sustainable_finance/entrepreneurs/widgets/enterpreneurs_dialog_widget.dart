import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/widgets/add_enterpreneurs_dialog_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/widgets/details_enterpreneurs_dialog_widget.dart';

import '../../../../providers/entrepreneur/entrepreneur_screen_provider.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import 'organization_selection_dialog_widget.dart';

class EntrepreneursDialogWidget extends StatefulWidget {
  final bool isUpdate;
  final int mEntrepreneurID;

  const EntrepreneursDialogWidget({
    Key? key,
    required this.isUpdate,
    required this.mEntrepreneurID,
  }) : super(key: key);

  @override
  State<EntrepreneursDialogWidget> createState() => _EntrepreneursDialogWidgetState();
}

class _EntrepreneursDialogWidgetState extends State<EntrepreneursDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurScreenProvider>(
      builder: (context, _provider, widget) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.35,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flex(
                    direction: !Responsive.isDesktop(context) ? Axis.vertical : Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            fixedSize: Size(230, 40),
                            backgroundColor: _provider.titleClick[0] ? Color(0xffF2F2F2) : Colors.transparent,
                          ),
                          onPressed: () {
                            setState(() {
                              _provider.updateTitleClick(
                                firstTitleClicked: true,
                                secondTitleClicked: false,
                              );
                            });
                            selectedFirst.value = true;
                          },
                          child: Text(
                            "Enterprise Basics".tr(),

                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: Montserrat_Medium,
                              fontWeight: _provider.titleClick[0] ? FontWeight.bold : FontWeight.normal,
                              color: _provider.titleClick[0] ? Color(0xff231f20) : Color(0xff333333),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: !Responsive.isDesktop(context) ? 6 : 12,
                        height: !Responsive.isDesktop(context) ? 6 : 12,
                      ),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              _provider.updateTitleClick(
                                firstTitleClicked: false,
                                secondTitleClicked: true,
                              );
                            });
                            selectedFirst.value = false;
                          },
                          style: OutlinedButton.styleFrom(
                            fixedSize: Size(230, 40),
                            backgroundColor: _provider.titleClick[1] ? Color(0xffF2F2F2) : Colors.transparent,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Text(
                              "Enterprise Details".tr(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: Montserrat_Medium,
                                fontWeight: _provider.titleClick[1] ? FontWeight.bold : FontWeight.normal,
                                color: _provider.titleClick[1] ? Color(0xff231f20) : Color(0xff333333),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  _provider.titleClick[0] ? AddEnterpriseDialogWidget() : DetailsEnterpriseDialogWidget(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
