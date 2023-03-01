import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/styles.dart';

class RejectRequestDialog extends StatelessWidget {
  const RejectRequestDialog({Key? key}) : super(key: key);

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
              Navigator.of(context).pop();
            },
            child: Icon(Icons.close, size: 20),
          )
        ],
      ),
      content: Container(
        width: getWidth(context) * 0.33,
        padding: EdgeInsets.only(bottom: 40),
        child: CustomText(
          textAligns: TextAlign.center,
          text: "Thank you for your feedback.".tr(),
          size: 12,
        ),
      ),
    );
  }
}
