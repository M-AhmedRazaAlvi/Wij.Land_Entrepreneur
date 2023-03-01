import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../utils/styles.dart';

class AnecdotesDescCardWidget extends StatelessWidget {
  const AnecdotesDescCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24,
            ),
            CustomText(
              text:
                  'Ellie called to let us know that recently she has seen a significant increase in local businesses contacting her to ask if she wants to sell her locally and sustainably produced products through them as a processor. A couple of them even mentioned that they got to know Ellie was producing more sustainably than farmers in the area by finding her on our organization\'s website. The organizations may even be interested in working with our organization.',
              size: 16,
              weight: FontWeight.w300,
              color: ivoryBlack,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                CustomText(
                  text: 'Impact Direction:',
                  size: 16,
                  color: darkBlue,
                  weight: FontWeight.w600,
                ),
                SizedBox(
                  width: 8,
                ),
                CustomText(
                  text: 'Positive',
                  color: darkBlue,
                  weight: FontWeight.w300,
                  size: 16,
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                CustomText(
                    text: 'Who brought it up:',
                    size: 16,
                    color: darkBlue,
                    weight: FontWeight.w600),
                SizedBox(
                  width: 8,
                  height: 8,
                ),
                CustomText(
                    text: 'Casper after calling with Ellie',
                    color: darkBlue,
                    weight: FontWeight.w300,
                    size: 16),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                CustomText(
                    text: 'Which Communication:',
                    size: 16,
                    color: darkBlue,
                    weight: FontWeight.w600),
                SizedBox(
                  height: 8,
                  width: 8,
                ),
                CustomText(
                    text: 'Phone call',
                    color: darkBlue,
                    weight: FontWeight.w300,
                    size: 16),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
