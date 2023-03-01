import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../office/widgets/add_text_button_widget.dart';
import '../../../../office/widgets/comment_text.dart';

class DialogCommentBox extends StatelessWidget {
  const DialogCommentBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomText(
                      text: "Pear Pastures: Participation Comment",
                      size: !Responsive.isDesktop(context) ? 18 : 22,
                      weight: FontWeight.bold,
                    ),
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
                height: 10,
              ),
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
                  text: "Add Task",
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
    );
  }
}
