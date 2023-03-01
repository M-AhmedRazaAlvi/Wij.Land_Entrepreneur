import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/screens/auth/widgets/email_send_widget.dart';
import 'package:wij_land/screens/auth/widgets/title_text_widget.dart';
import 'package:wij_land/utils/hex_color.dart';
import 'package:wij_land/utils/styles.dart';

class ResetPasswordWidget extends StatefulWidget {
  final String mTitle;
  final String? mSubTitle;
  final String? mButtonText;
  final TextEditingController? passwordController;
  final TextEditingController? reEnterPasswordController;

  const ResetPasswordWidget({
    Key? key,
    required this.mTitle,
    this.mSubTitle,
    this.mButtonText,
    this.passwordController,
    this.reEnterPasswordController,
  }) : super(key: key);

  @override
  State<ResetPasswordWidget> createState() => _ResetPasswordWidgetState();
}

class _ResetPasswordWidgetState extends State<ResetPasswordWidget> {
  @override
  Widget build(BuildContext context) {
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
                  widget.mTitle,
                  style: TextStyle(color: HexColor("#000000"), fontSize: 20, fontWeight: FontWeight.w700,fontFamily: Montserrat_Medium),
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
              widget.mSubTitle!,
              textAlign: TextAlign.left,
              style: TextStyle(color: HexColor("#000000"), fontSize: 16, fontWeight: FontWeight.w400,fontFamily: Montserrat_Medium),
            ),
            SizedBox(height: 9),
            TextFormField(
              controller: widget.passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 5),

            ///
            //////          Text for password do not match
            Visibility(
              child: CustomText(text: "The password do not match!".tr(), color: HexColor("#FF0000"), weight: FontWeight.w600),
            ),
            SizedBox(height: 30),
            TextFormField(
              controller: widget.reEnterPasswordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 5),

            ///
            //////       Text for password do not match

            Visibility(
              child: CustomText(text: "The password do not match!".tr(), color: HexColor("#FF0000"), weight: FontWeight.w600),
            ),
            SizedBox(height: 25),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: 47,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return Dialog(
                          child:
                          TitleTextWidget(
                            mTitle: "Success!".tr(),
                            mSubTitle: "Your Password has been updated!".tr(),
                          ),
                        );
                      },
                    );
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
