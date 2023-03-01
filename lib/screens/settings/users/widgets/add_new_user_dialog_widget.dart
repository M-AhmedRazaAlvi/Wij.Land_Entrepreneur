import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/on_hover.dart';
import '../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../app_common_widgets/text_widget.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../../office/widgets/add_text_button_widget.dart';

class AddNewUserDialogWidget extends StatefulWidget {
  const AddNewUserDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddNewUserDialogWidget> createState() => _AddNewUserDialogWidgetState();
}

class _AddNewUserDialogWidgetState extends State<AddNewUserDialogWidget> {
  var roleText = ['Farmer'.tr(), 'Contractor'.tr(), 'Employee'.tr(), 'Advisor'.tr()],
      contactText = 'Contact Person'.tr(),
      farmerText = ['Interested in Renting Nature Land'.tr(), 'Member of Focus Group'.tr()];
  var roleSelect = [],
      farmSelect = false,
      contactPerson = false,
      textFarm = 'Select Farm'.tr(),
      farmRole = 'Select Farmer Role'.tr(),
      farmerSelect = [],
      headFarm = 'Select'.tr(),
      textOrg = 'Select Organization'.tr(),
      empRole = 'Select Employee Role'.tr(),
      farmList = ['Select Farm'.tr(), 'Jessica Farm'.tr(), 'Pear Pastures'.tr(), 'Queens Farm'.tr(), 'Jack Farms'.tr()],
      orgList = ['Select Organization'.tr(), 'Better Soils'.tr(), 'Green Leaf'.tr(), 'Max India'.tr(), 'Satya Farm'.tr(), 'Wij.Land'.tr()],
      farmerRole = ['Select Farmer Role'.tr(), 'Representative'.tr(), 'Farm Member'.tr(), 'Other'.tr()],
      employeeRole = ['Select Employee Role'.tr(), 'Owner'.tr(), 'Employee'.tr(), 'Other'.tr()],
      headList = [
        'Select'.tr(),
        'Yes'.tr(),
        'No'.tr(),
      ],
      format = 'Select Date'.tr();
  DateTime fromDate = DateTime.now();
  final TextEditingController _farmerController = TextEditingController();
  final TextEditingController _contractController = TextEditingController();
  final TextEditingController _employeeController = TextEditingController();
  final TextEditingController _advisorController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    roleSelect = List.filled(roleText.length, false);
    roleSelect[0] = true;
    farmerSelect = List.filled(farmerText.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: AlertDialog(
          contentPadding: EdgeInsets.only(
            left: 24,
            top: 20,
            right: 24,
          ),
          buttonPadding: EdgeInsets.zero,
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Add Person".tr(),
                      size: 26,
                      color: ivoryBlack,
                      weight: FontWeight.w600,
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
                SizedBox(
                  height: 14,
                ),
                CustomText(
                  text: "Basic Information".tr(),
                  size: 18,
                  color: ivoryBlack,
                  weight: FontWeight.w600,
                ),
              ],
            ),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "First Name".tr(),
                  weight: FontWeight.w400,
                ),
                SizedBox(
                  height: 6,
                ),
                TextWidgetField(),
                SizedBox(
                  height: 18,
                ),
                CustomText(text: "Last Name".tr(), weight: FontWeight.w400),
                SizedBox(
                  height: 6,
                ),
                TextWidgetField(),
                SizedBox(
                  height: 18,
                ),
                CustomText(text: "Email Address".tr(), weight: FontWeight.w400),
                SizedBox(
                  height: 6,
                ),
                TextWidgetField(),
                SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    Expanded(child: CustomText(text: "Phone No (Mobile) ".tr(), weight: FontWeight.w400)),
                    SizedBox(
                      width: !Responsive.isDesktop(context)
                          ? 6
                          : !Responsive.isDesktop(context)
                              ? 4
                              : 12,
                    ),
                    Expanded(child: CustomText(text: "Phone No (Home) ".tr(), weight: FontWeight.w400)),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Expanded(child: TextWidgetField()),
                    SizedBox(
                      width: !Responsive.isDesktop(context)
                          ? 6
                          : !Responsive.isDesktop(context)
                              ? 4
                              : 12,
                    ),
                    Expanded(child: TextWidgetField()),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                CustomText(text: "Mailing Address".tr(), weight: FontWeight.w400),
                SizedBox(
                  height: 6,
                ),
                TextWidgetField(),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: "Roles".tr(),
                  weight: FontWeight.w400,
                ),
                SizedBox(
                  height: 12,
                ),
                for (int i = 0; i < roleText.length; i++)
                  RealCheckBoxWidget(
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
                      labelWeight: FontWeight.w400),
                SizedBox(
                  height: 18,
                ),
                roleSelect[0]
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Farmer Details".tr(),
                            size: 14,
                            weight: FontWeight.w600,
                            color: ivoryBlack,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(text: "Farm".tr(), color: ivoryBlack, weight: FontWeight.w400),
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
                                          color: greyBlue,
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
                                  color: farmSelect ? lightGreen : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      /*showDialog(
                                      context: context,
                                      builder: (_) {
                                        return EditKpiDialogWidget();
                                      });*/
                                    },
                                    icon: FaIcon(
                                      FontAwesomeIcons.plus,
                                      color: farmSelect ? Colors.white : iconColors,
                                      size: 16,
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                          SizedBox(height: 20),
                          CustomText(
                            text: "Farmer Role".tr(),
                            color: ivoryBlack,
                          ),
                          SizedBox(height: 6),
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
                                    color: greyBlue,
                                    weight: FontWeight.w300,
                                  ));
                            }).toList(),
                          ),
                          SizedBox(height: 20),
                          CustomText(
                            text: "Head Farm".tr(),
                            color: ivoryBlack,
                          ),
                          SizedBox(height: 6),
                          RealDropDownWidget(
                            value: headFarm,
                            onChanged: (va) {
                              setState(() {
                                headFarm = va;
                              });
                            },
                            items: headList.map<DropdownMenuItem<String>>((String values) {
                              return DropdownMenuItem<String>(
                                  value: values,
                                  child: CustomText(
                                    text: values,
                                    color: greyBlue,
                                    weight: FontWeight.w300,
                                  ));
                            }).toList(),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          for (int i = 0; i < farmerText.length; i++)
                            RealCheckBoxWidget(
                              value: farmerSelect[i],
                              onChanged: (va) {
                                setState(() {
                                  if (farmerSelect[i] == true) {
                                    farmerSelect[i] = false;
                                  } else {
                                    farmerSelect[i] = true;
                                  }
                                });
                              },
                              Labeltext: farmerText[i],
                              labelSize: 15,
                              labelColor: ivoryBlack,
                              labelWeight: FontWeight.w400,
                            ),
                          SizedBox(
                            height: 18,
                          ),
                          CustomText(
                            text: "Connected to WijLand Since".tr(),
                            color: ivoryBlack,
                          ),
                          SizedBox(height: 6),
                          Stack(
                            children: [
                              TextWidgetField(
                                controller: _farmerController,
                              ),
                              Positioned(
                                right: !Responsive.isDesktop(context)
                                    ? getWidth(context) / 100
                                    : !Responsive.isDesktop(context)
                                        ? getWidth(context) / 100
                                        : getWidth(context) / 150,
                                top: !Responsive.isDesktop(context)
                                    ? getWidth(context) / 80
                                    : !Responsive.isDesktop(context)
                                        ? getWidth(context) / 100
                                        : getWidth(context) / 200,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    datePicker(context, _farmerController);
                                  },
                                  icon: Icon(
                                    Icons.calendar_today_rounded,
                                    color: Color(0xff768192),
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          CustomText(
                            text: "Comment".tr(),
                            color: ivoryBlack,
                          ),
                          SizedBox(height: 6),
                          TextWidgetField(
                            textPadding: EdgeInsets.symmetric(vertical: 70),
                          ),
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: 20,
                ),
                roleSelect[1]
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Contractor Details".tr(),
                            size: 14,
                            weight: FontWeight.w600,
                            color: ivoryBlack,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            text: "Connected to WijLand Since".tr(),
                            color: ivoryBlack,
                          ),
                          SizedBox(height: 6),
                          Stack(
                            children: [
                              TextWidgetField(
                                controller: _contractController,
                              ),
                              Positioned(
                                right: !Responsive.isDesktop(context)
                                    ? getWidth(context) / 100
                                    : !Responsive.isDesktop(context)
                                        ? getWidth(context) / 100
                                        : getWidth(context) / 150,
                                top: !Responsive.isDesktop(context)
                                    ? getWidth(context) / 80
                                    : !Responsive.isDesktop(context)
                                        ? getWidth(context) / 100
                                        : getWidth(context) / 200,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    datePicker(context, _contractController);
                                  },
                                  icon: Icon(
                                    Icons.calendar_today_rounded,
                                    color: Color(0xff768192),
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          CustomText(
                            text: "Comment".tr(),
                            color: ivoryBlack,
                          ),
                          SizedBox(height: 6),
                          TextWidgetField(
                            textPadding: EdgeInsets.symmetric(vertical: 70),
                          ),
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: 20,
                ),
                roleSelect[2]
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Employee Details".tr(),
                            size: 14,
                            weight: FontWeight.w600,
                            color: ivoryBlack,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            text: "Organization Name".tr(),
                            color: ivoryBlack,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          RealDropDownWidget(
                            value: textOrg,
                            onChanged: (va) {
                              setState(() {
                                textOrg = va;
                              });
                            },
                            items: orgList.map<DropdownMenuItem<String>>((String values) {
                              return DropdownMenuItem<String>(
                                  value: values,
                                  child: CustomText(
                                    text: values,
                                    color: greyBlue,
                                    weight: FontWeight.w300,
                                  ));
                            }).toList(),
                          ),
                          SizedBox(height: 20),
                          CustomText(
                            text: "Employee Role".tr(),
                            color: ivoryBlack,
                          ),
                          SizedBox(height: 6),
                          RealDropDownWidget(
                            value: empRole,
                            onChanged: (va) {
                              setState(() {
                                empRole = va;
                              });
                            },
                            items: employeeRole.map<DropdownMenuItem<String>>((String values) {
                              return DropdownMenuItem<String>(
                                  value: values,
                                  child: CustomText(
                                    text: values,
                                    color: greyBlue,
                                    weight: FontWeight.w300,
                                  ));
                            }).toList(),
                          ),
                          SizedBox(height: 20),
                          RealCheckBoxWidget(
                            value: contactPerson,
                            onChanged: (va) {
                              setState(() {
                                if (contactPerson == true) {
                                  contactPerson = false;
                                } else {
                                  contactPerson = true;
                                }
                              });
                            },
                            Labeltext: contactText,
                            labelSize: 15,
                            labelWeight: FontWeight.w400,
                            labelColor: ivoryBlack,
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          CustomText(
                            text: "Connected to WijLand Since".tr(),
                            color: ivoryBlack,
                          ),
                          SizedBox(height: 6),
                          Stack(
                            children: [
                              TextWidgetField(
                                controller: _employeeController,
                              ),
                              Positioned(
                                right: !Responsive.isDesktop(context)
                                    ? getWidth(context) / 100
                                    : !Responsive.isDesktop(context)
                                        ? getWidth(context) / 100
                                        : getWidth(context) / 150,
                                top: !Responsive.isDesktop(context)
                                    ? getWidth(context) / 80
                                    : !Responsive.isDesktop(context)
                                        ? getWidth(context) / 100
                                        : getWidth(context) / 200,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    datePicker(context, _employeeController);
                                  },
                                  icon: Icon(
                                    Icons.calendar_today_rounded,
                                    color: Color(0xff768192),
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          CustomText(
                            text: "Comment".tr(),
                            color: ivoryBlack,
                          ),
                          SizedBox(height: 6),
                          TextWidgetField(
                            textPadding: EdgeInsets.symmetric(vertical: 70),
                          ),
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: 20,
                ),
                roleSelect[3]
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Advisor Details".tr(),
                            size: 14,
                            weight: FontWeight.w600,
                            color: ivoryBlack,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            text: "Connected to WijLand Since".tr(),
                            color: ivoryBlack,
                          ),
                          SizedBox(height: 6),
                          Stack(
                            children: [
                              TextWidgetField(
                                controller: _advisorController,
                              ),
                              Positioned(
                                right: !Responsive.isDesktop(context)
                                    ? getWidth(context) / 100
                                    : !Responsive.isDesktop(context)
                                        ? getWidth(context) / 100
                                        : getWidth(context) / 150,
                                top: !Responsive.isDesktop(context)
                                    ? getWidth(context) / 80
                                    : !Responsive.isDesktop(context)
                                        ? getWidth(context) / 100
                                        : getWidth(context) / 200,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    datePicker(context, _advisorController);
                                  },
                                  icon: Icon(
                                    Icons.calendar_today_rounded,
                                    color: Color(0xff768192),
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 18),
                          CustomText(
                            text: "Comment".tr(),
                            color: ivoryBlack,
                          ),
                          SizedBox(height: 6),
                          TextWidgetField(
                            textPadding: EdgeInsets.symmetric(vertical: 70),
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.only(left: 40, right: 40, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AddTextButtonWidget(
                    text: "Cancel ".tr(),
                    colors: dimMetalic3,
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AddTextButtonWidget(
                    text: "Add Person ".tr(),
                    colors: Colors.yellow,
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

  Future<void> datePicker(BuildContext context, _controller) async {
    final DateTime? picked = await showDatePicker(context: context, initialDate: fromDate, firstDate: DateTime(2021), lastDate: DateTime(2101));
    if (picked != null && picked != fromDate) {
      setState(() {
        var dateString = picked;
        format = Jiffy(dateString).format("dd-MMM-yyyy");
        _controller.text = format;
      });
    }
  }
}
