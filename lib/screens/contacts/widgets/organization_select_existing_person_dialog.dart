import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/screens/contacts/widgets/title_text_field_widget.dart';

import '../../../app_common_widgets/custom_text.dart';
import '../../../app_common_widgets/real_check_box_widget.dart';
import '../../office/widgets/add_text_button_widget.dart';

class OrganizationSelectExistingPersonDialog extends StatefulWidget {
  const OrganizationSelectExistingPersonDialog({Key? key}) : super(key: key);

  @override
  State<OrganizationSelectExistingPersonDialog> createState() =>
      _OrganizationSelectExistingPersonDialogState();
}

class _OrganizationSelectExistingPersonDialogState
    extends State<OrganizationSelectExistingPersonDialog> {
  String? selected = "";

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
                      text: "Select existing person",
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
                const SizedBox(
                  height: 10,
                ),
                DropdownSearch<String>(
                  showSearchBox: true,
                  mode: Mode.MENU,
                  selectedItem: selected,
                  items: const [
                    "Ajay",
                    "Amber",
                    "Bob",
                    'Donald',
                    'Ellie',
                    'Gaby'
                  ],
                  popupItemDisabled: (String s) => s.startsWith('I'),
                  onChanged: (_) {
                    setState(() {
                      selected = _;
                    });
                  },
                ),
                TitleTextFieldWidget(
                  textEditingController: TextEditingController(),
                  title: "Organization Name",
                  enabled: false,
                  hintText: "Better Soils",
                ),
                RealCheckBoxWidget(
                  value: false,
                  onChanged: (value) {
                    // setStats
                  },
                  Labeltext:
                      "Use Organization address as post address for this person",
                ),
                TitleTextFieldWidget(
                  textEditingController: TextEditingController(),
                  title: "Role *",
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
                    text: "Add Role",
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
