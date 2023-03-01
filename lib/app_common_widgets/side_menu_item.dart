import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/app_common_widgets/horizontal_menu_items.dart';
import 'package:wij_land/routes/routes.dart' as menu;

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  final menu.MenuItem menuItem;
  final bool? isexpand;
  const SideMenuItem({
    Key? key,
    required this.itemName,
    required this.onTap,
    required this.menuItem,
    this.isexpand,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return HorizontalMenuItem(
      itemName: itemName,
      onTap: onTap,
      isexpand: isexpand,
      menuItem: menuItem,
    );
  }
}
