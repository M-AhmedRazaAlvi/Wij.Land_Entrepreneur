import 'package:flutter/material.dart';
import 'package:wij_land/screens/office/wij_lan_team/WijLand_screens/widgets/name_email_widget.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../app_common_widgets/menu_popup_widget.dart';
import '../../../../../utils/styles.dart';

class WijTeamWidgetSmall extends StatelessWidget {
  const WijTeamWidgetSmall({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: lightGrey, width: .5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 20,
                height: 20,
                margin: const EdgeInsets.only(left: 10, right: 50),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(3)),
              ),
              const Expanded(
                flex: 2,
                child: CustomText(
                  text: "Name",
                  size: 18,
                  weight: FontWeight.bold,
                ),
              ),
              const Expanded(
                flex: 2,
                child: CustomText(
                  text: "E-mail",
                  size: 18,
                  weight: FontWeight.bold,
                ),
              ),
              const MenuPopupWidget(contents: ["Delete", "Dwonload CSV"])
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Divider(
              color: secondary.withOpacity(0.25),
            ),
          ),
          const WijLandEmailWidget(
            textName: 'Cerd Mcalister',
            textEmail: 'gard@gamil.com',
            color: Colors.blue,
            size: 14,
          ),
          const WijLandEmailWidget(
            textName: 'Johan2 de Raak',
            textEmail: 'raak@gamil.com',
            color: Colors.blue,
            size: 14,
          ),
          const WijLandEmailWidget(
            textName: 'Juliel',
            textEmail: 'Juliel.solano@gamil.com',
            color: Colors.blue,
            size: 14,
          ),
          const WijLandEmailWidget(
            textName: 'Malik bhai',
            textEmail: 'malik@gamil.com',
            color: Colors.blue,
            size: 14,
          ),
          const WijLandEmailWidget(
            textName: 'Muhammad Abbas Test',
            textEmail: 'muhammad.abbas@gamil.com',
            color: Colors.blue,
            size: 14,
          ),
          const WijLandEmailWidget(
            textName: 'Cerd Mcalister',
            textEmail: 'gard@gamil.com',
            color: Colors.blue,
            size: 14,
          ),
        ],
      ),
    );
  }
}
