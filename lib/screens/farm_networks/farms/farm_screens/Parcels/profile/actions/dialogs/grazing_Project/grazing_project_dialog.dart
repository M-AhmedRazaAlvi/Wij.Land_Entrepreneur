// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../routes/routes.dart';
import '../../../../../../../../../utils/controller.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../title_bar_widget.dart';

class GrazingProjectDialogBox extends StatelessWidget {
  const GrazingProjectDialogBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: SingleChildScrollView(
        child: AlertDialog(
          title: TitleBarWiget(titleText: "Grazing Project"),
          content: Container(
            width: !Responsive.isDesktop(context) ? getWidth(context) : getWidth(context) * 0.6,
            height: getHeight(context) * 0.4,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Actions",
                  size: 22,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  width: getWidth(context),
                  child: Wrap(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 15, bottom: 15),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 2,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(
                                    color: Colors.black,
                                  )),
                              padding: EdgeInsets.symmetric(horizontal: !Responsive.isDesktop(context) ? 20 : 25, vertical: 15),
                              textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                          child: CustomText(
                            text: "Grazing Advice",
                            weight: FontWeight.bold,
                            color: Colors.black38,
                            size: !Responsive.isDesktop(context) ? 14 : 20,
                          ),
                          onPressed: () {
                            navigationController.navigateTo(grazingAdviceScreenRoute);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
