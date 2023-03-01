import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../app_common_widgets/custom_text.dart';
import '../../../app_common_widgets/text_widget.dart';
import '../../../utils/styles.dart';
import '../../office/widgets/add_text_button_widget.dart';

class AddOrganizationDialog extends StatefulWidget {
  const AddOrganizationDialog({
    Key? key,
    required this.edit,
  }) : super(key: key);
  final bool edit;

  @override
  State<AddOrganizationDialog> createState() => _AddOrganizationDialogState();
}

class _AddOrganizationDialogState extends State<AddOrganizationDialog> {
  bool _sampler = false;
  final TextEditingController fName = TextEditingController(),
      lName = TextEditingController(),
      email = TextEditingController(),
      phone = TextEditingController(),
      phoneHome = TextEditingController(),
      address = TextEditingController(),
      date = TextEditingController(),
      comment = TextEditingController();
  List<String> organizationTypeList = [
    'Association/collective',
    'Company',
    'Farm',
    'Foundation',
    'Governmental Institution',
    'Knowledge Institute',
    'Lab',
    'Other',
    'Site Management',
  ];
  String organizationType = "Association/collective";
  List<String> relationToWijlandList = [
    'Beneficiaries',
    'Collaborative',
    'Donors/Inventors',
    'No Partnership',
    'Partners',
    'Suppliers',
  ];
  String relationToWijland = "Beneficiaries";

  @override
  void dispose() {
    super.dispose();
    fName.dispose();
    lName.dispose();
    email.dispose();
    phone.dispose();
    phoneHome.dispose();
    address.dispose();
    date.dispose();
    comment.dispose();
  }

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
                    const CustomText(
                      text: "Add Organization",
                      size: 28,
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
                const CustomText(
                  text: "Basic Information",
                  size: 20,
                  weight: FontWeight.bold,
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
                Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  child: DottedBorder(
                    color: Colors.black38,
                    strokeWidth: 2,
                    padding: const EdgeInsets.all(25),
                    child: const Icon(
                      Icons.add,
                      size: 40,
                      color: Colors.black38,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(text: "Organization Name"),
                TextWidgetField(
                  controller: fName,
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(text: "Organization Type"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      border: Border.all(color: lightGrey, width: 0.5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: DropdownButton(
                        isExpanded: true,
                        style: TextStyle(color: lightGrey),
                        value: organizationType,
                        underline: const SizedBox(),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: organizationTypeList.map((String items) {
                          return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style:
                                    TextStyle(color: lightGrey, fontSize: 12),
                              ));
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            organizationType = newValue as String;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(text: "Address"),
                TextWidgetField(
                  controller: email,
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(text: "Relation to Wij.land .land"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      border: Border.all(color: lightGrey, width: 0.5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: DropdownButton(
                        isExpanded: true,
                        style: TextStyle(color: lightGrey),
                        value: relationToWijland,
                        underline: const SizedBox(),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: relationToWijlandList.map((String items) {
                          return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style:
                                    TextStyle(color: lightGrey, fontSize: 12),
                              ));
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            relationToWijland = newValue as String;
                          });
                        },
                      ),
                    ),
                  ),
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
                    colors: Colors.black12,
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
