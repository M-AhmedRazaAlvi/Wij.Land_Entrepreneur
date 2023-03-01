import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../app_common_widgets/text_widget.dart';
import '../../../../../../utils/styles.dart';
import '../../../../widgets/add_text_button_widget.dart';
import '../../../../widgets/comment_text.dart';

class AddContractDialog extends StatefulWidget {
  final String profileText;
  final String submitText;
  const AddContractDialog({
    Key? key,
    required this.profileText,
    required this.submitText,
  }) : super(key: key);

  @override
  State<AddContractDialog> createState() => _AddContractDialogState();
}

class _AddContractDialogState extends State<AddContractDialog> {
  final TextEditingController fName = TextEditingController(),
      contractDate = TextEditingController(),
      exprirationDate = TextEditingController(),
      comment = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    contractDate.dispose();
    exprirationDate.dispose();
    comment.dispose();
  }

  String? selectedFarm = 'Select Farm';
  List<String> selectedFarmList = [
    'Select Farm',
    'Farm of Donald Roa',
    'Farm of Ellie de jong',
  ];
  String? selectPeople = 'Select Farm';
  List<String> selectPeopleList = [
    'Select Farm',
    'Farm of Donald Roa',
    'Farm of Ellie de jong',
    'Farm of Elliot Mass',
  ];
  String? contractStatus = 'Select Status';
  List<String> contractStatusList = [
    'Select Status',
    'Farm of Donald Roa',
  ];
  double value = 0;
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
                          text: widget.profileText,
                          size: 40,
                          weight: FontWeight.bold,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ])),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const CustomText(
                  text: "Contract Type",
                ),
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
                  items: selectedFarmList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
                const SizedBox(height: 15),
                const CustomText(text: "People Involved"),
                const SizedBox(
                  height: 15,
                ),
                RealDropDownWidget(
                  value: selectPeople,
                  onChanged: (newValue) {
                    setState(() {
                      selectPeople = newValue;
                    });
                  },
                  items: selectPeopleList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomText(text: "Contract Date"),
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
                          contractDate.text = d.toString().split(" ")[0];
                        });
                      }
                    });
                  },
                  child: TextWidgetField(
                    controller: contractDate,
                    enabled: false,
                    suffixIcon: const Icon(Icons.calendar_today),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomText(text: "Expiration Date"),
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
                          exprirationDate.text = d.toString().split(" ")[0];
                        });
                      }
                    });
                  },
                  child: TextWidgetField(
                    controller: exprirationDate,
                    enabled: false,
                    suffixIcon: const Icon(Icons.calendar_today),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomText(text: "Description of Contract"),
                const SizedBox(
                  height: 15,
                ),
                CommentTextField(
                  controller: comment,
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomText(text: "Contract Status"),
                const SizedBox(
                  height: 15,
                ),
                RealDropDownWidget(
                  value: contractStatus,
                  onChanged: (newValue) {
                    setState(() {
                      contractStatus = newValue;
                    });
                  },
                  items: contractStatusList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
                const SizedBox(height: 15),
                const CustomText(text: "Add File"),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: DottedBorder(
                    color: Colors.black38,
                    strokeWidth: 2,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: const Icon(
                      Icons.add,
                      size: 40,
                      color: Colors.black38,
                    ),
                  ),
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
                    colors: lightBlack,
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AddTextButtonWidget(
                    text: widget.submitText,
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
