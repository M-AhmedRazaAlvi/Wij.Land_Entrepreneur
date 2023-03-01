import 'package:flutter/material.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../../app_common_widgets/on_hover.dart';
import '../../../../utils/hex_color.dart';
import '../../../../utils/responsive.dart';

class EventGoingButton extends StatelessWidget {
  final String text;
  final backColor;
  final textColor;
  final onTap;

  const EventGoingButton({
    Key? key,
    required this.text,
    this.backColor = Colors.transparent,
    this.textColor = Colors.black,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnHover(
      builder: (hover) {
        return SizedBox(
          height: getHeight(context)*0.03,
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              primary:hover ? lightGreen : backColor,
              elevation: hover ? 2 : 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color:hover ?lightGreen: darkGrey),
                borderRadius: BorderRadius.circular(Responsive.isDesktop(context) ? 10 : 7),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Responsive.isMobile(context) ? 8 : 14,
                color: hover ? Colors.white : textColor,
                fontFamily: Montserrat_Medium,
              ),
            ),
          ),
        );
      },
    );
  }
}
