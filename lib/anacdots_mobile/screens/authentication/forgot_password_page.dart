import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:wij_land/anacdots_mobile/Router/router.dart';
import 'package:wij_land/anacdots_mobile/app_common_widgets/styles.dart';
import 'package:wij_land/anacdots_mobile/screens/authentication/reset_password_page.dart';

import '../../../utils/functions.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController resetEmailController = TextEditingController();
  final resendEmailKey = GlobalKey<FormState>();
  bool onHover = false;
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Form(
          key: resendEmailKey,
          child: Center(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                child: Text(
                  "Enter your Email \nto reset password ",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18),
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
                width: getHeight(context) * 0.3,
                child: TextFormField(
                    //  controller: email,
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                    validator: (value) => value != null && !value.contains("@") ? "Enter your valid Email" : null,
                    onSaved: ((newValue) => email = newValue!)),
              ),
              SizedBox(
                height: 25,
              ),
              MouseRegion(
                onHover: (event) {
                  setState(() {
                    onHover = true;
                  });
                },
                onExit: (event) {
                  setState(() {
                    onHover = false;
                  });
                },
                child: InkWell(
                  onTap: () {
                    //    validate();

                    final reset = resendEmailKey.currentState;
                    if (reset!.validate()) {
                      reset.save();
                      print("Email is $email");
                      Get.rootDelegate.toNamed(Routes.resetPassword);
                    }
                  },
                  child: Container(
                      width: getHeight(context) * 0.3,
                      height: 50,
                      decoration: BoxDecoration(color: onHover ? hoverGreen : darkGreen, borderRadius: BorderRadius.circular(5)),
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
  }

  void validate() {
    final form = resendEmailKey.currentState!;
    if (form.validate()) {
      form.save();
      // setState(() {
      //   isSignendIn = true;
      // });
    } else {
      //  Get.rootDelegate.toNamed(Routes.dashboard);
    }
  }
}
