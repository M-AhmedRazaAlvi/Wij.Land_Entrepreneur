// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/title_bar_widget.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../action_biomass_project.dart';

class BiomassMakingDialogBox extends StatefulWidget {
  const BiomassMakingDialogBox({Key? key}) : super(key: key);

  @override
  State<BiomassMakingDialogBox> createState() => _BiomassMakingDialogBoxState();
}

class _BiomassMakingDialogBoxState extends State<BiomassMakingDialogBox> {
  List<String> titleFarmButtonList = <String>[
    "Making Bokashi",
    "Bokashi Sample",
  ];
  List<bool> titelBool = <bool>[];
  bool biomassProject = false, grazingProject = false;

  @override
  void initState() {
    super.initState();
    titelBool = List.filled(2, false);
  }

  bool clickUpdate = false, selected = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: SingleChildScrollView(
        child: AlertDialog(
          title: TitleBarWiget(titleText: "Biomass Project"),
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
                      for (int i = 0; i < 2; i++)
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
                              weight: FontWeight.bold,
                              color: titelBool[i] == true ? Colors.white : Colors.black38,
                              text: titleFarmButtonList[i],
                              size: !Responsive.isDesktop(context) ? 14 : 20,
                            ),
                            onPressed: () {
                              setState(() {
                                if (titelBool.contains(true)) {
                                  titelBool = List.filled(9, false);
                                  titelBool[i] = true;
                                  clickUpdate = false;
                                  if (titelBool[0]) {
                                    Get.to(ActionBiomassProject());
                                  }
                                } else {
                                  titelBool[i] = true;
                                  if (titelBool[0]) {
                                    Get.to(ActionBiomassProject());
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
