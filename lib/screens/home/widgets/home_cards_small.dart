// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:wij_land/screens/home/widgets/my_tasks_card.dart';
import 'package:wij_land/screens/home/widgets/projects_card.dart';

class HomeCardsSmallScreen extends StatelessWidget {
  const HomeCardsSmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

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
