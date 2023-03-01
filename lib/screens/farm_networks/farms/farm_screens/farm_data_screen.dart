import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_data/save_farm/save_all_farm.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_data/update_farm/all_farm_screens.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_data/update_farm/animal_farm.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_data/update_farm/boerenwijzer_farm.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_data/update_farm/general_farm.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_data/update_farm/grazing_farm.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_data/update_farm/management_farm.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_data/update_farm/manure_farm.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_data/update_farm/plant_farm.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/icon_text_container.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../../app_common_widgets/animated_search.dart';
import '../../../contacts/widgets/popup_menu_button.dart';
import 'farm_data/update_farm/soil_farm.dart';

class FarmDataScreen extends StatefulWidget {
  const FarmDataScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FarmDataScreen> createState() => _FarmDataScreenState();
}

class _FarmDataScreenState extends State<FarmDataScreen> {
  List<dynamic> cardColor = <dynamic>[
    Colors.lightBlue,
    Colors.green,
    Colors.lightBlue,
    Colors.red,
    Colors.lightBlue,
  ];
  List<String> cardTitleList = <String>["0", "", "", "", ""];
  List<String> cardSubTitleList = <String>[
    "ACTIVE PROJECTS",
    "ACTIVE IN PROJECT SINCE",
    "MOST RECENT CONTACT MOMENT",
    "MOST RECENT ACTION",
    "ENGAGEMENT YEAR"
  ];
  List<String> titleFarmButtonList = <String>[
    "All",
    "General",
    "Soil",
    "Manure",
    "Animal",
    "Grazing & Mowing",
    "Management",
    "Plant",
    "Boerenwijzer"
  ];
  List<bool> titelBool = <bool>[];

  @override
  void initState() {
    super.initState();
    titelBool = List.filled(9, false);
    titelBool[0] = true;
  }

  final bool checkedValue = false;

  bool clickUpdate = false;
  bool checkAll = false;
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: CustomText(
                text: "Wij.land Involvements",
                size: 18,
                color: darkBlue,
                weight: FontWeight.bold,
              ),
            ),
            Container(
              width: getWidth(context),
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Wrap(
                children: [
                  for (int i = 0; i < 5; i++)
                    Container(
                      height: 160,
                      width: !Responsive.isDesktop(context)
                          ? getWidth(context)
                          : 160,
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                      margin: EdgeInsets.only(right: 10, bottom: 10),
                      decoration: BoxDecoration(
                          color: cardColor[i],
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: cardTitleList[i],
                            color: Colors.white,
                            size: 20,
                          ),
                          CustomText(
                            text: cardSubTitleList[i],
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
            Container(
              width: getWidth(context),
              padding: EdgeInsets.all(20),
              child: Wrap(
                children: [
                  for (int i = 0; i < 9; i++)
                    Container(
                      padding: EdgeInsets.only(right: 15, bottom: 15),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: titelBool[i] == true
                              ? hoverColor
                              : Colors.grey[100],
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                color: titelBool[i] == true
                                    ? Colors.white10
                                    : Colors.black26,
                              )),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),),
                        child: CustomText(
                          text: titleFarmButtonList[i],
                          color: titelBool[i] == true
                              ? Colors.white
                              : Colors.black,
                          size: 16,
                        ),
                        onPressed: () {
                          setState(() {
                            if (clickUpdate == true) {
                              clickUpdate = false;
                            }

                            if (titelBool.contains(true)) {
                              titelBool = List.filled(9, false);
                              titelBool[i] = true;
                              clickUpdate = false;
                            } else {
                              titelBool[i] = true;
                            }
                          });
                        },
                      ),
                    )
                ],
              ),
            ),
            !Responsive.isDesktop(context)
                ? Container(
                    width: getWidth(context),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            for (int i = 0; i < 9; i++)
                              titelBool[i] == true
                                  ? CustomText(
                                      text: titleFarmButtonList[i],
                                      color: hoverColor,
                                      size: 22,
                                      weight: FontWeight.bold,
                                    )
                                  : SizedBox.shrink(),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              AnimatedSearchWidget(),
                              Wrap(
                                children: [
                                  IconAndTextContainer(
                                    addText: clickUpdate ? "Save" : "UpDate",
                                    onTap: () {
                                      setState(
                                        () {
                                          clickUpdate = !clickUpdate;
                                        },
                                      );
                                    },
                                  ),
                                  PopUpMenuButtonWidget( mOnDeleteTap: () {},)
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : Container(
                    width: getWidth(context),
                    padding: EdgeInsets.all(10),
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0; i < 9; i++)
                              titelBool[i] == true
                                  ? CustomText(
                                      text: titleFarmButtonList[i],
                                      color: hoverColor,
                                      size: 22,
                                      weight: FontWeight.bold,
                                    )
                                  : SizedBox.shrink(),
                          ],
                        ),
                        Wrap(
                          children: [
                            AnimatedSearchWidget(),
                            IconAndTextContainer(
                              addText: clickUpdate ? "Save" : "UpDate",
                              onTap: () {
                                setState(
                                  () {
                                    clickUpdate = !clickUpdate;
                                  },
                                );
                              },
                            ),
                            PopUpMenuButtonWidget( mOnDeleteTap: () {},)
                          ],
                        ),
                      ],
                    ),
                  ),
            SizedBox(
              height: 20,
            ),
            clickUpdate
                ? SaveAllFarm()
                : Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child: ListView(
                          shrinkWrap: false,
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FarmAllDataWidget(
                                first: true,
                                check: checkAll,
                                contactType: "Property",
                                contactDate: "Value",
                                peopleInvolved: "Input Date",
                                comment: "#",
                                size: !Responsive.isDesktop(context)
                                    ? getWidth(context) / 2
                                    : getWidth(context) / 3.2,
                                titleFarmButtonList: const [],
                                chekedValue: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      titelBool[0]
                          ? AllFarmWidgetScreens(
                              checkAll: checkAll,
                            )
                          : Container(),
                      titelBool[1]
                          ? GeneralFarmWidget(
                              checkAll: checkAll,
                              checkedValue: checkedValue,
                            )
                          : Container(),
                      titelBool[2]
                          ? SoilFarmWidget(
                              checkAll: checkAll,
                              checkedValue: checkedValue,
                            )
                          : Container(),
                      titelBool[3]
                          ? ManureFarmWidget(
                              checkAll: checkAll,
                              checkedValue: checkedValue,
                            )
                          : Container(),
                      titelBool[4]
                          ? AnimalFarmWidget(
                              checkAll: checkAll,
                              checkedValue: checkedValue,
                            )
                          : Container(),
                      titelBool[5]
                          ? GrazingFarmWidget(
                              checkAll: checkAll,
                              checkedValue: checkedValue,
                            )
                          : Container(),
                      titelBool[6]
                          ? ManagementFarmWidget(
                              checkAll: checkAll,
                              checkedValue: checkedValue,
                            )
                          : Container(),
                      titelBool[7]
                          ? PlantFarmWidget(
                              checkAll: checkAll,
                              checkedValue: checkedValue,
                            )
                          : Container(),
                      titelBool[8]
                          ? BoerenwijzerFarmWidget(
                              checkAll: checkAll,
                              checkedValue: checkedValue,
                            )
                          : Container(),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
