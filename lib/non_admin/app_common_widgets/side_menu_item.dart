import 'package:flutter/material.dart';
import 'package:wij_land/non_admin/app_common_widgets/horizontal_menu_items.dart';
import 'package:wij_land/non_admin/routes/routes.dart';

class SideMenuFarmerItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  final MenuFarmerItem menuItem;
  final bool? isExpand;
  const SideMenuFarmerItem({
    Key? key,
    required this.itemName,
    required this.onTap,
    required this.menuItem,
    this.isExpand,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HorizontalFarmerMenuItem(
      itemName: itemName,
      onTap: onTap,
      isexpand: isExpand,
      menuItem: menuItem,
    );
    // }
  }
}
