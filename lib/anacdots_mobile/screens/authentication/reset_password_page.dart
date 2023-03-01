import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wij_land/anacdots_mobile/app_common_widgets/styles.dart';
import 'package:wij_land/anacdots_mobile/models/authentication_model/reset_password_first_time.dart';
import 'package:wij_land/utils/functions.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController resetEmailControllerA = TextEditingController();
  TextEditingController resetEmailControllerB = TextEditingController();

  bool onHover = false;
  bool _isMatch = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              child: Text(
                "Welcome to the \nChirp.Landscape.Network",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: Text(
                "Enter your new password ",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: getHeight(context) * 0.3,
              child: TextFormField(
                obscureText: true,
                controller: resetEmailControllerA,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: Text(
                "Confirm Password ",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: getHeight(context) * 0.3,
              child: TextFormField(
                obscureText: true,
                controller: resetEmailControllerB,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Visibility(
                visible: _isMatch ? false : true,
                child: Padding(
                  padding: const EdgeInsets.only(),
                  child: Text(
                    "Password dosen't match",
                    style: TextStyle(color: Colors.red),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                print(resetEmailControllerA.value.text);
                if (resetEmailControllerA.value.text ==
                    resetEmailControllerB.value.text) {
                  setState(() {
                    _isMatch = true;
                  });
                } else {
                  setState(() {
                    _isMatch = false;
                  });
                }
              },
              child: Container(
                  width: getHeight(context) * 0.3,
                  height: 50,
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
          ]),
        ),
      ),
    );
  }
}
