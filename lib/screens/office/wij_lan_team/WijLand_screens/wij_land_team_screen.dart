import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wij_land/screens/office/wij_lan_team/WijLand_screens/widgets/add_person_dialog.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../utils/controller.dart';
import '../../../../../../utils/functions.dart';
import '../../../../../utils/styles.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/responsive.dart';
import '../../../contacts/widgets/organization_info_row.dart';
import '../../../contacts/widgets/popup_menu_button.dart';
import '../../office_programes/Widgets/addicon_and_dialog.dart';

class WijLandTeamScreen extends StatefulWidget {
  const WijLandTeamScreen({Key? key}) : super(key: key);

  @override
  State<WijLandTeamScreen> createState() => _WijLandTeamScreenState();
}

class _WijLandTeamScreenState extends State<WijLandTeamScreen> {
  List<bool> checks = [];
  bool searchTapped = false;
  bool checkAll = false;
  bool filterTapped = false;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 20; i++) {
      checks.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        clipBehavior: Clip.none,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          color: Colors.grey[100],
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(() => SizedBox(
                      child: CustomText(
                        text: menuController.activeItemRoute.value,
                        size: 14,
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: getWidth(context),
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      CustomText(
                        text: "Wij.land Team",
                        size: 35,
                        color: darkGreen,
                        weight: FontWeight.bold,
                      ),
                      AddIconsAndDialogBox(
                        icons: Icons.filter_list,
                        onIconTap: () {},
                        addText: "Person",
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AddPersolDialogWidget();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
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
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50 * 21,
                              width: getWidth(context),
                              child: ListView(
                                reverse: false,
                                addRepaintBoundaries: false,
                                addSemanticIndexes: false,
                                addAutomaticKeepAlives: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Column(
                                    children: [
                                      OrganizationInfoRow(
                                        first: true,
                                        check: checkAll,
                                        logo: "",
                                        organization: "Name",
                                        organizationType: "E-mail",
                                        registrationDate: "Phone Number",
                                        size: !Responsive.isDesktop(context)
                                            ? getWidth(context) / 3.5
                                            : getWidth(context) / 6,
                                      ),
                                      Divider(
                                        color: secondary,
                                        height: 1,
                                      ),
                                      for (int i = 0; i < 10; i++)
                                        InkWell(
                                          onTap: () {
                                            navigationController.navigateTo(
                                                wijLandProfileScreenRoute);
                                          },
                                          child: OrganizationInfoRow(
                                            first: false,
                                            logo: BGImage,
                                            check: checks[i],
                                            organization: "Gerd Mcalister",
                                            organizationType: "gerd@gmail.com",
                                            registrationDate: "9344453333",
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
                      child: PopUpMenuButtonWidget( mOnDeleteTap: () {},),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
