import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/controller.dart';
import '../utils/styles.dart';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DropdownState();
}

class _DropdownState extends State<DropdownWidget> {
  List<DropdownMenuItem<Widget>> dropDownItems = [];
  late Widget currentItem;
  late List<Widget> items = [];

  _DropdownState();

  @override
  void initState() {
    super.initState();
    items = [
      Text(authController.myUser.value.name ?? "No Name".tr()),
      Text("Profile".tr(), style: TextStyle(fontFamily: Montserrat_Medium),),
      Text("Settings".tr(),style: TextStyle(fontFamily: Montserrat_Medium),),
      Text("Activity Log".tr(),style: TextStyle(fontFamily: Montserrat_Medium),),
      Text("New Ticket".tr(),style: TextStyle(fontFamily: Montserrat_Medium),),
      Text("Logout".tr(),style: TextStyle(fontFamily: Montserrat_Medium),)
    ];

    for (Widget item in items) {
      dropDownItems.add(DropdownMenuItem(
          // value: item,
          child: item));
    }
    currentItem = dropDownItems[0];
  }

  // @override
  // void didUpdateWidget(DropdownWidget oldWidget) {
  //   if (currentItem != widget.currentItem) {
  //     setState(() {
  //       currentItem = widget.currentItem;
  //     });
  //   }
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 10,
            color: Color(0x19000000),
          ),
        ],
      ),
      child: DropdownButton(
        value: currentItem,
        // icon: currentItem,
        items: dropDownItems,
        onTap: () {
          print("clicked");
        },
        onChanged: (newValue) {
          setState(() {
            currentItem = newValue as Widget;
          });
        },
      ),
    );
  }
}
