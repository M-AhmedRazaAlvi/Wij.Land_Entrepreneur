import 'package:animate_do/animate_do.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:wij_land/app_common_widgets/side_menu.dart';
import '../routes/routes.dart';
import '../utils/controller.dart';
import '../utils/functions.dart';
import '../utils/local_navigator.dart';
import '../utils/styles.dart';

class SmallScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  const SmallScreen({Key? key, this.scaffoldKey}) : super(key: key);

  @override
  State<SmallScreen> createState() => _SmallScreenState();
}

class _SmallScreenState extends State<SmallScreen> {
  List<String> navOptions = [
    authController.myUser.value.personInfo?.name ?? "No Name",
    "Profile",
    "Settings",
    "Activity Log",
    "New Ticket",
    "Logout"
  ];

  String navOption = authController.myUser.value.personInfo?.name ?? "No Name";
  List<String> languages = ["English", "Dutch"];

  String language = "English";

  makeNavOptions() {
    navOptions = [
      authController.myUser.value.personInfo?.name ?? "No Name",
      "Profile",
      "Settings",
      "Activity Log",
      "New Ticket",
      "Logout"
    ];
    navOption = navOptions[0];
  }

  bool openMenu = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: openMenu,
          child: MouseRegion(
            child: AnimatedContainer(
              child: SlideInLeft(
                  child: SizedBox(
                      child: SideMenu(
                        isexpand: true,
                      ),
                      width: 220),
                  from: 40),
              width: 220,
              duration: Duration(milliseconds: 500),
            ),
            onExit: (a) {
              // openMenu = !openMenu;
              // setState(() {});
            },
          ),
        ),
        Expanded(
            child: Column(
          children: [
            SizedBox(
              height: getHeight(context) * 0.010,
            ),
            Row(children: [
              Visibility(
                visible: !openMenu,
                child: Expanded(
                    child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          widget.scaffoldKey!.currentState!.openDrawer();
                        },
                        icon: Icon(
                          Icons.menu_sharp,
                          color: Colors.indigo,
                        ))
                  ],
                )),
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
                child: Image.asset('assets/images/Wij.land_profile.png'),
                borderColor: Colors.purpleAccent,
                radius: 15,
              ),
              SizedBox(
                width: getHeight(context) * 0.009,
              ),
              DropdownButton(
                style: TextStyle(
                  color: lightGrey,
                  fontFamily: Montserrat_Medium,
                ),
                value: navOption,
                underline: const SizedBox(),
                isDense: true,
                alignment: Alignment.center,
                icon: const Icon(Icons.keyboard_arrow_down),
                onTap: () {
                  print("Clicked");
                },
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
                    Get.offNamedUntil(authPageRoute, (route) => false);

                    // navigationController.navigateTo(liveViewLogin);
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
