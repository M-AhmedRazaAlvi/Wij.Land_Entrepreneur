
import 'package:flutter/material.dart';
import 'package:wij_land/screens/office/wij_lan_team/person_profile/Role_Screens/role_dialogs/role_dialog_screens.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../utils/functions.dart';
import '../../../../../../utils/styles.dart';
import '../../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../office_programes/Widgets/on_hover_button_widget.dart';
import '../../../widgets/add_button.dart';
class ProfileRoleContainer extends StatefulWidget {
  const ProfileRoleContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileRoleContainer> createState() => _ProfileRoleContainerState();
}

class _ProfileRoleContainerState extends State<ProfileRoleContainer> {
  bool _interested = false;
  bool _member = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: getWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "Role",
                size: 30,
                weight: FontWeight.bold,
                color: darkGreen,
              ),
              ButtonWithAddIcon(
                text: "Role",
                onPressed: () {
                  showDialog(
                    // /////////////////////////////Role DialogBox///////////
                    context: context,
                    builder: (BuildContext context) {
                      return RoleDialogScreens(
                        text: "Add Role",
                      );
                    },
                  );
                },
              ),
            ],
          ),
          Container(
            height: 50 * 21,
            width: getWidth(context),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                for (int i = 0; i < 3; i++)
                  Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: "Farmer on Farm : Farm of Gerd Mcalister",
                            size: 18,
                            weight: FontWeight.bold,
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            children: const [
                              CustomText(
                                text: "Involved with Wij.landSince 30-12-2021.",
                                size: 18,
                              ),
                              SizedBox(width: 20),
                              CustomText(
                                text: "Farmer Role : Representative",
                                size: 18,
                                weight: FontWeight.bold,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const CustomText(
                            text: "Relevant checkboxes",
                            size: 18,
                          ),
                          const SizedBox(height: 10),
                          RealCheckBoxWidget(
                              value: _interested,
                              onChanged: (value) {
                                setState(
                                  () {
                                    _interested = value ?? false;
                                  },
                                );
                              },
                              Labeltext:
                                  "Interested in Renting Nature Grounds"),
                          RealCheckBoxWidget(
                              value: _member,
                              onChanged: (value) {
                                setState(
                                  () {
                                    _member = value ?? false;
                                  },
                                );
                              },
                              Labeltext: "Member of Focus Group"),
                          SizedBox(
                            height: 60,
                          ),
                          Divider(
                            color: Colors.black12,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Positioned(
                        top: 10,
                        right: 0,
                        child: Row(
                          children: [
                            OnHoverButtonWidget(
                              icons: Icons.edit,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return RoleDialogScreens(
                                      text: "Edit Role",
                                    );
                                  },
                                );
                              },
                            ),
                            OnHoverButtonWidget(
                              onTap: () {},
                              icons: Icons.delete,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
