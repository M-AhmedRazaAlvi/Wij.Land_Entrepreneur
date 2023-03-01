import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wij_land/screens/dynamic_filters/widgets/dynamic_files_delete_dialog_widget.dart';

import '../../../utils/responsive.dart';

showPopupEMenu(context) {
  showMenu<String>(
    context: context,
    position: RelativeRect.fromLTRB(
        25.0,
        !Responsive.isDesktop(context) ? 380 : 160.0,
        20.0,
        0.0), //position where you want to show the menu on screen
    items: [
      PopupMenuItem<String>(
          child: Row(
            children: const [
              FaIcon(
                FontAwesomeIcons.trashAlt,
                size: 14,
              ),
              SizedBox(width: 8),
              Text('Delete '),
            ],
          ),
          value: '1'),
    ],
    elevation: 8.0,
  ).then((String? itemSelected) {
    if (itemSelected == null) return;

    if (itemSelected == "1") {
      //code here
      showDialog(
          context: context,
          builder: (_) {
            return DeleteDynamicFileDialogWidget();
          });
    }
  });
}
