import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/app_common_widgets/on_hover.dart';

import '../utils/responsive.dart';
import '../utils/styles.dart';

class CommonElevatedButton extends StatelessWidget {
  final Function()? mOnTap;
  final String? mButtonText;
  final Color? mButtonColor;

  const CommonElevatedButton({
    Key? key,
    required this.mOnTap,
     this.mButtonText,
     this.mButtonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnHover(
      builder: (hover) {
        return SizedBox(
          height: 44,
          child: ElevatedButton(
            onPressed: mOnTap,
            style: ElevatedButton.styleFrom(
              primary: hover ? lightGreen : mButtonColor,
              elevation: hover ? 2 : 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Center(
              child: Text(
                mButtonText!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Responsive.isDesktop(context) ? 14 : 12,
                  fontWeight: FontWeight.w700,
                  color: hover ? Colors.white : dark,
                  fontFamily: Montserrat_Medium,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
