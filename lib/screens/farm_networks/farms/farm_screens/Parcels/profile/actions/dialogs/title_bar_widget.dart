
import 'package:flutter/material.dart';

import '../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../utils/responsive.dart';


class TitleBarWiget extends StatelessWidget {
  const TitleBarWiget({
    Key? key, required this.titleText,
  }) : super(key: key);
  final String titleText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: !Responsive.isDesktop(context) ? 20 : 30,
                    ),
                  ),
                  CustomText(
                    text:titleText,
                    size: !Responsive.isDesktop(context) ? 20 : 30,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.close,
                  size: !Responsive.isDesktop(context) ? 20 : 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
