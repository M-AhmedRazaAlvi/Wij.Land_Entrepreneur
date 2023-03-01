// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';

class FarmInFoButtons extends StatelessWidget {
  final dynamic onPressed;
  final String text;
  final dynamic bgColor;
  final dynamic textColor;
  final dynamic borderColor;
  const FarmInFoButtons({
    Key? key,
    this.onPressed,
    required this.text,
    this.bgColor,
    this.textColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 15, bottom: 15),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0), side: BorderSide(color: borderColor)),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          ),
          onPressed: onPressed,
          child: CustomText(
            text: text,
            color: textColor,
            size: 14,
          )),
    );
  }
}
