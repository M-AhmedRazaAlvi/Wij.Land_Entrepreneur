import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/counter_widget.dart';
import '../../../../../../app_common_widgets/custom_text.dart';

class LandscapeElementWidget extends StatefulWidget {
  const LandscapeElementWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LandscapeElementWidget> createState() => _LandscapeElementWidgetState();
}

class _LandscapeElementWidgetState extends State<LandscapeElementWidget> {
  int countGreen = 15, countBlue = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 20,
          children: [
            CustomText(
              text:
                  "Which percentage of your company land consists of green, non-productive elements?",
            ),
            SizedBox(
              width: 120,
              child: CounterWidget(
                count: countGreen,
                onAddTap: () {
                  setState(() {
                    countGreen++;
                  });
                },
                onCloseTap: () {
                  setState(() {
                    countGreen--;
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 20,
          children: [
            CustomText(
              text:
                  "Which percentage of your company land consists of blue, non-productive elements?",
            ),
            SizedBox(
              width: 120,
              child: CounterWidget(
                count: countBlue,
                onAddTap: () {
                  setState(() {
                    countBlue++;
                  });
                },
                onCloseTap: () {
                  setState(() {
                    countBlue--;
                  });
                },
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
