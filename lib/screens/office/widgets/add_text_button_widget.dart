import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../utils/styles.dart';
import '../../../app_common_widgets/on_hover.dart';
import '../../../utils/hex_color.dart';
import '../../../utils/responsive.dart';

class AddTextButtonWidget extends StatelessWidget {
  final String text;
  final Color colors, textColor;
  final Function()? onPress;
  final FontWeight textWeight;

  const AddTextButtonWidget({
    Key? key,
    required this.text,
    required this.colors,
    this.textColor = Colors.black87,
    this.textWeight = FontWeight.w600,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnHover(
      builder: (hover) {
        return ElevatedButton(
          onPressed: onPress,
          style: ElevatedButton.styleFrom(
            primary: hover ? lightGreen : colors,
            elevation: hover ? 2 : 0,

            shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.isMobile(context) ? 3 :5,
                vertical: Responsive.isMobile(context) ? 8 : 12,
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.isMobile(context) ? 10 : 14,
                  color: hover ? Colors.white : HexColor('#231F20'),
                  fontFamily: Montserrat_Medium,
                ),
              )),
        );
      },
    );
  }
}
