import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_card.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_bottom_widget.dart';
import 'package:wij_land/screens/farm_networks/farms/widgets/dialog_comments.dart';
import 'package:wij_land/screens/farm_networks/farms/widgets/dialog_farms_add.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/controller.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../contacts/widgets/popup_menu_button.dart';
import '../../office/widgets/search_widget.dart';

class FarmProfileScreens extends StatelessWidget {
  const FarmProfileScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool onClickList = true;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          width: getWidth(context),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Obx(() => SizedBox(
                    child: CustomText(
                      text: menuController.activeItemRoute.value,
                      size: 14,
                    ),
                  )),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  ClickIconButton(
                    clickcolors: Colors.white,
                    icon: Icons.comment_rounded,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CommentDialog();
                        },
                      );
                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  ClickIconButton(
                    clickcolors: Colors.white,
                    icon: Icons.edit,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return FarmsAddDialogBox(
                              profileText: "Edit Farm",
                              submitText: "Update");
                        },
                      );
                    },
                  ),
                  PopUpMenuButtonWidget( mOnDeleteTap: () {},)
                ],
              ),
              SizedBox(
                height: 40,
              ),
              FarmProfileCardWidget(),
              SizedBox(
                height: 20,
              ),
              FarmBottomWidgets(),
            ],
          ),
        ),
      ),
    );
  }
}
