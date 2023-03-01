import 'package:flutter/material.dart';
import 'package:wij_land/app_common_widgets/on_hover.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../../../utils/hex_color.dart';
import '../../../../../utils/responsive.dart';

class IconButtonWidget extends StatelessWidget {
  final Function()? mOnTap;
  final IconData mIcon;
  final bool mShowBorder;

  const IconButtonWidget({
    Key? key,
    required this.mOnTap,
    required this.mIcon,
    required this.mShowBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnHover(
      builder: (isHover) {
        return Material(
          elevation: 1,
          color: isHover ? lightGreen : Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(
                color: mShowBorder ? HexColor('#231F20') : Colors.transparent,
                width: mShowBorder ? 0.2 : 0.0,
              )),
          child: IconButton(
            onPressed: mOnTap,
            icon: Icon(
              mIcon,
              size: Responsive.isMobile(context) ? 15 : 20,
              color: isHover ? Colors.white : HexColor('#231F20'),
            ),
          ),
        );
      },
    );
  }
}
