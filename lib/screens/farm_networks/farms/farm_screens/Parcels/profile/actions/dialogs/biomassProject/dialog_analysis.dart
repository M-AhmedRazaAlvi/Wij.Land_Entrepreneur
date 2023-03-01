import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/real_date_picker.dart';
import '../../../../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../../../../app_common_widgets/text_widget.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../office/widgets/add_text_button_widget.dart';
import '../../../../../../../../office/widgets/comment_text.dart';

class DialogAddAnalysis extends StatefulWidget {
  const DialogAddAnalysis({
    Key? key,
  }) : super(key: key);

  @override
  State<DialogAddAnalysis> createState() => _DialogAddAnalysisState();
}

class _DialogAddAnalysisState extends State<DialogAddAnalysis> {
  final TextEditingController analysisdate = TextEditingController();
  String? labReceived = 'Select Organization';
  List<String> labReceivedList = [
    'Select Organization',
    'Enterprise Name',
    'Enterprise Name 3',
    'Enterprise Name 4',
    'Enterprise Name 5',
  ];
  String? tagFarm = 'Select Farm';
  List<String> tagFarmList = [
    'Select Farm',
    'Farm of',
    'Farm of 1',
    'Farm of 2',
    'Farm of 3',
  ];

  String? tagProject = 'Select Project';
  List<String> tagProjectList = [
    'Select Project',
    'aa',
    'Arable Land',
    'August Project',
  ];
  String? tagOrganization = 'Select Organization';
  List<String> tagOrganizationList = [
    'Select Organization',
    'Better Soils',
    'Enterprise Name',
    'Enterprise Name 3',
    'Enterprise Name 4',
    'Enterprise Name 5',
  ];
  String? tagEvent = 'Select Event';
  List<String> tagEventList = [
    'Select Event',
    'Aiman Far',
    'Ali Raza',
    'Another Test',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: SingleChildScrollView(
        child: AlertDialog(
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Add Analysis Result",
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
                SizedBox(
                  height: 20,
                ),
                CustomText(text: "Add File"),
                SizedBox(
                  height: 15,
                ),
                DottedBorder(
                    padding: EdgeInsets.all(50), child: Icon(Icons.add)),
              ],
            ),
          ),
          content: Container(
            width: !Responsive.isDesktop(context)
                ? getWidth(context)
                : getWidth(context) * 0.8,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: "Analysis Name"),
                SizedBox(
                  height: 10,
                ),
                TextWidgetField(),
                SizedBox(
                  height: 15,
                ),
                CustomText(text: "Analysis Code"),
                SizedBox(
                  height: 10,
                ),
                TextWidgetField(),
                SizedBox(
                  height: 15,
                ),
                CustomText(text: "Analysis Code"),
                SizedBox(
                  height: 10,
                ),
                RealDatePickerWidget(dateController: analysisdate),
                SizedBox(
                  height: 15,
                ),
                CustomText(text: "Lab Received from"),
                SizedBox(
                  height: 10,
                ),
                RealDropDownWidget(
                  value: labReceived,
                  onChanged: (newValue) {
                    setState(() {
                      labReceived = newValue;
                    });
                  },
                  items: labReceivedList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomText(text: "comment"),
                SizedBox(
                  height: 10,
                ),
                CommentTextField(),
                SizedBox(
                  height: 25,
                ),
                CustomText(
                  text: "Add Tags",
                  size: 22,
                  weight: FontWeight.bold,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(text: "These tags will apply to all files"),
                SizedBox(
                  height: 10,
                ),
                CustomText(text: "Farm"),
                RealDropDownWidget(
                  value: tagFarm,
                  onChanged: (newValue) {
                    setState(() {
                      tagFarm = newValue;
                    });
                  },
                  items:
                      tagFarmList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomText(text: "Project"),
                SizedBox(
                  height: 10,
                ),
                RealDropDownWidget(
                  value: tagProject,
                  onChanged: (newValue) {
                    setState(() {
                      tagProject = newValue;
                    });
                  },
                  items: tagProjectList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomText(text: "Organization"),
                SizedBox(
                  height: 10,
                ),
                RealDropDownWidget(
                  value: tagOrganization,
                  onChanged: (newValue) {
                    setState(() {
                      tagOrganization = newValue;
                    });
                  },
                  items: tagOrganizationList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomText(text: "Events"),
                SizedBox(
                  height: 10,
                ),
                RealDropDownWidget(
                  value: tagEvent,
                  onChanged: (newValue) {
                    setState(() {
                      tagEvent = newValue;
                    });
                  },
                  items: tagEventList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
                SizedBox(
                  height: 15,
                ),
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
                    text: "Save",
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
