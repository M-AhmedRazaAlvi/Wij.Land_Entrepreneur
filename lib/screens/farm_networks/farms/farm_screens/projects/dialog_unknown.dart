import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/real_date_picker.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../office/widgets/add_text_button_widget.dart';
import '../../../../office/widgets/comment_text.dart';


class DialogUnknownBox extends StatefulWidget {
  const DialogUnknownBox({Key? key}) : super(key: key);

  @override
  State<DialogUnknownBox> createState() => _DialogUnknownBoxState();
}

class _DialogUnknownBoxState extends State<DialogUnknownBox> {
  String? projectResponsible = 'Select Person';
  List<String> projectResponsibleList = <String>[
    'Select Person',
    "No results found",
  ];
  String? participation = 'Select Participation status';
  List<String> participationList = <String>[
    'Select Participation status',
    "Active Participation",
    "Not Participating",
    "No Longer Active",
    "Project Finished",
    "Unknown",
  ];
  String? interest = 'Select Interested status';
  List<String> interestList = <String>[
    'Select Interested status',
    "Interested",
    "Not Interested",
    "Doing Independently, interested in working with Wij.land",
    "Doing Independently,not interested in working with Wij.land",
    "Unknown",
  ];

  final TextEditingController fName = TextEditingController(),
      date = TextEditingController(),
      startDate = TextEditingController(),
      endDate = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    date.dispose();
    startDate.dispose();
    endDate.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SingleChildScrollView(
        child: AlertDialog(
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Edit Project Status",
                  size: !Responsive.isDesktop(context) ? 20 : 30,
                  weight: FontWeight.bold,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    size: !Responsive.isDesktop(context) ? 20 : 30,
                  ),
                ),
              ],
            ),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(text: "Arable", weight: FontWeight.bold),
                const SizedBox(
                  height: 30,
                ),
                Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    SizedBox(
                      width: !Responsive.isDesktop(context)
                          ? getWidth(context)
                          : getWidth(context) / 2.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            spacing: 20,
                            runSpacing: 10,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              CustomText(text: "Start Date"),
                              SizedBox(
                                width: !Responsive.isDesktop(context)
                                    ? getWidth(context)
                                    : getWidth(context) / 3.7,
                                child: RealDatePickerWidget(
                                    dateController: startDate),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Wrap(
                            spacing: 20,
                            runSpacing: 10,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              CustomText(text: "End Date  "),
                              SizedBox(
                                width: !Responsive.isDesktop(context)
                                    ? getWidth(context)
                                    : getWidth(context) / 3.7,
                                child: RealDatePickerWidget(
                                    dateController: endDate),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: !Responsive.isDesktop(context)
                          ? getWidth(context)
                          : getWidth(context) / 2.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: "Project Responsible"),
                          SizedBox(
                            height: 10,
                          ),
                          RealDropDownWidget(
                            value: projectResponsible,
                            onChanged: (newValue) {
                              setState(() {
                                projectResponsible = newValue;
                              });
                            },
                            items: projectResponsibleList
                                .map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem<String>(
                                    value: value, child: Text(value));
                              },
                            ).toList(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Divider(thickness: 1, color: Colors.black26),
                const SizedBox(
                  height: 15,
                ),
                CustomText(text: "Participation Status"),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: !Responsive.isDesktop(context)
                      ? getWidth(context)
                      : getWidth(context) / 3,
                  child: RealDropDownWidget(
                    value: participation,
                    onChanged: (newValue) {
                      setState(() {
                        participation = newValue;
                      });
                    },
                    items: participationList.map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      },
                    ).toList(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Divider(thickness: 1, color: Colors.black26),
                const SizedBox(
                  height: 15,
                ),
                CustomText(text: "Interest Status"),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: !Responsive.isDesktop(context)
                      ? getWidth(context)
                      : getWidth(context) / 3,
                  child: RealDropDownWidget(
                    value: interest,
                    onChanged: (newValue) {
                      setState(() {
                        interest = newValue;
                      });
                    },
                    items: interestList.map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      },
                    ).toList(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomText(text: "Comment"),
                const SizedBox(height: 10),
                CommentTextField(),
              ],
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Row(
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
                    text: "Update",
                    colors: Colors.yellow,
                    onPress: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
