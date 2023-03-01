import 'package:flutter/material.dart';

import '../../../app_common_widgets/custom_text.dart';
import '../../../utils/responsive.dart';
import '../../../utils/styles.dart';

class MyTaskInfo extends StatefulWidget {
  final String task;
  final String assignedBy;
  final String contactMoment;
  final String farm;
  final String project;
  final String status;
  final double size;
  final bool bold;
  final bool isStatusField;
  const MyTaskInfo(
      {Key? key,
      this.task = "",
      this.assignedBy = "0",
      this.size = 16,
      this.bold = false,
      this.contactMoment = "",
      this.farm = "",
      this.project = "",
      this.isStatusField = true,
      this.status = "To do"})
      : super(key: key);

  @override
  State<MyTaskInfo> createState() => _MyTaskInfoState();
}

class _MyTaskInfoState extends State<MyTaskInfo> {
  String status = "To do";
  @override
  void initState() {
    super.initState();
    status = widget.status;
  }

  List<String> list = <String>[
    'To do',
    'In Progress',
    'Done',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: widget.isStatusField
                ? MainAxisAlignment.spaceEvenly
                : MainAxisAlignment.start,
            children: [
              if (!widget.isStatusField)
                SizedBox(width: MediaQuery.of(context).size.width / 40),
              CustomText(
                text: widget.task,
                color: secondary,
                size: widget.size,
                weight: widget.bold ? FontWeight.bold : FontWeight.normal,
              ),
              if (!widget.isStatusField)
                SizedBox(width: MediaQuery.of(context).size.width / 35),
              CustomText(
                text: widget.assignedBy,
                color: secondary,
                size: widget.size,
                weight: widget.bold ? FontWeight.bold : FontWeight.normal,
              ),
              if (!widget.isStatusField)
                SizedBox(width: MediaQuery.of(context).size.width / 50),
              CustomText(
                text: widget.contactMoment,
                color: secondary,
                size: widget.size,
                weight: widget.bold ? FontWeight.bold : FontWeight.normal,
              ),
              if (!widget.isStatusField)
                SizedBox(width: MediaQuery.of(context).size.width / 30),
              CustomText(
                text: widget.farm,
                color: secondary,
                size: widget.size,
                weight: widget.bold ? FontWeight.bold : FontWeight.normal,
              ),
              if (!widget.isStatusField)
                SizedBox(width: MediaQuery.of(context).size.width / 16),
              CustomText(
                text: widget.project,
                color: secondary,
                size: widget.size,
                weight: widget.bold ? FontWeight.bold : FontWeight.normal,
              ),
              if (!widget.isStatusField)
                SizedBox(width: MediaQuery.of(context).size.width / 28),
              widget.isStatusField
                  ? SizedBox(
                      width: !Responsive.isDesktop(context) ? 80 : 120,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: const Text("Status"),
                          value: status,
                          isDense: true,
                          onChanged: (String? newValue) {
                            setState(() {
                              status = newValue ?? "To do";
                            });
                            //  debugprintstatus);
                          },
                          items: list.map((String map) {
                            return DropdownMenuItem<String>(
                              value: map,
                              child: Text(map,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: !Responsive.isDesktop(context)
                                          ? 10
                                          : 16)),
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  : CustomText(
                      text: widget.status,
                      color: secondary,
                      size: widget.size,
                      weight: widget.bold ? FontWeight.bold : FontWeight.normal,
                    ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Divider(
            color: secondary.withOpacity(0.25),
          ),
        ),
      ],
    );
  }
}
