import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/on_hover.dart';
import '../../../../../../utils/responsive.dart';
import '../../../../../../utils/styles.dart';
import '../../../../../office/wij_lan_team/person_profile/File_Screens/Widgets/add_media_file_dialog.dart';

class AddFileAllMediaDialogBox extends StatefulWidget {
  const AddFileAllMediaDialogBox({
    Key? key,
  }) : super(key: key);

  @override
  State<AddFileAllMediaDialogBox> createState() => _AddFileAllMediaDialogBoxState();
}

class _AddFileAllMediaDialogBoxState extends State<AddFileAllMediaDialogBox> {
  List<String> filetextList = <String>["Analysis Results", "Farm Management Plan", "Soil Advisory Reort", "Interview Report", "Media", "Other"];
  List<IconData> fileIconList = <IconData>[
    CupertinoIcons.doc_text,
    CupertinoIcons.doc_text,
    CupertinoIcons.doc_text,
    CupertinoIcons.doc_text,
    Icons.camera_alt,
    Icons.done,
  ];
  List<bool> titelBool = <bool>[];

  @override
  void initState() {
    super.initState();
    titelBool = List.filled(6, false);
    titelBool[0] = true;
  }

  final bool otherchecked = false;

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
                      text: "Select a file type",
                      size: !Responsive.isDesktop(context) ? 20 : 30,
                      weight: FontWeight.bold,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                        size: !Responsive.isDesktop(context) ? 25 : 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: "Files",
                  size: 20,
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 15,
                  runSpacing: 25,
                  children: [
                    for (int i = 0; i < 6; i++)
                      OnHover(
                        builder: (hover) => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 2,
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0), side: BorderSide(color: Colors.black)),
                              textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                          onPressed: () {
                            setState(() {
                              if (titelBool.contains(true)) {
                                titelBool = List.filled(10, false);
                                titelBool[i] = true;
                              } else {
                                titelBool[i] = true;
                              }
                            });
                            titelBool[0]
                                ? showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AddMediaFileDialog(text: "Add Analysis Results");
                                    })
                                : Container();
                            titelBool[1]
                                ? showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AddMediaFileDialog(text: "Add Farm Management Plan");
                                    })
                                : Container();
                            titelBool[2]
                                ? showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AddMediaFileDialog(text: "Add Soil Advisory Report");
                                    })
                                : Container();
                            titelBool[3]
                                ? showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AddMediaFileDialog(text: "Add Interview Report");
                                    })
                                : Container();
                            titelBool[4]
                                ? showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AddMediaFileDialog(text: "Add Media");
                                    })
                                : Container();
                            titelBool[5]
                                ? showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AddMediaFileDialog(text: "Add OtherFile");
                                    })
                                : Container();
                          },
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 10,
                            children: [
                              // if(  titelBool[5])
                              // Icon(fileIconList[5])
                              //     else

                              Icon(fileIconList[i], color: Colors.black54),
                              CustomText(
                                text: filetextList[i],
                                color: Colors.black54,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ),
                    const SizedBox(
                      width: 10,
                    ),
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
