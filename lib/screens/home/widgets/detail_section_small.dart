import 'package:flutter/material.dart';
import 'package:wij_land/screens/home/widgets/my_tasks_card.dart';
import 'package:wij_land/screens/home/widgets/projects_card.dart';

class DetailSectionSmall extends StatelessWidget {
  const DetailSectionSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        ProjectsCard(),
        SizedBox(
          width: 30,
        ),
        MyTasksCard(),
      ],
    );
  }
}
