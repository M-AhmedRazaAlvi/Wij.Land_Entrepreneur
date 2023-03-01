import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wij_land/routes/routes.dart' as route;

import '../../app_common_widgets/custom_text.dart';
import '../../utils/controller.dart';
import '../../utils/responsive.dart';
import '../../utils/styles.dart';
import '../routes/routes.dart';

class VerticalMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  final route.MenuItem menuItem;

  const VerticalMenuItem(
      {Key? key,
      required this.itemName,
      required this.onTap,
      required this.menuItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return menuItem.isExpandale
        ? expandableVerticalMenuItem()
        : baseVerticalMenuItem();
  }

  Widget expandableVerticalMenuItem() {
    return InkWell(
      onHover: (value) {
        value
            ? menuFarmerController.onHover(itemName)
            : menuFarmerController.onHover("not hovering");
      },
      child: ExpansionTile(
        trailing: SizedBox(),
        title: Obx(
          () => Container(
            color: menuFarmerController.isHovering(itemName)
                ? lightGrey.withOpacity(.1)
                : Colors.transparent,
            child: Row(
              children: [
                Visibility(
                  visible: menuFarmerController.isHovering(itemName) ||
                      menuFarmerController.isActive(itemName),
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: Container(
                    width: 3,
                    height: 72,
                    color: dark,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: menuFarmerController.returnIconFor(itemName),
                        ),
                        if (!menuFarmerController.isActive(itemName))
                          Flexible(
                              child: CustomText(
                            text: itemName,
                            color: menuFarmerController.isHovering(itemName)
                                ? primary
                                : lightGrey,
                            size: 14,
                            weight: FontWeight.normal,
                          ))
                        else
                          Flexible(
                              child: CustomText(
                            text: itemName,
                            color: third,
                            size: 18,
                            weight: FontWeight.bold,
                          ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: menuItem.innerMenu!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // debug debugPrint"$item PRESSED");
                    if (menuItem.innerMenu![index].route ==
                        farmerAuthPageRoute) {
                      authController.signOut();
                    }
                    if (!menuFarmerController
                        .isActive(menuItem.innerMenu![index].name)) {
                      menuFarmerController.changeActiveItemTo(
                          menuItem.innerMenu![index].name,
                          menuItem.innerMenu![index].route);
                      if (!Responsive.isDesktop(context)) {
                        Get.back();
                      }
                      // navigationController.navigateTo(context,menuItem.innerMenu![index].route);
                      navigationController
                          .navigateTo(menuItem.innerMenu![index].route);
                    }
                  },
                  onHover: (value) {
                    value
                        ? menuFarmerController
                            .onHover(menuItem.innerMenu![index].name)
                        : menuFarmerController.onHover("not hovering");
                  },
                  child: Obx(
                    () => Container(
                      color: menuFarmerController
                              .isHovering(menuItem.innerMenu![index].name)
                          ? lightGrey.withOpacity(.1)
                          : Colors.transparent,
                      child: Row(
                        children: [
                          Visibility(
                            visible: menuFarmerController.isHovering(
                                    menuItem.innerMenu![index].name) ||
                                menuFarmerController
                                    .isActive(menuItem.innerMenu![index].name),
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            child: Container(
                              width: 3,
                              height: 72,
                              color: dark,
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Padding(
                                  //   padding: const EdgeInsets.all(16),
                                  //   child: menuFarmerController.returnIconFor(
                                  //       menuItem.innerMenu![index].name),
                                  // ),
                                  if (!menuFarmerController.isActive(
                                      menuItem.innerMenu![index].name))
                                    Flexible(
                                        child: CustomText(
                                      text: menuItem.innerMenu![index].name,
                                      color: menuFarmerController.isHovering(
                                              menuItem.innerMenu![index].name)
                                          ? primary
                                          : lightGrey,
                                      size: 14,
                                      weight: FontWeight.normal,
                                    ))
                                  else
                                    Flexible(
                                        child: CustomText(
                                      text: menuItem.innerMenu![index].name,
                                      color: third,
                                      size: 18,
                                      weight: FontWeight.bold,
                                    ))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }

  Widget baseVerticalMenuItem() {
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? menuFarmerController.onHover(itemName)
            : menuFarmerController.onHover("not hovering");
      },
      child: Obx(
        () => Container(
          color: menuFarmerController.isHovering(itemName)
              ? lightGrey.withOpacity(.1)
              : Colors.transparent,
          child: Row(
            children: [
              Visibility(
                visible: menuFarmerController.isHovering(itemName) ||
                    menuFarmerController.isActive(itemName),
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Container(
                  width: 3,
                  height: 72,
                  color: dark,
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: menuFarmerController.returnIconFor(itemName),
                      ),
                      if (!menuFarmerController.isActive(itemName))
                        Flexible(
                            child: CustomText(
                          text: itemName,
                          color: menuFarmerController.isHovering(itemName)
                              ? primary
                              : lightGrey,
                          size: 14,
                          weight: FontWeight.normal,
                        ))
                      else
                        Flexible(
                            child: CustomText(
                          text: itemName,
                          color: third,
                          size: 18,
                          weight: FontWeight.bold,
                        ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
