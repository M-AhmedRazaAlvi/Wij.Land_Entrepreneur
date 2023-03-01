import 'package:flutter/cupertino.dart';
import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../utils/responsive.dart';

class ProjectTextWidget extends StatelessWidget {
  final String text;
  final double width;

  const ProjectTextWidget({Key? key, required this.text, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: Responsive.isMobile(context) ? 5 : 20),
      width: width,
      child: CustomText(
        lines: 2,
        overflows: TextOverflow.ellipsis,
        textAligns: TextAlign.left,
        text: text,
        size: Responsive.isMobile(context) ? 8 : 12,
        weight: FontWeight.normal,
      ),
    );
  }
}
