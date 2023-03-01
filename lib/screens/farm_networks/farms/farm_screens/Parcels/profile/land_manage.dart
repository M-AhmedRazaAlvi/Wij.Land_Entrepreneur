import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/widget/on_general.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/widget/on_management.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../office/office_programes/Widgets/on_hover_button_widget.dart';

class ParcelLandManagement extends StatefulWidget {
  const ParcelLandManagement({
    Key? key,
  }) : super(key: key);

  @override
  State<ParcelLandManagement> createState() => _ParcelLandManagementState();
}

class _ParcelLandManagementState extends State<ParcelLandManagement> {
  bool onGeneralClicked = false, onManageClicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "General",
                        size: 20,
                      ),
                      OnHoverButtonWidget(
                          onTap: () {
                            setState(() {
                              onGeneralClicked = !onGeneralClicked;
                            });
                          },
                          icons: onGeneralClicked
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down),
                    ],
                  ),
                  onGeneralClicked ? OnGeneralWidget() : Container(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Land Management",
                        size: 20,
                      ),
                      OnHoverButtonWidget(
                          onTap: () {
                            setState(() {
                              onManageClicked = !onManageClicked;
                            });
                          },
                          icons: onManageClicked
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down),
                    ],
                  ),
                  onManageClicked ? OnManagementWidget() : Container(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
