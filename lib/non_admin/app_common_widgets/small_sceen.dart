import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:hovering/hovering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wij_land/non_admin/app_common_widgets/local_navigator.dart';
import 'package:wij_land/non_admin/app_common_widgets/side_menu.dart';
import 'package:wij_land/non_admin/routes/routes.dart';
import 'package:wij_land/routes/routes.dart';
import '../../screens/app.dart';
import '../../utils/controller.dart';
import '../../utils/functions.dart';
import '../../utils/styles.dart';

StreamController<double> larrgeScreenStreamcontroller = StreamController<double>();

class SmallFarmerScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  const SmallFarmerScreen({Key? key, this.scaffoldKey}) : super(key: key);

  @override
  State<SmallFarmerScreen> createState() => _SmallFarmerScreenState();
}

class _SmallFarmerScreenState extends State<SmallFarmerScreen> {
  List<String> navOptions = [];
  String navOption = authController.myUser.value.personInfo?.name ?? "No Name";
  StreamSubscription? stream;

  @override
  void dispose() {
    stream!.cancel();
    super.dispose();
  }

  Locale? locale;
  List<String> languages = ["English", "Dutch"];
  String language = "English";

  SharedPreferences? _prefs;

  void saveLanguage(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("text", text);
  }

  void raedLanguage() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      language = _prefs!.getString("text") ?? "English"; // get the value
    });
    if (language == 'English') {
      EasyLocalization.of(context)!.setLocale(Locale("nl"));
      Get.updateLocale(Locale("nl"));
      MyApp.of(context)!.setLocale(Locale.fromSubtags(languageCode: 'nl'));
      context.setLocale(context.supportedLocales[1]);

      EasyLocalization.of(context)!.setLocale(Locale("en"));
      Get.updateLocale(Locale("en"));
      context.setLocale(context.supportedLocales[0]);
      MyApp.of(context)!.setLocale(Locale.fromSubtags(languageCode: 'en'));
    } else {
      EasyLocalization.of(context)!.setLocale(Locale("en"));
      Get.updateLocale(Locale("en"));
      context.setLocale(context.supportedLocales[0]);
      MyApp.of(context)!.setLocale(Locale.fromSubtags(languageCode: 'en'));

      EasyLocalization.of(context)!.setLocale(Locale("nl"));
      Get.updateLocale(Locale("nl"));
      context.setLocale(context.supportedLocales[1]);
      MyApp.of(context)!.setLocale(Locale.fromSubtags(languageCode: 'nl'));
    }
  }

  @override
  void initState() {
    super.initState();
    raedLanguage();
  }

  bool openMenu = false;
  @override
  Widget build(BuildContext context) {
    navOptions = [
      authController.myUser.value.personInfo?.name ?? "No Name".tr(),
      "Profile".tr(),
      "Settings".tr(),
      "Activity Log".tr(),
      "New Ticket".tr(),
      "Logout".tr()
    ];
    return Row(
      children: [
        Visibility(
          visible: openMenu,
          child: MouseRegion(
            child: AnimatedContainer(
              child: SlideInLeft(
                  child: SizedBox(
                      child: SideFarmerMenu(
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
            flex: 5,
            child: Obx(
              () => Column(
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
                      child: DropdownButton(
                        style: TextStyle(
                          color: lightGrey,
                          fontFamily: Montserrat_Medium,
                        ),
                        value: language,
                        underline: const SizedBox(),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: languages.map<DropdownMenuItem<String>>((String items) {
                          return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: TextStyle(
                                  color: lightGrey,
                                  fontFamily: Montserrat_Medium,
                                ),
                              ));
                        }).toList(),
                        onChanged: (newValue) async {
                          // print("new=================================$newValue");
                          setState(() {
                            saveLanguage(newValue!);
                            language = newValue;
                            _prefs!.setString("text", language);
                          });
                          if (language == "English") {
                            Get.updateLocale(Locale("en"));
                            EasyLocalization.of(context)!.setLocale(Locale("en"));
                            setState(() {
                              context.setLocale(context.supportedLocales[0]);
                              Locale locale = Locale("en");
                              Get.updateLocale(locale);
                              MyApp.of(context)!.setLocale(Locale.fromSubtags(languageCode: 'en'));
                            });
                          } else {
                            Get.updateLocale(Locale("nl"));
                            EasyLocalization.of(context)!.setLocale(Locale("nl"));
                            setState(() {
                              Locale locale = Locale("nl");
                              Get.updateLocale(locale);
                              context.setLocale(context.supportedLocales[1]);
                              MyApp.of(context)!.setLocale(Locale.fromSubtags(languageCode: 'nl'));
                            });
                          }
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(
                      width: getWidth(context) * 0.010,
                    ),
                    SizedBox(
                      width: getWidth(context) * 0.010,
                    ),
                    Icon(Icons.notifications, color: Colors.black, size: 20),
                    SizedBox(
                      width: getWidth(context) * 0.010,
                    ),
                    Builder(builder: (context) {
                      print('imagePath  = ${authController.myUser.value.personInfo?.imagePath?.path}');
                      return CircularProfileAvatar(
                        authController.myUser.value.personInfo?.imagePath?.path != null
                            ? authController.myUser.value.personInfo!.imagePath!.path!
                            : "",
                        borderColor: Colors.black,
                        radius: 15,
                        imageFit: BoxFit.cover,
                      );
                    }),
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
                        print("Clicked : $navOption");
                      },
                      items: navOptions.map((String items) {
                        return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: TextStyle(
                                color: lightGrey,
                                fontFamily: Montserrat_Medium,
                              ),
                            ));
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          navOption = newValue as String;
                        });
                        if (navOption == "Profile") {
                          navigationController.navigateTo(farmComputerProfileRoute);
                        }
                        if (navOption == "Settings") {
                          print("clicked : $navOption");
                          navigationController.navigateTo(farmComputerPrivacySettingsRoute);
                        }
                        if (navOption == "Logout") {
                          print('logout click in this ');
                          // launchUrl('https://$gloal_base_path/login');
                          // navigationController.goBack();
                          // navigationController.navigatorKey.currentState!.pushNamedAndRemoveUntil(authPageRoute, (route) => false);
                          //     Get.offNamed(authPageRoute);
                          Get.offNamedUntil(authPageRoute, (route) => false);
                        }
                      },
                    ),
                    SizedBox(
                      width: getHeight(context) * 0.010,
                    ),
                  ], mainAxisAlignment: MainAxisAlignment.end),
                  Expanded(child: localFarmerNavigator()),
                ],
              ),
            )),
      ],
    );
  }
}
