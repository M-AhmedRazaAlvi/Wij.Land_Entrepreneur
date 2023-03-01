import 'package:flutter/material.dart';
import 'package:wij_land/screens/home/widgets/projects_info.dart';

import '../../../app_common_widgets/custom_text.dart';
import '../../../utils/styles.dart';
class ProjectsCard extends StatelessWidget {
  const ProjectsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        border: Border.all(color: lightGrey, width: .5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "Projects",
            color: Colors.green,
            size: 30,
          ),
          const SizedBox(
            height: 12,
          ),
          const ProjectsInfo(
            title: "Name",
            amount: "Hectares",
            size: 20,
            bold: true,
          ),
          const ProjectsInfo(
            title: "Arable Land",
            amount: "2.751",
            size: 16,
            bold: false,
          ),
          const ProjectsInfo(
            title: "External Project No 1",
            amount: "1.371",
            size: 16,
            bold: false,
          ),
          const ProjectsInfo(
            title: "Property Scan Project",
            amount: "13.162",
            size: 16,
            bold: false,
          ),
          const ProjectsInfo(
            title: "Soil Project",
            amount: "3.376",
            size: 16,
            bold: false,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  text: "Show more",
                  size: 20,
                  weight: FontWeight.bold,
                ),
                Icon(
                  Icons.arrow_forward,
                  color: secondary,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
