import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/widget/empty_widget.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/text_widget.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../app_common_widgets/counter_widget.dart';
import '../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../utils/responsive.dart';
import '../../../../../office/widgets/add_text_button_widget.dart';
import '../Widget/chnage_icon_text.dart';
import '../Widget/general_drop_widget.dart';

class ParcelPlantWidget extends StatefulWidget {
  const ParcelPlantWidget({Key? key}) : super(key: key);

  @override
  State<ParcelPlantWidget> createState() => _ParcelPlantWidgetState();
}

class _ParcelPlantWidgetState extends State<ParcelPlantWidget> {
  String? problems = "(y/n)";
  List<String> problemsList = <String>[
    "(y/n)",
    "Yes",
    "No",
  ];
  String? yields = "Select";
  List<String> yieldsList = <String>[
    "Select",
    ">10",
    "8-10",
    "<8",
  ];
  String? grassland = "(y/n)";
  List<String> grasslandList = <String>[
    "(y/n)",
    "Yes",
    "No",
  ];
  bool onclicked = false;
  int countFisrt = 0;
  int counterSecond = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(25),
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  onclicked
                      ? AddTextButtonWidget(
                          text: "Cancel",
                          colors: Colors.white,
                          onPress: () {
                            setState(() {
                              onclicked = !onclicked;
                            });
                          },
                        )
                      : Container(),
                  SizedBox(
                    width: 20,
                  ),
                  ChangeIconTextButton(
                    icon: onclicked ? Icons.save : Icons.edit_note,
                    text: onclicked ? "Save" : "Edit",
                    colors: onclicked ? Colors.yellowAccent : Colors.white,
                    onPress: () {
                      setState(() {
                        onclicked = !onclicked;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: !Responsive.isDesktop(context)
                  ? getWidth(context)
                  : getWidth(context) / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text:
                          "On which % of the parcel grows Engels Raai grass?"),
                  onclicked
                      ? CounterWidget(
                          count: countFisrt,
                          onAddTap: () {
                            setState(() {
                              countFisrt++;
                            });
                          },
                          onCloseTap: () {
                            setState(() {
                              countFisrt--;
                            });
                          },
                        )
                      : EmptyWidget(),
                  SizedBox(
                    height: 25,
                  ),
                  CustomText(
                      text:
                          "Which % of the parcel is herbrich? (15 herbrich plants (incl. grasses.) / 10 herbs, non grass)"),
                  onclicked
                      ? CounterWidget(
                          count: counterSecond,
                          onAddTap: () {
                            setState(() {
                              counterSecond++;
                            });
                          },
                          onCloseTap: () {
                            setState(() {
                              counterSecond--;
                            });
                          },
                        )
                      : EmptyWidget(),
                  SizedBox(
                    height: 25,
                  ),
                  CustomText(
                      text:
                          "Are there problems related to unwanted plants on this parcel? (y/n)"),
                  onclicked
                      ? RealDropDownWidget(
                          value: problems,
                          onChanged: (newValue) {
                            setState(() {
                              problems = newValue;
                            });
                          },
                          items: problemsList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                                value: value, child: Text(value));
                          }).toList(),
                        )
                      : GeneralDropWidget(
                          text: "(y/n)",
                        ),
                  SizedBox(
                    height: 25,
                  ),
                  CustomText(
                      text:
                          "What is the yield of parcel? (tonnes of dry matter)"),
                  onclicked
                      ? RealDropDownWidget(
                          value: yields,
                          onChanged: (newValue) {
                            setState(() {
                              yields = newValue;
                            });
                          },
                          items: yieldsList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                                value: value, child: Text(value));
                          }).toList(),
                        )
                      : GeneralDropWidget(
                          text: "Select",
                        ),
                  SizedBox(
                    height: 25,
                  ),
                  CustomText(text: "Do you tear the grassland?"),
                  onclicked
                      ? RealDropDownWidget(
                          value: grassland,
                          onChanged: (newValue) {
                            setState(() {
                              grassland = newValue;
                            });
                          },
                          items: grasslandList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                                value: value, child: Text(value));
                          }).toList(),
                        )
                      : GeneralDropWidget(
                          text: "(y/n)",
                        ),
                  SizedBox(
                    height: 25,
                  ),
                  CustomText(text: "Comment about crop?"),
                  onclicked ? TextWidgetField() : EmptyWidget(),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
