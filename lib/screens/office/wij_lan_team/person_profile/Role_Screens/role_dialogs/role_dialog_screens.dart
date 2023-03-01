
import 'package:flutter/material.dart';
import 'package:wij_land/screens/office/wij_lan_team/person_profile/Role_Screens/role_dialogs/role_advisor_widget.dart';
import 'package:wij_land/screens/office/wij_lan_team/person_profile/Role_Screens/role_dialogs/role_contractor_widget.dart';
import 'package:wij_land/screens/office/wij_lan_team/person_profile/Role_Screens/role_dialogs/role_emploee_widget.dart';
import 'package:wij_land/screens/office/wij_lan_team/person_profile/Role_Screens/role_dialogs/role_farm_datails_widget.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../../widgets/add_text_button_widget.dart';

class RoleDialogScreens extends StatefulWidget {
  final String text;
  const RoleDialogScreens({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<RoleDialogScreens> createState() => _RoleDialogScreensState();
}

class _RoleDialogScreensState extends State<RoleDialogScreens> {
  bool first = true, second = false, third = false, fourth = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: AlertDialog(
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: widget.text,
                      size: 40,
                      weight: FontWeight.bold,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  spacing: 80,
                  children: [
                    RealCheckBoxWidget(
                        value: first,
                        onChanged: (value) {
                          setState(() {
                            first = true;
                            second = false;
                            third = false;
                            fourth = false;
                          });
                        },
                        Labeltext: "Farmer"),
                    RealCheckBoxWidget(
                        value: second,
                        onChanged: (value) {
                          setState(() {
                            first = false;
                            second = true;
                            third = false;
                            fourth = false;
                          });
                        },
                        Labeltext: "Contractor"),
                    RealCheckBoxWidget(
                        value: third,
                        onChanged: (value) {
                          setState(() {
                            first = false;
                            second = false;
                            third = true;
                            fourth = false;
                          });
                        },
                        Labeltext: "Employee"),
                    RealCheckBoxWidget(
                        value: fourth,
                        onChanged: (value) {
                          setState(() {
                            first = false;
                            second = false;
                            third = false;
                            fourth = true;
                          });
                        },
                        Labeltext: "Advisor"),
                  ],
                ),
              ],
            ),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                first ? const RoleFarmDatailsWidget() : Container(),
                second ? const RoleContractorWidget() : Container(),
                third ? const RoleEmploeeWidget() : Container(),
                fourth ? const RoleAdvisorWidget() : Container(),
              ],
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AddTextButtonWidget(
                    text: "Cancel",
                    colors: Colors.white,
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AddTextButtonWidget(
                    text: "Add Role",
                    colors: Colors.yellow,
                    onPress: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
