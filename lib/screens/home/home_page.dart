import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:wij_land/screens/home/widgets/detail_section_large.dart';
import 'package:wij_land/screens/home/widgets/detail_section_small.dart';
import 'package:wij_land/screens/home/widgets/home_cards_large.dart';
import 'package:wij_land/screens/home/widgets/home_cards_medium.dart';
import 'package:wij_land/screens/home/widgets/home_cards_small.dart';

import '../../../utils/responsive.dart';
import '../../app_common_widgets/large_screen.dart';
import '../../utils/controller.dart';
import '../../utils/styles.dart';

var uniqueKey = Key('EntreprenuerScreen-key');

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.black,
      title: "Home",
      child: VisibilityDetector(
        key: uniqueKey,
        onVisibilityChanged: (visibilityInfo) {
          var visiblePercentage = visibilityInfo.visibleFraction * 100;
          if (visiblePercentage > 50) {
            global_entitiy.value = [
              Text(
                'Home',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: darkRed),
              ),
              Text(
                '',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: darkRed),
              ),
            ];
            routeStateofWijLand = 1;
            navigationController.navigateTo('/home');
          } else {
            routeStateofWijLand = 0;
          }
        },
        child: SizedBox(
            // child: Column(
            //   children: [
            //     Expanded(
            //         child: Padding(
            //       padding: const EdgeInsets.all(12.0),
            //       child: ListView(
            //         children: [
            //           if (!Responsive.isDesktop(context) ||
            //               !Responsive.isDesktop(context))
            //             if (!Responsive.isDesktop(context))
            //               const HomeCardsMediumScreen()
            //             else
            //               const HomeCardsLargeScreen()
            //           else
            //             const HomeCardsSmallScreen(),
            //           if (!Responsive.isDesktop(context))
            //             const DetailSectionLarge()
            //           else
            //             const DetailSectionSmall(),
            //         ],
            //       ),
            //     ))
            //   ],
            // ),
            ),
      ),
    );
  }
}
