import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../office/widgets/add_text_button_widget.dart';

class DeleteAnecdotesDialogWidget extends StatefulWidget {
  const DeleteAnecdotesDialogWidget({Key? key}) : super(key: key);

  @override
  State<DeleteAnecdotesDialogWidget> createState() =>
      _DeleteAnecdotesDialogWidgetState();
}

class _DeleteAnecdotesDialogWidgetState
    extends State<DeleteAnecdotesDialogWidget> {
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
                        size: 40,
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
                    Icon(
                      Icons.delete_rounded,
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
                    colors: Colors.black12,
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
