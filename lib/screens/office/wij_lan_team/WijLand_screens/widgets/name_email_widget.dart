import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../utils/styles.dart';


class WijLandEmailWidget extends StatelessWidget {
  final String textName;
  final String textEmail;

  final dynamic color;
  final dynamic size;
  const WijLandEmailWidget({
    Key? key,
    required this.textName,
    required this.textEmail,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 20,
              height: 20,
              margin: const EdgeInsets.only(left: 10, right: 50),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(3)),
            ),
            Expanded(
              flex: 2,
              child: CustomText(
                text: textName,
                size: size,
              ),
            ),
            Expanded(
              flex: 2,
              child: CustomText(
                text: textEmail,
                size: size,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
            )
          ],
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
