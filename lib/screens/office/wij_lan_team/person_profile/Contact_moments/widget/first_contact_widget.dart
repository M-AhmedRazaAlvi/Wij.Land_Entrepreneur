import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../app_common_widgets/text_widget.dart';
import '../../../../widgets/comment_text.dart';

class FirstContactWidget extends StatefulWidget {
  const FirstContactWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstContactWidget> createState() => _FirstContactWidgetState();
}

class _FirstContactWidgetState extends State<FirstContactWidget> {
  String? relatedFarm = 'Select Farm';
  List<String> relatedFarmList = <String>[
    'Select Farm',
    'Better Soils',
    '@cvncxhwbbwxbwbxiwu123',
    'Green Leaf',
    "LTO",
    "Muhammad Abbas test",
    "Nature Conservancy"
  ];
  String? contactKind = 'Select Contact Type';
  List<String> contactKindList = <String>[
    'Select Contact Type',
    'At Event',
    'Email',
    "Farm Visit",
    "Phone Call",
  ];
  String? selectProject = 'Select Project';
  List<String> selectProjectList = <String>[
    'Select Project',
    'Aa',
    'Arable Land',
    "August Project",
    "Biomass Project",
  ];
  String? organization = 'Select Organization';
  List<String> organizationList = <String>[
    'Select Organization',
    'Arable Land',
    "Green Leaf",
    "Max Pak",
  ];
  final TextEditingController fName = TextEditingController(),
      date = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    date.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: "Attendee"),
                    SizedBox(
                      height: 10,
                    ),
                    TextWidgetField(),
                  ],
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(text: "Date of Contact Moment"),
                    const SizedBox(
                      height: 10,
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
                  ],
                )),
          ]),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "Main Subject"),
                      SizedBox(
                        height: 10,
                      ),
                      TextWidgetField(),
                    ],
                  )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(text: "Related Farm"),
                    const SizedBox(
                      height: 5,
                    ),
                    RealDropDownWidget(
                      value: relatedFarm,
                      onChanged: (newValue) {
                        setState(() {
                          relatedFarm = newValue;
                        });
                      },
                      items: relatedFarmList.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        },
                      ).toList(),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(text: "Kind of contact"),
                      const SizedBox(
                        height: 5,
                      ),
                      RealDropDownWidget(
                        value: contactKind,
                        onChanged: (newValue) {
                          setState(() {
                            contactKind = newValue;
                          });
                        },
                        items: contactKindList.map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                                value: value, child: Text(value));
                          },
                        ).toList(),
                      ),
                    ],
                  )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(text: "Related Project"),
                    const SizedBox(
                      height: 5,
                    ),
                    RealDropDownWidget(
                      value: selectProject,
                      onChanged: (newValue) {
                        setState(() {
                          selectProject = newValue;
                        });
                      },
                      items: selectProjectList.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        },
                      ).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(text: "Organization Name"),
                    const SizedBox(
                      height: 5,
                    ),
                    RealDropDownWidget(
                      value: organization,
                      onChanged: (newValue) {
                        setState(() {
                          organization = newValue;
                        });
                      },
                      items: organizationList.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        },
                      ).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const CustomText(text: "Notes"),
          const SizedBox(
            height: 15,
          ),
          const CommentTextField()
        ],
      ),
    );
  }
}
