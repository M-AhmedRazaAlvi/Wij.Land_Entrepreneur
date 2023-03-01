import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/projects/project_profile_screens/widgets/project_profile_InfoCard.dart';
import 'package:wij_land/screens/farm_networks/projects/project_profile_screens/widgets/project_profile_involved.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';


class ProjectProfileScreen extends StatelessWidget {
  const ProjectProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            width: getWidth(context),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            color: Colors.grey[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // CustomText(text: "Office/Wij.land Team.land Team/Person profiles"),
                SizedBox(
                  height: 40,
                ),
                ProjectProfileInfoCard(),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: getWidth(context),
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: const [
                      ProjectProfileColorCardWidget(
                        cardText: "Participating Farms",
                        color: Color.fromARGB(255, 99, 9, 2),
                        numbers: "23",
                      ),
                      ProjectProfileColorCardWidget(
                        cardText: "Participating Farms",
                        color: Color.fromARGB(255, 143, 135, 62),
                        numbers: "23",
                      ),
                      ProjectProfileColorCardWidget(
                        cardText: "Participating Farms",
                        color: Color.fromARGB(255, 104, 92, 91),
                        numbers: "23",
                      ),
                      ProjectProfileColorCardWidget(
                        cardText: "Participating Farms",
                        color: Color.fromARGB(255, 99, 9, 2),
                        numbers: "23",
                      )
                    ],
                  ),
                ),
//ProfileRolesWidget(),
                ProjectProfileInvolved()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectProfileColorCardWidget extends StatelessWidget {
  final Color color;
  final String cardText;
  final String numbers;
  const ProjectProfileColorCardWidget({
    Key? key,
    required this.color,
    required this.cardText,
    required this.numbers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: !Responsive.isDesktop(context) ? 15 : 2),
      padding: !Responsive.isDesktop(context)
          ? EdgeInsets.all(14)
          : EdgeInsets.all(0),
      width: !Responsive.isDesktop(context)
          ? getWidth(context)
          : getWidth(context) * 0.19,
      height: !Responsive.isDesktop(context)
          ? getHeight(context) * 0.16
          : getHeight(context) * 0.15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)), color: color),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomText(text: cardText, size: 20, color: Colors.white),
          SizedBox(
            height: 20,
          ),
          CustomText(
              text: "23",
              size: !Responsive.isDesktop(context) ? 16 : 20,
              weight: FontWeight.bold,
              color: Colors.white),
        ]),
      ),
    );
  }
}
