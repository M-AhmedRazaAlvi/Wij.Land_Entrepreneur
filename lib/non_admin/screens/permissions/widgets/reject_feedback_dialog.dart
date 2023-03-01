import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/screens/office/widgets/add_text_button_widget.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/responsive.dart';
import 'package:wij_land/utils/styles.dart';

class RejectFeedbackDialog extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final TextEditingController controller;
  final Function()? mOnTap;
  RejectFeedbackDialog(
      {Key? key, required this.controller, required this.mOnTap})
      : super(key: key);
  final messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30, right: 20, top: 20),
            child: CustomText(
              text: "Reject Request".tr(),
              weight: FontWeight.bold,
              size: 16,
              fontFamily: Montserrat_Bold,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context, false);
            },
            child: Icon(Icons.close, size: 20),
          )
        ],
      ),
      content: SingleChildScrollView(
        child: Container(
            width: Responsive.isMobile(context)
                ? getWidth(context) * 0.8
                : getWidth(context) * 0.4,
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  lines: 4,
                  text:
                      "Please provide us with feedback on why you are rejecting this request."
                          .tr(),
                  size: 12,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: messageController,
                  maxLines: 6,
                  minLines: 6,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: darkyellow),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )
              ],
            )),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20, bottom: 10),
          child: AddTextButtonWidget(
            text: "Submit Feedback".tr(),
            colors: darkyellow,
            onPress: mOnTap,
          ),
        ),
      ],
    );
  }
}
