import 'package:flutter/material.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../utils/styles.dart';
import '../../../../office/widgets/add_text_button_widget.dart';

class DeleteGuestDialogWidget extends StatefulWidget {
  const DeleteGuestDialogWidget({Key? key}) : super(key: key);

  @override
  State<DeleteGuestDialogWidget> createState() =>
      _DeleteGuestDialogWidgetState();
}

class _DeleteGuestDialogWidgetState extends State<DeleteGuestDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: SingleChildScrollView(
        child: AlertDialog(
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    size: 20,
                    color: Color(0xff3c4b64),
                  ),
                ),
              ],
            ),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: CustomText(
              text:
                  'Are you sure you want to delete selected internal guest(s)?(s)',
              size: 28,
              color: darkBlue,
              weight: FontWeight.w600,
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AddTextButtonWidget(
                    text: "No, do not delete",
                    colors: dimMetalic3,
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  AddTextButtonWidget(
                    text: "Yes, Delete Selected Guest(s)",
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
