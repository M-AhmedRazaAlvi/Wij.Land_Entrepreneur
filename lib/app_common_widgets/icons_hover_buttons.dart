import 'package:flutter/material.dart';
import 'package:wij_land/app_common_widgets/on_hover.dart';

import '../utils/styles.dart';

class IconHoverButton extends StatelessWidget {
  final IconData icons;
  final double iconSize, widthSize;
  final Function()? onPress;
  final bool isClick;

  const IconHoverButton(
      {Key? key,
      required this.icons,
      required this.onPress,
      this.isClick = false,
      this.iconSize = 15,
      this.widthSize = 45})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnHover(
      builder: (hover) {
        return SizedBox(
          width: widthSize,
          height: 44,
          child: ElevatedButton(
            onPressed: onPress,
            style: ElevatedButton.styleFrom(
              primary: hover || isClick ? lightGreen : Colors.white,
              elevation: hover ? 2 : 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),

              ),
            ),
            child: Icon(
              icons,
              color: hover || isClick ? Colors.white : Color(0xff333333),
              size: iconSize,
            ),
          ),
        );
      },
    );
  }
}
