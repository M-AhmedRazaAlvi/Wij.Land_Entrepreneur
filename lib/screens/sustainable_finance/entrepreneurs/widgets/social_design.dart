import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../app_common_widgets/common_text_form_field_widget.dart';

class SocialDesign extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final TextEditingController textController;

  const SocialDesign(
      {Key? key,
      required this.icon,
      required this.iconColor,
      required this.textController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(
          icon,
          color: iconColor,
          size: 35,
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: CommonTextFormFieldWidget(
            mTextEditingController: textController,
            isObscureText: false,
            mKeyboardType: TextInputType.url,
            mIsEnabled: true,
          ),
        ),
      ],
    );
  }
}
