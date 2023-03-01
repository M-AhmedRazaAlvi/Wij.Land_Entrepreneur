import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../office/widgets/add_text_button_widget.dart';
import '../../Widget/chnage_icon_text.dart';
import '../../Widget/general_drop_widget.dart';

class OnManagementWidget extends StatefulWidget {
  const OnManagementWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<OnManagementWidget> createState() => _OnManagementWidgetState();
}

class _OnManagementWidgetState extends State<OnManagementWidget> {
  String? raised = "(Y/n)";
  List<String> raisedList = <String>[
    "(Y/n)",
    "Yes",
    "No",
  ];
  String? waterbodies = "(Y/n)";
  List<String> waterbodiesList = <String>[
    "(Y/n)",
    "Yes",
    "No",
  ];
  String? borders = "(Y/n)";
  List<String> bordersList = <String>[
    "(Y/n)",
    "Yes",
    "No",
  ];
  String? ditchBank = "(Y/n)";
  List<String> ditchBankList = <String>[
    "(Y/n)",
    "Yes",
    "No",
  ];
  String? zone = "(Y/n)";
  List<String> zoneList = <String>[
    "(Y/n)",
    "Yes",
    "No",
  ];
  String? forest = "(Y/n)";
  List<String> forestList = <String>[
    "(Y/n)",
    "Yes",
    "No",
  ];

  String? selectTime = "Select";
  List<String> selectTimeList = <String>[
    "Select",
    "Unknown",
    "2022",
    "2021",
    "2020",
    "2019",
    "2018",
    "2017",
    "2016",
    "2015",
    "2014",
    "2013",
    "2012",
    "2011",
    "2010",
    "2009",
    "2008",
    "2007",
    "2006",
    "2005",
    "2004",
    "2003",
    "2002",
    "2001",
    "2000",
  ];
  bool onclicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              CustomText(text: "Is the water level of this farm raised? (y/n)"),
              onclicked
                  ? RealDropDownWidget(
                      value: raised,
                      onChanged: (newValue) {
                        setState(() {
                          raised = newValue;
                        });
                      },
                      items: raisedList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                    )
                  : GeneralDropWidget(
                      text: " (y/n)",
                    ),
              SizedBox(
                height: 25,
              ),
              CustomText(
                  text: "Did you restore the banks of water bodies ? (y/n)"),
              onclicked
                  ? RealDropDownWidget(
                      value: waterbodies,
                      onChanged: (newValue) {
                        setState(() {
                          waterbodies = newValue;
                        });
                      },
                      items: waterbodiesList
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
              CustomText(text: "Do you manage the parcel borders ?"),
              onclicked
                  ? RealDropDownWidget(
                      value: borders,
                      onChanged: (newValue) {
                        setState(() {
                          borders = newValue;
                        });
                      },
                      items: bordersList
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
              CustomText(text: "Do you manage the ditch banks? (y/n)"),
              onclicked
                  ? RealDropDownWidget(
                      value: ditchBank,
                      onChanged: (newValue) {
                        setState(() {
                          ditchBank = newValue;
                        });
                      },
                      items: ditchBankList
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
              CustomText(text: "Did you make a plas-dras zone on this parcel?"),
              onclicked
                  ? RealDropDownWidget(
                      value: zone,
                      onChanged: (newValue) {
                        setState(() {
                          zone = newValue;
                        });
                      },
                      items: zoneList
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
                  text: "Did you restore any local timber forests? (y/n)"),
              onclicked
                  ? RealDropDownWidget(
                      value: forest,
                      onChanged: (newValue) {
                        setState(() {
                          forest = newValue;
                        });
                      },
                      items: forestList
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
                  text: "When did you plow this parcel for the last time?"),
              onclicked
                  ? RealDropDownWidget(
                      value: selectTime,
                      onChanged: (newValue) {
                        setState(() {
                          selectTime = newValue;
                        });
                      },
                      items: selectTimeList
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
    );
  }
}
