import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../app_common_widgets/text_widget.dart';
import '../../../../../office/widgets/comment_text.dart';
import '../../../../../office/widgets/search_widget.dart';

class FarmMemberWidget extends StatefulWidget {
  const FarmMemberWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<FarmMemberWidget> createState() => _FarmMemberWidgetState();
}

class _FarmMemberWidgetState extends State<FarmMemberWidget> {
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

  String? selectedHead = 'Select';
  List<String> selectedHeadList = <String>[
    'Select',
    "Yes",
    "No",
  ];
  String? farmRole = 'Select Role';
  List<String> farmRoleList = <String>[
    'Select Role',
    'Representative',
    'Farm Member',
    'Other'
  ];

  bool checkedAddress = false;
  bool checkedinterest = false;
  bool checkedGroup = false;
//  bool first = true, second = false, third = false, fourth = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: "Farmer Details", size: 20, weight: FontWeight.bold),
        const SizedBox(
          height: 15,
        ),
        CustomText(text: "Farm"),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
                child: TextWidgetField(
              hintText: "Farm of",
            )),
            SizedBox(
              width: 10,
            ),
            ClickIconButton(
              clickcolors: Colors.white,
              icon: Icons.add,
              onPressed: () {},
            ),
          ],
        ),
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
          value: selectedHead,
          onChanged: (newValue) {
            setState(() {
              selectedHead = newValue;
            });
          },
          items: selectedHeadList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
        ),
        const SizedBox(
          height: 15,
        ),
        RealCheckBoxWidget(
          value: checkedinterest,
          onChanged: (value) {
            setState(() {
              checkedinterest = value ?? false;
            });
          },
          Labeltext: 'Interested in Renting Nature Land',
        ),
        const SizedBox(
          height: 15,
        ),
        RealCheckBoxWidget(
          value: checkedGroup,
          onChanged: (value) {
            setState(() {
              checkedGroup = value ?? false;
            });
          },
          Labeltext: 'Member of Focus Group',
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
        CommentTextField(),
      ],
    );
  }
}
