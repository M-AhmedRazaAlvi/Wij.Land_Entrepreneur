import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/bottom_button.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/widget/profile_card.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/controller.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../office/office_programes/Widgets/on_hover_button_widget.dart';

class ParcelProfileScreen extends StatefulWidget {
  const ParcelProfileScreen({Key? key}) : super(key: key);

  @override
  State<ParcelProfileScreen> createState() => _ParcelProfileScreenState();
}

class _ParcelProfileScreenState extends State<ParcelProfileScreen> {
  bool onClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          width: getWidth(context),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => SizedBox(
                        child: CustomText(
                          text: menuController.activeItemRoute.value,
                          size: 14,
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              ParcelProfileCardWidget(),
              SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  onClicked
                      ? Container(
                          height: 300,
                          width: getWidth(context),
                          color: Colors.black12,
                          child: Center(
                              child: CustomText(
                            text: "Map",
                          )),
                        )
                      : Card(
                          elevation: 3,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 30),
                            width: getWidth(context),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Map",
                                  size: 18,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: 300,
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
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20),
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
                        ),
                  Positioned(
                      right: 20,
                      top: 10,
                      child: OnHoverButtonWidget(
                          onTap: () {
                            setState(() {
                              onClicked = !onClicked;
                            });
                          },
                          icons: onClicked
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              ParcelBottomButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
