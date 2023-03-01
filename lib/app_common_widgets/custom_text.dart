import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/utils/styles.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.text,
      this.size = 14,
      this.color = Colors.black,
      this.overflows = TextOverflow.ellipsis,
      this.textAligns = TextAlign.left,
      this.weight = FontWeight.normal,
      this.lines = 1,
      this.fontFamily = Montserrat_Medium})
      : super(key: key);
  final String text;
  final double size;
  final Color color;
  final TextAlign textAligns;
  final FontWeight weight;
  final int lines;
  final dynamic fontFamily;
  final TextOverflow overflows;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAligns,
      overflow: overflows,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        color: color,
        fontWeight: weight,
        fontSize: size,
        fontFamily: fontFamily,
      ),
    );
  }
}
