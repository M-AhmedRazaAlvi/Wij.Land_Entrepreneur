import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/widget/empty_widget.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/text_widget.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../app_common_widgets/counter_widget.dart';
import '../../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../office/widgets/add_text_button_widget.dart';
import '../../Widget/chnage_icon_text.dart';
import '../../Widget/general_drop_widget.dart';

class OnManureWidget extends StatefulWidget {
  const OnManureWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<OnManureWidget> createState() => _OnManureWidgetState();
}

class _OnManureWidgetState extends State<OnManureWidget> {
  String? fertilizer = "Select";
  List<String> fertilizerList = <String>[
    "Select",
    "carbon",
    "sea salt",
    "bacteria",
    "other",
  ];

  bool onclicked = false;
  double countCow = 0;
  double countSolid = 0;
  double countSlurry = 0;
  double countNitrogen = 0;
  double countAmine = 0;
  double countUrea = 0;

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
              CustomText(
                  text:
                      "What is the total use of cow manure on this plot? (Tonnes/ha)"),
              onclicked
                  ? CounterWidget(
                      count: countCow,
                      onAddTap: () {
                        setState(() {
                          countCow++;
                        });
                      },
                      onCloseTap: () {
                        setState(() {
                          countCow--;
                        });
                      },
                    )
                  : EmptyWidget(),
              SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Row(
                    children: const [
                      Expanded(
                        flex: 3,
                        child: CustomText(
                            text:
                                "How much of it is solid or rough manure? (Tonnes/ha)"),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(flex: 1, child: CustomText(text: "( % )")),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: onclicked
                              ? CounterWidget(
                                  count: countSolid,
                                  onAddTap: () {
                                    setState(() {
                                      countSolid++;
                                    });
                                  },
                                  onCloseTap: () {
                                    setState(() {
                                      countSolid--;
                                    });
                                  },
                                )
                              : EmptyWidget()),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          flex: 1,
                          child: onclicked ? TextWidgetField() : EmptyWidget()),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Row(
                    children: const [
                      Expanded(
                        flex: 3,
                        child: CustomText(
                            text: "How much of this is slurry? (Tonnes/ha)"),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(flex: 1, child: CustomText(text: "( % )")),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: onclicked
                              ? CounterWidget(
                                  count: countSlurry,
                                  onAddTap: () {
                                    setState(() {
                                      countSlurry++;
                                    });
                                  },
                                  onCloseTap: () {
                                    setState(() {
                                      countSlurry--;
                                    });
                                  },
                                )
                              : EmptyWidget()),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          flex: 1,
                          child: onclicked ? TextWidgetField() : EmptyWidget()),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              CustomText(text: "Which fertilizer enrichment(s) do you use?"),
              onclicked
                  ? RealDropDownWidget(
                      value: fertilizer,
                      onChanged: (newValue) {
                        setState(() {
                          fertilizer = newValue;
                        });
                      },
                      items: fertilizerList
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
                      "How many kg of nitrogen does the fertilizer you use contain per hectare / year on this plot? (kg/ha/yr)"),
              onclicked
                  ? CounterWidget(
                      count: countNitrogen,
                      onAddTap: () {
                        setState(() {
                          countNitrogen++;
                        });
                      },
                      onCloseTap: () {
                        setState(() {
                          countNitrogen--;
                        });
                      },
                    )
                  : EmptyWidget(),
              SizedBox(
                height: 25,
              ),
              CustomText(
                  text: "How much of it is Amine Fertilizer? (kg/ha/yr)"),
              onclicked
                  ? CounterWidget(
                      count: countAmine,
                      onAddTap: () {
                        setState(() {
                          countAmine++;
                        });
                      },
                      onCloseTap: () {
                        setState(() {
                          countAmine--;
                        });
                      },
                    )
                  : EmptyWidget(),
              SizedBox(
                height: 25,
              ),
              CustomText(text: "How much of it is Urea? (kg/ha/yr)"),
              onclicked
                  ? CounterWidget(
                      count: countUrea,
                      onAddTap: () {
                        setState(() {
                          countUrea++;
                        });
                      },
                      onCloseTap: () {
                        setState(() {
                          countUrea--;
                        });
                      },
                    )
                  : EmptyWidget(),
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
