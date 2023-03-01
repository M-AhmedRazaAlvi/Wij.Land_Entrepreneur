import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/screens/office/widgets/add_text_button_widget.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/images.dart';
import 'package:wij_land/utils/styles.dart';

class EventsProjectDialogBox extends StatelessWidget {
  const EventsProjectDialogBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context) * 0.7,
      child: AlertDialog(
        content: Column(
          children: [
            Wrap(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(10))),
                  child: Image(
                    image: AssetImage(Images.eventImage),
                    fit: BoxFit.cover,
                    height: 139,
                    width: 164,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Project Name".tr(),
                        size: 24,
                        color: darkred,
                        weight: FontWeight.w800,
                      ),
                      SizedBox(
                        width: getWidth(context) / 2,
                        child: CustomText(
                          text:
                              "",
                          weight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 35),
            SizedBox(
              width: getWidth(context) * 0.6,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.spaceBetween,
                children:  [
                  CustomText(
                    text: "Project Manager".tr(),
                    weight: FontWeight.w700,
                  ),
                  Image(
                      image: AssetImage(Images.eventfileboy),
                      width: 39,
                      height: 39),
                  CustomText(
                    text: "Person Name".tr(),
                  ),
                  CustomText(
                    text: "project.manager@email.com".tr(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            SizedBox(
              height: 20,
            ),
            Wrap(
              spacing: 30,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Project Interest".tr(),
                      size: 24,
                      color: darkred,
                      weight: FontWeight.w800,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: getWidth(context) * 0.7,
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          CustomText(
                              text:
                                  "Are you interested in participating in this project?".tr()),
                          AddTextButtonWidget(
                            text: "Yes, Im interested".tr(),
                            colors: normalGrey,
                            onPress: () {},
                          ),
                          AddTextButtonWidget(
                            text: "No, Im not interested".tr(),
                            colors: normalGrey,
                            onPress: () {},
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 45,
            ),
          ],
        ),
      ),
    );
  }
}
