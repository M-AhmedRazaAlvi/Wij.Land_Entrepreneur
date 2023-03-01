import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/models/user/forgot_password_response.dart';
import 'package:wij_land/utils/hex_color.dart';

import '../../../anacdots_mobile/app_common_widgets/ancadots_toast_widget.dart';
import '../../../providers/GlobalProvider/auth/auth_provider.dart';
import '../../../utils/styles.dart';

class ForgotPasswordDialogWidget extends StatefulWidget {
  final String mTitle;
  final String? mSubTitle;
  final String? mButtonText;
  final TextEditingController? emailController;

  const ForgotPasswordDialogWidget({
    Key? key,
    required this.mTitle,
    this.mSubTitle,
    this.mButtonText,
    this.emailController,
  }) : super(key: key);

  @override
  State<ForgotPasswordDialogWidget> createState() => _ForgotPasswordDialogWidgetState();
}

class _ForgotPasswordDialogWidgetState extends State<ForgotPasswordDialogWidget> {
  final resendEmailKey = GlobalKey<FormState>();
  String email = '';
  bool isLoading = false;
  ForgotPasswordResponse? forgotPasswordResponse;

  @override
  void initState() {
    initData();

    super.initState();
  }

  initData() async {
    // await Provider.of<ForGotProvider>(context, listen: false).forgotPasswordResponse;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ForGotProvider>(context, listen: false);

    return Container(
      width: 561,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: HexColor("#FFFFFF"),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  provider.emailNotFound ? "Email Not Found" : widget.mTitle,
                  style: TextStyle(
                    color: HexColor("#000000"),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: Montserrat_Medium,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                )
              ],
            ),
            SizedBox(height: 9),
            Text(
              provider.emailNotFound ? "This email is not registered yet. Please try another or the system administrator" : widget.mSubTitle!,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: HexColor("#000000"),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: Montserrat_Medium,
              ),
            ),
            SizedBox(height: 9),
            TextFormField(
              controller: widget.emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 25),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: 47,
                child: ElevatedButton(
                  onPressed: () async {
                    if (widget.emailController!.text.isNotEmpty) {
                      setState(() {
                        isLoading = true;
                      });

                      if (isLoading) {
                        await Provider.of<ForGotProvider>(context, listen: false).ForgotPassword(widget.emailController!.text);
                      }
                      setState(() {
                        isLoading = false;
                      });

                      if (provider.forgotPasswordResponse!.status == 200) {
                        Navigator.of(context).pop();
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return Dialog(
                              child: Container(
                                width: 561,
                                padding: const EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                  color: HexColor("#FFFFFF"),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Email Sent!",
                                            style: TextStyle(
                                              color: HexColor("#000000"),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: Montserrat_Medium,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              widget.emailController!.clear();
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(
                                              Icons.close,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 9),
                                      Text(
                                        "An email has been sent to ${widget.emailController!.text} with further instructions.",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: HexColor("#000000"),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: Montserrat_Medium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        setState(() {
                          provider.emailNotFound = true;
                        });
                        // widget.emailController!.clear();
                        //
                        // Navigator.of(context).pop();
                      }
                    } else {
                      showAnacdotsToast("Please Enter a Email!");
                    }

                    // showDialog(
                    //   context: context,
                    //   barrierDismissible: false,
                    //   builder: (context) {
                    //     return Dialog(
                    //         child: widget.emailController.toString().contains("true")
                    //             ? TitleTextWidget(
                    //                 mTitle: "Email Send!".tr(),
                    //                 mSubTitle: "An email has been sent to [email] with further instructions.".tr(),
                    //               )
                    //             : EmailSendWidget(
                    //                 emailController: widget.emailController,
                    //                 mTitle: "Email Not Found".tr(),
                    //                 mSubTitle: "This email is not registered yet. please try another or the system administrator",
                    //                 mButtonText: "Send Reset Instructions".tr(),
                    //               ));
                    //   },
                    // );
                    ///     OR //////////////////////////////////

                    // showDialog(
                    //   context: context,
                    //   barrierDismissible: false,
                    //   builder: (context) {
                    //     return Dialog(
                    //       child:  TitleTextWidget(
                    //         mTitle: "Email Sent!",
                    //         mSubTitle: "An email has been sent to [email] to reinvite them to the system. Instructions on how to set their email "
                    //             "are included.",
                    //
                    // showDialog(
                    //   context: context,
                    //   barrierDismissible: false,
                    //   builder: (context) {
                    //     return Dialog(
                    //         child: widget.emailController.toString().contains("true")
                    //             ? TitleTextWidget(
                    //                 mTitle: "Email Send!".tr(),
                    //                 mSubTitle: "An email has been sent to [email] with further instructions.".tr(),
                    //               )
                    //             : EmailSendWidget(
                    //                 emailController: widget.emailController,
                    //                 mTitle: "Email Not Found".tr(),
                    //                 mSubTitle: "This email is not registered yet. please try another or the system administrator",
                    //                 mButtonText: "Send Reset Instructions".tr(),
                    //               ));
                    //   },
                    // );
                    // ///     OR //////////////////////////////////
                    //
                    // // showDialog(
                    // //   context: context,
                    // //   barrierDismissible: false,
                    // //   builder: (context) {
                    // //     return Dialog(
                    // //       child:  TitleTextWidget(
                    // //         mTitle: "Email Sent!",
                    // //         mSubTitle: "An email has been sent to [email] to reinvite them to the system. Instructions on how to set their email "
                    // //             "are included.",
                    // //
                    // //       ),
                    // //       /// OR  ////////////////////
                    // //       // TitleTextWidget(
                    // //       //   mTitle: "Email Sent!",
                    // //       //   mSubTitle: "An email has been sent to [email] with instructions to set a new password.",
                    // //       //
                    // //       // ),
                    // //     );
                    // //   },
                    // // );
                    // ///     OR //////////////////////////////////
                    // // showDialog(
                    // //   context: context,
                    // //   barrierDismissible: false,
                    // //   builder: (context) {
                    // //     return Dialog(
                    // //       child: ResetPasswordWidget(
                    // //         mTitle: "Reset Password",
                    // //         mSubTitle: "Please enter your new password",
                    // //         mButtonText: "Reset",
                    // //       ),
                    // //     );
                    // //   },
                    // // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor("#2D2D2D"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.mButtonText!,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: HexColor("#FFFFFF"),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: Montserrat_Medium,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
