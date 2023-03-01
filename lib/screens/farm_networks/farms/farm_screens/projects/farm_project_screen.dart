import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/projects/project_info.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/controller.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../../../app_common_widgets/animated_search.dart';
import '../../../../../routes/routes.dart';
import '../../../../contacts/widgets/popup_menu_button.dart';
import '../../../../office/widgets/search_widget.dart';

class FarmProjectsScreens extends StatefulWidget {
  const FarmProjectsScreens({Key? key}) : super(key: key);

  @override
  State<FarmProjectsScreens> createState() => _FarmProjectsScreensState();
}

class _FarmProjectsScreensState extends State<FarmProjectsScreens> {
  String? ditchBank = "Select Season";
  List<String> ditchBankList = <String>[
    "Select Season",
    "Fall/Autumn",
    "Spring",
    "Summer",
    "Winter",
  ];
  bool filterTapped = false;
  bool checkAll = false;

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
              child: !Responsive.isDesktop(context)
                  ? Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            text: "Projects",
                            size: 30,
                            color: hoverColor,
                            weight: FontWeight.bold,
                          ),
                        ),
                        AnimatedSearchWidget(),
                        ClickIconButton(
                          icon: Icons.filter_list,
                          clickcolors: filterTapped ? hoverColor : Colors.white,
                          onPressed: () {
                            setState(
                              () {
                                filterTapped = !filterTapped;
                              },
                            );
                          },
                        )
                      ],
                    )
                  : Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        CustomText(
                          text: "Project",
                          size: 30,
                          color: hoverColor,
                          weight: FontWeight.bold,
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
                                setState(
                                  () {
                                    filterTapped = !filterTapped;
                                  },
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
            ),
            SizedBox(
              height: 10,
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
                      child: SizedBox(
                        height: 35 * 20,
                        width: getWidth(context),
                        child: ListView(
                          shrinkWrap: false,
                          scrollDirection: Axis.horizontal,
                          children: [
                            Column(
                              children: [
                                FarmProjectsInfoWidget(
                                  first: true,
                                  check: checkAll,
                                  projectName: "Project Name",
                                  projectRep: "Project Rep",
                                  interest: "Interest status",
                                  participation: "Participation status",
                                  parcels: "Parcels",
                                  actions: "",
                                  size: !Responsive.isDesktop(context)
                                      ? getWidth(context) / 3
                                      : getWidth(context) / 7,
                                ),
                                for (int i = 0; i < 6; i++)
                                  InkWell(
                                    onTap: () {
                                      navigationController.navigateTo(
                                          farmProjectProfileScreenRoute);
                                    },
                                    child: FarmProjectsInfoWidget(
                                      first: false,
                                      check: checkAll,
                                      projectName: "Project Name",
                                      projectRep: "Rep",
                                      interest: "Interest status",
                                      participation: "Participation status",
                                      parcels: "Parcels",
                                      actions: "",
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
                  ),
                  Positioned(
                    top: 15,
                    right: 15,
                    child: PopUpMenuButtonWidget( mOnDeleteTap: () {},),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
