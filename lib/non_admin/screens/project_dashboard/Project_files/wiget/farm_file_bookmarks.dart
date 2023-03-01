import 'package:flutter/material.dart';
import 'package:wij_land/utils/responsive.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/styles.dart';

class FarmFileBookMarksWidget extends StatelessWidget {
  final String text;
  final onTap;
  final bgColors;
  final textColor;
  final iconColor;

  const FarmFileBookMarksWidget({
    Key? key,
    required this.text,
    this.onTap,
    this.bgColors,
    this.textColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? 12 : 23, vertical: Responsive.isMobile(context) ? 8 : 12),
        decoration: BoxDecoration(
          color: bgColors,
          border: Border.all(color: darkGreen),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Wrap(
          spacing: Responsive.isMobile(context)
              ? 5
              : Responsive.isTablet(context)
                  ? 10
                  : 15,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Image.asset(IconImages.vectorIcon,
                width: Responsive.isMobile(context)
                    ? 7
                    : Responsive.isTablet(context)
                        ? 9
                        : 10,
                height: Responsive.isMobile(context)
                    ? 10
                    : Responsive.isTablet(context)
                        ? 12
                        : 16,
                color: iconColor),
            CustomText(
              textAligns: TextAlign.left,
              text: text,
              color: textColor,
              size: Responsive.isMobile(context)
                  ? 8
                  : Responsive.isTablet(context)
                      ? 12
                      : 14,
            ),
          ],
        ),
      ),
    );
  }
}
