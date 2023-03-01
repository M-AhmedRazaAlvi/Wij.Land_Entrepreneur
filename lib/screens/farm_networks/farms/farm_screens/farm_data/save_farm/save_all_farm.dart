import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_data/update_farm/all_farm_screens.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_data/update_farm/general_farm.dart';

import '../../../../../../utils/functions.dart';
import '../../../../../../utils/responsive.dart';
import '../update_farm/animal_farm.dart';
import '../update_farm/boerenwijzer_farm.dart';
import '../update_farm/grazing_farm.dart';
import '../update_farm/management_farm.dart';
import '../update_farm/manure_farm.dart';
import '../update_farm/plant_farm.dart';
import '../update_farm/soil_farm.dart';


class SaveAllFarm extends StatefulWidget {
  const SaveAllFarm({
    Key? key,
  }) : super(key: key);

  @override
  State<SaveAllFarm> createState() => _SaveAllFarmState();
}

class _SaveAllFarmState extends State<SaveAllFarm> {
  bool checkAll = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: getWidth(context),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView(
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FarmAllDataWidget(
                      first: true,
                      check: checkAll,
                      contactType: "Property",
                      contactDate: "Value",
                      peopleInvolved: "Input Date",
                      comment: "#",
                      size: !Responsive.isDesktop(context)
                          ? getWidth(context) / 2
                          : getWidth(context) / 3.2,
                      titleFarmButtonList: const [],
                      chekedValue: false,
                    ),
                  ),
                ],
              ),
            ),
            GeneralFarmWidget(
              checkAll: checkAll,
              checkedValue: true,
            ),
            SoilFarmWidget(checkAll: checkAll, checkedValue: true),
            ManureFarmWidget(checkAll: checkAll, checkedValue: true),
            AnimalFarmWidget(checkAll: checkAll, checkedValue: true),
            GrazingFarmWidget(checkAll: checkAll, checkedValue: true),
            ManagementFarmWidget(checkAll: checkAll, checkedValue: true),
            PlantFarmWidget(checkAll: checkAll, checkedValue: true),
            BoerenwijzerFarmWidget(checkAll: checkAll, checkedValue: true)
          ],
        ),
      ),
    );
  }
}
