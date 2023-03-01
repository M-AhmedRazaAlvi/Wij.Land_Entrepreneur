import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wij_land/non_admin/routes/routes.dart';
import 'package:wij_land/utils/images.dart';

import '../../../utils/styles.dart';

class SideMenuFarmerProvider extends GetxController {
  // TODO : Will check commented code later
  static SideMenuFarmerProvider instance = Get.find();
  var activeItem = nHomePageDisplayName.obs;
  var activeItemRoute = farmerRoute.obs;
  var hoverItem = "";

  changeActiveItemTo(String itemName, String route) {
    activeItem.value = itemName;
    activeItemRoute.value = route;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) {
      hoverItem = itemName;
    }
  }

  bool isActive(String itemName) => itemName == activeItem.value;

  bool isHovering(String itemName) => itemName == hoverItem;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case nHomePageDisplayName:
        return _customIcon(Icons.home, itemName);
      case farmComputerProjectName:
        return _customIcon(Icons.folder, itemName);
      case farmComputerEventsName:
        return _customSvg(IconImages.eventsIcon, itemName);
      case farmComputerActionName:
        return _customSvg(IconImages.actionIcon, itemName);
      case farmComputerParcelDataName:
        return _customIcon(Icons.dynamic_feed, itemName);
      case farmComputerParcelName:
        return _customIcon(Icons.map, itemName);
      case farmComputerFileName:
        return _customIcon(CupertinoIcons.doc_on_doc_fill, itemName);
      case farmComputerContactMomentName:
        return _customIcon(Icons.contact_phone_rounded, itemName);
      case farmComputerDataOverviewName:
        return _customIcon(Icons.ac_unit, itemName);

      case farmerAuthPageDisplayName:
        return _customIcon(Icons.logout, itemName);
      case farmerComputerMemberScreenName:
        return _svgImage(SvgIcons.memberIcon, itemName);
      default:
        return _customIcon(Icons.lock, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) {
      return Icon(
        icon,
        size: 18,
        color: primary,
      );
    }
    return Icon(
      icon,
      size: 18,
      color: isHovering(itemName) ? primary : lightGrey,
    );
  }

  Widget _customSvg(String svg, String itemName) {
    if (isActive(itemName)) {
      return Image.asset(
        svg,
        width: 22,
        height: 22,
      );
    }
    return Image.asset(
      svg,
      width: 22,
      height: 22,
      color: isHovering(itemName) ? primary : lightGrey,
    );
  }
  Widget _svgImage(String svg, String itemName) {
    if (isActive(itemName)) {
      return SvgPicture.asset(
        svg,
        color: primary,
        width: 22,
        height: 22,
      );
    }
    return SvgPicture.asset(
      svg,
      width: 22,
      height: 22,
      color: isHovering(itemName) ? primary : lightGrey,
    );
  }
}
