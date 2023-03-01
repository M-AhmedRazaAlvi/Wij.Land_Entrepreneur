import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wij_land/screens/communications/anecdotes/widgets/anecdotes_delete_dialog_widget.dart';

showPopupAnecdotesMenu(context, size) {
  showMenu<String>(
    context: context,
    position: RelativeRect.fromLTRB(25.0, size, 20.0,
        0.0), //position where you want to show the menu on screen
    items: [
      PopupMenuItem<String>(
          child: Row(
            children: const [
              FaIcon(
                FontAwesomeIcons.trash,
                size: 14,
              ),
              SizedBox(width: 8),
              Text('Delete'),
            ],
          ),
          value: '1'),
      PopupMenuItem<String>(
          child: Row(
            children: const [
              FaIcon(
                FontAwesomeIcons.fileAlt,
                size: 14,
              ),
              SizedBox(width: 8),
              Text('Download CSV'),
            ],
          ),
          value: '2'),
    ],
    elevation: 8.0,
  ).then((String? itemSelected) {
    if (itemSelected == null) return;

    if (itemSelected == "1") {
      //code here
      showDialog(
          context: context,
          builder: (_) {
            return DeleteAnecdotesDialogWidget();
          });
    } else if (itemSelected == "2") {
      //code here
      /*  showDialog(
          context: context,
          builder: (_) {
            return DeleteAnecdotesDialogWidget();
          });*/
    }
  });
}
