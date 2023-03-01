import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wij_land/routes/routes.dart' as route;
import '../utils/controller.dart';
import '../utils/responsive.dart';
import '../utils/styles.dart';
import 'custom_text.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  final route.MenuItem menuItem;
  final bool? isexpand;

  const HorizontalMenuItem(
      {Key? key,
      required this.itemName,
      required this.onTap,
      required this.menuItem,
      this.isexpand})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return !isexpand!
        ? baseHorizontalMenuItemForExpanded(_width)
        : menuItem.isExpandale
            ? expandableHorizontalMenuItem(_width)
            : baseHorizontalMenuItem(_width);
  }

  Widget expandableHorizontalMenuItem(double _width) {
    return InkWell(
      onHover: (value) {
        value
            ? menuController.onHover(itemName)
            : menuController.onHover("not hovering");
      },
      child: ExpansionTile(
          collapsedIconColor: lightGrey,
          iconColor: primary,
          title: Obx(
            () => Container(
              color: menuController.isHovering(itemName)
                  ? lightGrey.withOpacity(.1)
                  : Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  menuController.returnIconFor(itemName),
                  SizedBox(width: 10),
                  if (!menuController.isActive(itemName))
                    Flexible(
                        child: FadeIn(
                      child: CustomText(
                        text: itemName,
                        color: menuController.isHovering(itemName)
                            ? primary
                            : Colors.white,
                        size: 14,
                        weight: FontWeight.normal,
                      ),
                    ))
                  else
                    Flexible(
                        child: FadeIn(
                      child: CustomText(
                        text: itemName,
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
                      if (menuItem.innerMenu![index].route ==
                          route.authPageRoute) {
                        authController.signOut();
                      }
                      if (!menuController
                          .isActive(menuItem.innerMenu![index].name)) {
                        print('Clicked now frist');
                        menuController.changeActiveItemTo(
                            menuItem.innerMenu![index].name,
                            menuItem.innerMenu![index].route);
                        if (!Responsive.isDesktop(context)) {
                          Get.back();
                        }
                        navigationController
                            .navigateTo(menuItem.innerMenu![index].route);
                      } else {
                        navigationController.navigatorKey.currentState!
                            .pushReplacementNamed(
                                menuItem.innerMenu![index].route);
                      }
                    },
                    onHover: (value) {
                      value
                          ? menuController
                              .onHover(menuItem.innerMenu![index].name)
                          : menuController.onHover("not hovering");
                    },
                    child: Obx(
                      () => Container(
                        color: menuController
                                .isHovering(menuItem.innerMenu![index].name)
                            ? lightGrey.withOpacity(.1)
                            : Colors.transparent,
                        child: Row(
                          children: [
                            Visibility(
                              visible: menuController.isHovering(
                                      menuItem.innerMenu![index].name) ||
                                  menuController.isActive(
                                      menuItem.innerMenu![index].name),
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
                            if (!menuController
                                .isActive(menuItem.innerMenu![index].name))
                              Flexible(
                                  child: CustomText(
                                text: menuItem.innerMenu![index].name,
                                color: menuController.isHovering(
                                        menuItem.innerMenu![index].name)
                                    ? primary
                                    : Colors.white,
                                size: 12,
                                weight: FontWeight.normal,
                              ))
                            else
                              Flexible(
                                  child: CustomText(
                                text: menuItem.innerMenu![index].name,
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
    return ExpansionTile(
      collapsedIconColor: lightGrey,
      iconColor: primary,
      trailing: Icon(Icons.abc_outlined, color: secondary),
      title: InkWell(
        onTap: onTap,
        onHover: (value) {
          value
              ? menuController.onHover(itemName)
              : menuController.onHover("not hovering");
        },
        child: Obx(
          () => Container(
            color: menuController.isHovering(itemName)
                ? lightGrey.withOpacity(.1)
                : Colors.transparent,
            child: Row(
              children: [
                SizedBox(width: 10),
                menuController.returnIconFor(itemName),
                SizedBox(width: 10),
                if (!menuController.isActive(itemName))
                  Flexible(
                      child: FadeIn(
                    child: CustomText(
                      text: itemName,
                      color: menuController.isHovering(itemName)
                          ? primary
                          : Colors.white,
                      size: 14,
                      lines: 2,
                      weight: FontWeight.normal,
                    ),
                  ))
                else
                  Flexible(
                      child: FadeIn(
                    child: CustomText(
                      text: itemName,
                      color: primary,
                      size: 18,
                      lines: 2,
                      weight: FontWeight.bold,
                    ),
                  ))
              ],
            ),
          ),
        ),
      ),
      children: [],
    );
  }

  Widget baseHorizontalMenuItemForExpanded(double _width) {
    return Transform.translate(
      offset: Offset(10, 2),
      child: ExpansionTile(
        collapsedIconColor: lightGrey,
        iconColor: primary,
        leading: menuController.returnIconFor(itemName),
        trailing: SizedBox(),
        title: SizedBox(),
        children: [],
      ),
    );
  }
}
