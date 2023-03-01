import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';

class GeneralDropWidget extends StatelessWidget {
  final String text;
  const GeneralDropWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black38)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: text),
          SizedBox(
            height: 15,
          ),
          Icon(Icons.keyboard_arrow_down)
        ],
      ),
    );
  }
}
