import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wij_land/app_common_widgets/common_elevated_button.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/hex_color.dart';
import 'package:wij_land/utils/responsive.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../app_common_widgets/custom_text.dart';
import '../../../non_admin/providers/privacy_settings_screen_provider.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/styles.dart';
import '../../app.dart';

class PrivacySettingsScreen extends StatefulWidget {
  const PrivacySettingsScreen({Key? key}) : super(key: key);

  @override
  State<PrivacySettingsScreen> createState() => _PrivacySettingsScreenState();
}

class _PrivacySettingsScreenState extends State<PrivacySettingsScreen> {
  late MapController mapController;

  @override
  void initState() {
    var provider = Provider.of<PrivacySettingsScreenProvider>(context, listen: false);
    provider.getSettingsData();
    mapController = MapController();
    raedLanguage();

    super.initState();
  }

  Locale? locale;

  SharedPreferences? _prefs;

  void saveLanguage(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("text", text);
  }

  void raedLanguage() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      language = _prefs!.getString("English") ?? "English"; // get the value
    });
    if (language == 'English') {
      EasyLocalization.of(context)!.setLocale(Locale("nl"));
      Get.updateLocale(Locale("nl"));
      context.setLocale(context.supportedLocales[1]);
      MyApp.of(context)!.setLocale(Locale.fromSubtags(languageCode: 'nl'));

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

  List<String> languages = ["English", "Dutch"];
  String language = "English";

  @override
  Widget build(BuildContext context) {
    return Consumer<PrivacySettingsScreenProvider>(
      builder: (context, provider, widget) {
        return Scaffold(
          backgroundColor: HexColor("#E5E5E5"),
          body: provider.showLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Language settings".tr(),
                              size: Responsive.isMobile(context) ? 14 : 22,
                              color: HexColor("#892913"),
                              weight: FontWeight.w800,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: CustomText(
                                text: "Set the default language of your profile here :".tr(),
                                size: Responsive.isMobile(context) ? 10 : 14,
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: DropdownButton(
                                style: TextStyle(
                                  color: lightGrey,
                                  fontFamily: Montserrat_Medium,
                                ),
                                value: language,
                                underline: const SizedBox(),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: languages.map<DropdownMenuItem<String>>(
                                  (String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(
                                        items,
                                        style: TextStyle(
                                          color: lightGrey,
                                          fontFamily: Montserrat_Medium,
                                        ),
                                      ),
                                    );
                                  },
                                ).toList(),
                                onChanged: (newValue) async {
                                  // print("new=================================$newValue");
                                  setState(
                                    () {
                                      saveLanguage(newValue!);
                                      language = newValue;
                                      _prefs!.setString("English", language);
                                    },
                                  );
                                  if (language == "English") {
                                    Get.updateLocale(Locale("en"));
                                    EasyLocalization.of(context)!.setLocale(Locale("en"));
                                    setState(
                                      () {
                                        context.setLocale(context.supportedLocales[0]);
                                        Locale locale = Locale("en");
                                        Get.updateLocale(locale);
                                        MyApp.of(context)!.setLocale(Locale.fromSubtags(languageCode: 'en'));
                                      },
                                    );
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
                          ],
                        ),
                        SizedBox(height: getWidth(context) * 0.1),
                        CustomText(
                          text: "Privacy settings".tr(),
                          size: Responsive.isMobile(context) ? 14 : 22,
                          color: HexColor("#892913"),
                          weight: FontWeight.w800,
                        ),
                        SizedBox(height: 19),
                        Responsive.isDesktop(context) || Responsive.isTablet(context)
                            ? Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      height:Responsive.isTablet(context)?getHeight(context)*0.45: getHeight(context) * 0.4,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(Responsive.isMobile(context) ? 10 : 30),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Public Map".tr(),
                                              style: GoogleFonts.montserrat(
                                                fontSize: Responsive.isMobile(context) ? 14 : 16,
                                                color: HexColor("#48883E"),
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Status: ".tr(),
                                                    style: GoogleFonts.montserrat(
                                                      fontSize: Responsive.isMobile(context) ? 10 : 14,
                                                      color: HexColor("#000000"),
                                                      fontWeight: FontWeight.w800,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: provider.privacySettingsResponseModel.isPublic == null
                                                        ? "You are NOT visible on the wij.land public map".tr()
                                                        : provider.privacySettingsResponseModel.isPublic!
                                                            ? "You are visible on the wij.land public map".tr()
                                                            : "You are NOT visible on the wij.land public map".tr(),
                                                    style: GoogleFonts.montserrat(
                                                      fontSize: Responsive.isMobile(context) ? 10 : 14,
                                                      color: HexColor("#000000"),
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Date updated:".tr(),
                                                    style: GoogleFonts.montserrat(
                                                      fontSize: Responsive.isMobile(context) ? 10 : 14,
                                                      color: HexColor("#000000"),
                                                      fontWeight: FontWeight.w800,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: provider.privacySettingsResponseModel.dateMapUpdated ?? "-",
                                                    style: GoogleFonts.montserrat(
                                                      fontSize: Responsive.isMobile(context) ? 10 : 14,
                                                      color: HexColor("#000000"),
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  TextSpan(text: "       "),
                                                  TextSpan(
                                                    text: "Updated by: ".tr(),
                                                    style: GoogleFonts.montserrat(
                                                      fontSize: Responsive.isMobile(context) ? 10 : 14,
                                                      color: HexColor("#000000"),
                                                      fontWeight: FontWeight.w800,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: provider.privacySettingsResponseModel.updatedBy ?? "",
                                                    style: GoogleFonts.montserrat(
                                                      fontSize: Responsive.isMobile(context) ? 10 : 14,
                                                      color: HexColor("#000000"),
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            Text(
                                              "Do you want your location to be visible on the wij.land public map?".tr(),
                                              style: GoogleFonts.montserrat(
                                                fontSize: Responsive.isMobile(context) ? 10 : 14,
                                                color: HexColor("#000000"),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(height: 18),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          title: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(
                                                                "Public Map Consent".tr(),
                                                                style: GoogleFonts.montserrat(
                                                                  fontSize: Responsive.isMobile(context) ? 10 : 15,
                                                                  color: HexColor("#892913"),
                                                                  fontWeight: FontWeight.w800,
                                                                ),
                                                              ),
                                                              InkWell(
                                                                  onTap: () {
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Icon(Icons.close))
                                                            ],
                                                          ),
                                                          content: SizedBox(
                                                            width: 257,
                                                            child: RichText(
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: provider.privacySettingsResponseModel.isPublic == true
                                                                        ? "You are indicating that you no longer want your farm to be visible on the "
                                                                            .tr()
                                                                        : "You are indicating that you would like your farm to be visible on the "
                                                                            .tr(),
                                                                    style: GoogleFonts.montserrat(
                                                                      fontSize: Responsive.isMobile(context) ? 10 : 12,
                                                                      color: HexColor("#000000"),
                                                                      fontWeight: FontWeight.w400,
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                      text: "wij.land".tr(),
                                                                      style: GoogleFonts.montserrat(
                                                                        fontSize: Responsive.isMobile(context) ? 10 : 12,
                                                                        color: HexColor("#0000FF"),
                                                                        decoration: TextDecoration.underline,
                                                                        fontWeight: FontWeight.w400,
                                                                      ),
                                                                      recognizer: TapGestureRecognizer()
                                                                        ..onTap = () async {
                                                                          if (await canLaunchUrl(Uri.parse("https://wij.land/"))) {
                                                                            launch("https://wij.land/");
                                                                          } else {
                                                                            throw 'Could not launch https://wij.land/';
                                                                          }
                                                                        }),
                                                                  TextSpan(
                                                                    text: " public webpage. Would you like to proceed?".tr(),
                                                                    style: GoogleFonts.montserrat(
                                                                      fontSize: Responsive.isMobile(context) ? 10 : 12,
                                                                      color: HexColor("#000000"),
                                                                      fontWeight: FontWeight.w400,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          backgroundColor: Colors.white,
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(4),
                                                          ),
                                                          actions: [
                                                            SizedBox(
                                                              width: 86,
                                                              height: 35,
                                                              child: CommonElevatedButton(
                                                                mOnTap: () {
                                                                  Navigator.pop(context);
                                                                },
                                                                mButtonText: "No".tr(),
                                                                mButtonColor: HexColor('#F5F5F9'),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 86,
                                                              height: 35,
                                                              child: CommonElevatedButton(
                                                                mOnTap: () {
                                                                  Navigator.pop(context);
                                                                  provider.updateSettingsData(
                                                                      isPublic: provider.privacySettingsResponseModel.isPublic! ? false : true);
                                                                },
                                                                mButtonText: "Yes".tr(),
                                                                mButtonColor: HexColor('#F5EC62'),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 25,
                                                    width: 25,
                                                    decoration: BoxDecoration(
                                                      color: provider.privacySettingsResponseModel.isPublic == null
                                                          ? HexColor('#C4C4C4')
                                                          : provider.privacySettingsResponseModel.isPublic!
                                                              ? HexColor("#48883E")
                                                              : HexColor('#C4C4C4'),
                                                    ),
                                                    child: provider.privacySettingsResponseModel.isPublic == null ||
                                                            provider.privacySettingsResponseModel.isPublic! == false
                                                        ? SizedBox()
                                                        : Center(
                                                            child: Icon(
                                                              Icons.check,
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                  ),
                                                ),
                                                SizedBox(width: 30),
                                                Expanded(
                                                  child: Text(
                                                    "I want my location be visible on the public facing map".tr(),
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: GoogleFonts.montserrat(
                                                      fontSize: Responsive.isMobile(context) ? 10 : 14,
                                                      color: HexColor("#000000"),
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: provider.privacySettingsResponseModel.latitude == null
                                        ? Container(
                                            height:Responsive.isTablet(context)?getHeight(context)*0.45: getHeight(context) * 0.4,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(12),
                                              child: Image.asset(
                                                "assets/images/map.png",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height:Responsive.isTablet(context)?getHeight(context)*0.45: getHeight(context) * 0.4,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: _MapWidget(
                                              lat:provider.privacySettingsResponseModel.latitude.toString().isNotEmpty? provider
                                                .privacySettingsResponseModel
                                              .latitude??52.413960:52.413960,
                                              lng:provider.privacySettingsResponseModel.longitude.toString().isNotEmpty?provider
                                              .privacySettingsResponseModel
                                                .longitude??4.972374:4.972374,
                                            ),
                                          ),
                                  ),
                                ],
                              )
                            : Container(
                                height:Responsive.isTablet(context)?getHeight(context)*0.45: getHeight(context) * 0.4,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 16, left: 23, bottom: 23),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Public Map".tr(),
                                        style: GoogleFonts.montserrat(
                                          fontSize: Responsive.isMobile(context) ? 14 : 16,
                                          color: HexColor("#48883E"),
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Status: ".tr(),
                                              style: GoogleFonts.montserrat(
                                                fontSize: Responsive.isMobile(context) ? 10 : 12,
                                                color: HexColor("#000000"),
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            TextSpan(
                                              text: provider.privacySettingsResponseModel.isPublic == null
                                                  ? "You are NOT visible on the wij.land public map".tr()
                                                  : provider.privacySettingsResponseModel.isPublic!
                                                      ? "You are visible on the wij.land public map".tr()
                                                      : "You are NOT visible on the wij.land public map".tr(),
                                              style: GoogleFonts.montserrat(
                                                fontSize: Responsive.isMobile(context) ? 10 : 12,
                                                color: HexColor("#000000"),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Date updated: ".tr(),
                                              style: GoogleFonts.montserrat(
                                                fontSize: Responsive.isMobile(context) ? 10 : 12,
                                                color: HexColor("#000000"),
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            TextSpan(
                                              text: provider.privacySettingsResponseModel.dateMapUpdated ?? "",
                                              style: GoogleFonts.montserrat(
                                                fontSize: Responsive.isMobile(context) ? 10 : 12,
                                                color: HexColor("#000000"),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(text: "    "),
                                            TextSpan(
                                              text: "Updated by: ".tr(),
                                              style: GoogleFonts.montserrat(
                                                fontSize: Responsive.isMobile(context) ? 10 : 12,
                                                color: HexColor("#000000"),
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            TextSpan(
                                              text: provider.privacySettingsResponseModel.updatedBy ?? "",
                                              style: GoogleFonts.montserrat(
                                                fontSize: Responsive.isMobile(context) ? 10 : 12,
                                                color: HexColor("#000000"),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Do you want your location to be visible on the wij.land public map?".tr(),
                                        style: GoogleFonts.montserrat(
                                          fontSize: Responsive.isMobile(context) ? 10 : 14,
                                          color: HexColor("#000000"),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Public Map Consent",
                                                          style: GoogleFonts.montserrat(
                                                            fontSize: Responsive.isMobile(context) ? 10 : 15,
                                                            color: HexColor("#892913"),
                                                            fontWeight: FontWeight.w800,
                                                          ),
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              Navigator.pop(context);
                                                            },
                                                            child: Icon(Icons.close))
                                                      ],
                                                    ),
                                                    content: SizedBox(
                                                      width: 257,
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: provider.privacySettingsResponseModel.isPublic == true
                                                                  ? "You are indicating that you no longer want your farm to be visible on the ".tr()
                                                                  : "You are indicating that you would like your farm to be visible on the ".tr(),
                                                              style: GoogleFonts.montserrat(
                                                                fontSize: Responsive.isMobile(context) ? 10 : 12,
                                                                color: HexColor("#000000"),
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                                text: "wij.land".tr(),
                                                                style: GoogleFonts.montserrat(
                                                                  fontSize: Responsive.isMobile(context) ? 10 : 12,
                                                                  color: HexColor("#0000FF"),
                                                                  decoration: TextDecoration.underline,
                                                                  fontWeight: FontWeight.w400,
                                                                ),
                                                                recognizer: TapGestureRecognizer()
                                                                  ..onTap = () async {
                                                                    if (await canLaunchUrl(Uri.parse("https://wij.land/"))) {
                                                                      launch("https://wij.land/");
                                                                    } else {
                                                                      throw 'Could not launch https://wij.land/';
                                                                    }
                                                                  }),
                                                            TextSpan(
                                                              text: " public webpage. Would you like to proceed?".tr(),
                                                              style: GoogleFonts.montserrat(
                                                                fontSize: Responsive.isMobile(context) ? 10 : 12,
                                                                color: HexColor("#000000"),
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    backgroundColor: Colors.white,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(4),
                                                    ),
                                                    actions: [
                                                      SizedBox(
                                                        width: 86,
                                                        height: 35,
                                                        child: CommonElevatedButton(
                                                          mOnTap: () {
                                                            Navigator.pop(context);
                                                          },
                                                          mButtonText: "No".tr(),
                                                          mButtonColor: HexColor('#F5F5F9'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 86,
                                                        height: 35,
                                                        child: CommonElevatedButton(
                                                          mOnTap: () {
                                                            Navigator.pop(context);
                                                            provider.updateSettingsData(
                                                                isPublic: provider.privacySettingsResponseModel.isPublic! ? false : true);
                                                          },
                                                          mButtonText: "Yes".tr(),
                                                          mButtonColor: HexColor('#F5EC62'),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                color: provider.privacySettingsResponseModel.isPublic == null
                                                    ? HexColor('#C4C4C4')
                                                    : provider.privacySettingsResponseModel.isPublic!
                                                        ? HexColor("#48883E")
                                                        : HexColor('#C4C4C4'),
                                              ),
                                              child: provider.privacySettingsResponseModel.isPublic == null ||
                                                      provider.privacySettingsResponseModel.isPublic! == false
                                                  ? SizedBox()
                                                  : Center(
                                                      child: Icon(
                                                        Icons.check,
                                                        color: Colors.white,
                                                        size: 18,
                                                      ),
                                                    ),
                                            ),
                                          ),
                                          SizedBox(width: 30),
                                          SizedBox(
                                            width: getWidth(context) * 0.5,
                                            child: Text(
                                              "I want my location be visible on the public facing map".tr(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                fontSize: Responsive.isMobile(context) ? 10 : 12,
                                                color: HexColor("#000000"),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        SizedBox(height: 19),
                        Responsive.isMobile(context)
                            ? provider.privacySettingsResponseModel.latitude == null
                                ? Container(
                                    height: getHeight(context) * 0.35,
                                    width: getWidth(context),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        "assets/images/map.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : Container(
                                    height:getHeight(context) * 0.35,
                                    width: getWidth(context),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: _MapWidget(
                                      lat: provider.privacySettingsResponseModel.latitude!,
                                      lng: provider.privacySettingsResponseModel.longitude!,
                                    ),
                                  )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }

  Widget _MapWidget({required double lat, required double lng}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          center: latLng.LatLng(lat, lng),
          zoom: 9.2,
          boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(100.0)),
          interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://api.mapbox.com/styles/v1/mapbox/satellite-v9/tiles/"
                "{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw",
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: latLng.LatLng(
                  lat,
                  lng,
                ),
                height: 80,
                width: 80,
                builder: (context) {
                  return Icon(
                    Icons.location_on_rounded,
                    color: Colors.red,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
