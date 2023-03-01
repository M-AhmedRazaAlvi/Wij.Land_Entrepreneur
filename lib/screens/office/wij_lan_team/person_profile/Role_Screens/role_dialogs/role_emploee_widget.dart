import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../app_common_widgets/text_widget.dart';
import '../../../../widgets/comment_text.dart';

class RoleEmploeeWidget extends StatefulWidget {
  const RoleEmploeeWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<RoleEmploeeWidget> createState() => _RoleEmploeeWidgetState();
}

class _RoleEmploeeWidgetState extends State<RoleEmploeeWidget> {
  String? selectOrganization = 'Select Organization';
  List<String> selectOrganizationList = <String>[
    'Select Organization',
    'Better Soils',
    '@cvncxhwbbwxbwbxiwu123',
    'Green Leaf',
    "LTO",
    "Muhammad Abbas test",
    "Nature Conservancy"
  ];
  String? selectRole = 'Select Role';
  List<String> selectRoleList = <String>[
    'Select Role',
    'Owner',
    'Employee',
    'Other'
  ];
  final TextEditingController fName = TextEditingController(),
      date = TextEditingController(),
      comment = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    date.dispose();
    comment.dispose();
  }

  bool checkOrgAddress = false;
  bool checkContect = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: "Employee Details",
          size: 18,
          weight: FontWeight.bold,
        ),
        const SizedBox(
          height: 15,
        ),
        const CustomText(text: "Organization Name"),
        const SizedBox(
          height: 5,
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
        const CustomText(
          text: "Post Addess",
          size: 18,
          weight: FontWeight.bold,
        ),
        const SizedBox(height: 5),
        RealCheckBoxWidget(
            value: checkOrgAddress,
            onChanged: (value) {
              setState(() {
                checkOrgAddress = value ?? false;
              });
            },
            Labeltext:
                "Use organization address as post address for this person"),
        const SizedBox(
          height: 10,
        ),
        const CustomText(text: "Employee role"),
        const SizedBox(
          height: 5,
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
          height: 10,
        ),
        RealCheckBoxWidget(
          value: checkContect,
          onChanged: (value) {
            setState(() {
              checkContect = value ?? false;
            });
          },
          Labeltext: 'Contact Person',
        ),
        const SizedBox(height: 10),
        const SizedBox(
          height: 10,
        ),
        const CustomText(text: "Connected to WijLand Since"),
        const SizedBox(
          height: 5,
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
        const SizedBox(height: 10),
        const CustomText(
          text: "Comments",
        ),
        const SizedBox(height: 10),
        CommentTextField(
          controller: comment,
        )
      ],
    );
  }
}
