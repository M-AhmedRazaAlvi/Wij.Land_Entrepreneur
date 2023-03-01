import 'package:flutter/material.dart';
import 'package:wij_land/screens/office/wij_lan_team/WijLand_screens/widgets/add_person_dialog.dart';
import 'package:wij_land/screens/office/wij_lan_team/WijLand_screens/widgets/wij_team_widget_small.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../utils/styles.dart';
import '../../widgets/add_button.dart';
import '../../widgets/search_widget.dart';
class WijLandTeamSmall extends StatelessWidget {
  const WijLandTeamSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomText(text: "Office/Wij.land Team", size: 16),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        text: "Wij.land Team",
                        size: 30,
                        color: third,
                        weight: FontWeight.bold),
                    Row(
                      children: [
                        ClickIconButton(
                          icon: Icons.search,
                          onPressed: () {},
                        ),
                        ClickIconButton(
                          icon: Icons.filter_alt,
                          onPressed: () {},
                        ),
                        ButtonWithAddIcon(
                          text: "Person",
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AddPersolDialogWidget();
                                });
                          },
                        )
                      ],
                    ),
                  ],
                ),
                const WijTeamWidgetSmall(),
              ]),
        ),
      ),
    );
  }
}
