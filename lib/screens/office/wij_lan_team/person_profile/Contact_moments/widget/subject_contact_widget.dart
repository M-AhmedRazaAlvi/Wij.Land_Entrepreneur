import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
class SubjectContactWidget extends StatelessWidget {
  final String subjectText;
  final String descriptionText;
  final size;
  final weight;
  final child;
  final width;
  const SubjectContactWidget({
    Key? key,
    required this.subjectText,
    required this.descriptionText,
    required this.size,
    required this.weight,
    this.child,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black26))),
      child: Row(
        children: [
          SizedBox(
            width: width,
            child: CustomText(
              text: subjectText,
              size: size,
              weight: weight,
            ),
          ),
          SizedBox(
            width: width,
            child: CustomText(
              text: descriptionText,
              size: size,
              weight: weight,
            ),
          ),
          SizedBox(
            // width: width,
            child: child,
          ),
        ],
      ),
    );
  }
}
