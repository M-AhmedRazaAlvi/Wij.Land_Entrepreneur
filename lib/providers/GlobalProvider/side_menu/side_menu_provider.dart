import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wij_land/utils/images.dart';

import '../../../routes/routes.dart';
import '../../../utils/styles.dart';

class SideMenuProvider extends GetxController {
  // TODO : Will check commented code later
  static SideMenuProvider instance = Get.find();
  var activeItem = entrepreneurNetworkPageDisplayName.obs;
  var activeItemRoute = entreprenuersScreenPageRoute.obs;
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
      case homePageDisplayName:
        return _customSvg(SvgIcons.homeIcon, itemName);
      case quickLinksPageDisplayName:
        return _customIcon(FontAwesomeIcons.bolt, itemName);
      case officePageDisplayName:
        return _customSvg(SvgIcons.fileLineIcon, itemName);
      case contactsPageDisplayName:
        return _customSvg(SvgIcons.userIcon, itemName);
      case mapPageDisplayName:
        return _customSvg(SvgIcons.mapIcon, itemName);
      case dynamicFilterPageDisplayName:
        return _customSvg(SvgIcons.filterIcon, itemName);
      case farmNetworkPageDisplayName:
        return _customSvg(SvgIcons.leafIcon, itemName);
      case entrepreneurNetworkPageDisplayName:
        return _customSvg(SvgIcons.leafIcon, itemName);
      case reviewRequestDisplayName:
        return _customIcon(FontAwesomeIcons.solidComments, itemName);
      case communicationPageDisplayName:
        return _customSvg(SvgIcons.folderOpenIcon, itemName);

      case permissionsDisplayName:
        return _customSvg(SvgIcons.lockIcon, itemName);
      case reportingPageDisplayName:
        return _customSvg(SvgIcons.folderOpenIcon, itemName);
      case settingsPageDisplayName:
        return _customSvg(SvgIcons.gearIcon, itemName);
      case authPageDisplayName:
        return _customIcon(Icons.logout, itemName);
      default:
        return _customIcon(Icons.logout, itemName);
    }
  }

  Widget _customIcon(dynamic icon, String itemName) {
    if (isActive(itemName)) {
      return Icon(
        icon,
        size: 16,
        color: primary,
      );
    }
    return Icon(
      icon,
      size: 14,
      color: isHovering(itemName) ? primary : lightWhite,
    );
  }

  Widget _customSvg(String svg, String itemName) {
    if (isActive(itemName)) {
      return SvgPicture.asset(
        svg,
        color: primary,
        width: 12,
        height: 12,
      );
    }
    return SvgPicture.asset(
      svg,
      width: 12,
      height: 12,
      color: isHovering(itemName) ? primary : lightWhite,
    );
  }
}
