import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../../../../app_common_widgets/text_widget.dart';
import '../../../../../../utils/functions.dart';
import '../../../../../../utils/responsive.dart';
import '../../../../../office/widgets/add_text_button_widget.dart';

class EditInterviewDialogBox extends StatefulWidget {
  const EditInterviewDialogBox({
    Key? key,
  }) : super(key: key);

  @override
  State<EditInterviewDialogBox> createState() => _EditInterviewDialogBoxState();
}

class _EditInterviewDialogBoxState extends State<EditInterviewDialogBox> {
  final TextEditingController fName = TextEditingController(),
      lName = TextEditingController(),
      email = TextEditingController(),
      address = TextEditingController(),
      date = TextEditingController(),
      comment = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    fName.dispose();
    lName.dispose();
    email.dispose();
    address.dispose();
    date.dispose();
    comment.dispose();
  }

  List<String> selectedfarmOfSince = [];
  String farmOfSince = "Farm of";
  List<String> farmOfSinceList = [
    "Farm of",
    "Farm of,Usquert",
    "Farm of,Delft",
    "Farm of Donald Roa",
    "Farm of Ellie de Jong",
    "Farm of Ellie Mass",
    "Farm of Ellie McPhee",
  ];
  String parcel = "Farm of";
  List<String> parcelList = [
    "Farm of",
    "Farm of,Usquert",
    "Farm of,Delft",
    "Farm of Donald Roa",
    "Farm of Ellie de Jong",
    "Farm of Ellie Mass",
    "Farm of Ellie McPhee",
  ];

  String project = "Farm of";
  List<String> projectList = [
    "Farm of",
    "Farm of,Usquert",
    "Farm of,Delft",
    "Farm of Donald Roa",
    "Farm of Ellie de Jong",
    "Farm of Ellie Mass",
    "Farm of Ellie McPhee",
  ];
  String organization = "Farm of";
  List<String> organizationList = [
    "Better Soils",
    "Enterprise name",
    "Enterprise name 3",
    "Enterprise name 5",
  ];
  String event = "Farm of";
  List<String> eventList = [
    "Aiman Far",
    "Ali Raza",
    "Another Test",
    "Biodiversity",
    "Bodemexcursie",
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
                      text: "Edit Interview Report",
                      size: !Responsive.isDesktop(context) ? 16 : 30,
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
                Row(
                  children: [
                    const Icon(
                      Icons.file_present,
                      size: 80,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: CustomText(text: "test-10mb.bin"),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            margin: const EdgeInsets.all(20),
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.grey,
                              color: Colors.green,
                              minHeight: 5,
                              value: value,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text: "Date",
                ),
                const SizedBox(height: 10),
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
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
              ],
            ),
          ),
          content: Container(
            width: getWidth(context) * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: "Add Tags",
                  size: 26,
                  weight: FontWeight.bold,
                ),
                const SizedBox(height: 15),
                const CustomText(
                  text: "These tags will apply to all files",
                ),
                const SizedBox(height: 20),
                Wrap(
                  children: [
                    SelectableDropdownWidget(
                      widthSize: !Responsive.isDesktop(context)
                          ? getWidth(context) * 0.65
                          : getWidth(context) / 3.1,
                      items: farmOfSinceList,
                      mSelectedValue: "",
                      mOnDropDownChange: (value) {},
                      mSelectedItemsList: [],
                      title: "Farm",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SelectableDropdownWidget(
                      widthSize: !Responsive.isDesktop(context)
                          ? getWidth(context) * 0.65
                          : getWidth(context) / 3.1,
                      items: parcelList,
                      mSelectedValue: "",
                      mOnDropDownChange: (value) {},
                      mSelectedItemsList: [],
                      title: "Parcel",
                    )
                  ],
                ),
                const SizedBox(height: 15),
                SelectableDropdownWidget(
                  widthSize: !Responsive.isDesktop(context)
                      ? getWidth(context) * 0.65
                      : getWidth(context) / 3.1,
                  items: projectList,
                  title: "Project",
                  mSelectedValue: "",
                  mOnDropDownChange: (value) {},
                  mSelectedItemsList: [],
                ),
                const SizedBox(height: 15),
                SelectableDropdownWidget(
                  widthSize: !Responsive.isDesktop(context)
                      ? getWidth(context) * 0.65
                      : getWidth(context) / 3.1,
                  items: organizationList,
                  mSelectedValue: "",
                  mOnDropDownChange: (value) {},
                  mSelectedItemsList: [],
                  title: "Organization",
                ),
                const SizedBox(height: 15),
                SelectableDropdownWidget(
                  widthSize: !Responsive.isDesktop(context)
                      ? getWidth(context) * 0.65
                      : getWidth(context) / 3.1,
                  items: eventList,
                  mSelectedValue: "",
                  mOnDropDownChange: (value) {},
                  mSelectedItemsList: [],
                  title: "Event",
                )
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
                    colors: Colors.white,
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AddTextButtonWidget(
                    text: "UpDate",
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
