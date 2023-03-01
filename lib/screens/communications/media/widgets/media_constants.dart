import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wij_land/screens/communications/media/widgets/media_delete_dialog_widget.dart';

import '../../../../utils/responsive.dart';

var responseType = 'Select Responsible',
    responseList = [
      'Select Responsible',
      'Jan van het Landt',
      'Ajay Jadeja',
      'Amber Lemming',
      'Aquilina Emerson',
      'Arjun Milan',
      'Bob Martin',
      'Danielle de Nie'
    ];

var categoryType = 'Select Type',
    categoryList = ['Select Type', 'Online', 'Radio & TV', 'Printing Press'];

final TextEditingController controller = TextEditingController();
final TextEditingController dateController = TextEditingController();
DateTime fromDate = DateTime.now();
var format = 'Select Date';

List<String> activeSinceList = ['2017', '2018', '2019', '2020', '2021', '2022'];

showPopupMenu(context) {
  showMenu<String>(
    context: context,
    position: RelativeRect.fromLTRB(
        25.0,
        !Responsive.isDesktop(context) ? 380 : 80.0,
        20.0,
        0.0), //position where you want to show the menu on screen
    items: [
      PopupMenuItem<String>(
          child: Row(
            children: const [
              FaIcon(FontAwesomeIcons.trash),
              SizedBox(width: 8),
              Text('Delete Media Item:'),
            ],
          ),
          value: '1'),
    ],
    elevation: 8.0,
  ).then(
    (String? itemSelected) {
      if (itemSelected == null) return;

      if (itemSelected == "1") {
        //code here
        showDialog(
          context: context,
          builder: (_) {
            return DeleteMediaDialogWidget();
          },
        );
      }
    },
  );
}
