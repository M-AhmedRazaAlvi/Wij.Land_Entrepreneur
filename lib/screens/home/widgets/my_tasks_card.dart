import 'package:flutter/material.dart';
import 'package:wij_land/screens/home/widgets/my_task_info.dart';

import '../../../app_common_widgets/custom_text.dart';
import '../../../utils/responsive.dart';
import '../../../utils/styles.dart';

class MyTasksCard extends StatelessWidget {
  const MyTasksCard({
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
            text: "My Tasks",
            color: Colors.green,
            size: 30,
          ),
          const SizedBox(
            height: 12,
          ),
          MyTaskInfo(
            task: "Task",
            assignedBy: "Assigned By",
            contactMoment: "Contact Moment",
            farm: "Farm",
            project: "Project",
            status: "Status",
            size: !Responsive.isDesktop(context) ? 12 : 16,
            bold: true,
            isStatusField: false,
          ),
          for (int i = 0; i < 10; i++)
            MyTaskInfo(
              task: "My Task",
              assignedBy: "Julie Solano",
              contactMoment: "10-12-2021",
              farm: "Farm of Elliot Mass",
              project: "Arable Land",
              status: i % 2 == 0 ? "In Progress" : "To do",
              size: !Responsive.isDesktop(context) ? 10 : 16,
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
