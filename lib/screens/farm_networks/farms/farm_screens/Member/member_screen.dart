import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Member/dialogs/dialog_add_member.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Member/dialogs/dialog_select_person.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Member/info_member.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../app_common_widgets/icon_text_container.dart';
import '../../../../../utils/functions.dart';
import '../../../../../utils/responsive.dart';
import '../../../../../utils/styles.dart';
import '../../../../contacts/widgets/popup_menu_button.dart';
import '../../../../office/widgets/add_text_button_widget.dart';

class MembersScreen extends StatefulWidget {
  const MembersScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MembersScreen> createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  List<bool> checks = [];
  bool checkAll = false;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      checks.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        height: getHeight(context),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            SizedBox(
              width: getWidth(context),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Members",
                    size: 26,
                    color: hoverColor,
                    weight: FontWeight.bold,
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      AddTextButtonWidget(
                        text: "Select Existing Person",
                        colors: lightskin,
                        onPress: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SelectPersonDialog();
                              });
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconAndTextContainer(
                        addText: "New Members",
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddMembersDialog();
                              });
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: getWidth(context),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                      height: 20 * 20,
                      // width: getWidth(context),
                      child: ListView(
                        shrinkWrap: false,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MembersInfoWidget(
                                  first: true,
                                  check: checkAll,
                                  memberName: "Name",
                                  memberEmail: "Email",
                                  memberNumber: "Phone number",
                                  joinDate: "Join Date ",
                                  memberRole: "Role",
                                  size: !Responsive.isDesktop(context)
                                      ? getWidth(context) / 3.5
                                      : getWidth(context) / 6,
                                ),
                              ),
                              Divider(
                                color: Colors.black26,
                                height: 1,
                              ),
                              for (int i = 0; i < 4; i++)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: MembersInfoWidget(
                                    first: false,
                                    check: checks[i],
                                    memberName: "test3",
                                    memberEmail: "03-02-2022",
                                    memberNumber: "04-05-2022",
                                    joinDate: "JoinDate",
                                    memberRole: "Role",
                                    size: !Responsive.isDesktop(context)
                                        ? getWidth(context) / 3.5
                                        : getWidth(context) / 6,
                                  ),
                                ),
                            ],
                          ),
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
            ),
          ],
        ),
      ),
    );
  }
}
