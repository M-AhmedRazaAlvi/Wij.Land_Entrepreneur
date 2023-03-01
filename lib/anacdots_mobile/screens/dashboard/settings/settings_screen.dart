import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wij_land/anacdots_mobile/app_common_widgets/styles.dart';
import 'package:wij_land/anacdots_mobile/screens/dashboard/settings/widgets/profile_screen_widget.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';

import '../../../../utils/images.dart';
import '../../../Router/router.dart';
import '../main_dashboard.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Settings",
                  size: 24,
                  color: anecBlack,
                  weight: FontWeight.w700,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.times,
                      size: 20,
                    ))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 40, right: 40),
            child: Column(
              children: [
                InkWell(
                  hoverColor: hoverGreen,
                  overlayColor: MaterialStateProperty.all(hoverGreen),
                  onTap: () {
                    // Get.rootDelegate.toNamed(Routes.profile);
                    // Navigator.pushNamed(context, Routes.profile);
                    Navigator.push(context, MaterialPageRoute(builder: (c)=>ProfileScreenWidget()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: darkGreen, width: 1.5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 70,
                            child: SvgPicture.asset(
                              SvgIcons.olnIcon,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: CustomText(
                            text: "Profile",
                            size: 18,
                            lines: 2,
                            weight: FontWeight.w800,
                            color: darkGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
