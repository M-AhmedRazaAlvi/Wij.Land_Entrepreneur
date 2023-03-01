import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Boerenwijzer/start_survey.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../app_common_widgets/icon_text_container.dart';

class FarmBoerenwijzerScreen extends StatefulWidget {
  const FarmBoerenwijzerScreen({Key? key}) : super(key: key);

  @override
  State<FarmBoerenwijzerScreen> createState() => _FarmBoerenwijzerScreenState();
}

class _FarmBoerenwijzerScreenState extends State<FarmBoerenwijzerScreen> {
  late bool clicked = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (clicked)
            Column(
              children: [
                CustomText(
                  text:
                      "Welcome to the boerenwijzer project! Start your first survey!",
                  size: 20,
                ),
                SizedBox(
                  height: 30,
                ),
                IconAndTextContainer(
                    onTap: () {
                      setState(() {
                        clicked = false;
                      });
                    },
                    addText: "Start Survey"),
              ],
            )
          else
            BoerenwijzerStartSurvey(),
        ],
      ),
    );
  }
}
