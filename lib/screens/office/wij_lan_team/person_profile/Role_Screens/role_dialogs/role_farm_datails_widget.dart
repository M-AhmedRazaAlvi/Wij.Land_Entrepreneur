import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../app_common_widgets/text_widget.dart';
import '../../../../widgets/comment_text.dart';

class RoleFarmDatailsWidget extends StatefulWidget {
  const RoleFarmDatailsWidget({Key? key}) : super(key: key);

  @override
  State<RoleFarmDatailsWidget> createState() => _RoleFarmDatailsWidgetState();
}

class _RoleFarmDatailsWidgetState extends State<RoleFarmDatailsWidget> {
  String? selectedFarm = 'Select Farm';
  List<String> selectedFarmList = <String>[
    'Select Farm',
    'Farm of Donald Roa',
    'Farm of Ellie de jong',
    'Farm of Elliot Mass',
    "Farm of Fleurette Goode",
    "Farm of Freya Filonannian"
  ];
  String? farmRole = 'Select Role';
  List<String> farmRoleList = <String>[
    'Select Role',
    'Representatvie',
    'Farm Mamber',
    'Other'
  ];
  String? headFarm = 'Select';
  List<String> headFarmList = <String>[
    'Select',
    'Yes',
    'No',
  ];
  bool _membersgroup = false;
  bool _postaddress = false;
  bool _interested = false;

  final TextEditingController fName = TextEditingController(),
      //lName = TextEditingController(),
      //email = TextEditingController(),
      // phone = TextEditingController(),
      //phoneHome = TextEditingController(),
      // address = TextEditingController(),
      date = TextEditingController(),
      comment = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    //fName.dispose();
    //lName.dispose();
    //email.dispose();
    //phone.dispose();
    // phoneHome.dispose();
    // address.dispose();
    date.dispose();
    comment.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: "Farmal Details",
          size: 18,
          weight: FontWeight.bold,
        ),
        const SizedBox(
          height: 15,
        ),
        const CustomText(text: "Farm"),
        const SizedBox(
          height: 15,
        ),
        RealDropDownWidget(
          value: selectedFarm,
          onChanged: (newValue) {
            setState(() {
              selectedFarm = newValue;
            });
          },
          items: selectedFarmList.map<DropdownMenuItem<String>>((String value) {
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
        const SizedBox(
          height: 15,
        ),
        RealCheckBoxWidget(
            value: _postaddress,
            onChanged: (value) {
              setState(() {
                _postaddress = value ?? false;
              });
            },
            Labeltext: "Use farm address as post address for this person"),
        const SizedBox(
          height: 15,
        ),
        const CustomText(text: "Farm role"),
        const SizedBox(
          height: 15,
        ),
        RealDropDownWidget(
          value: farmRole,
          onChanged: (newValue) {
            setState(() {
              farmRole = newValue;
            });
          },
          items: farmRoleList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
        ),
        const SizedBox(
          height: 15,
        ),
        const CustomText(text: "Head Farm"),
        const SizedBox(
          height: 15,
        ),
        RealDropDownWidget(
          value: headFarm,
          onChanged: (newValue) {
            setState(() {
              headFarm = newValue;
            });
          },
          items: headFarmList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
        ),
        const SizedBox(
          height: 15,
        ),
        RealCheckBoxWidget(
          value: _interested,
          onChanged: (value) {
            setState(() {
              _interested = value ?? false;
            });
          },
          Labeltext: 'Interested in Renting Nature Land',
        ),
        const SizedBox(
          height: 15,
        ),
        RealCheckBoxWidget(
          value: _membersgroup,
          onChanged: (value) {
            setState(() {
              _membersgroup = value ?? false;
            });
          },
          Labeltext: 'Member of Focus Group',
        ),
        const SizedBox(
          height: 15,
        ),
        const CustomText(text: "Connected to WijLand Since"),
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
        const CustomText(
          text: "Comments",
        ),
        const SizedBox(
          height: 15,
        ),
        CommentTextField(
          controller: comment,
        )
      ],
    );
  }
}
