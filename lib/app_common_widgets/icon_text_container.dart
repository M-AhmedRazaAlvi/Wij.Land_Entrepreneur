import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/app_common_widgets/on_hover.dart';

import '../utils/responsive.dart';
import '../utils/styles.dart';

class IconAndTextContainer extends StatelessWidget {
  const IconAndTextContainer({
    Key? key,
    required this.onTap,
    required this.addText,
    this.height = 55,
  }) : super(key: key);

  final dynamic onTap;
  final String addText;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // height: height,
        //  width: !Responsive.isDesktop(context) ? 80 : 160,
        child: OnHover(
            builder: (hover) => InkWell(
                hoverColor: Colors.transparent,
                onTap: onTap,
                child: Card(
                  color: hover ? hoverColor : shineYellow,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Responsive.isMobile(context) ? 10 : 13,
                      vertical: Responsive.isMobile(context) ? 6 : 10,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: hover ? Colors.white : dark,
                          size: 15,
                        ),
                        SizedBox(width: 5),
                        Text(
                          addText,
                          style: TextStyle(
                            fontSize: Responsive.isMobile(context) ? 11 : 16,
                            fontWeight: FontWeight.bold,
                            color: hover ? Colors.white : dark,
                            fontFamily: Montserrat_Medium,
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                ))));
  }
}
