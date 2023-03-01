
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wij_land/screens/settings/users/widgets/delete_user_profile_widget.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/on_hover.dart';
import '../../../../utils/styles.dart';

class UserMoreDialogWidget extends StatefulWidget {
  String name;
   UserMoreDialogWidget({Key? key,this.name=''}) : super(key: key);

  @override
  State<UserMoreDialogWidget> createState() => _UserMoreDialogWidgetState();
}

class _UserMoreDialogWidgetState extends State<UserMoreDialogWidget> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/2,
      child: SingleChildScrollView(
        child: AlertDialog(
          title: Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "More Option".tr(),
                      size: 26,
                      weight: FontWeight.w600,
                      color: ivoryBlack,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                        size: 21,color: iconColors,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.37,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OnHover(
                  builder: (hover) {
                    return SizedBox(
                        height: 35  ,
                        child: TextButton.icon(
                            style: TextButton.styleFrom(primary:hover?lightGreen: iconColors,backgroundColor: Colors.transparent),
                            onPressed: (){}, icon:FaIcon(FontAwesomeIcons.envelope,size: 16,), label: CustomText(text: 'Resend Invitation (via email)'.tr(),size: 14,weight: FontWeight.w300,color: hover?lightGreen:ivoryBlack,)));
                  }
                ),
                OnHover(
                  builder: (hover) {
                    return SizedBox(
                        height: 35,
                        child: TextButton.icon(
                            style: TextButton.styleFrom(primary:hover?lightGreen: iconColors,backgroundColor: Colors.transparent),
                            onPressed: (){}, icon:FaIcon(FontAwesomeIcons.lock,size: 16,), label: CustomText(text: 'Reset Password (via email)'.tr(),
                          size: 14,weight: FontWeight.w300,color: hover?lightGreen:ivoryBlack,)));
                  }
                ),
                OnHover(
                  builder: (hover) {
                    return SizedBox(
                        height: 35,
                        child: TextButton.icon(
                            style: TextButton.styleFrom(primary:hover?lightGreen: iconColors,backgroundColor: Colors.transparent),
                            onPressed: (){
                              showDialog(context: context, builder: (_)=>DeleteUserProfileWidget(name:widget.name));

                            }, icon:FaIcon(FontAwesomeIcons.trash,size: 16,), label: CustomText(text: 'Delete User'.tr(),size: 14,weight: FontWeight
                            .w300,color: hover?lightGreen:ivoryBlack,)));
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}