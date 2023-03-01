import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CommonOutlinedButton extends StatelessWidget {
  final Function()? mOnPressed;
  final String mLabelText;
  final Color mButtonColor, mTextColor;

  const CommonOutlinedButton({Key? key, required this.mOnPressed, required this.mLabelText, required this.mButtonColor, required this.mTextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: OutlinedButton(
        onPressed: mOnPressed,
        child: Text(
          mLabelText,
          style:TextStyle(
            color: mTextColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: Montserrat_Medium,
          ),
        ).tr(),
        style: OutlinedButton.styleFrom(
          primary: mButtonColor,
          side: BorderSide(
            width: 0.5,
            color: mButtonColor,
          ),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              width: 0.5,
              color: mButtonColor,
            ),
          ),
        ),
      ),
    );
  }
}
