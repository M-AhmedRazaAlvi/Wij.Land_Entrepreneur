import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/screens/office/widgets/add_text_button_widget.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/responsive.dart';
import 'package:wij_land/utils/styles.dart';

class RequestToRejoinDialog extends StatelessWidget {
  const RequestToRejoinDialog({Key? key}) : super(key: key);

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
              text: "Request to Rejoin".tr(),
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
      content: SingleChildScrollView(
        child: Container(
          width: Responsive.isMobile(context)
              ? getWidth(context) * 0.8
              : Responsive.isTablet(context)
                  ? getWidth(context) * 0.6
                  : getWidth(context) * 0.4,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                lines: 4,
                text:
                    "You are about to request to rejoin this date sharing agreement.the request will be sent to Wij.land and they will assess if "
                        "you can still join this agreement. Beware that to join this agreement you have to comply with the guidelines explained in "
                        "the information sheet.".tr(),
                size: 10,
              ),
              SizedBox(height: 20),
              CustomText(text: "Do you wish to proceed?".tr()),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AddTextButtonWidget(
                    text: "No, do not Request".tr(),
                    colors: shineGrey,
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                  AddTextButtonWidget(
                    text: "Yes, Request to Rejoin".tr(),
                    colors: darkyellow,
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
