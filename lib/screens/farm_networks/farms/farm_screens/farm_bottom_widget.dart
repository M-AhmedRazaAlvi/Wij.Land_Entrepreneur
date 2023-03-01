import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Boerenwijzer/boerenwijzer_screen.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Files/farm_file_screen.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Member/member_screen.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/parcel_screen.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/actions/action_parcel.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_data_screen.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/projects/farm_project_screen.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/tasks/task_screens.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../office/wij_lan_team/person_profile/Contact_moments/contact_screens/profile_contact_moments.dart';
import '../../../office/wij_lan_team/person_profile/contract/profile_contract_screens.dart';


class FarmBottomWidgets extends StatefulWidget {
  const FarmBottomWidgets({
    Key? key,
  }) : super(key: key);

  @override
  State<FarmBottomWidgets> createState() => _FarmBottomWidgetsState();
}

class _FarmBottomWidgetsState extends State<FarmBottomWidgets> {
  List<String> farmdataList = <String>[
    "Farm Data",
    "Members",
    "Contact Moments",
    "Parcels",
    "Projects",
    "Actions",
    "Tasks",
    "Files",
    "Contracts",
    "Boerenwijzer"
  ];
  List<bool> titelBool = <bool>[];
  bool farmdata = true,
      members = false,
      contactMoment = false,
      parcels = false,
      projects = false,
      action = false,
      tasks = false,
      file = false,
      contract = false,
      boerenwijzer = false;

  @override
  void initState() {
    super.initState();
    titelBool = List.filled(10, false);
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
                          for (int i = 0; i < 10; i++)
                            ElevatedButton(
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
                              child: CustomText(
                                text: farmdataList[i],
                                size: 16,
                                weight: FontWeight.bold,
                                color: titelBool[i] == true
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                        ],
                      )
                    : Wrap(
                        children: [
                          for (int i = 0; i < 10; i++)
                            ElevatedButton(
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
                              child: CustomText(
                                text: farmdataList[i],
                                size: 16,
                                weight: FontWeight.bold,
                                color: titelBool[i] == true
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                        ],
                      ),
              ),
              titelBool[0] ? FarmDataScreen() : Container(),
              titelBool[1] ? MembersScreen() : Container(),
              titelBool[2] ? ProfileContactMoments() : Container(),
              titelBool[3] ? ParcelsScreen() : Container(),
              titelBool[4] ? FarmProjectsScreens() : Container(),
              titelBool[5] ? ParcelActionWidget() : Container(),
              titelBool[6] ? TasksScreens() : Container(),
              titelBool[7] ? FarmFilesScreens() : Container(),
              titelBool[8] ? ProfileContractScreens() : Container(),
              titelBool[9] ? FarmBoerenwijzerScreen() : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
