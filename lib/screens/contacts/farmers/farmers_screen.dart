import 'package:flutter/material.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/routes/routes.dart';
import 'package:wij_land/screens/contacts/farmers/farmers_info_row.dart';

import '../../../utils/controller.dart';
import '../../../utils/functions.dart';
import '../../../utils/responsive.dart';
import '../../../utils/styles.dart';
import '../../office/office_programes/Widgets/addicon_and_dialog.dart';
import '../widgets/add_member_dialog.dart';
import '../widgets/popup_menu_button.dart';

class FarmersScreen extends StatefulWidget {
  const FarmersScreen({Key? key}) : super(key: key);

  @override
  State<FarmersScreen> createState() => _FarmersScreenState();
}

class _FarmersScreenState extends State<FarmersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          height: getHeight(context),
          width: getWidth(context),
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: getWidth(context),
                      child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            CustomText(
                                text: "Farmers",
                                size: 20,
                                color: third,
                                weight: FontWeight.bold),
                            AddIconsAndDialogBox(
                                addText: "Farmer",
                                icons: Icons.filter_alt_sharp,
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AddMemberDialog();
                                      });
                                })
                          ]),
                    ),
                    Stack(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: SizedBox(
                            width: getWidth(context),
                            height: 30 * 35,
                            child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: FarmerInfoRow(
                                              firstName: "First Name",
                                              lastName: "Last Name",
                                              farm: "Farm",
                                              role: "Role",
                                              email: "Email",
                                              phoneNumber: "Phone Number",
                                              joinDate: 'JoinDate',
                                              first: false,
                                              size:
                                                  !Responsive.isDesktop(context)
                                                      ? getWidth(context) / 3
                                                      : getWidth(context) /
                                                          8.9),
                                        ),
                                        for (int i = 0; i <= 10; i++)
                                          InkWell(
                                            onTap: () {
                                              navigationController.navigateTo(
                                                  farmerPersonProfileRoute);
                                            },
                                            child: FarmerInfoRow(
                                                firstName: "firstName",
                                                lastName: "lastName",
                                                farm: "farm",
                                                role: "role",
                                                email: "email",
                                                phoneNumber: "phoneNumber",
                                                joinDate: "joinDate",
                                                first: true,
                                                size: !Responsive.isDesktop(
                                                        context)
                                                    ? getWidth(context) / 3
                                                    : getWidth(context) / 8.9),
                                          )
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                        ),
                        Positioned(
                          top: 15,
                          right: 15,
                          child: PopUpMenuButtonWidget( mOnDeleteTap: () {},),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
