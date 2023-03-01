import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:wij_land/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart' as local;
import '../../app_common_widgets/custom_text.dart';
import '../../utils/controller.dart';
import '../../utils/responsive.dart';
import '../../utils/styles.dart';
import '../routes/routes.dart';

class HorizontalFarmerMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  final MenuFarmerItem menuItem;
  final bool? isexpand;

  const HorizontalFarmerMenuItem({Key? key, required this.itemName, required this.onTap, required this.menuItem, this.isexpand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return !isexpand!
        ? baseHorizontalMenuItemForExpanded(_width)
        : menuItem.isExpandable
            ? expandableHorizontalMenuItem(_width)
            : baseHorizontalMenuItem(_width);
  }

  Widget expandableHorizontalMenuItem(double _width) {
    return InkWell(
      onHover: (value) {
        value ? menuFarmerController.onHover(itemName) : menuFarmerController.onHover("not hovering");
      },
      child: ExpansionTile(
          collapsedIconColor: lightGrey,
          iconColor: primary,
          title: Obx(
            () => Container(
              color: menuFarmerController.isHovering(itemName) ? lightGrey.withOpacity(.1) : Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  menuFarmerController.returnIconFor(itemName),
                  SizedBox(width: 10),
                  if (!menuFarmerController.isActive(itemName))
                    Flexible(
                        child: FadeIn(
                      child: CustomText(
                        text: itemName.tr(),
                        color: menuFarmerController.isHovering(itemName) ? primary : Colors.white,
                        size: 14,
                        weight: FontWeight.normal,
                      ),
                    ))
                  else
                    Flexible(
                        child: FadeIn(
                      child: CustomText(
                        text: itemName.tr(),
                        color: primary,
                        size: 14,
                        weight: FontWeight.bold,
                      ),
                    ))
                ],
              ),
            ),
          ),
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: menuItem.innerMenu!.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // debug debugPrint"$item PRESSED");
                      if (menuItem.innerMenu![index].route == authPageRoute) {
                        authController.signOut();
                      }
                      if (!menuFarmerController.isActive(menuItem.innerMenu![index].name)) {
                        menuFarmerController.changeActiveItemTo(menuItem.innerMenu![index].name, menuItem.innerMenu![index].route);
                        if (!Responsive.isDesktop(context)) {
                          Get.back();
                        }
                        navigationController.navigateTo(menuItem.innerMenu![index].route);
                      } else {
                        navigationController.navigatorKey.currentState!.pushReplacementNamed(menuItem.innerMenu![index].route);
                      }
                    },
                    onHover: (value) {
                      value ? menuFarmerController.onHover(menuItem.innerMenu![index].name) : menuFarmerController.onHover("not hovering");
                    },
                    child: Obx(
                      () => Container(
                        color: menuFarmerController.isHovering(menuItem.innerMenu![index].name) ? lightGrey.withOpacity(.1) : Colors.transparent,
                        child: Row(
                          children: [
                            Visibility(
                              visible: menuFarmerController.isHovering(menuItem.innerMenu![index].name) ||
                                  menuFarmerController.isActive(menuItem.innerMenu![index].name),
                              maintainSize: true,
                              maintainAnimation: true,
                              maintainState: true,
                              child: Container(
                                width: 6,
                                height: 40,
                                color: dark,
                              ),
                            ),
                            SizedBox(width: 40),
                            if (!menuFarmerController.isActive(menuItem.innerMenu![index].name))
                              Flexible(
                                  child: CustomText(
                                text: menuItem.innerMenu![index].name.tr(),
                                color: menuFarmerController.isHovering(menuItem.innerMenu![index].name) ? primary : Colors.white,
                                size: 12,
                                weight: FontWeight.normal,
                              ))
                            else
                              Flexible(
                                  child: CustomText(
                                text: menuItem.innerMenu![index].name.tr(),
                                color: primary,
                                size: 12,
                                weight: FontWeight.bold,
                              ))
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ]),
    );
  }

  Widget baseHorizontalMenuItem(double _width) {
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value ? menuFarmerController.onHover(itemName) : menuFarmerController.onHover("not hovering");
      },
      child: Obx(
        () => Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          color: menuFarmerController.isHovering(itemName) ? lightGrey.withOpacity(.1) : Colors.transparent,
          child: Row(
            children: [
              SizedBox(width: 10),
              menuFarmerController.returnIconFor(itemName),
              SizedBox(width: 10),
              if (!menuFarmerController.isActive(itemName))
                Flexible(
                    child: FadeIn(
                  child: CustomText(
                    text: itemName.tr(),
                    color: menuFarmerController.isHovering(itemName) ? primary : Colors.white,
                    lines: 2,
                    size: 14,
                    weight: FontWeight.normal,
                  ),
                ))
              else
                Flexible(
                    child: FadeIn(
                  child: CustomText(
                    text: itemName.tr(),
                    color: primary,
                    lines: 2,
                    size: 18,
                    weight: FontWeight.bold,
                  ),
                ))
            ],
          ),
        ),
      ),
    );
  }

  Widget baseHorizontalMenuItemForExpanded(double _width) {
    return Transform.translate(
      offset: Offset(10, 2),
      child: ExpansionTile(
        collapsedIconColor: lightGrey,
        iconColor: primary,
        leading: menuFarmerController.returnIconFor(itemName),
        trailing: SizedBox(),
        title: SizedBox(),
        children: [],
      ),
    );
  }
}
