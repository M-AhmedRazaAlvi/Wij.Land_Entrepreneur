import 'package:flutter/material.dart';

import '../../../app_common_widgets/custom_text.dart';
import '../../../utils/styles.dart';

class ProjectsInfo extends StatelessWidget {
  final String title;
  final String amount;
  final double size;
  final bool bold;
  const ProjectsInfo(
      {Key? key,
      this.title = "",
      this.amount = "0",
      this.size = 16,
      this.bold = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: title,
                color: secondary,
                size: size,
                weight: bold ? FontWeight.bold : FontWeight.normal,
              ),
              CustomText(
                text: amount,
                color: secondary,
                size: size,
                weight: bold ? FontWeight.bold : FontWeight.normal,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Divider(
            color: secondary.withOpacity(0.25),
          ),
        ),
      ],
    );
  }
}
