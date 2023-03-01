import 'package:flutter/material.dart';
import 'package:wij_land/screens/home/widgets/info_card.dart';

import '../../../utils/styles.dart';

class HomeCardsLargeScreen extends StatelessWidget {
  const HomeCardsLargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        InfoCard(
          title: "Farmers",
          value: "46",
          onTap: () {},
          topColor: Colors.redAccent,
        ),
        SizedBox(
          width: _width / 64,
        ),
        InfoCard(
          title: "Farms",
          value: "28",
          topColor: Colors.greenAccent,
          onTap: () {},
        ),
        SizedBox(
          width: _width / 64,
        ),
        InfoCard(
          title: "Hectares",
          value: "17.287",
          topColor: Colors.lightGreenAccent,
          onTap: () {},
        ),
        SizedBox(
          width: _width / 64,
        ),
        InfoCard(
          title: "Partners",
          value: "1",
          topColor: secondary,
          onTap: () {},
        ),
      ],
    );
  }
}
