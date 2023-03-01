import 'package:flutter/material.dart';
import 'package:wij_land/screens/office/wij_lan_team/person_profile/contract/Dialogs/add_dialog_contract.dart';
import 'package:wij_land/screens/office/wij_lan_team/person_profile/contract/contract_info_row.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../utils/functions.dart';
import '../../../../../../utils/responsive.dart';
import '../../../../../../utils/styles.dart';
import '../../../../contacts/widgets/popup_menu_button.dart';
import '../../../office_programes/Widgets/addicon_and_dialog.dart';

class ProfileContractScreens extends StatefulWidget {
  const ProfileContractScreens({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileContractScreens> createState() => _ProfileContractScreensState();
}

class _ProfileContractScreensState extends State<ProfileContractScreens> {
  List<bool> checks = [];
  bool checkAll = false;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      checks.add(false);
    }
  }

  late bool searchTapped, filterTapped = false;

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
                    color: darkGreen,
                    weight: FontWeight.bold,
                  ),
                  Expanded(
                    child: AddIconsAndDialogBox(
                        icons: Icons.filter_list,
                        onIconTap: () {},
                        addText: "Contract",
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddContractDialog(
                                  profileText: "Add Contract",
                                  submitText: "Add Contract",
                                );
                              });
                        }),
                  ),
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
                                    ContractInfoWidget(
                                      first: true,
                                      check: checkAll,
                                      description: "Description",
                                      contractDate: "Contract Date",
                                      expirationDate: "Expriration Date",
                                      status: "Status",
                                      size: !Responsive.isDesktop(context)
                                          ? getWidth(context) / 3.5
                                          : getWidth(context) / 6,
                                    ),
                                    Divider(
                                      color: Colors.black26,
                                      height: 1,
                                    ),
                                    for (int i = 0; i < 5; i++)
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AddContractDialog(
                                                  profileText: "Edit Contract",
                                                  submitText: "Upload",
                                                );
                                              });
                                        },
                                        child: ContractInfoWidget(
                                          first: false,
                                          check: checks[i],
                                          description: "test3",
                                          contractDate: "03-02-2022",
                                          expirationDate: "04-05-2022",
                                          status: "Status",
                                          size: !Responsive.isDesktop(context)
                                              ? getWidth(context) / 3.5
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
