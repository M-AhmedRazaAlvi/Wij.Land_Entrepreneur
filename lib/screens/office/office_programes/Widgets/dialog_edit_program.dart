import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../app_common_widgets/text_widget.dart';
import '../../../../utils/images.dart';
import '../../../../utils/styles.dart';
import '../../widgets/add_text_button_widget.dart';
import '../../widgets/comment_text.dart';

class EditProgrammeDialog extends StatefulWidget {
  const EditProgrammeDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<EditProgrammeDialog> createState() => _EditProgrammeDialogState();
}

class _EditProgrammeDialogState extends State<EditProgrammeDialog> {
  final TextEditingController fName = TextEditingController(),
      comment = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    comment.dispose();
  }

  String? programmCoordinate = 'Select programme coordinator';
  List<String> programmCoordinateList = <String>[
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
      width: MediaQuery.of(context).size.width,
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
                          child: CustomText(
                            text: "Edit programme",
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
                  ])),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const CustomText(
                  text: "Corrent Cover Image",
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 150,
                  width: 120,
                  child: Image(
                    image: AssetImage(Images.wallpaper),
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomText(
                  text: "Upload Cover Image",
                ),
                const SizedBox(
                  height: 15,
                ),
                DottedBorder(
                  color: Colors.black38,
                  strokeWidth: 2,
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
                  child: const Icon(
                    Icons.add,
                    size: 40,
                    color: Colors.black38,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                const CustomText(text: "Programme Name"),
                const SizedBox(
                  height: 15,
                ),
                TextWidgetField(
                    // controller: fName,
                    ),
                const SizedBox(
                  height: 15,
                ),
                const CustomText(text: "Programme Coordinator"),
                const SizedBox(
                  height: 15,
                ),
                RealDropDownWidget(
                  value: programmCoordinate,
                  onChanged: (newValue) {
                    setState(() {
                      programmCoordinate = newValue;
                    });
                  },
                  items: programmCoordinateList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
                const SizedBox(height: 15),
                const CustomText(text: "Programme Description"),
                const SizedBox(
                  height: 15,
                ),
                CommentTextField(
                  controller: comment,
                ),
                const SizedBox(
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
                    colors: lightBlack,
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AddTextButtonWidget(
                    text: "Upload",
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
