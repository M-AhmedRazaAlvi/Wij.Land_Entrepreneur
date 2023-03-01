import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';

class EventsSocialCardWidget extends StatelessWidget {
  final String title, counts;
  final Color colors;

  const EventsSocialCardWidget(
      {Key? key,
      required this.title,
      required this.counts,
      required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width:!Responsive.isDesktop(context)?getWidth(context):ResponsiveWidget.isMediumScreen(context)? getWidth(context)/2.2:ResponsiveWidget.isCustomSize(context)?getWidth(context)   :getWidth(context)/4.2,
      width: !Responsive.isDesktop(context) ? getWidth(context) : 350,
      height: 125,
      child: Card(
        color: colors,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 6.0, left: 16),
              child: CustomText(
                  text: title,
                  color: Colors.white,
                  size: 14,
                  weight: FontWeight.w300),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: CustomText(
                text: counts,
                color: Colors.white,
                size: 30,
                weight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
