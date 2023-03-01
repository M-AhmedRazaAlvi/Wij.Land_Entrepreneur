import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../utils/functions.dart';
import '../../../../office/wij_lan_team/person_profile/profile_card_widget.dart';

class PersonProfileCardWidget extends StatelessWidget {
  const PersonProfileCardWidget({Key? key}) : super(key: key);

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
            children:  [
              CustomText(
                text: "Office/Wij.land Team.land Team/Person profile".tr(),
              ),
              SizedBox(
                height: 40,
              ),
              ProfileCardWidget(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
