import 'package:flutter/material.dart';
import 'package:wij_land/screens/office/wij_lan_team/person_profile/File_Screens/Widgets/check_list_widget.dart';
import 'package:wij_land/screens/office/wij_lan_team/person_profile/File_Screens/Widgets/check_view_widget.dart';
import 'package:wij_land/screens/office/wij_lan_team/person_profile/File_Screens/Widgets/dialog_file_add.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../utils/functions.dart';
import '../../../../../../utils/styles.dart';
import '../../../office_programes/Widgets/addicon_and_dialog.dart';
import '../../../widgets/search_widget.dart';

class ProfileFileScreens extends StatefulWidget {
  const ProfileFileScreens({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  State<ProfileFileScreens> createState() => _ProfileFileScreensState();
}

class _ProfileFileScreensState extends State<ProfileFileScreens> {
  bool checkedView = false, checkedList = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: getWidth(context),
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: widget.text,
                size: 30,
                weight: FontWeight.bold,
                color: darkGreen,
              ),
              AddIconsAndDialogBox(
                  icons: Icons.filter_alt,
                  onIconTap: () {},
                  addText: "File",
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const DialogAddFile();
                        });
                  })
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ClickIconButton(
                clickcolors: checkedView ? Colors.green : Colors.white,
                icon: Icons.view_array,
                onPressed: () {
                  setState(
                    () {
                      checkedView = true;
                      checkedList = false;
                    },
                  );
                },
              ),
              const SizedBox(
                width: 6,
              ),
              ClickIconButton(
                  clickcolors: checkedList ? Colors.green : Colors.white,
                  icon: Icons.list_alt,
                  onPressed: () {
                    setState(() {
                      checkedView = false;
                      checkedList = true;
                    });
                  }),
              //   const PopUpMenuButtonWidget(),
            ],
          ),
          Column(
            children: [
              checkedView ? const CheckedViewWidget() : Container(),
              checkedList ? const CheckedListWidget() : Container(),
            ],
          )
        ],
      ),
    );
  }
}
