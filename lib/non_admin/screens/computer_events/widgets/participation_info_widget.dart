import 'package:flutter/material.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/responsive.dart';

class ParticipationInfoRowWidget extends StatelessWidget {
  const ParticipationInfoRowWidget({
    Key? key,
    required this.farmName,
    required this.response,
    required this.attended,
    required this.first,
    required this.size,
    required this.totalRow,
  }) : super(key: key);
  final bool first;
  final String farmName, response, attended, totalRow;

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: Responsive.isMobile(context) ? 6 : 30),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black26))),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(right: Responsive.isMobile(context) ? 5 : 10),
            width: size * 1.5,
            child: CustomText(
              textAligns: TextAlign.left,
              overflows: TextOverflow.ellipsis,
              lines: 2,
              text: farmName,
              size: first
                  ? Responsive.isMobile(context)
                      ? 11
                      : 14
                  : Responsive.isMobile(context)
                      ? 9
                      : 12,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width: size * 1.2,
            child: CustomText(
              textAligns: TextAlign.left,
              overflows: TextOverflow.ellipsis,
              lines: 2,
              text: response,
              size: first
                  ? Responsive.isMobile(context)
                      ? 11
                      : 14
                  : Responsive.isMobile(context)
                      ? 9
                      : 12,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width: size * 1.2,
            child: CustomText(
              textAligns: TextAlign.left,
              overflows: TextOverflow.ellipsis,
              lines: 2,
              text: attended,
              size: first
                  ? Responsive.isMobile(context)
                      ? 11
                      : 14
                  : Responsive.isMobile(context)
                      ? 9
                      : 12,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width: Responsive.isMobile(context) ? size : size / 2,
            child: CustomText(
              textAligns: TextAlign.left,
              overflows: TextOverflow.ellipsis,
              lines: 2,
              text: totalRow,
              size: first
                  ? Responsive.isMobile(context)
                      ? 11
                      : 14
                  : Responsive.isMobile(context)
                      ? 9
                      : 12,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
