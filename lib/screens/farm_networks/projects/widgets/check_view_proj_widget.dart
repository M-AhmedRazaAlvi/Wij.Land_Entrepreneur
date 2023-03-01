import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/controller.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../../../routes/routes.dart';
import '../../../../app_common_widgets/on_hover.dart';

class CheckViewProjWidget extends StatelessWidget {
  const CheckViewProjWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context),
      margin: !Responsive.isDesktop(context)
          ? EdgeInsets.only(right: 130, bottom: 1000)
          : EdgeInsets.only(right: 130),
      child: GridView.builder(
        itemCount: 8,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // childAspectRatio: 1.45,
            childAspectRatio: !Responsive.isDesktop(context)
                ? 2.5 / 2.6
                : !Responsive.isDesktop(context)
                    ? 1.0
                    : !Responsive.isDesktop(context)
                        ? 1.2
                        : 1.0,
            crossAxisCount: !Responsive.isDesktop(context)
                ? 1
                : !Responsive.isDesktop(context)
                    ? 2
                    : !Responsive.isDesktop(context)
                        ? 3
                        : 4),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {
                navigationController.navigateTo(projectProfilePageRoute);
              },
              child: ProjectCard(
                projImage: "assets/images/wallpapersimages1.png",
                propertyName: "Property Scan Project",
                projectTitle: "Internal Project",
                noOfFarms: "24 Farms Invovled",
                noOfHactares: "25, hectares",
                status: "Status: Active",
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String projImage,
      propertyName,
      projectTitle,
      noOfFarms,
      noOfHactares,
      status;

  const ProjectCard({
    Key? key,
    required this.projImage,
    required this.propertyName,
    required this.projectTitle,
    required this.noOfFarms,
    required this.noOfHactares,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnHover(
      builder: (hover) => Card(
          color: hover ? darkGreen : Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          elevation: 5,
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(15)),
                  child: Image.asset(
                    projImage,
                    height:
                        !Responsive.isDesktop(context)
                            ? getHeight(context) * 0.28
                            : !Responsive.isDesktop(context)
                                ? getHeight(context) * 0.18
                                : Responsive.isDesktop(context)
                                    ? getHeight(context) * 0.11
                                    : getHeight(context) * 0.19,
                    // width:ResponsiveWidget //need to adjust image size by medium and large
                    //             .isSmallScreen(context)
                    //         ? getWidth(context)* 0.38
                    //        : ResponsiveWidget
                    //             .isMediumScreen(context)
                    //         ? getWidth(context) * 0.25
                    //         : getWidth(context),
                    width: getWidth(context),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: propertyName,
                        size: 20,
                        weight: FontWeight.bold,
                        color: hover ? Colors.white : darkGreen,
                      ),
                      CustomText(
                        text: projectTitle,
                        color: hover ? Colors.white : Colors.grey,
                      ),
                      CustomText(
                          text: noOfFarms,
                          color: hover ? Colors.white : Colors.grey),
                      CustomText(
                          text: noOfHactares,
                          color: hover ? Colors.white : Colors.grey),
                      CustomText(
                          text: status,
                          color: hover ? Colors.white : Colors.grey)
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
