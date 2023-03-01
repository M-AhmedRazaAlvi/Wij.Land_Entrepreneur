// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:wij_land/app_common_widgets/common_elevated_button.dart';
import 'package:wij_land/app_common_widgets/common_text_form_field_widget.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/main.dart';
import 'package:wij_land/non_admin/app_common_widgets/large_screen.dart';
import 'package:wij_land/app_common_widgets/small_screen.dart';

import '../../app_common_widgets/real_dropdown_widget.dart';
import '../../app_common_widgets/text_widget.dart';
import '../../models/user/user_model.dart';
import '../../screens/auth/authentication_page.dart';
import '../../utils/controller.dart';
import '../../utils/functions.dart';
import '../../utils/hex_color.dart';
import '../../utils/responsive.dart';
import '../../utils/styles.dart';
import '../api_clients/farm_computer_project_clients.dart';
import '../app_common_widgets/side_menu.dart';
import '../app_common_widgets/small_sceen.dart';

class SiteFarmerLayout extends StatefulWidget {
  const SiteFarmerLayout({Key? key}) : super(key: key);

  @override
  State<SiteFarmerLayout> createState() => _SiteFarmerLayoutState();
}

class _SiteFarmerLayoutState extends State<SiteFarmerLayout> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey(debugLabel: 'site_farm_layout');
  final GlobalKey<NavigatorState> navKeyGlobal = GlobalKey<NavigatorState>(debugLabel: 'globally');

  late List<String> navOptions;
  late String navOption;
  List<String> languages = ["English", "Dutch"];
  String language = "English";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // authController.loginViaToken();

    currentUser();
  }

  currentUser() async {
    print('user login click');
    MyUser response = await authController.loginViaToken();
    print('response is  ${response.token}');
    if (response.id != null) {
      setState(() {
        isLoading = false;
        authController.myUser.value = response;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  TextEditingController mController = TextEditingController();
  HtmlEditorController mEditController = HtmlEditorController();
  String? mEditText;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (routeStateofWijLand != 1) {
          navigationController.goBack();
        }
        return false;
      },
      child: Scaffold(
        key: scaffoldKey,
        extendBodyBehindAppBar: true,
        floatingActionButton: Transform.rotate(
          angle: 45,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12.0, right: 30),
            child: FloatingActionButton(
              tooltip: "Feedback".tr(),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              backgroundColor: darkGreen,
              onPressed: () {
                showFeedBackDialog(context);
              },
              child: Transform.rotate(
                angle: -45,
                child: Icon(
                  Icons.chat_bubble,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        drawer: Responsive.isMobile(context)
            ? SizedBox(
                child: SideFarmerMenu(
                  isexpand: true,
                ),
                width: 220)
            : null,
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Navigator(
                key: navKeyGlobal,
                onGenerateRoute: (_) => MaterialPageRoute(
                  builder: (_) => Responsive(
                    desktop: LargeFarmerScreen(),
                    mobile: SmallFarmerScreen(scaffoldKey: scaffoldKey),
                    tablet: LargeFarmerScreen(),
                  ),
                ),
              ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      backgroundColor: secondary,
      leading: !(Responsive.isTablet(context))
          ? Center(
              child: Image.asset(
                "assets/icons/logo_big.png",
                scale: !(Responsive.isMobile(context)) ? (Responsive.isTablet(context) ? 5 : 1) : 10,
              ),
            )
          : IconButton(
              icon: Icon(
                Icons.menu,
                color: lightGrey,
              ),
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
            ),
      leadingWidth: (Responsive.isMobile(context)) ? (!Responsive.isTablet(context) ? 200 : 250) : 50,
      actions: [
        if (!Responsive.isMobile(context))
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: lightGrey, width: 1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: DropdownButton(
                  style: TextStyle(
                    color: lightGrey,
                    fontFamily: Montserrat_Medium,
                  ),
                  value: language,
                  underline: const SizedBox(),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: languages.map((String items) {
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
                      language = newValue as String;
                    });
                  },
                ),
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 250,
            decoration: BoxDecoration(
              border: Border.all(color: lightGrey, width: 1),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search".tr(),
                  focusColor: Colors.transparent,
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                  hintStyle: TextStyle(
                    color: lightGrey,
                    fontFamily: Montserrat_Medium,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: lightGrey,
                  ),
                  contentPadding: const EdgeInsets.all(12)),
            ),
          ),
        ),
        if (!Responsive.isMobile(context))
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.notifications,
              color: lightGrey,
            ),
          ),
        if (!Responsive.isMobile(context))
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: lightGrey,
              )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: lightGrey, width: 1),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DropdownButton(
                style: TextStyle(
                  color: lightGrey,
                  fontFamily: Montserrat_Medium,
                ),
                value: navOption,
                underline: const SizedBox(),
                icon: const Icon(Icons.keyboard_arrow_down),
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
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  // FarmComputerProjectClients clients= FarmComputerProjectClients();

  bool isLoad = false;

  showFeedBackDialog(BuildContext context) {
    mController.text = authController.myUser.value.personInfo!.name!;
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Feedback".tr(),
                style: TextStyle(
                  fontSize: Responsive.isMobile(context) ? 16 : 26,
                  color: HexColor('#231F20'),
                  fontWeight: FontWeight.bold,
                  fontFamily: Montserrat_Medium,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(dialogContext);
                },
                icon: Icon(
                  Icons.close,
                  size: 15,
                ),
              )
            ],
          ),
          content: isLoad
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: "Farmer Name".tr()),
                        SizedBox(
                          height: 12,
                        ),
                        TextWidgetField(
                          controller: mController,
                          enabled: false,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        CustomText(text: "Feedback Message".tr()),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.white12,
                          )),
                          // height: 280,
                          width: getWidth(context) * 0.45,
                          child: HtmlEditor(
                            controller: mEditController,
                            callbacks: Callbacks(
                              onChangeContent: (str) {
                                print('content $str');
                              },
                              onChangeCodeview: (str) {},
                            ),
                            htmlEditorOptions: HtmlEditorOptions(
                              hint: "Your text here...".tr(),
                              initialText: mEditText,
                              autoAdjustHeight: true,
                            ),
                            otherOptions: OtherOptions(
                              height: 220,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            htmlToolbarOptions: HtmlToolbarOptions(
                              buttonBorderWidth: 1,
                              dropdownIconSize: 18,
                              toolbarItemHeight: 30,
                              buttonBorderColor: Colors.red,
                              dropdownBoxDecoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.white12,
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(19),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, right: 12),
              child: Row(
                children: [
                  SizedBox(
                    child: CommonElevatedButton(
                      mOnTap: () {
                        Navigator.pop(dialogContext);
                      },
                      mButtonText: 'Cancel'.tr(),
                      mButtonColor: HexColor('#EBEDF4'),
                    ),
                    width: 120,
                  ),
                  SizedBox(width: 15),
                  SizedBox(
                    child: CommonElevatedButton(
                      mOnTap: () async {
                        isLoad = true;
                        setState(() {});
                        Map map = {
                          "person_name": mController.text,
                          "feedback_message": await mEditController.getText(),
                        };

                        var response = await FarmComputerProjectClients().postFeedback(map);
                        Navigator.pop(dialogContext);

                        if (response != 200) {
                          showSnack("Un-Verified farmer".tr());
                          isLoad = false;
                        } else {
                          showSnack("Farmer feedback added successfully".tr());
                          isLoad = false;
                        }
                        setState(() {});
                      },
                      mButtonText: 'Save'.tr(),
                      mButtonColor: HexColor('#F7EC4D'),
                    ),
                    width: 120,
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.end,
              ),
            )
          ],
        );
      },
    );
  }
}
