import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/anacdots_mobile/screens/dashboard/anacdot_directory/report/widget/phone_library.dart';
import 'package:wij_land/utils/functions.dart';
import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../utils/styles.dart';
import '../../../../app_common_widgets/styles.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/NotificationKeys.dart';

class DailyReportsScreen extends StatefulWidget {
  const DailyReportsScreen({Key? key}) : super(key: key);

  @override
  _DailyReportsScreenState createState() => _DailyReportsScreenState();
}

class _DailyReportsScreenState extends State<DailyReportsScreen> {
  final List<String> entries = <String>[
    'A',
    'B',
    'C',
    "D",
    "E",
    "F",
    "G",
    "H",
    "i"
  ];
  final List<int> colorCodes = <int>[
    600,
    500,
    100,
    200,
    300,
    500,
    400,
    700,
    500
  ];
  File? imageFile;

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  bool clickOnCamera = true;
  bool clickOnLocation = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back, color: darkBlack, size: 20)),
        title: CustomText(
            text: PrefernceKey.dailyReports, weight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      child: _TextWidget(
                    onTap: () {},
                    text: PrefernceKey.anacdotCancel,
                    borderColor: APPColor.darkGreen,
                    textColor: APPColor.darkGreen,
                  )),
                  SizedBox(width: 10),
                  Expanded(
                      child: _TextWidget(
                    onTap: () {},
                    text: PrefernceKey.anacdotSave,
                    bgColor: APPColor.darkGreen,
                    textColor: Colors.white,
                    borderColor: APPColor.darkGreen,
                  )),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomText(
                      text: PrefernceKey.media + "\t(12)",
                      weight: FontWeight.bold,
                      size: 16,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Visibility(
                      visible: clickOnCamera ? true : false,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            clickOnCamera = false;
                          });
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(color: APPColor.darkGreen),
                          ),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: APPColor.darkGreen,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !clickOnCamera ? true : false,
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        PhoneLibraryScreen()));
                              });
                            },
                            child: _TextWidget(
                                text: PrefernceKey.showAll,
                                borderColor: darkBlackAnec)),
                        SizedBox(width: 6),
                        InkWell(
                          onTap: () {
                            _getFromGallery();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: darkBlackAnec),
                            ),
                            child: Icon(Icons.add, size: 23),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Visibility(
                visible: !clickOnCamera ? true : false,
                child: Container(
                  alignment: Alignment.center,
                  height: getHeight(context) * 0.2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8),
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          debugPrint("=============================$index");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.amber[colorCodes[index]],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Center(child: Text('Entry ${entries[index]}')),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                      child: CustomText(
                          text: PrefernceKey.location,
                          weight: FontWeight.bold,
                          size: 16)),
                  SizedBox(width: 10),
                  Expanded(
                    child: Visibility(
                      visible: clickOnLocation ? true : false,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            clickOnLocation = false;
                          });
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(color: APPColor.darkGreen),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: APPColor.darkGreen,
                                size: 15,
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.location_on_outlined,
                                color: APPColor.darkGreen,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Visibility(
                visible: !clickOnLocation ? true : false,
                child: Container(
                  alignment: Alignment.center,
                  height: getHeight(context) * 0.3,
                  color: Colors.grey,
                  child: CustomText(text: "Map", color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              CustomText(
                  text: PrefernceKey.tags, weight: FontWeight.bold, size: 16),
              SizedBox(height: 10),
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: [
                  _TextWidget(
                      text: "Personal name", borderColor: greenColor, size: 8),
                  _TextWidget(
                      text: "Personal name", borderColor: greenColor, size: 8),
                  _TextWidget(
                      text: "Personal name", borderColor: greenColor, size: 8),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _TextWidget extends StatelessWidget {
  final String text;
  final Color borderColor;
  final Color bgColor;
  final Color textColor;
  final dynamic size;
  final dynamic onTap;

  const _TextWidget({
    Key? key,
    required this.text,
    this.borderColor = Colors.black,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
    this.size = 10,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: borderColor),
        ),
        child: CustomText(
          text: text,
          size: size,
          color: textColor,
          textAligns: TextAlign.center,
          weight: FontWeight.w600,
        ),
      ),
    );
  }
}
