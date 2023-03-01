import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wij_land/anacdots_mobile/api_client/base_class.dart';
import 'package:http/http.dart' as http;
import 'package:wij_land/anacdots_mobile/app_common_widgets/styles.dart';
import 'package:wij_land/anacdots_mobile/screens/authentication/widgets/forgot_password_page.dart';
import 'package:wij_land/anacdots_mobile/screens/authentication/widgets/reset_password_page.dart';
import 'package:wij_land/anacdots_mobile/utils/NotificationKeys.dart';
import 'package:wij_land/anacdots_mobile/utils/controller.dart';
import '../../../app_common_widgets/custom_text.dart';
import '../../app_common_widgets/ancadots_toast_widget.dart';
import '../../models/authentication_model/anacdots_user_model.dart';
import 'package:wij_land/anacdots_mobile/providers/auth_provider/auth_provider.dart';
import 'package:wij_land/anacdots_mobile/screens/dashboard/home/home_screen.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:wij_land/anacdots_mobile/app_common_widgets/styles.dart';
import 'package:wij_land/anacdots_mobile/screens/dashboard/home/home_screen.dart';
import 'package:wij_land/utils/functions.dart';
import '../../Router/router.dart';
import '../dashboard/main_dashboard.dart';
import 'widgets/forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    _isPasswordVisible = false;
    moveNext();
    checkRemember();
    super.initState();
  }

  bool remember = false;
  bool onHover = false;
  bool isUserName = false;
  bool isPassword = false;
  bool _isPasswordVisible = false;
  AnacdotsUserModel? userModel;
  checkFieldsAndLogin() async {
    var provider = Provider.of<AuthProvider>(context, listen: false);
    if (emailController.text.isEmpty) {
      setState(() {
        isUserName = true;
        isPassword = false;
      });
    } else if (passwordController.text.isEmpty) {
      setState(() {
        isPassword = true;
        isUserName = false;
      });
    } else {
      setState(() {
        isPassword = false;
        isUserName = false;
        isLoading = true;
      });

      var response = await provider.login(
          emailController.text, passwordController.text, remember);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', emailController.text);
      prefs.setString('password', passwordController.text);
      isLoading = false;
      print("response==================${response}");

      if (provider.isSignendIn == true) {
        isLoading = false;
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainDashboard(),
            ));
        showAnacdotsToast(
            "Logged In Successfully ${provider.myUser.value.data!.passwordSkip}");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ResetPasswordPage(),
            ));
        if (provider.myUser.value.data!.passwordSkip == false) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ResetPasswordPage(),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MainDashboard(),
              ));
        }
      } else {
        setState(() {
          isLoading = false;
        });

        showAnacdotsToast("Invalid Credentials");
        return null;
      }
      isLoading = false;
    }
    // return true;
  }

  checkRemember() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    remember = prefs.getBool(AnacdotsRemember) ?? false;
    if (remember) {
      String emailStr = prefs.getString(AnacdotsEmail) ?? "";
      String passStr = prefs.getString(AnactdotsPassword) ?? "";
      setState(() {
        emailController.text = emailStr;
        passwordController.text = passStr;
      });
      print("Email and password is ${emailStr} ${passStr}");
    } else {
      setState(() {
        prefs.clear();
      });
    }
  }

  //if already login then automatically move to dashboard otherwise on login screen
  moveNext() {
    if (mounted) {
      print('function call');
      if (Provider.of<AuthProvider>(context, listen: false).isSignendIn) {
        isLoading = true;
        Future(() {
          return Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Container(
          height: getHeight(context),
          margin: EdgeInsets.only(left: 50, right: 50),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Welcome to the\nChirp LandScape Network",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              Text("User Name"),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                //      height: 0,
                width: getHeight(context) / 0.4,
                child: TextFormField(
                  maxLines: 1,
                  controller: emailController,
                  cursorColor: APPColor.darkGreen,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: APPColor.darkGreen)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Visibility(
                  visible: isUserName ? true : false,
                  child: Text(
                    "User name cannot be empty",
                    style: TextStyle(color: Colors.red),
                  )),
              SizedBox(
                height: 10,
              ),
              Text("Password"),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                //    height: 50,
                width: getHeight(context) / 0.4,
                child: TextFormField(
                    obscureText: !_isPasswordVisible,
                    controller: passwordController,
                    cursorColor: APPColor.darkGreen,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(_isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          color: APPColor.darkGreen,
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: APPColor.darkGreen)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)))),
              ),
              Visibility(
                  visible: isPassword ? true : false,
                  child: Text(
                    "Password cannot be empty",
                    style: TextStyle(color: Colors.red),
                  )),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: remember,
                            activeColor: darkGreen,
                            checkColor: Colors.white,
                            onChanged: (value) {
                              setState(
                                () {
                                  remember = value ?? false;
                                  print(value);
                                },
                              );
                            },
                          ),
                        ),
                        Text("Remember me",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        print("ontap");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPasswordPage(),
                            ));
                      },
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              !isLoading
                  ? InkWell(
                      onTap: () async {
                        await checkFieldsAndLogin();
                      },
                      // child: MouseRegion(
                      //   onHover: (event) => setState(() {
                      //     onHover = true;
                      //   }),
                      //   onExit: (event) => setState(() {
                      //     onHover = false;
                      //   }),
                      child: Container(
                          width: getHeight(context) / 0.4,
                          height: 50,
                          decoration: BoxDecoration(
                              color: onHover ? hoverGreen : darkGreen,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    )
                  : Center(child: SpinKitCircle(color: darkGreen)),
              //   )
              // })),
            ]),
          ),
        ),
      ),
    );
  }
}
