import 'package:flutter/material.dart';

import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';

class SocialMediaTotalCardWidget extends StatelessWidget {
  final String title, counts;
  final Color colors;

  const SocialMediaTotalCardWidget(
      {Key? key,
      required this.title,
      required this.counts,
      required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: !Responsive.isDesktop(context)
          ? getWidth(context)
          : !Responsive.isDesktop(context)
              ? getWidth(context) / 2.2
              : !Responsive.isDesktop(context)
                  ? getWidth(context)
                  : getWidth(context) / 4.2,
      height: 100,
      child: Card(
        color: colors,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 6.0, left: 16),
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0, left: 16),
              child: Text(
                counts,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
