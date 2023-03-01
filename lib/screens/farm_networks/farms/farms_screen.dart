import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/widgets/dialog_farms_add.dart';
import 'package:wij_land/screens/farm_networks/farms/widgets/farm_info_row.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/icon_text_container.dart';
import '../../../../../../../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../../../../../../../utils/controller.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../app_common_widgets/animated_search.dart';
import '../../../routes/routes.dart';
import '../../contacts/widgets/popup_menu_button.dart';
import '../../office/widgets/search_widget.dart';

class FarmsScreen extends StatefulWidget {
  const FarmsScreen({Key? key}) : super(key: key);

  @override
  State<FarmsScreen> createState() => _FarmsScreenState();
}

class _FarmsScreenState extends State<FarmsScreen> {
  // ACTIVE SINCE
  List<String> selectedActiveSince = [];
  String activeSince = "2017";
  List<String> activeSinceList = [
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022'
  ];

  // PROVIINCE
  List<String> selectedProvinceList = [];
  String province = "Drenthe";
  List<String> provinceList = [
    'Drenthe',
    'Flevoland',
    'Friesland',
    'Gelderland',
    'Groningen',
    'Limburg',
    'Noord-Brabant',
    'Noord-Holland',
    'Overijssel',
    'Utrecht',
    'Zeeland',
    'Zuid-Holland',
  ];

// CERTIFICATE
  String certificate = 'Normal';
  List<String> selectedCertificateList = [];
  List<String> certificateList = [
    'Normal',
    'Bio-dynamic',
    'Certified',
    'Planet Proof',
    'Transition ',
    'Other'
  ];

// FARMING TYPE
  String farmingType = "Arable Farming";
  List<String> selectedFarmingType = [];
  List<String> farmingTypeList = [
    'Arable Farming',
    'Cattle, double',
    'Dairy Farming',
    'Meat Farming',
    'Mixed Farming',
    'Other'
  ];

// VISITAION
  List<String> visitationList = ['Yes', 'No'];
  String visitation = "Yes";
  bool searchTapped = false, filterTapped = false;
  bool onLocation = false, onProfile = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          height: getHeight(context),
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            CustomText(
                              text: "Farms",
                              size: 30,
                              color: third,
                              weight: FontWeight.bold,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ClickIconButton(
                              icon: Icons.location_pin,
                              clickcolors:
                                  onLocation ? hoverColor : Colors.white,
                              onPressed: () {
                                setState(() {
                                  onProfile = false;
                                  onLocation = true;
                                });
                              },
                            ),
                            ClickIconButton(
                              icon: Icons.list,
                              clickcolors:
                                  onProfile ? hoverColor : Colors.white,
                              onPressed: () {
                                setState(() {
                                  onProfile = true;
                                  onLocation = false;
                                });
                              },
                            ),
                          ],
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            AnimatedSearchWidget(),
                            ClickIconButton(
                              icon: Icons.filter_list,
                              clickcolors:
                                  filterTapped ? hoverColor : Colors.white,
                              onPressed: () {
                                setState(() {
                                  filterTapped = !filterTapped;
                                });
                              },
                            ),
                            IconAndTextContainer(
                              addText: "Add Farm",
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return FarmsAddDialogBox(
                                        profileText: "Add Farm",
                                        submitText: "Add Farm",
                                      );
                                    });
                              },
                            ),
                            // AddIconsAndDialogBox(
                            //   icons: Icons.filter_list,
                            //   onIconTap: () {
                            //     setState(
                            //       () {
                            //         filterTapped = !filterTapped;
                            //       },
                            //     );
                            //   },
                            //   addText: "Add Farm",
                            //   onTap: () {
                            //     showDialog(
                            //         context: context,
                            //         builder: (BuildContext context) {
                            //           return FarmsAddDialogBox(
                            //             profileText: "Add Farm",
                            //             submitText: "Add Farm",
                            //           );
                            //         });
                            //   },
                            // ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    if (filterTapped)
                      Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Wrap(
                            alignment: WrapAlignment.spaceAround,
                            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SelectableDropdownWidget(
                                items: activeSinceList,
                                title: "Active in Wij.land since",
                                mSelectedValue: "",
                                mOnDropDownChange: (value) {},
                                mSelectedItemsList: [],
                              ),
                              SelectableDropdownWidget(
                                items: provinceList,
                                title: "Province",
                                mSelectedValue: "",
                                mOnDropDownChange: (value) {},
                                mSelectedItemsList: [],
                              ),
                              SelectableDropdownWidget(
                                items: certificateList,
                                title: "Certification",
                                mSelectedValue: "",
                                mOnDropDownChange: (value) {},
                                mSelectedItemsList: [],
                              ),
                              SelectableDropdownWidget(
                                items: farmingTypeList,
                                title: "Farming Type",
                                mSelectedValue: "",
                                mOnDropDownChange: (value) {},
                                mSelectedItemsList: [],
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (onProfile)
                      Stack(
                        children: [
                          Card(
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: SizedBox(
                              height: 30 * 25,
                              width: getWidth(context),
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                children: [
                                  Column(
                                    children: [
                                      FarmInfoRow(
                                        first: true,
                                        firstName: "Farm Name",
                                        farmRepresentative:
                                            "Farm Representative",
                                        lastFarmVisit: "Last Farm Visit",
                                        lastContact: "Last Contact",
                                        lastContactType: "Last Contact Type",
                                        dateAdded: "Date Added",
                                        size: !Responsive.isDesktop(context)
                                            ? getWidth(context) / 3
                                            : getWidth(context) / 7,
                                      ),
                                      for (int i = 0; i < 10; i++)
                                        InkWell(
                                          onTap: () {
                                            //  Get.to(FarmProfileScreens());
                                            navigationController
                                                .navigateTo(farmProfileRoute);
                                          },
                                          child: FarmInfoRow(
                                            first: false,
                                            firstName: "Farm of Jacob Piersson",
                                            farmRepresentative:
                                                "Frederik Hengeveld",
                                            lastFarmVisit: "22-07-2021",
                                            lastContact: "22-07-2021",
                                            lastContactType: "Phone Call",
                                            dateAdded: "22-07-2021",
                                            size: !Responsive.isDesktop(context)
                                                ? getWidth(context) / 3
                                                : getWidth(context) / 7,
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
                            child: PopUpMenuButtonWidget(
                              mOnDeleteTap: () {},
                            ),
                          ),
                        ],
                      ),
                    if (onLocation)
                      Container(
                        height: 300,
                        color: Colors.grey,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
