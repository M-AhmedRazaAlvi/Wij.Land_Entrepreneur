import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/on_hover.dart';
import '../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../app_common_widgets/text_widget.dart';
import '../../../../utils/styles.dart';
import '../../../office/widgets/add_text_button_widget.dart';
import 'add_new_farm_dialog_widget.dart';
import 'add_new_user_dialog_widget.dart';

class AddUserDialogWidget extends StatefulWidget {
  const AddUserDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddUserDialogWidget> createState() => _AddUserDialogWidgetState();
}

class _AddUserDialogWidgetState extends State<AddUserDialogWidget> {
  var headText = ['Wij.land user.land user'.tr(), 'Farmer user'.tr()];
  var farmerRole = ['Select Farmer Role'.tr(), 'Farmer-Admin'.tr(), 'Farmer-not Admin'.tr()];
  var headSelect = [];
  var roleSelect = [];
  var personSelect = false, farmSelect = false;
  var textPerson = 'Select Person'.tr(), textFarm = 'Select Farm'.tr(), farmRole = 'Select Farmer Role'.tr();
  var personList = ['Select Person'.tr(), 'Ajay Jadeja'.tr(), 'Amber Lemming'.tr(), 'Aquiline Emerson'.tr(), 'Dennis Rupert'.tr(), 'Donald Roa'.tr()],
      farmList = ['Select Farm'.tr(), 'Jessica Farm'.tr(), 'Pear Pastures'.tr(), 'Queens Farm'.tr(), 'Jack Farms'.tr()];
  var roleText = [
    'Admin'.tr(),
    'Organization & Management'.tr(),
    'PC-Sustainable Farming'.tr(),
    'PC-Sustainable Earning'.tr(),
    'PC-Communication & Inspiration'.tr(),
    'Communication & Inspiration'.tr(),
    'Sustainable Farming'.tr(),
    'General Wij.land User'.tr()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    headSelect = List.filled(headText.length, false);
    headSelect[0] = true;

    roleSelect = List.filled(roleText.length, false);
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
                    CustomText(
                      text: "Add New User".tr(),
                      size: 26,
                      weight: FontWeight.w600,
                      color: ivoryBlack,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                        size: 21,
                        color: iconColors,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: [
                    for (int i = 0; i < headText.length; i++)
                      RealCheckBoxWidget(
                        value: headSelect[i],
                        onChanged: (va) {
                          setState(() {
                            if (headSelect.contains(true)) {
                              headSelect = List.filled(headText.length, false);
                              headSelect[i] = true;
                            } else {
                              headSelect[i] = true;
                            }
                          });
                        },
                        Labeltext: headText[i],
                        labelSize: 15,
                        labelWeight: FontWeight.w400,
                        labelColor: ivoryBlack,
                      ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                headSelect[1]
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Person".tr(),
                            weight: FontWeight.w400,
                            color: ivoryBlack,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: RealDropDownWidget(
                                  value: textPerson,
                                  onChanged: (va) {
                                    setState(() {
                                      textPerson = va;
                                    });
                                  },
                                  items: personList.map<DropdownMenuItem<String>>((String values) {
                                    return DropdownMenuItem<String>(
                                        value: values,
                                        child: CustomText(
                                          text: values,
                                          size: 14,
                                          weight: FontWeight.w300,
                                        ));
                                  }).toList(),
                                ),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              OnHover(builder: (personSelect) {
                                return Card(
                                  elevation: 2,
                                  color: personSelect ? lightGreen : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return AddNewUserDialogWidget();
                                          });
                                    },
                                    icon: FaIcon(
                                      FontAwesomeIcons.plus,
                                      color: personSelect ? Colors.white : Colors.black54,
                                      size: 16,
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            text: "Farm".tr(),
                            weight: FontWeight.w400,
                            color: ivoryBlack,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: RealDropDownWidget(
                                  value: textFarm,
                                  onChanged: (va) {
                                    setState(() {
                                      textFarm = va;
                                    });
                                  },
                                  items: farmList.map<DropdownMenuItem<String>>((String values) {
                                    return DropdownMenuItem<String>(
                                        value: values,
                                        child: CustomText(
                                          text: values,
                                          size: 14,
                                          weight: FontWeight.w300,
                                        ));
                                  }).toList(),
                                ),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              OnHover(builder: (farmSelect) {
                                return Card(
                                  elevation: 2,
                                  color: farmSelect ? Colors.green : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return AddNewFarmDialogWidget();
                                          });
                                    },
                                    icon: FaIcon(
                                      FontAwesomeIcons.plus,
                                      color: farmSelect ? Colors.white : Colors.black54,
                                      size: 16,
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            text: "Farmer Role".tr(),
                            weight: FontWeight.w400,
                            color: ivoryBlack,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          RealDropDownWidget(
                            value: farmRole,
                            onChanged: (va) {
                              setState(() {
                                farmRole = va;
                              });
                            },
                            items: farmerRole.map<DropdownMenuItem<String>>((String values) {
                              return DropdownMenuItem<String>(
                                  value: values,
                                  child: CustomText(
                                    text: values,
                                    size: 14,
                                    weight: FontWeight.w300,
                                    color: greyBlue,
                                  ));
                            }).toList(),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            text: "User Details".tr(),
                            weight: FontWeight.w600,
                            color: ivoryBlack,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            text: "Email".tr(),
                            weight: FontWeight.w400,
                            color: ivoryBlack,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          TextWidgetField(),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            text: "Name".tr(),
                            weight: FontWeight.w400,
                            color: ivoryBlack,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          TextWidgetField(),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    : Container(),
                headSelect[1]
                    ? SizedBox.shrink()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Email".tr(),
                            weight: FontWeight.w400,
                            color: ivoryBlack,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          TextWidgetField(),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            text: "Name".tr(),
                            weight: FontWeight.w400,
                            color: ivoryBlack,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          TextWidgetField(),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                headSelect[1]
                    ? Container()
                    : CustomText(
                        text: "Select Roles".tr(),
                        size: 14,
                        weight: FontWeight.w600,
                        color: ivoryBlack,
                      ),
                headSelect[1]
                    ? Container()
                    : SizedBox(
                        height: 10,
                      ),
                for (int i = 0; i < roleText.length; i++)
                  headSelect[1]
                      ? Container()
                      : RealCheckBoxWidget(
                          value: roleSelect[i],
                          onChanged: (va) {
                            setState(() {
                              if (roleSelect[i] == true) {
                                roleSelect[i] = false;
                              } else {
                                roleSelect[i] = true;
                              }
                            });
                          },
                          Labeltext: roleText[i],
                          labelWeight: FontWeight.w400,
                        ),
              ],
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  headSelect[1]
                      ? Container()
                      : AddTextButtonWidget(
                          text: "Cancel".tr(),
                          colors: dimMetalic3,
                          onPress: () {
                            Navigator.of(context).pop();
                          },
                        ),
                  const SizedBox(
                    width: 10,
                  ),
                  AddTextButtonWidget(
                    text: "Sent Email Invitation".tr(),
                    colors: Colors.yellow,
                    textColor: ivoryBlack,
                    onPress: () {},
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
