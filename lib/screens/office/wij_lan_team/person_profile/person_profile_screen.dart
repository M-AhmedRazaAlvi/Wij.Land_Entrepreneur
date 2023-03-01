import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wij_land/screens/office/wij_lan_team/person_profile/Role_Screens/profile_roles_widget.dart';
import 'package:wij_land/screens/office/wij_lan_team/person_profile/profile_card_widget.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../utils/controller.dart';
import '../../../../../../utils/functions.dart';

class PersonProfileScreen extends StatelessWidget {
  const PersonProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          width: getWidth(context),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => SizedBox(
                      child: CustomText(
                        text: menuController.activeItemRoute.value,
                        size: 14,
                      ),
                    )),
              SizedBox(
                height: 40,
              ),
              ProfileCardWidget(),
              SizedBox(
                height: 20,
              ),
              ProfileRolesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
