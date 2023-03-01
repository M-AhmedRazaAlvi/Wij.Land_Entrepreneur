import 'package:flutter/material.dart';
import 'package:wij_land/screens/home/widgets/my_tasks_card.dart';
import 'package:wij_land/screens/home/widgets/projects_card.dart';

class DetailSectionLarge extends StatelessWidget {
  const DetailSectionLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(
          flex: 2,
          child: ProjectsCard(),
        ),
        SizedBox(
          width: 30,
        ),
        Expanded(
          flex: 5,
          child: MyTasksCard(),
        ),
      ],
    );
  }
}
