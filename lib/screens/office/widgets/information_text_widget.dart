import 'package:flutter/material.dart';

import '../../../app_common_widgets/custom_text.dart';

class InformativeTextWidget extends StatelessWidget {
  final String textFirst;
  final String textSecond;
  const InformativeTextWidget({
    Key? key,
    required this.textFirst,
    required this.textSecond,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.only(bottom: 10),
      child: Wrap(
        children: [
          CustomText(
            text: textFirst,
            size: 16,
          ),
         const SizedBox(
            width: 8,
          ),
          Text(
            textSecond,
            style:const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
