import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/anacdots_mobile/app_common_widgets/ancadots_toast_widget.dart';
import 'package:wij_land/anacdots_mobile/app_common_widgets/styles.dart';

import '../../../../utils/functions.dart';
import '../../../models/authentication_model/forgot_password_request_model.dart';
import '../../../providers/auth_provider/auth_provider.dart';
import '../../../utils/NotificationKeys.dart';

import '../../../models/forgot_password_request_model.dart';
import '../../../providers/auth_provider/auth_provider.dart';
import '../../../utils/NotificationKeys.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController resetEmailController = TextEditingController();
  final resendEmailKey = GlobalKey<FormState>();
  bool onHover = false;
  String email = '';
  bool isLoading = false;
  ForgotPasswordRequest? forgotPasswordRequest;
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Form(
            key: resendEmailKey,
            child: Container(
              margin: EdgeInsets.only(left: 50, right: 50),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Enter your Email \nto reset password ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text("Email"),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: getHeight(context) * 0.36,
                      height: 55,
                      child: TextFormField(
                          cursorColor: APPColor.darkGreen,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: APPColor.darkGreen)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          validator: (value) =>
                              value != null && !value.contains("@")
                                  ? "Enter your valid Email"
                                  : null,
                          onSaved: ((newValue) => email = newValue!)),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    isLoading
                        ? Center(child: SpinKitCircle(color: darkGreen))
                        : InkWell(
                            onTap: () async {
                              final reset = resendEmailKey.currentState;
                              if (reset!.validate()) {
                                reset.save();
                                setState(() {
                                  isLoading = true;
                                });
                                print("Email is $email");
                              }

                              if (isLoading) {
                                await provider.forgotPassword(email);
                              }
                              setState(() {
                                isLoading = false;
                              });
                              if (provider.forgotPasswordResponse.status ==
                                  200) {
                                showAnacdotsToast(
                                    "Confirmation Email has been sent on your email address, Kindly check your inbox");
                              } else {
                                showAnacdotsToast("Invalid Email");
                              }
                            },
                            child: Center(
                              child: Container(
                                  width: getHeight(context) * 0.26,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: onHover ? hoverGreen : darkGreen,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      "Verify Email",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                            ),
                          ),
                  ]),
            ),
          ),
        ),
      );
    });
  }

  void validate() {
    final form = resendEmailKey.currentState!;
    if (form.validate()) {
      form.save();
    } else {}
  }
}
