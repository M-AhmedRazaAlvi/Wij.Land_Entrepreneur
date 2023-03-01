// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/biomassProject/biomass_dialog.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/grazing_Project/grazing_project_dialog.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/herbs_Project/herbs_project_dialog.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/property_Project/property_project_dialog.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/soilProject/soil_project_dialog.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';

class ParcelActionAddDialog extends StatefulWidget {
  const ParcelActionAddDialog({Key? key}) : super(key: key);

  @override
  State<ParcelActionAddDialog> createState() => _ParcelActionAddDialogState();
}

class _ParcelActionAddDialogState extends State<ParcelActionAddDialog> {
  List<String> titleFarmButtonList = <String>[
    "Biomass Project",
    "Grazing Project",
    "Herbs Project",
    "Property Scan Project",
    "Soil Project",
  ];
  List<bool> titelBool = <bool>[];
  bool biomassProject = false, grazingProject = false, herdsProject = false, propertyProject = false, soilProject = false;

  @override
  void initState() {
    super.initState();
    titelBool = List.filled(5, false);
  }

  bool clickUpdate = false, selected = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
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
                      text: "Select A Project",
                      size: !Responsive.isDesktop(context) ? 20 : 30,
                      weight: FontWeight.bold,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          content: Container(
            width: !Responsive.isDesktop(context) ? getWidth(context) : getWidth(context) * 0.6,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Projects",
                  size: 22,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  width: getWidth(context),
                  child: Wrap(
                    children: [
                      for (int i = 0; i < 5; i++)
                        Container(
                          padding: EdgeInsets.only(right: 15, bottom: 15),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: titelBool[i] == true ? third : Colors.white,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(
                                    color: titelBool[i] == true ? Colors.white10 : Colors.black,
                                  )),
                              padding: EdgeInsets.symmetric(horizontal: !Responsive.isDesktop(context) ? 20 : 25, vertical: 15),
                            ),
                            child: CustomText(
                              text: titleFarmButtonList[i],
                              weight: FontWeight.bold,
                              color: titelBool[i] == true ? Colors.white : Colors.black45,
                              size: !Responsive.isDesktop(context) ? 14 : 20,
                            ),
                            onPressed: () {
                              setState(
                                () {
                                  if (titelBool.contains(true)) {
                                    titelBool = List.filled(5, false);
                                    titelBool[i] = true;

                                    if (titelBool[0]) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return BiomassMakingDialogBox();
                                        },
                                      );
                                    } else if (titelBool[1]) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return GrazingProjectDialogBox();
                                        },
                                      );
                                    } else if (titelBool[2]) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return HerbsProjectDialogBox();
                                        },
                                      );
                                    } else if (titelBool[3]) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return PropertyScanProjectDialogBox();
                                        },
                                      );
                                    } else if (titelBool[4]) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return SoilProjectDialogBox();
                                        },
                                      );
                                    }
                                  } else {
                                    titelBool[i] = true;
                                    if (titelBool[0]) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Text("");
                                          // return bios1.BiomassMakingDialogBox();
                                        },
                                      );
                                    } else if (titelBool[1]) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return GrazingProjectDialogBox();
                                        },
                                      );
                                      Navigator.pop(context);
                                    } else if (titelBool[2]) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return HerbsProjectDialogBox();
                                        },
                                      );
                                    } else if (titelBool[3]) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return PropertyScanProjectDialogBox();
                                        },
                                      );
                                    } else if (titelBool[4]) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return SoilProjectDialogBox();
                                        },
                                      );
                                    }
                                  }
                                },
                              );
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
