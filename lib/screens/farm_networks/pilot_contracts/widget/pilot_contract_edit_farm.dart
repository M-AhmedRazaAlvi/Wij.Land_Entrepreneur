import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/text_widget.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../app_common_widgets/counter_widget.dart';
import '../../../../app_common_widgets/on_hover.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../office/widgets/comment_text.dart';

class PilotContractEditFarm extends StatefulWidget {
  const PilotContractEditFarm({Key? key}) : super(key: key);

  @override
  State<PilotContractEditFarm> createState() => _PilotContractEditFarmState();
}

class _PilotContractEditFarmState extends State<PilotContractEditFarm> {
  final TextEditingController date = TextEditingController();
  String? farmInvolved = 'Farm of Iona';
  List<String> farmInvolvedList = [
    'Farm of Iona',
    'Farm of noone',
    'Farm of zikry',
    'Farm of tan'
  ];
  String? projectinvolved = 'Projects';
  List<String> projectInvolvedList = [
    'Projects',
    'Project A',
    'Project B',
    'Project C'
  ];
  String? projectStatus = 'Select Status';
  List<String> projectStatusList = [
    'Select Status',
    'Signed',
    'Not Signed',
  ];
  String? pilotInvoice = 'Select Pilot Invoice';
  List<String> pilotInvoiceList = [
    'Select Status',
    'Yes',
    'No',
  ];
  bool onclicked = false;
  bool hoverColor = false;
  int countFisrt = 0;
  int counterSecond = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.start,
            // direction: !Responsive.isDesktop(context)
            //     ? Axis.vertical
            //     : Axis.horizontal,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  width: !Responsive.isDesktop(context)
                      ? getWidth(context)
                      : getWidth(context) * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "Contract Type"),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 35,
                        child: TextWidgetField(
                          //enabled: false,

                          suffixIcon: Icon(Icons.arrow_downward, size: 10),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomText(text: "People Involved"),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 35,
                        child: TextWidgetField(
                          //enabled: false,

                          suffixIcon: Icon(
                            Icons.arrow_downward,
                            size: 10,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomText(text: "Contract Date"),
                      SizedBox(
                        height: 5,
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
                        child: SizedBox(
                          height: 40,
                          child: TextWidgetField(
                            controller: date,
                            //  enabled: false,
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomText(text: "Expiration  Date"),
                      SizedBox(
                        height: 5,
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
                        child: SizedBox(
                          height: 40,
                          child: TextWidgetField(
                            controller: date,
                            //      enabled: false,
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  width: !Responsive.isDesktop(context)
                      ? getWidth(context)
                      : getWidth(context) * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "Farm Involved"),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 35,
                        child: RealDropDownWidget(
                          value: farmInvolved,
                          onChanged: (newValue) {
                            setState(() {
                              farmInvolved = newValue;
                            });
                          },
                          items: farmInvolvedList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                                value: value, child: Text(value));
                          }).toList(),
                        ),
                      ),
                      CustomText(text: "People Involved"),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 35,
                        child: RealDropDownWidget(
                          value: projectinvolved,
                          onChanged: (newValue) {
                            setState(() {
                              projectinvolved = newValue;
                            });
                          },
                          items: projectInvolvedList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                                value: value, child: Text(value));
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomText(text: "Contract Status"),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 35,
                        child: RealDropDownWidget(
                          value: farmInvolved,
                          onChanged: (newValue) {
                            setState(() {
                              farmInvolved = newValue;
                            });
                          },
                          items: farmInvolvedList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                                value: value, child: Text(value));
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomText(text: "Pilot Year"),
                      SizedBox(height: 10),
                      CounterWidget(
                        count: countFisrt,
                        onAddTap: () {
                          setState(() {
                            countFisrt++;
                          });
                        },
                        onCloseTap: () {
                          setState(() {
                            countFisrt--;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      CustomText(text: "Pilot Invoice"),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 35,
                        child: RealDropDownWidget(
                          value: projectinvolved,
                          onChanged: (newValue) {
                            setState(() {
                              projectinvolved = newValue;
                            });
                          },
                          items: projectInvolvedList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                                value: value, child: Text(value));
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText(text: "Description of Contract"),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              height: 100,
              width: getWidth(context),
              child: CommentTextField(),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText(text: "Add File"),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 50,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Icon(
                Icons.attach_file,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  child: OnHover(
                    builder: (hover) => ButtonTheme(
                      minWidth: 80,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Cancel",
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: OnHover(
                      builder: (hover) => ButtonTheme(
                        minWidth: 80,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Update",
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
