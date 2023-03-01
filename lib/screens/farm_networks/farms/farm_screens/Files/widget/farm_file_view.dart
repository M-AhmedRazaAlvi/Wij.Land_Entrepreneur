import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Files/widget/file_folder.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Files/widget/file_upload_widget.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../utils/functions.dart';
import '../../../../../../utils/responsive.dart';

class FarmFileCheckedView extends StatefulWidget {
  const FarmFileCheckedView({
    Key? key,
  }) : super(key: key);

  @override
  State<FarmFileCheckedView> createState() => _FarmFileCheckedViewState();
}

class _FarmFileCheckedViewState extends State<FarmFileCheckedView> {
  List<String> filedataList = <String>[
    "All",
    "Media",
    "Documents",
  ];
  List<bool> titelBool = <bool>[];
  bool allData = true, mediaDate = false, documentDate = false;

  @override
  void initState() {
    super.initState();
    titelBool = List.filled(3, false);
    titelBool[0] = true;
  }

  final bool allChecked = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: getWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(right: 40),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black26)),
              ),
              child: !Responsive.isDesktop(context)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < 3; i++)
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (titelBool.contains(true)) {
                                  titelBool = List.filled(10, false);
                                  titelBool[i] = true;
                                } else {
                                  titelBool[i] = true;
                                }
                              });
                            },
                            child: Transform.translate(
                              offset: titelBool[i]
                                  ? Offset(0.0, 1.5)
                                  : Offset(0, 0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: titelBool[i]
                                                ? Colors.black
                                                : Colors.black12,
                                            width: titelBool[i] ? 2 : 0.1))),
                                child: CustomText(
                                  text: filedataList[i],
                                  size: titelBool[i] ? 20 : 16,
                                  weight: titelBool[i]
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                      ],
                    )
                  : Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        for (int i = 0; i < 3; i++)
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (titelBool.contains(true)) {
                                  titelBool = List.filled(10, false);
                                  titelBool[i] = true;
                                } else {
                                  titelBool[i] = true;
                                }
                              });
                            },
                            child: Transform.translate(
                              offset: titelBool[i]
                                  ? Offset(0.0, 1.5)
                                  : Offset(0, 0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: titelBool[i]
                                                ? Colors.black
                                                : Colors.black12,
                                            width: titelBool[i] ? 2 : 0.1))),
                                child: CustomText(
                                  text: filedataList[i],
                                  size: titelBool[i] ? 20 : 16,
                                  weight: titelBool[i]
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
            ),
            titelBool[0]
                ? Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    width: getWidth(context),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 35,
                      runSpacing: 25,
                      children: const [
                        FileUploadWidget(),
                        FileUploadWidget(),
                        FileUploadWidget(),
                        FileUploadWidget(),
                      ],
                    ),
                  )
                : Container(),
            titelBool[1]
                ? Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    width: getWidth(context),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 35,
                      runSpacing: 25,
                      children: const [
                        FileUploadWidget(),
                        FileUploadWidget(),
                        FileUploadWidget(),
                        FileUploadWidget(),
                      ],
                    ),
                  )
                : Container(),
            titelBool[2]
                ? Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        SizedBox(
                          width: getWidth(context),
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            spacing: 20,
                            runSpacing: 25,
                            children: const [
                              FileFolderWidget(text: "Advisory"),
                              FileFolderWidget(text: "Farm Management plan"),
                              FileFolderWidget(text: "Analysis / Results"),
                              FileFolderWidget(text: "Interview"),
                              FileFolderWidget(text: "Other"),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          width: getWidth(context),
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            spacing: 35,
                            runSpacing: 25,
                            children: const [
                              FileUploadWidget(),
                              FileUploadWidget(),
                              FileUploadWidget(),
                              FileUploadWidget(),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ],
    );
  }
}
