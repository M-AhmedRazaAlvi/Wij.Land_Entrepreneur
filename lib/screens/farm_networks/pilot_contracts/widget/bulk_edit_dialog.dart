import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/real_date_picker.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../office/widgets/add_text_button_widget.dart';
import '../../../office/widgets/comment_text.dart';

class BulkEditDialog extends StatefulWidget {
  const BulkEditDialog({Key? key}) : super(key: key);

  @override
  State<BulkEditDialog> createState() => _BulkEditDialogState();
}

class _BulkEditDialogState extends State<BulkEditDialog> {
  var selectFarm = 'Select Farm', selectFarmList = ['Select Farm'];
  var selectProject = 'Select Project', selectProjectList = ['Select Project'];
  var selectPerson = 'Select Person', selectPersonList = ['Select Person'];
  var selectStatus = 'Select Status',
      selectStatusList = ['Select Status', 'Signed', 'Not Signed'];
  // var selectFarm='Select Farm',selectFarmList=['Select Farm'];
  TextEditingController contractDate = TextEditingController();
  TextEditingController expirationDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: SizedBox(
        width: !Responsive.isDesktop(context)
            ? getWidth(context) / 2
            : getWidth(context),
        //  height: getHeight(context)*0.4,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, top: 25),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                CustomText(
                  text: "Bulk Edit Contracts",
                  size: 20,
                  weight: FontWeight.bold,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: InkWell(
                    onTap: (){
                                    Get.back();

                    },
                    child: Icon(
                      Icons.close,
                      size: 16,
                      color: Colors.grey,
                      
                    ),
                  ),
                ),
              ]),
        ),
      ),
      content: SizedBox(
        width: getWidth(context) * 0.8,
        height: getHeight(context) * 0.8,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(text: "Farm Involved"),
                    SizedBox(
                      width: 90,
                    ),
                    SizedBox(
                      width: !Responsive.isDesktop(context)
                          ? getWidth(context) / 3.2
                          : getWidth(context) / 3,
                      child: RealDropDownWidget(
                        value: selectFarm,
                        onChanged: (va) {
                          setState(() {
                            selectFarm = va;
                          });
                        },
                        items: selectFarmList
                            .map<DropdownMenuItem<String>>((String values) {
                          return DropdownMenuItem<String>(
                              value: values, child: Text(values));
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CustomText(text: "Project Involved"),
                    SizedBox(
                      width: 80,
                    ),
                    SizedBox(
                      width: !Responsive.isDesktop(context)
                          ? getWidth(context) / 3.2
                          : getWidth(context) / 3,
                      child: RealDropDownWidget(
                        value: selectProject,
                        onChanged: (va) {
                          setState(() {
                            selectFarm = va;
                          });
                        },
                        items: selectProjectList
                            .map<DropdownMenuItem<String>>((String values) {
                          return DropdownMenuItem<String>(
                              value: values, child: Text(values));
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CustomText(text: "People Involved"),
                    SizedBox(
                      width: 80,
                    ),
                    SizedBox(
                      width: !Responsive.isDesktop(context)
                          ? getWidth(context) / 3.2
                          : getWidth(context) / 3,
                      child: RealDropDownWidget(
                        value: selectPerson,
                        onChanged: (va) {
                          setState(() {
                            selectPerson = va;
                          });
                        },
                        items: selectPersonList
                            .map<DropdownMenuItem<String>>((String values) {
                          return DropdownMenuItem<String>(
                              value: values, child: Text(values));
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CustomText(text: "Contract Status"),
                    SizedBox(
                      width: 80,
                    ),
                    SizedBox(
                      width: !Responsive.isDesktop(context)
                          ? getWidth(context) / 3.2
                          : getWidth(context) / 3,
                      child: RealDropDownWidget(
                        value: selectStatus,
                        onChanged: (va) {
                          setState(() {
                            selectStatus = va;
                          });
                        },
                        items: selectStatusList
                            .map<DropdownMenuItem<String>>((String values) {
                          return DropdownMenuItem<String>(
                              value: values, child: Text(values));
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CustomText(text: "Contract Date"),
                    SizedBox(
                      width: 90,
                    ),
                    SizedBox(
                        width: !Responsive.isDesktop(context)
                            ? getWidth(context) / 3.2
                            : getWidth(context) / 3,
                        child: RealDatePickerWidget(
                          dateController: contractDate,
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CustomText(text: "Expiration Date"),
                    SizedBox(
                      width: 80,
                    ),
                    SizedBox(
                        width: !Responsive.isDesktop(context)
                            ? getWidth(context) / 3.2
                            : getWidth(context) / 3,
                        child: RealDatePickerWidget(
                          dateController: expirationDate,
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [   
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: CustomText(text: "Description of Contract"),
                    ),
                    //SizedBox(height: 100,),

                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 40),
                      child: SizedBox(
                        width: !Responsive.isDesktop(context)
                            ? getWidth(context) / 3.2
                            : getWidth(context) / 3,
                        child: CommentTextField(),
                      ),
                    ),
                  ],
                ),
              
                
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AddTextButtonWidget(
                        text: "Cancel",
                        colors: Colors.white,
                        onPress: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      AddTextButtonWidget(
                        text: "Update",
                        colors: Colors.yellow,
                        onPress: () {},
                      )
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
