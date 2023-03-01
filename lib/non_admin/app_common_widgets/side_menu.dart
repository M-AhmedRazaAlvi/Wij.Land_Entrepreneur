import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wij_land/non_admin/app_common_widgets/side_menu_item.dart';

import '../../routes/routes.dart';
import '../../utils/controller.dart';
import '../../utils/responsive.dart';
import '../../utils/styles.dart';
import '../routes/routes.dart';

class SideFarmerMenu extends StatelessWidget {
  final bool? isexpand;

  const SideFarmerMenu({Key? key, this.isexpand}) : super(key: key);

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
                return SideMenuFarmerItem(
                  menuItem: sideMenuFarmerItems[index],
                  isExpand: isexpand,
                  itemName: sideMenuFarmerItems[index].name == authPageDisplayName ? "Log Out" : sideMenuFarmerItems[index].name,
                  onTap: () {
                    // print('sideMenuFarmerItems = ${sideMenuFarmerItems[index].route}');
                    if (sideMenuFarmerItems[index].route == '/farmer_auth') {
                      // launchUrl('https://$gloal_base_path/login');
                      Get.offNamedUntil(authPageRoute, (route) => false);
                    } else {
                      if (!menuFarmerController.isActive(sideMenuFarmerItems[index].name)) {
                        print('sideMenuFarmerItems = ${sideMenuFarmerItems[index].name}');
                        menuFarmerController.changeActiveItemTo(sideMenuFarmerItems[index].name, sideMenuFarmerItems[index].route);
                        if (!Responsive.isDesktop(context)) {
                          Get.back();
                        }
                        navigationController.navigateTo(sideMenuFarmerItems[index].route);
                        // navigationController.navigateTo(context,item.route);
                      } else {
                        navigationController.navigatorKey.currentState!.pushReplacementNamed(sideMenuFarmerItems[index].route);
                      }
                    }
                  },
                );
              },
              childCount: sideMenuFarmerItems.length,
            ),
          )
        ],
      ),
    );
  }
}
