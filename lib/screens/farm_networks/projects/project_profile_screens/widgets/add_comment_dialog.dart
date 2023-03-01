import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../office/widgets/add_text_button_widget.dart';
import '../../../../office/widgets/comment_text.dart';

class AddCommentDialog extends StatefulWidget {
  const AddCommentDialog({Key? key}) : super(key: key);

  @override
  State<AddCommentDialog> createState() => _AddCommentDialogState();
}

class _AddCommentDialogState extends State<AddCommentDialog> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: AlertDialog(
        title: Container(
            child: Row(
          children:const [
            CustomText(
              text: "Delfs Blue: Participation\n Comment",
              size: 20,
              weight: FontWeight.bold,
            ),
           
          ],
        )),
        content: Container(child: CommentTextField(),),
        actions: [
          Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
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
        ],
      ),
    );
  }
}
