import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/screens/settings/roles/widgets/CrudOperation.dart';
import 'package:wij_land/screens/settings/roles/widgets/RoleDescription.dart';

import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../app_common_widgets/custom_text.dart';
import '../../../utils/controller.dart';
import '../../../utils/styles.dart';

class RolesScreen extends StatefulWidget {
  const RolesScreen({Key? key}) : super(key: key);

  @override
  State<RolesScreen> createState() => _RolesScreenState();
}

class _RolesScreenState extends State<RolesScreen> {
  var titleClicked = [
        true,
        false,
      ],
      titleList = ['CRUD Permissions'.tr(), 'Role Descriptions'.tr()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomText(
                text: menuController.activeItemRoute.value,
                size: 16,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomText(
              text: 'Roles'.tr(),
              color: third,
              size: 40,
              weight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 12, left: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                        color: Color(0xff333333)),
                    child: Wrap(
                      children: [
                        for (int i = 0; i < 2; i++)
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6),
                              ),
                              color: titleClicked[i]
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              child: CustomText(
                                text: titleList[i],
                                color:
                                    titleClicked[i] ? ivoryBlack : Colors.white,
                                size: 14,
                                weight: FontWeight.w600,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (titleClicked.contains(true)) {
                                    titleClicked =
                                        List.filled(titleClicked.length, false);
                                    titleClicked[i] = true;
                                  } else {
                                    titleClicked[i] = false;
                                  }
                                });
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                  titleClicked[0] ? CrudOperations() : RoleDescriptions(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
