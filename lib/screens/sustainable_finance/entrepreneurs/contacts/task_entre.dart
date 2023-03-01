import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../utils/styles.dart';
import '../../../office/wij_lan_team/person_profile/contract/contract_info_row.dart';

class TaskEntrepreneur extends StatelessWidget {
  final String assignedText;
  final String statusText;
  final String subjectText;
  final String duedateText;
  final String descriptionText;
  final dynamic size;
  final dynamic weight;
  final dynamic child;
  final width;
  bool first = true;
  TaskEntrepreneur({
    Key? key,
    required this.size,
    required this.weight,
    this.child,
    required this.assignedText,
    required this.statusText,
    required this.subjectText,
    required this.duedateText,
    required this.descriptionText,
    this.width,
    required this.first,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.black26))),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: width,
                child: CustomText(
                  text: assignedText,
                  size: size,
                  weight: weight,
                ),
              ),
              SizedBox(
                  width: width,
                  child: first
                      ? Text(
                          statusText,
                          style: TextStyle(
                            fontWeight:
                                first ? FontWeight.bold : FontWeight.normal,
                            fontSize: first ? 18 : 14,
                              fontFamily: Montserrat_Medium,
                          ),
                        )
                      : ContarctSignedDropdown()),
              SizedBox(
                width: width,
                child: CustomText(
                  text: subjectText,
                  size: size,
                  weight: weight,
                ),
              ),
              SizedBox(
                width: width,
                child: CustomText(
                  text: duedateText,
                  size: size,
                  weight: weight,
                ),
              ),
              SizedBox(
                width: width,
                child: CustomText(
                  text: descriptionText,
                  size: size,
                  weight: weight,
                ),
              ),
              Container(child: child),
            ],
          ),
        ],
      ),
    );
  }
}
