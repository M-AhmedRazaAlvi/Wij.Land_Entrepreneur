import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../utils/responsive.dart';

class MediaDescCardWidget extends StatelessWidget {
  const MediaDescCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            CustomText(
              text: 'Description',
              size: !Responsive.isDesktop(context) ? 14 : 18,
              color: Colors.black87,
              weight: FontWeight.bold,
            ),
            SizedBox(
              height: 8,
            ),
            CustomText(
              text: 'details about the description',
            ),
            SizedBox(
              height: 16,
            ),
            CustomText(
              text: 'Reason',
              size: !Responsive.isDesktop(context) ? 14 : 18,
              color: Colors.black87,
              weight: FontWeight.bold,
            ),
            SizedBox(
              height: 8,
            ),
            CustomText(
              text: 'details about the Reason',
            ),
            SizedBox(
              height: 16,
            ),
            CustomText(
              text: 'Remarks:',
              size: !Responsive.isDesktop(context) ? 14 : 18,
              color: Colors.black87,
              weight: FontWeight.bold,
            ),
            SizedBox(
              height: 8,
            ),
            CustomText(
              text: 'details about the Remarks',
            ),
            SizedBox(
              height: 16,
            ),
            CustomText(
              text: 'Links:',
              size: !Responsive.isDesktop(context) ? 14 : 18,
              color: Colors.black87,
              weight: FontWeight.bold,
            ),
            SizedBox(
              height: 8,
            ),
            CustomText(
              text: 'details about the Links',
            ),
            SizedBox(
              height: 16,
            ),
            CustomText(
              text: 'Responsible: ',
              size: !Responsive.isDesktop(context) ? 14 : 18,
              color: Colors.black87,
              weight: FontWeight.bold,
            ),
            SizedBox(
              height: 8,
            ),
            CustomText(
              text: 'details about the responsible',
            ),
          ],
        ),
      ),
    );
  }
}
