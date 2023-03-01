import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wij_land/screens/communications/events/widgets/files_media/add_file_dialog_widget.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../app_common_widgets/on_hover.dart';

class AddEventFileDialogWidget extends StatefulWidget {
  const AddEventFileDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddEventFileDialogWidget> createState() =>
      _AddEventFileDialogWidgetState();
}

class _AddEventFileDialogWidgetState extends State<AddEventFileDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: AlertDialog(
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Select a File Type",
                      size: 24,
                      weight: FontWeight.bold,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Files",
                  size: 30,
                  color: Color(0xff231f20),
                  weight: FontWeight.w800,
                ),
                SizedBox(height: 30),
                Wrap(
                  spacing: 20,
                  runSpacing: 12,
                  children: [
                    OnHover(builder: (hover) {
                      return OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                              primary: Color(0xff333333),
                              fixedSize: Size(120, 40),
                              backgroundColor:
                                  hover ? Colors.red : Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: BorderSide(
                                      width: 0.2, color: Colors.black))),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AddFileDialogWidget(
                                      title: 'Invitation');
                                });
                          },
                          icon: FaIcon(FontAwesomeIcons.envelope,
                              size: 14,
                              color: hover ? Colors.white : Color(0xff333333)),
                          label: Text(
                            'Invitation',
                            style: TextStyle(
                                color:
                                    hover ? Colors.white : Color(0xff333333)),
                          ));
                    }),
                    OnHover(builder: (hover) {
                      return OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                              primary: Color(0xff333333),
                              backgroundColor:
                                  hover ? Colors.red : Colors.transparent,
                              fixedSize: Size(170, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: BorderSide(
                                      width: 0.2, color: Colors.black))),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AddFileDialogWidget(
                                      title: 'Presentation Files');
                                });
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.solidFilePowerpoint,
                            size: 14,
                            color: hover ? Colors.white : Color(0xff333333),
                          ),
                          label: Text(
                            'Presentation Files',
                            style: TextStyle(
                              color: hover ? Colors.white : Color(0xff333333),
                            ),
                          ));
                    }),
                    OnHover(builder: (hover) {
                      return OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                              primary: Color(0xff333333),
                              backgroundColor:
                                  hover ? Colors.red : Colors.transparent,
                              fixedSize: Size(140, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: BorderSide(
                                      width: 0.2, color: Colors.black))),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AddFileDialogWidget(
                                      title: 'Event Report');
                                });
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.solidFile,
                            size: 14,
                            color: hover ? Colors.white : Color(0xff333333),
                          ),
                          label: Text(
                            'Event Report',
                            style: TextStyle(
                              color: hover ? Colors.white : Color(0xff333333),
                            ),
                          ));
                    }),
                    OnHover(builder: (hover) {
                      return OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                              primary: Color(0xff333333),
                              backgroundColor:
                                  hover ? Colors.red : Colors.transparent,
                              fixedSize: Size(100, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: BorderSide(
                                      width: 0.2, color: Colors.black))),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AddFileDialogWidget(title: 'Media');
                                });
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.camera,
                            size: 14,
                            color: hover ? Colors.white : Color(0xff333333),
                          ),
                          label: Text(
                            'Media',
                            style: TextStyle(
                              color: hover ? Colors.white : Color(0xff333333),
                            ),
                          ));
                    }),
                    OnHover(builder: (hover) {
                      return OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                              primary: Color(0xff333333),
                              backgroundColor:
                                  hover ? Colors.red : Colors.transparent,
                              fixedSize: Size(220, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: BorderSide(
                                      width: 0.2, color: Colors.black))),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AddFileDialogWidget(
                                      title: 'Background Information');
                                });
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.infoCircle,
                            size: 14,
                            color: hover ? Colors.white : Color(0xff333333),
                          ),
                          label: Text(
                            'Background Information',
                            style: TextStyle(
                              color: hover ? Colors.white : Color(0xff333333),
                            ),
                          ));
                    }),
                    OnHover(builder: (hover) {
                      return OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              primary: Color(0xff333333),
                              backgroundColor:
                                  hover ? Colors.red : Colors.transparent,
                              fixedSize: Size(70, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: BorderSide(
                                      width: 0.2, color: Colors.black))),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AddFileDialogWidget(title: 'Other');
                                });
                          },
                          child: Text(
                            'Other',
                            style: TextStyle(
                              color: hover ? Colors.white : Color(0xff333333),
                            ),
                          ));
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
