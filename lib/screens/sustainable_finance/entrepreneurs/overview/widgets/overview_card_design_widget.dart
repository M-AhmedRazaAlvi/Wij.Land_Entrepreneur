import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../utils/functions.dart';

class OverViewCardDesignWidget extends StatelessWidget {
  final icon, subtitle, cardColor;
  final bool isSocial;
  final int followerCount;

  const OverViewCardDesignWidget({
    Key? key,
    required this.icon,

    required this.subtitle,
    required this.cardColor,
    required this.followerCount,
    required this.isSocial,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context) * 0.13,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isSocial
              ? SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: FaIcon(
                      icon,
                      color: cardColor,
                      size: 50,
                    ),
                  ),
                )
              : Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: cardColor,
                  ),
                  child: Center(
                    child: FaIcon(
                      icon,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
          SizedBox(
            height: 8,
          ),
          CustomText(
            text: followerCount.toString(),
            size: 16,
            weight: FontWeight.bold,
            color: Color(0xff707070),
          ),
          SizedBox(
            height: 4,
          ),
          CustomText(
            text: '$subtitle',
            size: 12,
            weight: FontWeight.bold,
            color: Color(0xff707070),
          ),
        ],
      ),
    );
  }
}
