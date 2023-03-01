// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../routes/routes.dart';
import '../../../../../../../../../utils/controller.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../title_bar_widget.dart';

class HerbsProjectDialogBox extends StatefulWidget {
  const HerbsProjectDialogBox({Key? key}) : super(key: key);

  @override
  State<HerbsProjectDialogBox> createState() => _HerbsProjectDialogBoxState();
}

class _HerbsProjectDialogBoxState extends State<HerbsProjectDialogBox> {
  List<String> titleFarmButtonList = <String>["Sowing Herbs", "Vegetation Scan", "Preparing Herbs"];
  List<bool> titelBool = <bool>[];
  bool biomassProject = false, grazingProject = false;

  @override
  void initState() {
    super.initState();
    titelBool = List.filled(3, false);
  }

  bool clickUpdate = false, selected = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: SingleChildScrollView(
        child: AlertDialog(
          title: TitleBarWiget(titleText: "Herbs Project"),
          content: Container(
            width: !Responsive.isDesktop(context) ? getWidth(context) : getWidth(context) * 0.6,
            height: getHeight(context) * 0.4,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Actions",
                  size: 22,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  width: getWidth(context),
                  child: Wrap(
                    children: [
                      for (int i = 0; i < 3; i++)
                        Container(
                          padding: EdgeInsets.only(right: 15, bottom: 15),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: titelBool[i] == true ? third : Colors.white,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(
                                    color: titelBool[i] == true ? Colors.white : Colors.black,
                                  )),
                              padding: EdgeInsets.symmetric(horizontal: !Responsive.isDesktop(context) ? 20 : 25, vertical: 15),
                            ),
                            child: CustomText(
                              text: titleFarmButtonList[i],
                              weight: FontWeight.bold,
                              color: titelBool[i] == true ? Colors.white : Colors.black38,
                              size: !Responsive.isDesktop(context) ? 14 : 20,
                            ),
                            onPressed: () {
                              setState(() {
                                if (titelBool.contains(true)) {
                                  titelBool = List.filled(3, false);
                                  titelBool[i] = true;

                                  if (titelBool[0]) {
                                    navigationController.navigateTo(sowingHerbsProjectRoute);
                                  } else if (titelBool[1]) {
                                    navigationController.navigateTo(vegetationScanHerbsRoute);
                                  } else if (titelBool[2]) {
                                    navigationController.navigateTo(preparingHerbsRoute);
                                  }
                                } else {
                                  titelBool[i] = true;
                                  if (titelBool[0]) {
                                    navigationController.navigateTo(sowingHerbsProjectRoute);
                                  } else if (titelBool[1]) {
                                    navigationController.navigateTo(vegetationScanHerbsRoute);
                                  } else if (titelBool[2]) {
                                    navigationController.navigateTo(preparingHerbsRoute);
                                  }
                                }
                              });
                            },
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
