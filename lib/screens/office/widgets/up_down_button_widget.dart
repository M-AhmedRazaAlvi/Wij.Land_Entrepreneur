// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

import '../../../app_common_widgets/on_hover.dart';
import '../../../utils/styles.dart';

class UpDownButtonWidget extends StatelessWidget {
  const UpDownButtonWidget({
    Key? key,
    required this.upDownIcon,
    required this.onPressed,
  }) : super(key: key);

  final bool upDownIcon;
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return OnHover(
        builder: (hover) => ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[100],
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20),),
            onPressed: onPressed,
            child: Icon(upDownIcon ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down)));
  }
}
