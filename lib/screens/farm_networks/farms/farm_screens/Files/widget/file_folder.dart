import 'package:flutter/material.dart';
import 'package:wij_land/utils/responsive.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../utils/styles.dart';

class FileFolderWidget extends StatelessWidget {
  final String text;

  const FileFolderWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Icon(Icons.folder, color: lightGreen, size:Responsive.isMobile(context)?60: 120),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal:Responsive.isMobile(context)?4: 15, vertical: 10),
              alignment: Alignment.center,
              child: CustomText(
                textAligns: TextAlign.center,
                overflows: TextOverflow.ellipsis,
                lines: 3,
                size: Responsive.isMobile(context)?7:12,
                text: text,
                color: Colors.white,
              ),
            )),
      ],
    );
  }
}
