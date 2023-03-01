
import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../utils/styles.dart';

class MapInfoButton extends StatelessWidget {
  const MapInfoButton({
    Key? key,
    required this.text,
    required this.allClicked,
  }) : super(key: key);

  final String text;
  final bool allClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: allClicked ? Colors.grey[300] : Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: allClicked ? hoverColor : Colors.white,
          )),
      child: CustomText(
        text: text,
        color: allClicked ? Colors.white : Colors.black,
      ),
    );
  }
}
