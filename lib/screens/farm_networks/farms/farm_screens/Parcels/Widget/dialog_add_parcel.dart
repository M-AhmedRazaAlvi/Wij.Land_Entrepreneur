import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/Widget/map_info.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/Widget/selected_map.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../../../office/widgets/add_text_button_widget.dart';

class AddParcelDialog extends StatefulWidget {
  const AddParcelDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<AddParcelDialog> createState() => _AddParcelDialogState();
}

class _AddParcelDialogState extends State<AddParcelDialog> {
  bool onMapClick = true, onBasicClick = false, onConfiClick = false;
  bool mapSelect = true;

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
                      text: "Add Parcel to Farm of",
                      size: !Responsive.isDesktop(context) ? 20 : 30,
                      weight: FontWeight.bold,
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
              ],
            ),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: getWidth(context),
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            onMapClick = true;
                            onBasicClick = false;
                            onConfiClick = false;
                          });
                        },
                        child: MapInfoButton(
                          text: "Step 1: Map",
                          allClicked: onMapClick,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // setState(() {
                          //   onMapClick = false;
                          //   onBasicClick = true;
                          //   onConfiClick = false;
                          // });
                        },
                        child: MapInfoButton(
                          text: "Step 2: Basics",
                          allClicked: onBasicClick,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // setState(() {
                          //   onMapClick = false;
                          //   onBasicClick = false;
                          //   onConfiClick = true;
                          // });
                        },
                        child: MapInfoButton(
                          text: "Step 3: Confirm",
                          allClicked: onConfiClick,
                        ),
                      ),
                    ],
                  ),
                ),
                onMapClick
                    ? Container(
                        padding: EdgeInsets.all(30),
                        width: getWidth(context),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  mapSelect = true;
                                  onMapClick = false;
                                });
                              },
                              child: SelectMap(
                                text: "Select from Map",
                                icon: Icons.map,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              onTap: () {},
                              child: SelectMap(
                                text: "Select from Local",
                                icon: Icons.upload,
                              ),
                            )
                          ],
                        ),
                      )
                    : mapSelect
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 250,
                                alignment: Alignment.center,
                                width: getWidth(context),
                                color: Colors.greenAccent,
                                child: CustomText(
                                  text: "Map",
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: !Responsive.isDesktop(context)
                                        ? 20
                                        : 40,
                                    width: !Responsive.isDesktop(context)
                                        ? 40
                                        : 80,
                                    margin: EdgeInsets.only(right: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  CustomText(text: "Farm Parcels"),
                                  SizedBox(
                                    width: !Responsive.isDesktop(context)
                                        ? 10
                                        : 40,
                                  ),
                                  Container(
                                    height: !Responsive.isDesktop(context)
                                        ? 20
                                        : 40,
                                    width: !Responsive.isDesktop(context)
                                        ? 40
                                        : 80,
                                    margin: EdgeInsets.only(right: 5),
                                    decoration: BoxDecoration(
                                        color: third,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  CustomText(text: "Selected")
                                ],
                              ),
                            ],
                          )
                        : Container()
              ],
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    text: "Next",
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
