import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../office/wij_lan_team/person_profile/Contact_moments/widget/contact_info_row.dart';

class FarmTasksInfoWidget extends StatefulWidget {
  const FarmTasksInfoWidget({
    Key? key,
    required this.first,
    required this.size,
    required this.check,
    required this.status,
    required this.assigned,
    required this.dueDate,
    required this.description,
    required this.project,
    required this.contactMoment,
    required this.subject,
  }) : super(key: key);
  final bool first, check;
  final String status,
      assigned,
      dueDate,
      description,
      project,
      contactMoment,
      subject;
  final double size;

  @override
  State<FarmTasksInfoWidget> createState() => _FarmTasksInfoWidgetState();
}

class _FarmTasksInfoWidgetState extends State<FarmTasksInfoWidget> {
  String? status = 'Done';
  List<String> statusList = [
    'Done',
    'In progress',
    'To do',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black26))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          !Responsive.isDesktop(context)
              ? const SizedBox(width: 5)
              : SizedBox(width: 20),
          if (widget.first)
            SizedBox(
              width: widget.size,
              child: CustomText(
                text: widget.status,
                size: widget.first ? 18 : 14,
                weight: widget.first ? FontWeight.bold : FontWeight.normal,
              ),
            )
          else
            SizedBox(
              width: widget.size,
              child: Padding(
                padding: EdgeInsets.only(
                    right: !Responsive.isDesktop(context) ? 10 : 30),
                child: RealDropDownWidget(
                  value: status,
                  onChanged: (newValue) {
                    setState(() {
                      status = newValue;
                    });
                  },
                  items:
                      statusList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
              ),
            ),
          SizedBox(
            width: widget.size,
            child: CustomText(
              text: widget.assigned,
              size: widget.first ? 18 : 14,
              weight: widget.first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width: widget.size,
            child: CustomText(
              text: widget.dueDate,
              size: widget.first ? 18 : 14,
              weight: widget.first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width: widget.size,
            child: CustomText(
              text: widget.description,
              size: widget.first ? 18 : 14,
              weight: widget.first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width: widget.size,
            child: CustomText(
              text: widget.project,
              size: widget.first ? 18 : 14,
              weight: widget.first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (widget.first)
            SizedBox(
              width: widget.size,
              child: CustomText(
                text: widget.contactMoment,
                size: widget.first ? 18 : 14,
                weight: widget.first ? FontWeight.bold : FontWeight.normal,
              ),
            )
          else
            SizedBox(
                width: widget.size,
                child: ContactCheckBoxWidget(check: widget.check)),
          SizedBox(
            width: widget.size,
            child: CustomText(
              text: widget.subject,
              size: widget.first ? 18 : 14,
              weight: widget.first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
