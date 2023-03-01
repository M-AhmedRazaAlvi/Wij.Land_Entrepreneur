// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import '../../../app_common_widgets/on_hover.dart';
import '../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../utils/constants.dart';
import '../../../utils/functions.dart';
import '../../../utils/responsive.dart';
import '../../../utils/styles.dart';
import '../widgets/add_organization_dialog.dart';
import '../widgets/organization_info_row.dart';
import '../widgets/popup_menu_button.dart';

class OrganizationsScreen extends StatefulWidget {
  const OrganizationsScreen({Key? key}) : super(key: key);

  @override
  _OrganizationsScreenState createState() => _OrganizationsScreenState();
}

class _OrganizationsScreenState extends State<OrganizationsScreen> {
  bool searchTapped = false;
  bool filterTapped = false;

  // ACTIVE SINCE
  List<String> organizationTypeList = [
    'Association/collective',
    'Company',
    'Farm',
    'Foundation',
    'Governmental Institution',
    'Knowledge Institute',
    'Lab',
    'Other',
    'Site Management',
  ];
  String organizationType = "2017";
  List<String> selectedorganizationTypeList = [];

  // PROVIINCE
  List<String> relationToWijlandList = [
    'Beneficiaries',
    'Collaborative',
    'Donors/Inventors',
    'No Partnership',
    'Partners',
    'Suppliers',
  ];
  String relationToWijland = "Drenthe";
  List<String> selectedrelationToWijlandList = [];
  List<bool> checks = [];
  bool checkAll = false;
  bool optHover = false;

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          height: 50,
                          width: searchTapped ? 400 : 50,
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Center(
                                child: Row(
                              children: [
                                if (searchTapped)
                                  const Expanded(
                                      child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(bottom: 12)),
                                    ),
                                  )),
                                SizedBox(
                                  height: 42,
                                  width: 42,
                                  child: OnHover(
                                      builder: (hover) => Card(
                                            color: hover
                                                ? hoverColor
                                                : Colors.white,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  searchTapped = !searchTapped;
                                                });
                                              },
                                              child: Icon(
                                                Icons.search,
                                                color: secondary,
                                              ),
                                            ),
                                          )),
                                ),
                              ],
                            )),
                          ),
                        ),
                        OnHover(
                            builder: (hover) => InkWell(
                                  onTap: () => setState(() {
                                    filterTapped = !filterTapped;
                                  }),
                                  child: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Card(
                                      color: hover ? hoverColor : Colors.white,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      child: Center(
                                          child: Icon(
                                        Icons.filter_list,
                                        color: secondary,
                                      )),
                                    ),
                                  ),
                                )),
                        SizedBox(
                          height: 50,
                          width: 160,
                          child: OnHover(
                              builder: (hover) => InkWell(
                                    onTap: () => showDialog(
                                        context: context,
                                        builder: (_) =>
                                            const AddOrganizationDialog(
                                                edit: false)),
                                    child: Card(
                                      color: hover
                                          ? Colors.greenAccent
                                          : Colors.yellowAccent,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: secondary,
                                            ),
                                            const Text(
                                              "Add Organization",
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                    ),
                                  )),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width:
                                    !Responsive.isDesktop(context) ? 210 : 300,
                                child: SelectableDropdownWidget(
                                  items: organizationTypeList,
                                  title: "Organization Type",
                                  mSelectedValue: "",
                                  mOnDropDownChange: (value) {},
                                  mSelectedItemsList: [],
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              SizedBox(
                                width:
                                    !Responsive.isDesktop(context) ? 210 : 300,
                                child: SelectableDropdownWidget(
                                  items: relationToWijlandList,
                                  title: "Relation to Wij.land.land",
                                  mSelectedValue: "",
                                  mOnDropDownChange: (value) {},
                                  mSelectedItemsList: [],
                                ),
                              ),
                            ],
                          ),
                        ),
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
                                  height: 50 * 21,
                                  width: getWidth(context),
                                  child: ListView(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: OrganizationInfoRow(
                                              first: true,
                                              check: checkAll,
                                              logo: "Logo",
                                              organization: "Organization",
                                              organizationType:
                                                  "Organization Type",
                                              registrationDate:
                                                  "Registration Date",
                                              size:
                                                  !Responsive.isDesktop(context)
                                                      ? getWidth(context) / 3.5
                                                      : getWidth(context) / 8,
                                            ),
                                          ),
                                          Divider(
                                            color: secondary,
                                            height: 1,
                                          ),
                                          for (int i = 0; i < 20; i++)
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: OrganizationInfoRow(
                                                first: false,
                                                logo: BGImage,
                                                check: checks[i],
                                                organization:
                                                    "Farm of Jacob Piersson",
                                                organizationType:
                                                    "Frederik Hengeveld",
                                                registrationDate: "22-07-2021",
                                                size: !Responsive.isDesktop(
                                                        context)
                                                    ? getWidth(context) / 3.5
                                                    : getWidth(context) / 8,
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
