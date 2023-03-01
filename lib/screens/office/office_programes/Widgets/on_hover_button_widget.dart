import 'package:flutter/material.dart';

import '../../../../app_common_widgets/on_hover.dart';
import '../../../../utils/styles.dart';

class OnHoverButtonWidget extends StatelessWidget {
  const OnHoverButtonWidget({
    Key? key,
    required this.onTap,
    required this.icons,
    this.height = 50,
    this.isFilterColor = false,
  }) : super(key: key);
  final onTap;
  final double? height;
  final IconData icons;
  final bool? isFilterColor;

  @override
  Widget build(BuildContext context) {
    return OnHover(
      builder: (hover) => InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 50,
          width: 50,
          child: Card(
            color: hover
                ? hoverColor
                : isFilterColor!
                    ? hoverColor
                    : Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Center(
                child: Icon(
              icons,
              size: 20,
              color: isFilterColor! ? Colors.white : secondary,
            )),
          ),
        ),
      ),
    );
  }
}
