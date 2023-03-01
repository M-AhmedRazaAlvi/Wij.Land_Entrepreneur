import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/screens/settings/roles/widgets/constants_value.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../utils/styles.dart';

class RoleDescriptions extends StatelessWidget {
  const RoleDescriptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 24,
          ),
          CustomText(
            text: 'Role Description'.tr(),
            size: 30,
            color: darkGreen,
            weight: FontWeight.w600,
          ),
          SizedBox(
            height: 24,
          ),
          for (int i = 0; i < 9; i++)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomText(
                  text: titleList[i],
                  size: 16,
                  weight: FontWeight.w600,
                  color: darkBlue,
                ),
                SizedBox(
                  height: 18,
                ),
                CustomText(
                  text: description[i],
                  size: 16,
                  weight: FontWeight.w300,
                  color: darkBlue,
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
