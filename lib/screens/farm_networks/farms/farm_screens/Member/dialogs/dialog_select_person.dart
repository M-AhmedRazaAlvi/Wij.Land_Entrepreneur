import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../app_common_widgets/text_widget.dart';
import '../../../../../office/widgets/add_text_button_widget.dart';

class SelectPersonDialog extends StatefulWidget {
  const SelectPersonDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectPersonDialog> createState() => _SelectPersonDialogState();
}

class _SelectPersonDialogState extends State<SelectPersonDialog> {
  final TextEditingController fName = TextEditingController(),
      date = TextEditingController(),
      comment = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    date.dispose();
    comment.dispose();
  }

  String? selectedPerson = 'Select Person';
  List<String> selectedPersonList = <String>[
    'Select Person',
    'Donald Roa',
    'Ellie de jong',
    'Elliot Mass',
    "Fleurette Goode",
    "Farm of Freya Filonannian"
  ];
  String? farmRole = 'Select Role';
  List<String> farmRoleList = <String>[
    'Select Role',
    'Representatvie',
    'Farm Mamber',
    'Other'
  ];

  bool checkedAddress = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: AlertDialog(
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Select Existing Person",
                      size: 30,
                      weight: FontWeight.bold,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const CustomText(text: "Person Name"),
                const SizedBox(
                  height: 15,
                ),
                RealDropDownWidget(
                  value: selectedPerson,
                  onChanged: (newValue) {
                    setState(() {
                      selectedPerson = newValue;
                    });
                  },
                  items: selectedPersonList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomText(text: "Farm Name"),
                const SizedBox(
                  height: 15,
                ),
                TextWidgetField(
                  controller: fName,
                ),
                const SizedBox(
                  height: 15,
                ),
                RealCheckBoxWidget(
                  value: checkedAddress,
                  onChanged: (value) {
                    setState(() {
                      checkedAddress = value ?? false;
                    });
                  },
                  Labeltext: 'Use Farm address as post address for this person',
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomText(text: "Role"),
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
                  items: farmRoleList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AddTextButtonWidget(
                    text: "Cancel",
                    colors: Colors.white60,
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AddTextButtonWidget(
                    text: "Add Person",
                    colors: Colors.yellow,
                    onPress: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
