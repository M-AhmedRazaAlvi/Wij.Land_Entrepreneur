import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/text_widget.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../office/widgets/add_text_button_widget.dart';

class ParcelGroupDialog extends StatelessWidget {
  final String submitText;
  const ParcelGroupDialog({
    Key? key, required this.submitText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: getHeight(context) / 4,
      child: AlertDialog(
        alignment: Alignment.topLeft,
        title: Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.close,
              size: 30,
            ),
          ),
        ),
        content: SizedBox(
          height: getHeight(context) / 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              CustomText(text: "Group Name"),
              SizedBox(
                height: 15,
              ),
              TextWidgetField(),
            ],
          ),
        ),
        actions: [
          Center(
            child: AddTextButtonWidget(
              text: submitText,
              colors: Colors.yellow,
              onPress: () {
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
