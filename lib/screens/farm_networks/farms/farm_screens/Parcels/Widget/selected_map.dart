import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';

class SelectMap extends StatelessWidget {
  final String text;
  final IconData icon;
  const SelectMap({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context),
      padding: EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          CustomText(
            text: text,
            size: !Responsive.isDesktop(context) ? 16 : 26,
          ),
          SizedBox(
            height: 10,
          ),
          Icon(
            icon,
            size: !Responsive.isDesktop(context) ? 50 : 100,
          ),
        ],
      ),
    );
  }
}
