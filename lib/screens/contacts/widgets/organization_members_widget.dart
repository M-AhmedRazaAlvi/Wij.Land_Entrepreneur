import 'package:flutter/material.dart';
import 'package:wij_land/screens/contacts/widgets/add_member_dialog.dart';
import 'package:wij_land/screens/contacts/widgets/organization_member_info_row.dart';
import 'package:wij_land/screens/contacts/widgets/organization_select_existing_person_dialog.dart';
import 'package:wij_land/screens/contacts/widgets/popup_menu_button.dart';

import '../../../app_common_widgets/custom_text.dart';
import '../../../utils/functions.dart';
import '../../../utils/responsive.dart';
import '../../office/widgets/add_button.dart';

class OrganizationMembersWidget extends StatefulWidget {
  const OrganizationMembersWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<OrganizationMembersWidget> createState() =>
      _OrganizationMembersWidgetState();
}

class _OrganizationMembersWidgetState extends State<OrganizationMembersWidget> {
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
              const CustomText(
                text: "Members",
                size: 20,
                weight: FontWeight.bold,
                color: Colors.green,
              ),
              Row(
                children: [
                  ButtonWithAddIcon(
                    text: "Select existing person",
                    color: Colors.grey.shade200,
                    onPressed: () {
                      showDialog(
                          // /////////////////////////////Role DialogBox///////////
                          context: context,
                          builder: (BuildContext context) {
                            return const OrganizationSelectExistingPersonDialog();
                          });
                    },
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  ButtonWithAddIcon(
                    text: "Add Member",
                    onPressed: () {
                      showDialog(
                          // /////////////////////////////Role DialogBox///////////
                          context: context,
                          builder: (BuildContext context) {
                            return AddMemberDialog();
                          });
                    },
                  ),
                ],
              ),
            ],
          ),
          Stack(
            children: [
              Card(
                color: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50 * 20,
                        width: getWidth(context),
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: OrganizationMemberInfoRow(
                                    first: true,
                                    name: "Name",
                                    role: "Role",
                                    lastContactMoment: "Last Contact Moment",
                                    email: "Email",
                                    phone: "Phone",
                                    size: !Responsive.isDesktop(context)
                                        ? getWidth(context) / 4
                                        : getWidth(context) / 6,
                                  ),
                                ),
                                for (int i = 0; i < 20; i++)
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: OrganizationMemberInfoRow(
                                      first: false,
                                      name: "Leendert Jan Looswijk",
                                      role: "Frederik Hengeveld",
                                      lastContactMoment: "22-07-2021",
                                      email: "Phone Call",
                                      phone: "22-07-2021",
                                      size: !Responsive.isDesktop(context)
                                          ? getWidth(context) / 4
                                          : getWidth(context) / 6,
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
               Positioned(
                top: 15,
                right: 15,
                child: PopUpMenuButtonWidget( mOnDeleteTap: () {},),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
