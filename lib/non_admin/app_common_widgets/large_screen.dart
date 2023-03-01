import 'dart:async';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:hovering/hovering.dart';
import 'package:wij_land/non_admin/app_common_widgets/local_navigator.dart';
import 'package:wij_land/non_admin/app_common_widgets/side_menu.dart';
import 'package:wij_land/routes/routes.dart';
import '../../providers/GlobalProvider/auth/auth_screen_provider.dart';
import '../../screens/app.dart';
import '../../utils/controller.dart';
import '../../utils/functions.dart';
import '../../utils/styles.dart';
import '../routes/routes.dart';

StreamController<double> larrgeScreenStreamcontroller = StreamController<double>();
var global_farmer_entitiy = <Widget>[].obs;

class LargeFarmerScreen extends StatefulWidget {
  const LargeFarmerScreen({Key? key}) : super(key: key);

  @override
  State<LargeFarmerScreen> createState() => _LargeFarmerScreenState();
}

class _LargeFarmerScreenState extends State<LargeFarmerScreen> {
  List<String> navOptions = [];
  String navOption = authController.myUser.value.personInfo?.name ?? "No Name";

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
        HoverWidget(
          child: SizedBox(child: SideFarmerMenu(isexpand: false), width: 65),
          hoverChild: SizedBox(child: SideFarmerMenu(isexpand: true), width: 220),
          onHover: (event) {},
        ),
        Expanded(
            child: Obx(
              () => Column(
                children: [
                  SizedBox(
                    height: getHeight(context) * 0.010,
                  ),
                  Row(children: [
                    Expanded(
                        child: Obx(
                              () => Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              ...global_farmer_entitiy
                            ],
                          ),
                        )),
                  /*  Container(
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
                    ),*/
                    SizedBox(
                      width: getWidth(context) * 0.010,
                    ),
                    // Container(
                    //   width: getWidth(context) / 4,
                    //   decoration: BoxDecoration(color: Color(0xffF3F3F3), borderRadius: BorderRadius.circular(7)),
                    //   child: TextField(
                    //     decoration: InputDecoration(
                    //         hintText: "Search".tr(),
                    //         focusColor: Colors.transparent,
                    //         border: InputBorder.none,
                    //         hintStyle: TextStyle(color: lightGrey, fontSize: 14),
                    //         prefixIcon: Icon(
                    //           Icons.search,
                    //           color: lightGrey,
                    //           size: 15,
                    //         ),
                    //         contentPadding: const EdgeInsets.all(12)),
                    //   ),
                    // ),
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
                      value:authController.myUser.value.personInfo?.name,
                      underline: const SizedBox(),
                      isDense: true,
                      alignment: Alignment.center,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      onTap: () {},
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
                        if (navOption == "Profile" || navOption == "Profiel") {
                          navigationController.navigateTo(farmComputerProfileRoute);
                        }
                        if (navOption == "Settings" || navOption == "Instellingen") {
                          print("clicked : $navOption");
                          navigationController.navigateTo(farmComputerPrivacySettingsRoute);
                        }
                        if (navOption == "Logout" || navOption == "Uitloggen") {
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
