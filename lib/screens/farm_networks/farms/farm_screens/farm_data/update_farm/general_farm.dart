import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_data/update_farm/all_farm_screens.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../utils/functions.dart';
import '../../../../../../utils/responsive.dart';
import '../../../../../../utils/styles.dart';
import '../../../../../office/widgets/comment_text.dart';

class GeneralFarmWidget extends StatefulWidget {
  const GeneralFarmWidget({
    Key? key,
    required this.checkAll,
    required this.checkedValue,
  }) : super(key: key);

  final bool checkAll;
  final bool checkedValue;

  @override
  State<GeneralFarmWidget> createState() => _GeneralFarmWidgetState();
}

class _GeneralFarmWidgetState extends State<GeneralFarmWidget> {
  List<bool> titelBool = <bool>[];
  @override
  void initState() {
    super.initState();
    titelBool = List.filled(9, false);
    for (int i = 0; i < 5; i++) titelBool[i] = true;
  }

  String? kindContact = 'Select';
  List<String> kindContactList = <String>[
    'Select',
    'Ekoholland',
    'A-Ware',
    'Cono',
    "RFC",
    "Other"
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
                          text: "General",
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
                                contactType: "General Comment",
                                contactDate: "Normal",
                                peopleInvolved: "03-05-2022",
                                comment: "",
                                size: !Responsive.isDesktop(context)
                                    ? getWidth(context) / 2
                                    : getWidth(context) / 3.2,
                                titleFarmButtonList: const [
                                  "General Comment",
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
                          text: "Supplying to",
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
                                contactType: "To whom do they supply meat?",
                                contactDate: "Normal",
                                peopleInvolved: "03-05-2022",
                                comment: "",
                                size: !Responsive.isDesktop(context)
                                    ? getWidth(context) / 2
                                    : getWidth(context) / 3.2,
                                titleFarmButtonList: const [
                                  "General_comments",
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
