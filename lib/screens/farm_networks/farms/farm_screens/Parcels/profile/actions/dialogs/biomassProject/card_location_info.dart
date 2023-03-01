import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/counter_widget.dart';
import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';


class CardLocationInformation extends StatefulWidget {
  const CardLocationInformation({
    Key? key,
    required this.action,
    this.child,
  }) : super(key: key);
  final bool action;
  final child;
  @override
  State<CardLocationInformation> createState() =>
      _CardLocationInformationState();
}

class _CardLocationInformationState extends State<CardLocationInformation> {
  String? farmOrgz = 'Farm of Iona';
  List<String> farmOrgzList = [
    'Farm of Iona',
    'Farm of noone',
    'Farm of zikry',
    'Farm of tan',
  ];
  int countLatitude = 0;
  int countLongitude = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomText(
              text: "Location",
              size: 25,
              color: darkBlue,
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              text: "Farm/Organizations",
            ),
            SizedBox(
              height: 10,
            ),
            RealDropDownWidget(
              value: farmOrgz,
              onChanged: (newValue) {
                setState(() {
                  farmOrgz = newValue;
                });
              },
              items: farmOrgzList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
            ),
            SizedBox(height: 15),
            widget.action
                ? Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: !Responsive.isDesktop(context)
                            ? getWidth(context) / 2.5
                            : getWidth(context) / 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: "Latitude"),
                            CounterWidget(
                              count: countLatitude,
                              onAddTap: () {
                                setState(() {
                                  countLatitude++;
                                });
                              },
                              onCloseTap: () {
                                setState(() {
                                  countLatitude--;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: !Responsive.isDesktop(context)
                            ? getWidth(context) / 2.5
                            : getWidth(context) / 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: "Longitude"),
                            CounterWidget(
                              count: countLongitude,
                              onAddTap: () {
                                setState(() {
                                  countLongitude++;
                                });
                              },
                              onCloseTap: () {
                                setState(() {
                                  countLongitude--;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                : Container(child: widget.child),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
