import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/icon_text_container.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/styles.dart';

class CardMapAndImage extends StatelessWidget {
  const CardMapAndImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            child: Container(
                alignment: Alignment.center,
                width: getWidth(context),
                padding: EdgeInsets.all(15),
                height: 300,
                child: CustomText(text: "Map"))),
        Card(
            child: Container(
          height: 300,
          padding: EdgeInsets.all(15),
          child: Stack(
            children: [
              Positioned(
                child: Align(
                    alignment: Alignment.centerRight,
                    child:
                        IconAndTextContainer(onTap: () {}, addText: "Photo")),
              ),
              CustomText(
                text: "Pictures",
                size: 20,
                color: darkBlue,
              ),
            ],
          ),
        )),
      ],
    );
  }
}
