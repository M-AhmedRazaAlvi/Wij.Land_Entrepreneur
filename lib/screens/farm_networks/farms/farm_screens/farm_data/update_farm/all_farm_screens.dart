import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_data/update_farm/animal_farm.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_data/update_farm/boerenwijzer_farm.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_data/update_farm/general_farm.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_data/update_farm/grazing_farm.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_data/update_farm/management_farm.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_data/update_farm/manure_farm.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_data/update_farm/plant_farm.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_data/update_farm/soil_farm.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../../../../utils/functions.dart';
import '../../../../../office/wij_lan_team/person_profile/Contact_moments/widget/contact_info_row.dart';
import '../../../widgets/dialog_property_farm.dart';


class AllFarmWidgetScreens extends StatelessWidget {
  const AllFarmWidgetScreens({
    Key? key,
    required this.checkAll,
  }) : super(key: key);

  final bool checkAll;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: Column(
        children: [
          GeneralFarmWidget(checkAll: checkAll, checkedValue: false),
          SoilFarmWidget(checkAll: checkAll, checkedValue: false),
          ManureFarmWidget(checkAll: checkAll, checkedValue: false),
          AnimalFarmWidget(checkAll: checkAll, checkedValue: false),
          GrazingFarmWidget(checkAll: checkAll, checkedValue: false),
          ManagementFarmWidget(checkAll: checkAll, checkedValue: false),
          PlantFarmWidget(checkAll: checkAll, checkedValue: false),
          BoerenwijzerFarmWidget(checkAll: checkAll, checkedValue: false)
        ],
      ),
    );
  }
}

class FarmAllDataWidget extends StatelessWidget {
  const FarmAllDataWidget({
    Key? key,
    required this.first,
    required this.check,
    required this.contactDate,
    required this.contactType,
    required this.peopleInvolved,
    required this.comment,
    required this.size,
    required this.titleFarmButtonList,
    required this.chekedValue,
    this.child,
  }) : super(key: key);
  final bool first, check, chekedValue;
  final dynamic child;
  final String contactDate, contactType, peopleInvolved, comment;
  final double size;
  final List<String> titleFarmButtonList;
  @override
  Widget build(BuildContext context) {
    return Container(
      //  width: getWidth(context),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: first ? Colors.transparent : Colors.black26))),
      child: Row(
        children: [
          if (first)
            SizedBox(
                width: size / 6,
                child: ContactCheckBoxWidget(
                  check: check,
                ))
          else
            SizedBox(
                width: size / 6, child: ContactCheckBoxWidget(check: check)),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: size,
            child: CustomText(
              text: contactType,
              size: first ? 18 : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          chekedValue
              ? Container(
                  width: size,
                  margin: EdgeInsets.only(top: 5, bottom: 15, right: 15),
                  child: child,
                )
              : SizedBox(
                  width: size,
                  child: CustomText(
                    text: contactDate,
                    size: first ? 18 : 14,
                    weight: first ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
          SizedBox(
            width: size / 2,
            child: CustomText(
              text: peopleInvolved,
              size: first ? 18 : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          first
              ? SizedBox(
                  width: 50,
                  child: CustomText(
                    text: comment,
                    size: first ? 18 : 14,
                    weight: first ? FontWeight.bold : FontWeight.normal,
                  ),
                )
              : SizedBox(
                  width: 50,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: IconHoverButton(
                      icons: Icons.lock_clock,
                      onPress: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return FarmPropertyDialog(
                                titleFarmButtonList: titleFarmButtonList);
                          },
                        );
                      },
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
