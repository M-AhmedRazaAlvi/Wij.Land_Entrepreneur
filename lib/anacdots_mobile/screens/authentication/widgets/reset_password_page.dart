import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/anacdots_mobile/app_common_widgets/ancadots_toast_widget.dart';
import 'package:wij_land/anacdots_mobile/app_common_widgets/styles.dart';
import 'package:wij_land/anacdots_mobile/providers/auth_provider/auth_provider.dart';
import 'package:wij_land/anacdots_mobile/screens/dashboard/anacdot_directory/AddNewAnacdot.dart';
import 'package:wij_land/anacdots_mobile/screens/dashboard/main_dashboard.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../models/authentication_model/reset_password_first_time.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController resetPasswordControllerA = TextEditingController();
  TextEditingController resetPasswordControllerB = TextEditingController();

  bool onHover = false;
  bool _isMatch = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: isLoading
              ? Center(child: SpinKitCircle(color: darkGreen))
              : Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "Welcome to the \nChirp.Landscape.Network",
                            style: TextStyle(
                                //   color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Text(
                            "Change your previous password ",
                            style: TextStyle(
                                //   color: Colors.black,
                                // fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: getHeight(context) * 0.3,
                          child: TextFormField(
                            obscureText: true,
                            controller: resetPasswordControllerA,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          child: Text(
                            "Confirm Password ",
                            style: TextStyle(
                                // color: Colors.black,
                                //  fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: getHeight(context) * 0.3,
                          child: TextFormField(
                            obscureText: true,
                            controller: resetPasswordControllerB,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Visibility(
                            visible: _isMatch ? false : true,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text(
                                "Password dosen't match",
                                style: TextStyle(color: Colors.red),
                              ),
                            )),
                        InkWell(
                          onTap: () async {
                            print(resetPasswordControllerA.value.text);
                            if (resetPasswordControllerA.value.text ==
                                resetPasswordControllerB.value.text) {
                              setState(() {
                                _isMatch = true;
                              });
                              //reset function will work here
                            } else {
                              setState(() {
                                _isMatch = false;
                              });
                            }
                            isLoading = true;
                            print("loadinggg===== ${isLoading}");
                            Map map = {
                              "user_cred": {
                                "password": resetPasswordControllerA.value.text,
                                "password_confirmation":
                                    resetPasswordControllerB.value.text,
                                "user_id":
                                    provider.myUser.value.data!.id.toString(),
                                "password_skip": true
                              }
                            };
                            // UserCred req = UserCred(
                            //     password: resetPasswordControllerA.value.text,
                            //     passwordConfirmation:
                            //         resetPasswordControllerB.value.text,
                            //     passwordSkip: false,
                            //     userId:
                            //         provider.myUser.value.data!.id.toString());
                            // ResetPasswordFirstTime request =
                            //     ResetPasswordFirstTime(userCred: req);
                            await Provider.of<AuthProvider>(context,
                                    listen: false)
                                .resetPasswordFirstTime(map);
                            print(
                                "is skip ${provider.resetPasswordFirstTimeResponse?.data?.passwordSkip}");
                            //  isLoading = false;
                            if (provider.resetPasswordFirstTimeResponse?.data
                                    ?.passwordSkip ==
                                true) {
                              isLoading = false;
                              showAnacdotsToast("Password Change Sucessfully");
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MainDashboard()));
                            }
                            isLoading = false;
                          },
                          child: Container(
                              width: getHeight(context) * 0.3,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: onHover ? hoverGreen : darkGreen,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "Change password",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ),
                      ]),
                ),
        ),
      );
    });
  }
}
