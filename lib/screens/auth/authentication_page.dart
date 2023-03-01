import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wij_land/routes/routes.dart';
import 'package:wij_land/screens/auth/widgets/forgot_password_dialog_widget.dart';
import 'package:wij_land/utils/images.dart';

import '../../app_common_widgets/common_text_form_field_widget.dart';
import '../../app_common_widgets/custom_text.dart';
import '../../app_common_widgets/on_hover.dart';
import '../../main.dart';
import '../../non_admin/routes/routes.dart';
import '../../providers/GlobalProvider/auth/auth_provider.dart';
import '../../utils/constants.dart';
import '../../utils/controller.dart';
import '../../utils/functions.dart';
import '../../utils/hex_color.dart';
import '../../utils/styles.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final TextEditingController mEmailController = TextEditingController();
  final TextEditingController mPasswordController = TextEditingController();
  final TextEditingController mForgetEmailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkRemember();
  }

  checkRemember() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool rem = prefs.getBool(REMEMBER) ?? false;
    if (rem) {
      String emailStr = prefs.getString(EMAIL) ?? "";
      String passStr = prefs.getString(PASSWORD) ?? "";
      setState(() {
        mEmailController.text = emailStr;
        mPasswordController.text = passStr;
        mRememberMe = rem;
      });
    }
  }

  bool mRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(Images.backgroundImage), fit: BoxFit.cover),
            ),
            padding: const EdgeInsets.all(24),
          ),
          Center(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  25,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        25,
                      ),
                    ),
                  ),
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 500,
                      width: 420,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Image.asset(
                                  LOGO,
                                  scale: 3,
                                ),
                              ),
                              Expanded(child: Container()),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Login".tr(),
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: Montserrat_Medium),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CustomText(
                              text: "Welcome back to the admin panel.".tr(),
                              color: secondary,
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          CommonTextFormFieldWidget(
                            mTextEditingController: mEmailController,
                            mKeyboardType: TextInputType.emailAddress,
                            mLabelText: "Email".tr(),
                            mHintText: "abc@domain.com".tr(),
                            mIsEnabled: true,
                            isObscureText: false,
                          ),
                          const SizedBox(height: 15),
                          CommonTextFormFieldWidget(
                            mTextEditingController: mPasswordController,
                            mKeyboardType: TextInputType.emailAddress,
                            mLabelText: "Password".tr(),
                            mHintText: "123".tr(),
                            mIsEnabled: true,
                            isObscureText: true,
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: mRememberMe,
                                    activeColor: HexColor("#F7EC4D"),
                                    checkColor: Colors.black,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          mRememberMe = value ?? false;
                                        },
                                      );
                                    },
                                  ),
                                  CustomText(
                                    text: "Remember Me".tr(),
                                    color: secondary,
                                    size: 14,
                                    weight: FontWeight.normal,
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  mForgetEmailController.clear();
                                  var forgotProvider = Provider.of<ForGotProvider>(context, listen: false);
                                  setState(() {
                                    forgotProvider.emailNotFound = false;
                                  });
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return Dialog(
                                        child: ForgotPasswordDialogWidget(
                                          mTitle: "Forgot password".tr(),
                                          mSubTitle: "Enter your email and we’ll send the instructions".tr(),
                                          mButtonText: "Send Reset Instructions".tr(),
                                          emailController: mForgetEmailController,
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: CustomText(
                                  text: "Forgot password?".tr(),
                                  color: secondary,
                                  size: 12,
                                  weight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            height: 55,
                            width: double.infinity,
                            child: OnHover(
                              builder: (hover) {
                                return ElevatedButton(
                                  onPressed: () async {
                                    if (mEmailController.text.isEmpty) {
                                      return;
                                    }
                                    if (mPasswordController.text.isEmpty) {
                                      return;
                                    }
                                    // Get.offAllNamed(rootRoute);
                                    print("comin here");
                                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Logging in")));
                                    showSnack("Logging you in");
                                    //  showSnack("Logging you in".tr());

                                    bool? loggedIn = await authController.login(mEmailController.text, mPasswordController.text, mRememberMe);

                                    // Obtain shared preferences.
                                    final prefs = await SharedPreferences.getInstance();
                                    if (loggedIn == null) {
                                      showSnack("Invalid Credentials".tr());
                                    } else {
                                      print('Logged In Status = ${loggedIn}');
                                      if (loggedIn) {
                                        hasAdmin = false;
                                        Get.offAndToNamed(farmerRoute);
                                        await prefs.setBool('admin_login', false);
                                        showSnack("Logged In".tr());
                                      } else {
                                        hasAdmin = true;
                                        Get.offAndToNamed(rootRoute);
                                        await prefs.setBool('admin_login', true);
                                        showSnack("Logged In".tr());
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: hover ? HexColor("#F7EC4D") : HexColor("#F7EC4D").withOpacity(0.8),
                                    elevation: hover ? 2 : 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(hover ? 8 : 5),
                                    ),
                                  ),
                                  child: Text(
                                    "Login".tr(),
                                    style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: Montserrat_Medium),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 15),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Do not have admin credentials? ".tr(),
                                  style: TextStyle(fontSize: 12, fontFamily: Montserrat_Medium),
                                ),
                                TextSpan(
                                  text: "Request Credentials! ".tr(),
                                  style: TextStyle(
                                    color: secondary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Montserrat_Medium,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
