import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/text_widget.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../office/widgets/add_text_button_widget.dart';
import '../../../../office/widgets/comment_text.dart';

class ParticipationStatusDialog extends StatefulWidget {
  const ParticipationStatusDialog({Key? key}) : super(key: key);

  @override
  State<ParticipationStatusDialog> createState() =>
      _ParticipationStatusDialogState();
}

class _ParticipationStatusDialogState extends State<ParticipationStatusDialog> {
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();

  String? participationStatus = 'Active Participation';
  List<String> participationStausList = [
    'Active Participation',
    'No longer Active',
    'Project Finished',
  ];
  String? intrestStatus = 'Intrested';
  List<String> intrestedStausList = [
    'Intrested',
    'Doing individually',
    'Unknown',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: getWidth(context),
        child: SingleChildScrollView(
          child: AlertDialog(
              title: Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomText(
                          text: "Edit Project Status",
                          size: 20,
                          weight: FontWeight.bold,
                          color: Colors.black),
                      SizedBox(
                        width: 200,
                      ),
                      Icon(
                        Icons.close,
                        color: Color.fromARGB(255, 102, 101, 101),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )),
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Delfs blue ",
                      size: 16,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // SizedBox(
                    //   height: 20,
                    // ),
                    Row(
                      children: [
                        CustomText(
                          text: "Start Date ",
                          size: 14,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: InkWell(
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
                                    endDate.text = d.toString().split(" ")[0];
                                  });
                                }
                              });
                            },
                            child: TextWidgetField(
                              controller: endDate,
                              enabled: false,
                              suffixIcon: Icon(Icons.calendar_today),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: "End Date ",
                          size: 14,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: InkWell(
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
                                    startDate.text = d.toString().split(" ")[0];
                                  });
                                }
                              });
                            },
                            child: TextWidgetField(
                              controller: endDate,
                              enabled: false,
                              suffixIcon: Icon(Icons.calendar_today),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Expanded(
                          child: TextWidgetField(
                            hintText: "Project Responsible",
                          ),
                        )
                      ],
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomText(text: "Participation Status"),
                    SizedBox(
                      height: 10,
                    ),
                    RealDropDownWidget(
                      value: participationStatus,
                      onChanged: (newValue) {
                        setState(() {
                          participationStatus = newValue;
                        });
                      },
                      items: participationStausList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    CustomText(text: "Interest Status"),
                    SizedBox(
                      height: 30,
                    ),

                    RealDropDownWidget(
                      value: intrestStatus,
                      onChanged: (newValue) {
                        setState(() {
                          intrestStatus = newValue;
                        });
                      },
                      items: intrestedStausList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomText(text: "Comment"),
                    CommentTextField(),
                  ]),
              actions: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AddTextButtonWidget(
                        text: "Cancel",
                        colors: Colors.white60,
                        onPress: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      AddTextButtonWidget(
                        text: "Update",
                        colors: Colors.yellow,
                        onPress: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                )
              ]),
        ));
  }
}
