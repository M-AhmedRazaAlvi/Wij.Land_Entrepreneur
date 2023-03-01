
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../../utils/styles.dart';
import '../../../office/widgets/add_text_button_widget.dart';

class DeleteUserProfileWidget extends StatefulWidget {
  String name;
   DeleteUserProfileWidget({Key? key,this.name=''}) : super(key: key);

  @override
  State<DeleteUserProfileWidget> createState() => _DeleteUserProfileWidgetState();
}

class _DeleteUserProfileWidgetState extends State<DeleteUserProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: AlertDialog(
          title: Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Request Deletion".tr(),
                      size: 26,
                      color: ivoryBlack,
                      weight: FontWeight.w600,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                        size: 21,
                        color: iconColors,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.38,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: 'Deleted Linked profiles, including'.tr(),
                  color: ivoryBlack,
                  size: 16,
                  textAligns: TextAlign.center,
                  weight: FontWeight.w300,
                ),
                const SizedBox(
                  height: 20,
                ),
                RealCheckBoxWidget(
                  value: true,
                  onChanged: (va) {
                  },
                  Labeltext: widget.name,labelSize: 15,labelWeight: FontWeight.w400,labelColor: ivoryBlack,),
              ],
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AddTextButtonWidget(
                    text: "don't delete".tr(),
                    colors: dimMetalic3,
                    onPress: () {
                      Navigator.of(context).pop();

                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  AddTextButtonWidget(
                    text: "Delete".tr(),
                    colors: Colors.yellow,
                    onPress: () {

                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
