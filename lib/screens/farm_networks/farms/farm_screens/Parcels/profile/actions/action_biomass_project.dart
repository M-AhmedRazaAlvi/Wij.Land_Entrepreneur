import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/icon_text_container.dart';
import '../../../../../../../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../../../../../../../app_common_widgets/text_widget.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../../../../../app_common_widgets/counter_widget.dart';
import '../../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../office/widgets/add_text_button_widget.dart';
import '../../../../../../office/widgets/comment_text.dart';

class ActionBiomassProject extends StatefulWidget {
  const ActionBiomassProject({Key? key}) : super(key: key);

  @override
  State<ActionBiomassProject> createState() => _ActionBiomassProjectState();
}

class _ActionBiomassProjectState extends State<ActionBiomassProject> {
  final TextEditingController date = TextEditingController();

  List<String> actionList = [
    "Amber Lemming ",
    "Arjun Milan",
    "Bob Martin",
  ];
  String? farms = 'Farm of Iona';
  List<String> farmList = [
    'Farm of Iona',
    'Farm of noone',
    'Farm of zikry',
    'Farm of tan',
  ];
  String? season = 'Fall';
  List<String> seasonList = [
    'Fall',
    'Autumn',
    'Spring',
    'Winter',
  ];
  int countLatitude = 0;
  int countLongitude = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: CustomText(
              text: "Biomass Project / Making Bokashi",
              size: 25,
              weight: FontWeight.bold,
              color: third,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AddTextButtonWidget(
                text: "Cancel",
                colors: Colors.white,
                onPress: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                width: 10,
              ),
              AddTextButtonWidget(
                text: "Save",
                colors: Colors.yellow,
                onPress: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: getWidth(context),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 20,
              children: [
                SizedBox(
                  width: !Responsive.isDesktop(context)
                      ? getWidth(context)
                      : getWidth(context) * 0.47,
                  child: Column(
                    children: [
                      Card(
                        elevation: 3,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CustomText(
                                text: "Location",
                                size: 25,
                                color: darkBlue,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomText(
                                text: "Farm/Organizations",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RealDropDownWidget(
                                value: farms,
                                onChanged: (newValue) {
                                  setState(() {
                                    farms = newValue;
                                  });
                                },
                                items: farmList.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                      value: value, child: Text(value));
                                }).toList(),
                              ),
                              SizedBox(height: 15),
                              Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: !Responsive.isDesktop(context)
                                        ? getWidth(context) / 2.5
                                        : getWidth(context) / 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(text: "Latitude"),
                                        CounterWidget(
                                          count: countLatitude,
                                          onAddTap: () {
                                            setState(() {
                                              countLatitude++;
                                            });
                                          },
                                          onCloseTap: () {
                                            setState(() {
                                              countLatitude--;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: !Responsive.isDesktop(context)
                                        ? getWidth(context) / 2.5
                                        : getWidth(context) / 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(text: "Longitude"),
                                        CounterWidget(
                                          count: countLongitude,
                                          onAddTap: () {
                                            setState(() {
                                              countLongitude++;
                                            });
                                          },
                                          onCloseTap: () {
                                            setState(() {
                                              countLongitude--;
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                CustomText(
                                  text: "General Information",
                                  size: 25,
                                  color: darkBlue,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SelectableDropdownWidget(
                                  items: actionList,
                                  title: "Action done by",
                                  mSelectedValue: "",
                                  mOnDropDownChange: (value) {},
                                  mSelectedItemsList: [],
                                ),
                                SizedBox(height: 10),
                                CustomText(text: "Date of Action"),
                                SizedBox(height: 10),
                                RealDatePickerWidget(date: date),
                                SizedBox(height: 10),
                                CustomText(
                                  text: "Done In season",
                                ),
                                SizedBox(height: 5),
                                RealDropDownWidget(
                                  value: season,
                                  onChanged: (newValue) {
                                    setState(() {
                                      season = newValue;
                                    });
                                  },
                                  items: seasonList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                        value: value, child: Text(value));
                                  }).toList(),
                                ),
                                SizedBox(height: 10),
                                CustomText(text: "Method Description"),
                                SizedBox(height: 10),
                                CommentTextField(),
                                SizedBox(height: 10),
                                CustomText(text: "Method Description"),
                                SizedBox(height: 10),
                                CommentTextField(),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: !Responsive.isDesktop(context)
                      ? getWidth(context)
                      : getWidth(context) * 0.47,
                  child: Column(
                    children: [
                      Card(
                          child: Container(
                              alignment: Alignment.center,
                              width: getWidth(context),
                              padding: EdgeInsets.all(15),
                              height: 300,
                              child: CustomText(text: "Map"))),
                      Card(
                          child: Container(
                        width: getWidth(context),
                        height: 300,
                        padding: EdgeInsets.all(15),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 20,
                              right: 10,
                              child: IconAndTextContainer(
                                  onTap: () {}, addText: "Photo"),
                            ),
                            CustomText(
                              text: "Pictures",
                              size: 20,
                              color: darkBlue,
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    ));
  }
}

class RealDatePickerWidget extends StatefulWidget {
  const RealDatePickerWidget({
    Key? key,
    required this.date,
  }) : super(key: key);

  final TextEditingController date;

  @override
  State<RealDatePickerWidget> createState() => _RealDatePickerWidgetState();
}

class _RealDatePickerWidgetState extends State<RealDatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2001),
                lastDate: DateTime(2023))
            .then((d) {
          debugPrint("$d");
          if (d != null) {
            setState(() {
              widget.date.text = d.toString().split(" ")[0];
            });
          }
        });
      },
      child: TextWidgetField(
        controller: widget.date,
        enabled: false,
        suffixIcon: Icon(Icons.calendar_today),
      ),
    );
  }
}
