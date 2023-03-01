import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_data/update_farm/all_farm_screens.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../utils/functions.dart';
import '../../../../../../utils/responsive.dart';
import '../../../../../../utils/styles.dart';
import '../../../../../office/widgets/comment_text.dart';

class SoilFarmWidget extends StatefulWidget {
  const SoilFarmWidget({
    Key? key,
    required this.checkAll,
    required this.checkedValue,
  }) : super(key: key);

  final bool checkAll;
  final bool checkedValue;

  @override
  State<SoilFarmWidget> createState() => _SoilFarmWidgetState();
}

class _SoilFarmWidgetState extends State<SoilFarmWidget> {
  String? kindContact = 'Y/N';
  List<String> kindContactList = <String>[
    'Y/N',
    'Yes',
    'NO',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: Column(
        children: [
          SizedBox(
            height: 70 * 15,
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
                          text: "Soil",
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
                                contactType: "Soil Comment",
                                contactDate: "Normal",
                                peopleInvolved: "03-05-2022",
                                comment: "",
                                size: !Responsive.isDesktop(context)
                                    ? getWidth(context) / 2
                                    : getWidth(context) / 3.2,
                                titleFarmButtonList: const [
                                  "Soil Comment",
                                ],
                                chekedValue: widget.checkedValue,
                                child: CommentTextField(),
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
                          text: "Soil (Grutto)",
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
                                    "Is this action plan being implemented?",
                                contactDate: "Normal",
                                peopleInvolved: "03-05-2022",
                                comment: "",
                                size: !Responsive.isDesktop(context)
                                    ? getWidth(context) / 2
                                    : getWidth(context) / 3.2,
                                titleFarmButtonList: const [
                                  "Soil_Comments",
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
        ],
      ),
    );
  }
}
