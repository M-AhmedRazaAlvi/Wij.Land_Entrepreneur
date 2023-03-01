import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_data/update_farm/all_farm_screens.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../utils/functions.dart';
import '../../../../../../utils/responsive.dart';
import '../../../../../../utils/styles.dart';

class GrazingFarmWidget extends StatefulWidget {
  const GrazingFarmWidget({
    Key? key,
    required this.checkAll,
    required this.checkedValue,
  }) : super(key: key);

  final bool checkAll;
  final bool checkedValue;

  @override
  State<GrazingFarmWidget> createState() => _GrazingFarmWidgetState();
}

class _GrazingFarmWidgetState extends State<GrazingFarmWidget> {
  String? kindContact = 'Select grazing';
  List<String> kindContactList = <String>[
    'Select grazing',
    'Stand grazing',
    'Strip Grazing',
    "New Dutch Grazing",
  ];
  String? mowingContact = 'Y/N';
  List<String> mowingContactList = <String>[
    'Y/N',
    'Yes',
    'No',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: Column(
        children: [
          SizedBox(
            height: 50 * 16,
            child: ListView(
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      Container(
                        width: !Responsive.isDesktop(context)
                            ? getWidth(context) * 1.5
                            : getWidth(context) * 0.9,
                        padding: EdgeInsets.all(15),
                        color: lightskin,
                        child: CustomText(
                          text: "Grazing",
                          size: 18,
                        ),
                      ),
                      Column(
                        children: [
                          for (int i = 0; i < 5; i++)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FarmAllDataWidget(
                                first: false,
                                check: widget.checkAll,
                                contactType:
                                    "What kind of outdoor grazing do you use on your farm?",
                                contactDate: "Normal",
                                peopleInvolved: "03-05-2022",
                                comment: "",
                                size: !Responsive.isDesktop(context)
                                    ? getWidth(context) / 2
                                    : getWidth(context) / 3.2,
                                titleFarmButtonList: const [
                                  "What kind of outdoor grazing do you use on your farm?",
                                ],
                                chekedValue: widget.checkedValue,
                                child: RealDropDownWidget(
                                  value: kindContact,
                                  onChanged: (newValue) {
                                    setState(() {
                                      kindContact = newValue;
                                    });
                                  },
                                  items: kindContactList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                        value: value, child: Text(value));
                                  }).toList(),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50 * 15,
            child: ListView(
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      Container(
                        width: !Responsive.isDesktop(context)
                            ? getWidth(context) * 1.5
                            : getWidth(context) * 0.9,
                        padding: EdgeInsets.all(15),
                        color: lightskin,
                        child: CustomText(
                          text: "Mowing",
                          size: 18,
                        ),
                      ),
                      Column(
                        children: [
                          for (int i = 0; i < 5; i++)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FarmAllDataWidget(
                                first: false,
                                check: widget.checkAll,
                                contactType: "Does the farmer mow the farm?",
                                contactDate: "Normal",
                                peopleInvolved: "03-05-2022",
                                comment: "",
                                size: !Responsive.isDesktop(context)
                                    ? getWidth(context) / 2
                                    : getWidth(context) / 3.2,
                                titleFarmButtonList: const [
                                  "Mowing_comments",
                                ],
                                chekedValue: widget.checkedValue,
                                child: RealDropDownWidget(
                                  value: mowingContact,
                                  onChanged: (newValue) {
                                    setState(() {
                                      mowingContact = newValue;
                                    });
                                  },
                                  items: mowingContactList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                        value: value, child: Text(value));
                                  }).toList(),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
