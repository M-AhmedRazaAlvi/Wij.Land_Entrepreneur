import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wij_land/screens/communications/events/widgets/events_delete_dialog_widget.dart';

import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';

var colorsEventList = [
  Color(0xFFA71832),
  Color(0XFF48883E),
  Color(0XFF82C454),
  Color(0XFF6BCADB),
];
var titleEventList = [
  'Attending',
  'May be Attending',
  'Not Attending',
  'Unknown'
];
var countsEventList = [
  '5987',
  '44830',
  '44275',
  '0',
];
var eventTitles = ['Event Details', 'Guest', 'Files/Media'];
var titleEventClicked = [true, false, false];
var plusClicked = [];

var guestAttendList = ['Select Attended', 'Yes', 'No'];
var guestResponseList = ['Select Response', 'Yes', 'No', 'Maybe'];
var guestRoundList = [
  'Select Round',
  'Round 1 ',
  'Round 2',
];
var responseType = 'Select Response', contactPerson = false, contactText = '';

showPopupEMenu(context) {
  showMenu<String>(
    context: context,
    position: RelativeRect.fromLTRB(
        25.0,
        !Responsive.isDesktop(context) ? 380 : 100.0,
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
              Text('Delete Event'),
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
            return DeleteEventsDialogWidget();
          });
    }
  });
}

showPopupFileMenu(context) {
  showMenu<String>(
    context: context,
    position: RelativeRect.fromLTRB(
        25.0,
        !Responsive.isDesktop(context) ? 380 : 580.0,
        24.0,
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
      /*   showDialog(
          context: context,
          builder: (_) {
            return DeleteEventsDialogWidget();
          });*/
    }
  });
}

showPopupEventsMenu(context) {
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
              Text('Delete'),
            ],
          ),
          value: '1'),
      PopupMenuItem<String>(
          child: Row(
            children: const [
              FaIcon(FontAwesomeIcons.fileAlt, size: 14),
              SizedBox(width: 8),
              Text('Download CSV'),
            ],
          ),
          value: '2'),
      PopupMenuItem<String>(
          child: Row(
            children: const [
              FaIcon(FontAwesomeIcons.copy, size: 14),
              SizedBox(width: 8),
              Text('Copy Event'),
            ],
          ),
          value: '3'),
    ],
    elevation: 8.0,
  ).then((String? itemSelected) {
    if (itemSelected == null) return;

    if (itemSelected == "1") {
      //code here
      showDialog(
          context: context,
          builder: (_) {
            return DeleteEventsDialogWidget();
          });
    }
  });
}

showPopupGuestMenu(context) {
  showMenu<String>(
    context: context,
    position: RelativeRect.fromLTRB(25.0, getHeight(context) / 5, 20.0,
        0.0), //position where you want to show the menu on screen
    items: [
      PopupMenuItem<String>(
          child: Row(
            children: const [
              FaIcon(FontAwesomeIcons.fileAlt, size: 14),
              SizedBox(width: 8),
              Text('Download CSV'),
            ],
          ),
          value: '1'),
      PopupMenuItem<String>(
          child: Row(
            children: const [
              FaIcon(
                FontAwesomeIcons.trashAlt,
                size: 14,
              ),
              SizedBox(width: 8),
              Text('Remove Guests'),
            ],
          ),
          value: '2'),
      PopupMenuItem<String>(
          child: Row(
            children: const [
              FaIcon(FontAwesomeIcons.recycle, size: 14),
              SizedBox(width: 8),
              Text('Bulk Edit'),
            ],
          ),
          value: '3'),
      PopupMenuItem<String>(
          child: Row(
            children: const [
              FaIcon(FontAwesomeIcons.mailchimp, size: 14),
              SizedBox(width: 8),
              Text('Email'),
            ],
          ),
          value: '4'),
    ],
    elevation: 8.0,
  ).then((String? itemSelected) {
    if (itemSelected == null) return;

    if (itemSelected == "2") {
      //code here
      showDialog(
          context: context,
          builder: (_) {
            return DeleteEventsDialogWidget();
          });
    }
  });
}
