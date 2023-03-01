import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../app_common_widgets/text_widget.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/styles.dart';
import '../../widgets/add_text_button_widget.dart';
import '../../widgets/comment_text.dart';

class AddProgrammesDialog extends StatefulWidget {
  const AddProgrammesDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<AddProgrammesDialog> createState() => _AddProgrammesDialogState();
}

class _AddProgrammesDialogState extends State<AddProgrammesDialog> {
  String? dropdownValue = 'Select programme coordinator';
  List<String> dropList = <String>[
    'Select programme coordinator',
    'Gerd McSlister',
    'Johan2 de Raak',
    'Juliel Solano',
    "Malik Bhai",
    "Mahammad Abbas Test"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context) * 0.7,
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
                    Expanded(
                      child: const CustomText(
                        text: "Add Programme",
                        size: 40,
                        weight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: "Upload Cover Image",
                  size: 16,
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: DottedBorder(
                    color: Colors.black38,
                    strokeWidth: 2,
                    padding: const EdgeInsets.all(30),
                    child: const Icon(
                      Icons.add,
                      size: 40,
                      color: Colors.black38,
                    ),
                  ),
                ),
              ],
            ),
          ),
          content: Container(
            padding: const EdgeInsets.all(20),
            width: getWidth(context) * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(text: "Programme Name"),
                const SizedBox(
                  height: 15,
                ),
                 TextWidgetField(),
                const SizedBox(
                  height: 15,
                ),
                const CustomText(text: "Programme Coordinator"),
                const SizedBox(
                  height: 15,
                ),
                RealDropDownWidget(
                  value: dropdownValue,
                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: dropList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomText(
                  text: "Programme Description",
                ),
                const SizedBox(
                  height: 15,
                ),
                const CommentTextField()
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
                    colors: lightBlack,
                    onPress: () {},
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AddTextButtonWidget(
                    text: "Save",
                    colors: Colors.yellow,
                    onPress: () {},
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
