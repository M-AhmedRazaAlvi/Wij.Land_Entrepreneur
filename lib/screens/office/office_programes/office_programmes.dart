import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wij_land/screens/office/office_programes/Widgets/add_programes_dialog.dart';
import 'package:wij_land/screens/office/office_programes/Widgets/addicon_and_dialog.dart';
import 'package:wij_land/screens/office/office_programes/Widgets/inspiretion_widget.dart';

import '../../../app_common_widgets/custom_text.dart';
import '../../../utils/controller.dart';
import '../../../utils/functions.dart';
import '../../../utils/images.dart';
import '../../../utils/styles.dart';

class OfficeProgrammes extends StatelessWidget {
  const OfficeProgrammes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          color: Colors.grey[100],
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               Obx(() => SizedBox(
                      child: CustomText(
                        text: menuController.activeItemRoute.value,
                        size: 14,
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: getWidth(context),
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      CustomText(
                        text: "Programmes",
                        size: 40,
                        weight: FontWeight.bold,
                        color: third,
                      ),
                      AddIconsAndDialogBox(
                        addText: "Programmes",
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => const AddProgrammesDialog());
                        }, icons: Icons.filter_alt,
                        onIconTap: (){},
                      ),
                    ],
                  ),
                ),
                InspiretionWidget(
                  imgUrl: Images.wallpaper,
                ),
                const SizedBox(
                  height: 20,
                ),
                InspiretionWidget(
                  imgUrl: Images.wallpaper,
                ),
              ]),
        ),
      ),
    );
  }
}
