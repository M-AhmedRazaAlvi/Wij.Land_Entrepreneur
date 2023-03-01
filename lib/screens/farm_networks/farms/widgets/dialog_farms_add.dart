import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/text_widget.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../office/widgets/add_text_button_widget.dart';

class FarmsAddDialogBox extends StatefulWidget {
  final String profileText;
  final String submitText;
  const FarmsAddDialogBox({
    Key? key,
    required this.profileText,
    required this.submitText,
  }) : super(key: key);

  @override
  State<FarmsAddDialogBox> createState() => _FarmsAddDialogBoxState();
}

class _FarmsAddDialogBoxState extends State<FarmsAddDialogBox> {
  final TextEditingController fName = TextEditingController(),
      farmDate = TextEditingController(),
      exprirationDate = TextEditingController(),
      comment = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    farmDate.dispose();
    exprirationDate.dispose();
    comment.dispose();
  }

  String? selectFramtype = 'Select Farm';
  List<String> selectFramtypeList = [
    'Select Farm',
    'Farm of Donald Roa',
    'Farm of Ellie de jong',
    'Farm of Elliot Mass',
  ];
  String? selectMunicipal = 'Select Municipality';
  List<String> selectMunicipalList = [
    'Select Municipality',
    'Farm of Donald Roa',
    'Farm of Ellie de jong',
    'Farm of Elliot Mass',
  ];
  String? selectWaterBoard = 'Select Water Board';
  List<String> selectWaterBoardList = [
    'Select Water Board',
    'Farm of Donald Roa',
    'Farm of Ellie de jong',
    'Farm of Elliot Mass',
  ];
  double value = 0;
  bool _onWebChecked = false;
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
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Wrap(
              spacing: 30,
              children: [
                ///////////////leftSideWidget///////////////////////////////

                SizedBox(
                  width: !Responsive.isDesktop(context)
                      ? getWidth(context) * 0.35
                      : !Responsive.isDesktop(context)
                          ? getWidth(context) * 0.6
                          : getWidth(context) * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      CustomText(text: "Upload Farm Photo"),
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
                      CustomText(text: "Farm name"),
                      const SizedBox(
                        height: 15,
                      ),
                      TextWidgetField(),
                      const SizedBox(
                        height: 15,
                      ),
                      const CustomText(text: "Farm Budiness Type"),
                      const SizedBox(
                        height: 15,
                      ),
                      RealDropDownWidget(
                        value: selectFramtype,
                        onChanged: (newValue) {
                          setState(() {
                            selectFramtype = newValue;
                          });
                        },
                        items: selectFramtypeList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const CustomText(text: "Connected to Wij.land Since"),
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
                                farmDate.text = d.toString().split(" ")[0];
                              });
                            }
                          });
                        },
                        child: TextWidgetField(
                          controller: farmDate,
                          enabled: false,
                          suffixIcon: const Icon(Icons.calendar_today),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RealCheckBoxWidget(
                          value: _onWebChecked,
                          onChanged: (value) {
                            setState(
                              () {
                                _onWebChecked = value ?? false;
                              },
                            );
                          },
                          Labeltext: "On Website"),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),

                ///////////////RightSideWidget///////////////////////////////
                SizedBox(
                  width: !Responsive.isDesktop(context)
                      ? getWidth(context) * 0.35
                      : !Responsive.isDesktop(context)
                          ? getWidth(context) * 0.6
                          : getWidth(context) * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "Farm Address"),
                      SizedBox(
                        height: 15,
                      ),
                      TextWidgetField(),
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
                                CustomText(text: "Latitude"),
                                SizedBox(
                                  height: 15,
                                ),
                                TextWidgetField(),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: "Longitude"),
                                SizedBox(
                                  height: 15,
                                ),
                                TextWidgetField(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(text: "Province"),
                      SizedBox(
                        height: 15,
                      ),
                      TextWidgetField(),
                      SizedBox(
                        height: 15,
                      ),
                      const CustomText(text: "Municipality"),
                      const SizedBox(
                        height: 15,
                      ),
                      RealDropDownWidget(
                        value: selectMunicipal,
                        onChanged: (newValue) {
                          setState(() {
                            selectMunicipal = newValue;
                          });
                        },
                        items: selectMunicipalList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const CustomText(text: "Water Board"),
                      const SizedBox(
                        height: 15,
                      ),
                      RealDropDownWidget(
                        value: selectWaterBoard,
                        onChanged: (newValue) {
                          setState(() {
                            selectWaterBoard = newValue;
                          });
                        },
                        items: selectWaterBoardList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
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
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
