import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../office/widgets/add_text_button_widget.dart';
import '../Widget/chnage_icon_text.dart';
import '../Widget/general_drop_widget.dart';

class ParcelSoilWidget extends StatefulWidget {
  const ParcelSoilWidget({Key? key}) : super(key: key);

  @override
  State<ParcelSoilWidget> createState() => _ParcelSoilWidgetState();
}

class _ParcelSoilWidgetState extends State<ParcelSoilWidget> {
  String? soilCompose = "Select";
  List<String> soilComposeList = <String>[
    "Select",
    "pure peat",
    "peat with clay",
    "peat with sand",
    "clay",
    "other",
  ];
  String? btCaMg = "Select";
  List<String> btCaMgList = <String>[
    "Select",
    "too much",
    "too little",
    "in accepted range",
  ];
  String? soilLayer = "(y/n)";
  List<String> soilLayerList = <String>[
    "(y/n)",
    "Yes",
    "No",
  ];
  String? traceElements = "Select";
  List<String> traceElementsList = <String>[
    "Select",
    "sufficinet",
    "little",
    "too little",
    "lot too little",
  ];
  String? amountOrganisms = "Select";
  List<String> amountOrganismsList = <String>[
    "Select",
    "sufficinet",
    "average",
    "insufficinet",
  ];
  String? diversityOrganisms = "Select";
  List<String> diversityOrganismsList = <String>[
    "Select",
    "sufficinet",
    "average",
    "insufficinet",
  ];
  String? kMineral = "Select";
  List<String> kMineralList = <String>[
    "Select",
    "strong",
    "weak",
    "non",
  ];
  String? mgMineral = "Select";
  List<String> mgMineralList = <String>[
    "Select",
    "strong",
    "weak",
    "non",
  ];
  String? no3Mineral = "Select";
  List<String> no3MineralList = <String>[
    "Select",
    "strong",
    "weak",
    "non",
  ];
  String? impermeableSoil = "Select";
  List<String> impermeableSoilList = <String>[
    "Select",
    "A lot",
    "A little",
    "None",
  ];

  bool onclicked = false;

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
                      text: "What is the soil composition of this parcel ?"),
                  onclicked
                      ? RealDropDownWidget(
                          value: soilCompose,
                          onChanged: (newValue) {
                            setState(() {
                              soilCompose = newValue;
                            });
                          },
                          items: soilComposeList
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
                  CustomText(
                      text: "Is there an off balance between Ca and Mg?"),
                  onclicked
                      ? RealDropDownWidget(
                          value: btCaMg,
                          onChanged: (newValue) {
                            setState(() {
                              btCaMg = newValue;
                            });
                          },
                          items: btCaMgList
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
                  CustomText(
                      text:
                          "Is there a disturbed soil layer in the soil of this parcel?"),
                  onclicked
                      ? RealDropDownWidget(
                          value: soilLayer,
                          onChanged: (newValue) {
                            setState(() {
                              soilLayer = newValue;
                            });
                          },
                          items: soilLayerList
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
                          "Are there healthy amounts of trace elements in the soil?"),
                  onclicked
                      ? RealDropDownWidget(
                          value: traceElements,
                          onChanged: (newValue) {
                            setState(() {
                              traceElements = newValue;
                            });
                          },
                          items: traceElementsList
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
                  CustomText(
                      text: "How were the amount of soil organisms rated?"),
                  onclicked
                      ? RealDropDownWidget(
                          value: amountOrganisms,
                          onChanged: (newValue) {
                            setState(() {
                              amountOrganisms = newValue;
                            });
                          },
                          items: amountOrganismsList
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
                  CustomText(
                      text: "How was the diversity of soil organisms rated?"),
                  onclicked
                      ? RealDropDownWidget(
                          value: diversityOrganisms,
                          onChanged: (newValue) {
                            setState(() {
                              diversityOrganisms = newValue;
                            });
                          },
                          items: diversityOrganismsList
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
                  CustomText(text: "Rating stacking of K+ mineral"),
                  onclicked
                      ? RealDropDownWidget(
                          value: kMineral,
                          onChanged: (newValue) {
                            setState(() {
                              kMineral = newValue;
                            });
                          },
                          items: kMineralList
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
                  CustomText(text: "Rating stacking of Mg mineral"),
                  onclicked
                      ? RealDropDownWidget(
                          value: mgMineral,
                          onChanged: (newValue) {
                            setState(() {
                              mgMineral = newValue;
                            });
                          },
                          items: mgMineralList
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
                  CustomText(text: "Rating stacking of NO3 mineral"),
                  onclicked
                      ? RealDropDownWidget(
                          value: no3Mineral,
                          onChanged: (newValue) {
                            setState(() {
                              no3Mineral = newValue;
                            });
                          },
                          items: no3MineralList
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
                  CustomText(
                      text:
                          "Is there any nuisance because of impermeable soil?"),
                  onclicked
                      ? RealDropDownWidget(
                          value: impermeableSoil,
                          onChanged: (newValue) {
                            setState(() {
                              impermeableSoil = newValue;
                            });
                          },
                          items: impermeableSoilList
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
