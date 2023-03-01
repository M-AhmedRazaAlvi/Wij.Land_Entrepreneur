import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../app_common_widgets/text_widget.dart';
import '../../../../../office/widgets/comment_text.dart';

class EmployeeMemberWidget extends StatefulWidget {
  const EmployeeMemberWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<EmployeeMemberWidget> createState() => _EmployeeMemberWidgetState();
}

class _EmployeeMemberWidgetState extends State<EmployeeMemberWidget> {
  final TextEditingController fName = TextEditingController(),
      date = TextEditingController(),
      comment = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    date.dispose();
    comment.dispose();
  }

  String? selectRole = 'Select Role';
  List<String> selectRoleList = <String>[
    'Select Role',
    "Owner",
    "Employee",
    "Other",
  ];
  String? selectOrganization = 'Select Organization';
  List<String> selectOrganizationList = <String>[
    'Select Organization',
    'Better Soils',
    "Green Leaf",
    "LTO",
    'Farm Mamber',
    'Other'
  ];

  bool checkedPerson = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        CustomText(text: "Employee Details", size: 20, weight: FontWeight.bold),
        const SizedBox(
          height: 15,
        ),
        CustomText(text: "Organization Name"),
        const SizedBox(
          height: 15,
        ),
        RealDropDownWidget(
          value: selectOrganization,
          onChanged: (newValue) {
            setState(() {
              selectOrganization = newValue;
            });
          },
          items: selectOrganizationList
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
        ),
        const SizedBox(
          height: 15,
        ),
        const CustomText(text: "Employee role"),
        const SizedBox(
          height: 15,
        ),
        RealDropDownWidget(
          value: selectRole,
          onChanged: (newValue) {
            setState(() {
              selectRole = newValue;
            });
          },
          items: selectRoleList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
        ),
        const SizedBox(
          height: 15,
        ),
        RealCheckBoxWidget(
          value: checkedPerson,
          onChanged: (value) {
            setState(() {
              checkedPerson = value ?? false;
            });
          },
          Labeltext: 'Contact Person',
        ),
        const SizedBox(
          height: 15,
        ),
        const CustomText(text: "Connected To WijLand Since"),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2023))
                .then((d) {
              debugPrint("$d");
              if (d != null) {
                setState(() {
                  date.text = d.toString().split(" ")[0];
                });
              }
            });
          },
          child: TextWidgetField(
            controller: date,
            enabled: false,
            suffixIcon: const Icon(Icons.calendar_today),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const CustomText(text: "Comment"),
        const SizedBox(
          height: 15,
        ),
        CommentTextField(controller: comment),
      ],
    );
  }
}
