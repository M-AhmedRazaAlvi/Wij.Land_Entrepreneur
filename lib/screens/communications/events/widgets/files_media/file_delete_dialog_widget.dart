import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../office/widgets/add_text_button_widget.dart';

class DeleteFileDialogWidget extends StatefulWidget {
  const DeleteFileDialogWidget({Key? key}) : super(key: key);

  @override
  State<DeleteFileDialogWidget> createState() => _DeleteFileDialogWidgetState();
}

class _DeleteFileDialogWidgetState extends State<DeleteFileDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
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
                      text: "Delete",
                      size: 26,
                      weight: FontWeight.bold,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.solidTrashAlt,
                      size: 24,
                      color: Color(0xff3c4b64),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Flexible(
                      child: Text('Are you sure you would like to delete this?',
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff3c4b64),
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AddTextButtonWidget(
                    text: "No, do not delete",
                    colors: Color(0xfff2f2f2),
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  AddTextButtonWidget(
                    text: "Yes, Delete",
                    colors: Colors.yellow,
                    onPress: () {},
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
