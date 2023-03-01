import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/controller.dart';
import '../../../../../../utils/functions.dart';
import '../../../../../../utils/responsive.dart';
import '../../../../../../utils/styles.dart';
import '../../../../../contacts/widgets/popup_menu_button.dart';
import '../../../../office_programes/Widgets/addicon_and_dialog.dart';
import '../widget/contact_info_row.dart';

class ProfileContactMoments extends StatefulWidget {
  const ProfileContactMoments({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileContactMoments> createState() => _ProfileContactMomentsState();
}

class _ProfileContactMomentsState extends State<ProfileContactMoments> {
  List<bool> checks = [];
  bool searchTapped = false;
  bool checkAll = false;
  bool filterTapped = false;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      checks.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        width: getWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: getWidth(context),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  CustomText(
                    text: "Contacts",
                    size: 35,
                    color: hoverColor,
                    weight: FontWeight.bold,
                  ),
                  AddIconsAndDialogBox(
                      icons: Icons.filter_list,
                      onIconTap: () {},
                      addText: "Contact Moment",
                      onTap: () {
                        navigationController.navigateTo(addContactMomentRoute);
                      }),
                ],
              ),
            ),
            SizedBox(
              width: getWidth(context),
              child: Stack(
                children: [
                  Card(
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50 * 21,
                            width: getWidth(context),
                            child: ListView(
                              shrinkWrap: false,
                              scrollDirection: Axis.horizontal,
                              children: [
                                Column(
                                  children: [
                                    ContactInfoWidget(
                                      first: true,
                                      check: checkAll,
                                      contactType: "Contact Type",
                                      contactDate: "Contact Date",
                                      peopleInvolved: "People Involved",
                                      comment: "Comment",
                                      size: !Responsive.isDesktop(context)
                                          ? getWidth(context) / 3
                                          : getWidth(context) / 6,
                                    ),
                                    Divider(
                                      color: Colors.black26,
                                      height: 1,
                                    ),
                                    for (int i = 0; i < 10; i++)
                                      InkWell(
                                        onTap: () {
                                          navigationController
                                              .navigateTo(onContactMomentRoute);
                                        },
                                        child: ContactInfoWidget(
                                          first: false,
                                          check: checkAll,
                                          contactType: "Live Meeting",
                                          contactDate: "03-05-2022",
                                          peopleInvolved: "Gerd McAlister",
                                          comment: "test",
                                          size: !Responsive.isDesktop(context)
                                              ? getWidth(context) / 3
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
                    child: PopUpMenuButtonWidget(
                      mOnDeleteTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
