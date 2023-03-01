import 'package:flutter/material.dart';
import 'package:wij_land/screens/contacts/contacts/contacts_info_row.dart';

import '../../../app_common_widgets/custom_text.dart';
import '../../../routes/routes.dart';
import '../../../utils/controller.dart';
import '../../../utils/functions.dart';
import '../../../utils/responsive.dart';
import '../../../utils/styles.dart';
import '../../office/office_programes/Widgets/addicon_and_dialog.dart';
import '../widgets/add_member_dialog.dart';
import '../widgets/popup_menu_button.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final bool searchTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.all(10),
      height: getHeight(context),
      width: getWidth(context),
      child: CustomScrollView(
        shrinkWrap: true,
        //   physics: AlwaysScrollableScrollPhysics(),

        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(
              width: getWidth(context),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                //       crossAxisAlignment: WrapCrossAlignment.cnter,
                children: [
                  CustomText(
                    text: "People",
                    weight: FontWeight.bold,
                    color: third,
                    size: 22,
                  ),
                  AddIconsAndDialogBox(
                      icons: Icons.filter_alt,
                      onIconTap: () {},
                      addText: "person",
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AddMemberDialog();
                            });
                      })
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Card(
                  elevation: 3,
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: SizedBox(
                    height: 30 * 40,
                    //width: getWidth(context),
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              ContactsInfoRow(
                                  firstName: "First Name",
                                  lastName: "Last Name",
                                  email: "E-mail",
                                  phoneNumber: "Phone Number",
                                  farm: "Farm/Organization",
                                  organizationType: "Organization Type",
                                  role: "Role",
                                  first: false,
                                  size: !Responsive.isDesktop(context)
                                      ? getWidth(context) / 3
                                      : getWidth(context) / 8.9),
                              for (int i = 0; i <= 10; i++)
                                InkWell(
                                  onTap: () {
                                    navigationController
                                        .navigateTo(contactsPersonProfileRoute);
                                  },
                                  child: ContactsInfoRow(
                                      first: true,
                                      firstName: "ajay",
                                      lastName: "jadeja",
                                      email: "jadeja007@gmail",
                                      phoneNumber: "090078601",
                                      farm: "farm",
                                      organizationType: "organizationType",
                                      role: "role",
                                      size: !Responsive.isDesktop(context)
                                          ? getWidth(context) / 3
                                          : getWidth(context) / 8.9),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  right: 15,
                  child: PopUpMenuButtonWidget(
                    mOnDeleteTap: () {},
                  ),
                ),
              ],
            )
          ]))
        ],
      ),
    ));
  }
}
