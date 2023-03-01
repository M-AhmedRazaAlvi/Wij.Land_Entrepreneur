// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:wij_land/utils/responsive.dart';

import '../../../app_common_widgets/on_hover.dart';
import '../../../utils/styles.dart';

class ClickIconButton extends StatelessWidget {
  final icon;
  final dynamic onPressed;
  final dynamic clickcolors;
  final iconColor;

  const ClickIconButton({
    Key? key,
    this.icon,
    this.onPressed,
    this.clickcolors, this.iconColor ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnHover(
        builder: (hover) => Container(
              width:Responsive.isMobile(context)?25: 45,
              height:Responsive.isMobile(context)?25: 45,
              margin: EdgeInsets.only(right:Responsive.isMobile(context)?4: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: clickcolors,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding:  EdgeInsets.symmetric(vertical:Responsive.isMobile(context)?5: 20)),
                onPressed: onPressed,
                child: Icon(
                  icon,
                  color: iconColor,
                  size:Responsive.isMobile(context)?12: 20,
                ),
              ),
            ));
  }
}
