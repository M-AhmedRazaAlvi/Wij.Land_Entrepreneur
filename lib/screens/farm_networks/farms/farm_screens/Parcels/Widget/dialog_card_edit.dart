import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/actions/action_parcel.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/grazing_manure.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/land_manage.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/plant_parcel_widget.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/soil_widget.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/sub_parcel.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/icon_text_container.dart';
import '../../../../../../../../../app_common_widgets/real_date_picker.dart';
import '../../../../../../../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../../../../../../../app_common_widgets/text_widget.dart';
import '../../../../../../../../../utils/controller.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../../../../../app_common_widgets/counter_widget.dart';
import '../../../../../office/widgets/add_text_button_widget.dart';
import '../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../Files/farm_file_screen.dart';

class ParcelCardEditDialog extends StatefulWidget {
  const ParcelCardEditDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<ParcelCardEditDialog> createState() => _ParcelCardEditDialogState();
}

class _ParcelCardEditDialogState extends State<ParcelCardEditDialog> {
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
                  text: "Edit Parcel",
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
                          const CustomText(text: "Parcel Description"),
                          const SizedBox(
                            height: 15,
                          ),
                          TextWidgetField(),
                          const SizedBox(
                            height: 15,
                          ),
                          const CustomText(text: "Hecteres"),
                          const SizedBox(
                            height: 15,
                          ),
                          TextWidgetField(),
                          const SizedBox(
                            height: 15,
                          ),
                          const CustomText(text: "Purpose"),
                          const SizedBox(
                            height: 15,
                          ),
                          RealDropDownWidget(
                            value: purpose,
                            onChanged: (newValue) {
                              setState(() {
                                purpose = newValue;
                              });
                            },
                            items: purposeList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value, child: Text(value));
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const CustomText(text: "Ownership"),
                          const SizedBox(
                            height: 15,
                          ),
                          RealDropDownWidget(
                            value: owner,
                            onChanged: (newValue) {
                              setState(() {
                                owner = newValue;
                              });
                            },
                            items: ownerList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value, child: Text(value));
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const CustomText(text: "Land Function"),
                          const SizedBox(
                            height: 15,
                          ),
                          RealDropDownWidget(
                            value: landFunction,
                            onChanged: (newValue) {
                              setState(() {
                                landFunction = newValue;
                              });
                            },
                            items: landFunctionList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value, child: Text(value));
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const CustomText(text: "Land Management"),
                          const SizedBox(
                            height: 15,
                          ),
                          RealDropDownWidget(
                            value: landManage,
                            onChanged: (newValue) {
                              setState(() {
                                landManage = newValue;
                              });
                            },
                            items: landManageList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value, child: Text(value));
                            }).toList(),
                          ),
                          const CustomText(text: "Organization Name"),
                          const SizedBox(
                            height: 15,
                          ),
                          RealDropDownWidget(
                            value: organized,
                            onChanged: (newValue) {
                              setState(() {
                                organized = newValue;
                              });
                            },
                            items: organizedList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value, child: Text(value));
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const CustomText(text: "Upload Parcel Image"),
                          const SizedBox(
                            height: 15,
                          ),
                          DottedBorder(
                              padding: EdgeInsets.all(30),
                              child: Icon(Icons.add))
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
                            const CustomText(text: "Add Parcel Location"),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 350,
                              color: Colors.black26,
                              child: Center(child: CustomText(text: "Map")),
                            ),
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                  ),
                                  CustomText(
                                    text: "Upload Shape File",
                                    color: Colors.black38,
                                  )
                                ],
                              ),
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
                    colors: Colors.white60,
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AddTextButtonWidget(
                    text: "Update Parcel",
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
