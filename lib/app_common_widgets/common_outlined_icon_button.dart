import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../utils/responsive.dart';
import '../utils/styles.dart';

class CommonOutlinedIconButton extends StatelessWidget {
  final Function()? mOnPressed;
  final String mLabelText;
  final Color mButtonAndTextColor;

  const CommonOutlinedIconButton({
    Key? key,
    required this.mOnPressed,
    required this.mLabelText,
    required this.mButtonAndTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: OutlinedButton.icon(
        onPressed: mOnPressed,
        style: OutlinedButton.styleFrom(
          primary: mButtonAndTextColor,
          side: BorderSide(
            width: 1,
            color: mButtonAndTextColor,
          ),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              width: 1,
              color: mButtonAndTextColor,
            ),
          ),
        ),
        icon: Icon(
          Icons.add,
          color: mButtonAndTextColor,
          size: 15,
        ),
        label: Text(
          mLabelText,
          style: TextStyle(
            color: mButtonAndTextColor,
            fontSize: !Responsive.isDesktop(context) ? 14 : 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: Montserrat_Medium,
          ),
        ),
      ),
    );
  }
}
