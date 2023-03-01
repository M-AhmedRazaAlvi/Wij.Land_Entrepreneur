import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wij_land/app_common_widgets/side_menu_item.dart';
import 'package:wij_land/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';

import '../utils/controller.dart';
import '../utils/functions.dart';
import '../utils/responsive.dart';
import '../utils/styles.dart';
import '../utils/url_scheme.dart';

class SideMenu extends StatelessWidget {
  final bool? isexpand;
  const SideMenu({Key? key, this.isexpand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondary,
      height: Get.height,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: SizedBox(
            height: 10,
          )),
          SliverToBoxAdapter(
            child: !isexpand!
                ? Container(
                    child: Image.asset('assets/images/Wij.land_profile.png', fit: BoxFit.contain),
                    height: 70,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(shape: BoxShape.rectangle))
                : Container(
                    child: Center(child: Image.asset('assets/images/Logo_wijland.png', fit: BoxFit.contain)),
                    height: 70,
                    decoration: BoxDecoration(shape: BoxShape.rectangle)),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SideMenuItem(
                  menuItem: sideMenuItems[index],
                  isexpand: isexpand,
                  itemName: sideMenuItems[index].name == authPageDisplayName ? "Log Out" : sideMenuItems[index].name,
                  onTap: () {
                    if (sideMenuItems[index].route == authPageRoute) {
                      if (sideMenuItems[index].route == authPageRoute) {
                        // authController.signOut();
                        // launchUrl('https://$gloal_base_path/logout');
                        Get.offNamedUntil(authPageRoute, (route) => false);

                      }
                    } else {
                      if (!menuController.isActive(sideMenuItems[index].name)) {
                        menuController.changeActiveItemTo(sideMenuItems[index].name, sideMenuItems[index].route);
                        if (!Responsive.isDesktop(context)) {
                          Get.back();
                        }
                        navigationController.navigateTo(sideMenuItems[index].route);
                        // navigationController.navigateTo(context,item.route);
                      } else {
                        navigationController.navigatorKey.currentState!.pushReplacementNamed(sideMenuItems[index].route);
                      }
                    }
                  },
                );
              },
              childCount: sideMenuItems.length,
            ),
          )
        ],
      ),
    );
  }
}
