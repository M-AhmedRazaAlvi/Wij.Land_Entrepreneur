import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/actions/action_parcel.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/grazing_manure.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/land_manage.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/plant_parcel_widget.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/soil_widget.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/sub_parcel.dart';

import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../Files/farm_file_screen.dart';

class ParcelBottomButtons extends StatefulWidget {
  const ParcelBottomButtons({
    Key? key,
  }) : super(key: key);

  @override
  State<ParcelBottomButtons> createState() => _ParcelBottomButtonsState();
}

class _ParcelBottomButtonsState extends State<ParcelBottomButtons> {
  List<String> farmdataList = <String>[
    "Land Management",
    "Soil",
    "Plant",
    "Grazing,Mowing & Manure",
    "Sub Parcels",
    "Actions",
    "Files",
  ];
  List<bool> titelBool = <bool>[];
  bool landManagement = true,
      soil = false,
      plant = false,
      grazing = false,
      subParcels = false,
      action = false,
      file = false;

  @override
  void initState() {
    super.initState();
    titelBool = List.filled(7, false);
    titelBool[0] = true;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Card(
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
          child: Column(
            children: [
              Container(
                width: getWidth(context),
                padding: const EdgeInsets.only(left: 20, top: 20),
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10))),
                child: !Responsive.isDesktop(context)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 0; i < 7; i++)
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: ElevatedButton(
                                style: TextButton.styleFrom(
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  primary: titelBool[i] == true
                                      ? Colors.black
                                      : Colors.white,
                                  backgroundColor: titelBool[i] == true
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (titelBool.contains(true)) {
                                      titelBool = List.filled(10, false);
                                      titelBool[i] = true;
                                    } else {
                                      titelBool[i] = true;
                                    }
                                  });
                                },
                                child: Text(
                                  farmdataList[i],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      )
                    : Wrap(
                        children: [
                          for (int i = 0; i < 7; i++)
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: ElevatedButton(
                                style: TextButton.styleFrom(
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  primary: titelBool[i] == true
                                      ? Colors.black
                                      : Colors.white,
                                  backgroundColor: titelBool[i] == true
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (titelBool.contains(true)) {
                                      titelBool = List.filled(10, false);
                                      titelBool[i] = true;
                                    } else {
                                      titelBool[i] = true;
                                    }
                                  });
                                },
                                child: Text(
                                  farmdataList[i],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
              ),
              titelBool[0] ? ParcelLandManagement() : Container(),
              titelBool[1] ? ParcelSoilWidget() : Container(),
              titelBool[2] ? ParcelPlantWidget() : Container(),
              titelBool[3] ? ParcelGrazingManure() : Container(),
              titelBool[4] ? SubParcelScreen() : Container(),
              titelBool[5] ? ParcelActionWidget() : Container(),
              titelBool[6] ? FarmFilesScreens() : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
