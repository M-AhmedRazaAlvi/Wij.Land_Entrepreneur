import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/widget/on_grazing.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/widget/on_manute_widget.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/widget/on_mowing_widget.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../office/office_programes/Widgets/on_hover_button_widget.dart';

class ParcelGrazingManure extends StatefulWidget {
  const ParcelGrazingManure({
    Key? key,
  }) : super(key: key);

  @override
  State<ParcelGrazingManure> createState() => _ParcelGrazingManureState();
}

class _ParcelGrazingManureState extends State<ParcelGrazingManure> {
  bool onGrazingClicked = false,
      onMowingClicked = false,
      onManureClicked = false;

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
                        text: "Grazing",
                        size: 20,
                      ),
                      OnHoverButtonWidget(
                          onTap: () {
                            setState(() {
                              onGrazingClicked = !onGrazingClicked;
                            });
                          },
                          icons: onGrazingClicked
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down),
                    ],
                  ),
                  onGrazingClicked ? OnGrazingWidget() : Container(),
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
                        text: "Mowing",
                        size: 20,
                      ),
                      OnHoverButtonWidget(
                          onTap: () {
                            setState(() {
                              onMowingClicked = !onMowingClicked;
                            });
                          },
                          icons: onMowingClicked
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down),
                    ],
                  ),
                  onMowingClicked ? OnMowingWidget() : Container(),
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
                        text: "Manure",
                        size: 20,
                      ),
                      OnHoverButtonWidget(
                          onTap: () {
                            setState(() {
                              onManureClicked = !onManureClicked;
                            });
                          },
                          icons: onManureClicked
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down),
                    ],
                  ),
                  onManureClicked ? OnManureWidget() : Container(),
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
