import 'package:flutter/material.dart';

import '../../../app_common_widgets/custom_text.dart';
import '../../../app_common_widgets/text_widget.dart';

class TitleTextFieldWidget extends StatelessWidget {
  const TitleTextFieldWidget({
    Key? key,
    required this.title,
    required this.textEditingController,
    this.enabled,
    this.hintText,
  }) : super(key: key);
  final String title;
  final TextEditingController textEditingController;
  final bool? enabled;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          CustomText(
            text: title,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 55,
            child: TextWidgetField(
              controller: textEditingController,
              enabled: enabled,
              hintText: hintText,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
