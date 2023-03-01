import 'package:flutter/material.dart';
import '../../../../app_common_widgets/custom_text.dart';
import '../../../app_common_widgets/styles.dart';

class DashboardIconWidgets extends StatelessWidget {
  const DashboardIconWidgets(
      {Key? key,
      required this.icons,
      required this.title,
      required this.onPress})
      : super(key: key);
  final dynamic icons, onPress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      hoverColor: hoverGreen,
      overlayColor: MaterialStateProperty.all(hoverGreen),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: darkGreen, width: 1.5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                height: 60,
                child: Icon(
                  icons,
                  size: 18,
                  color: darkGreen,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: CustomText(
                text: title,
                size: 14,
                lines: 2,
                weight: FontWeight.w800,
                color: darkGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
