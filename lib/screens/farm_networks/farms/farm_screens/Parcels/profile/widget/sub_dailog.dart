import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/text_widget.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../app_common_widgets/counter_widget.dart';
import '../../../../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../../../../office/widgets/add_text_button_widget.dart';
import '../../../../../../office/widgets/comment_text.dart';

class SubParcelAddDialog extends StatefulWidget {
  const SubParcelAddDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<SubParcelAddDialog> createState() => _SubParcelAddDialogState();
}

class _SubParcelAddDialogState extends State<SubParcelAddDialog> {
  String? owner = "Select Ownership";
  List<String> ownerList = <String>[
    "Select Ownership",
    "Owned",
    "Leased",
  ];
  String? purpose = "Select Purpose";
  List<String> purposeList = <String>[
    "Select Purpose",
    "Home",
    "Field",
  ];
  String? landFunction = "Select land Function";
  List<String> landFunctionList = <String>[
    "Select land Function",
    "Owned",
    "Leased",
  ];
  String? landManage = "Select land Management";
  List<String> landManageList = <String>[
    "Select land Management",
    "Owned",
    "Leased",
  ];
  String? organized = "Select Organization";
  List<String> organizedList = <String>[
    "Select Organization",
    "Owned",
    "Leased",
  ];
  double counter = 0;
  bool _interested = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: AlertDialog(
          title: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Add Sub-Parcel",
                  size: 30,
                  weight: FontWeight.bold,
                ),
                SizedBox(
                  width: 20,
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
          ),
          content: SizedBox(
            width: getWidth(context) * 0.8,
            child: Column(
              children: [
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    SizedBox(
                      width: !Responsive.isDesktop(context)
                          ? getWidth(context)
                          : getWidth(context) * 0.38,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            children: const [
                              CustomText(
                                text: "Farm Name:",
                                size: 18,
                                weight: FontWeight.bold,
                              ),
                              CustomText(
                                text: "Koos & Monique TEST JESSICA",
                                size: 18,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const CustomText(text: "Parcel Name"),
                          const SizedBox(
                            height: 15,
                          ),
                          TextWidgetField(),
                          const SizedBox(
                            height: 15,
                          ),
                          const CustomText(text: "Sub-Parcel Name"),
                          const SizedBox(
                            height: 15,
                          ),
                          TextWidgetField(),
                          const SizedBox(
                            height: 15,
                          ),
                          const CustomText(text: "Sub-Parcel Description"),
                          const SizedBox(
                            height: 15,
                          ),
                          CommentTextField(),
                          const SizedBox(
                            height: 15,
                          ),
                          const CustomText(text: "Hectares"),
                          const SizedBox(
                            height: 15,
                          ),
                          CounterWidget(
                            count: counter,
                            onAddTap: () {
                              setState(() {
                                counter = counter + (0.001);
                              });
                            },
                            onCloseTap: () {
                              setState(() {
                                counter = counter - (0.001);
                              });
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          RealCheckBoxWidget(
                              value: _interested,
                              onChanged: (value) {
                                setState(
                                  () {
                                    _interested = value ?? false;
                                  },
                                );
                              },
                              Labeltext: "This is the test plot"),
                          const SizedBox(
                            height: 15,
                          ),
                          const CustomText(text: "Set Location"),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: CustomText(
                                      text: "Select File",
                                    )),
                                Container(
                                  width: 1,
                                  color: Colors.black26,
                                  height: 40,
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                ),
                                CustomText(
                                  text: "Upload Shape File",
                                  color: Colors.black38,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //////////////////////////////////second////////////////////////
                    SizedBox(
                        width: !Responsive.isDesktop(context)
                            ? getWidth(context)
                            : getWidth(context) * 0.38,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 350,
                              color: Colors.black26,
                              child: Center(child: CustomText(text: "Map")),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        )),
                  ],
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
                    colors: Colors.white,
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AddTextButtonWidget(
                    text: "Add Sub-Parcel",
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
