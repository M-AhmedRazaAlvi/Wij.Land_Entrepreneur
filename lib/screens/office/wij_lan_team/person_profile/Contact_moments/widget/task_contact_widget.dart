import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';



class TasksContactWidget extends StatelessWidget {
  final String assignedText;
  final String statusText;
  final String subjectText;
  final String duedateText;
  final String descriptionText;
  final dynamic size;
  final dynamic weight;
  final dynamic child;
  final width;
  const TasksContactWidget({
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
                child: CustomText(
                  text: statusText,
                  size: size,
                  weight: weight,
                ),
              ),
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
