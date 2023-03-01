import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/route_manager.dart';
import 'package:hovering/hovering.dart';
import 'package:wij_land/app_common_widgets/side_menu.dart';
import 'package:wij_land/utils/functions.dart';
import '../routes/routes.dart';
import '../utils/controller.dart';
import '../utils/local_navigator.dart';
import '../utils/styles.dart';

var ishoverr = false.obs;
var global_entitiy = <Widget>[].obs;

class LargeScreen extends StatefulWidget {
  LargeScreen({Key? key}) : super(key: key);

  @override
  State<LargeScreen> createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  List<String> navOptions = [
    authController.myUser.value.personInfo?.name ?? "Admin",
    "Profile",
    "Settings",
    "Activity Log",
    "New Ticket",
    "Logout"
  ];

  String navOption = authController.myUser.value.personInfo?.name ?? "Admin";

  List<String> languages = ["English", "Dutch"];

  String language = "English";

  makeNavOptions() {
    navOptions = [
      authController.myUser.value.personInfo?.name ?? "Admin",
      "Profile",
      "Settings",
      "Activity Log",
      "New Ticket",
      "Logout"
    ];
    navOption = navOptions[0];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HoverWidget(
          child: SizedBox(child: SideMenu(isexpand: false), width: 65),
          hoverChild: SizedBox(child: SideMenu(isexpand: true), width: 220),
          onHover: (event) {},
        ),
        Expanded(
            child: Column(
          children: [
            SizedBox(
              height: getHeight(context) * 0.005,
            ),
            Row(children: [
              Expanded(
                  child: Obx(
                () => Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    ...global_entitiy
                  ],
                ),
              )),
              Container(
                child: DropdownButton(
                  style: TextStyle(color: lightGrey),
                  value: language,
                  underline: const SizedBox(),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: languages.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: TextStyle(color: lightGrey),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {},
                ),
              ),
              SizedBox(
                width: getWidth(context) * 0.010,
              ),
              Container(
                width: getWidth(context) / 4,
                decoration: BoxDecoration(
                    color: Color(0xffF3F3F3),
                    borderRadius: BorderRadius.circular(7)),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      focusColor: Colors.transparent,
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: lightGrey, fontSize: 14),
                      prefixIcon: Icon(
                        Icons.search,
                        color: lightGrey,
                        size: 15,
                      ),
                      contentPadding: const EdgeInsets.all(12)),
                ),
              ),
              SizedBox(
                width: getWidth(context) * 0.010,
              ),
              Icon(Icons.notifications, color: Colors.black, size: 20),
              SizedBox(
                width: getWidth(context) * 0.010,
              ),
              CircularProfileAvatar(
                authController.myUser.value.personInfo?.imagePath?.path != null
                    ? authController.myUser.value.personInfo!.imagePath!.path!
                    : "",
                // child: Image.asset('assets/images/Wij.land_profile.png'),
                borderColor: Colors.purpleAccent,
                radius: 15,
              ),
              SizedBox(
                width: getHeight(context) * 0.009,
              ),
              DropdownButton(
                style: TextStyle(color: lightGrey),
                value: navOption,
                underline: const SizedBox(),
                isDense: true,
                alignment: Alignment.center,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: navOptions.map((String items) {
                  return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items.tr(),
                        style: TextStyle(
                          color: lightGrey,
                          fontFamily: Montserrat_Medium,
                        ),
                      ));
                }).toList(),
                onChanged: (newValue) {
                  navOption = newValue as String;
                  setState(() {});
                  if (newValue == 'Logout') {
                    // launchUrl('https://$gloal_base_path/logout');
                    print('large logout');
                    Get.offNamedUntil(authPageRoute, (route) => false);
                  }
                },
              ),
              SizedBox(
                width: getHeight(context) * 0.010,
              ),
            ], mainAxisAlignment: MainAxisAlignment.end),
            Expanded(child: localNavigator()),
          ],
        )),
      ],
    );
  }
}
