import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';

import '../utils/responsive.dart';
import '../utils/styles.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key,
    List<Widget> navOptions) {
  return AppBar(
    leading: (Responsive.isDesktop(context))
        ? Center(
            child: Image.asset(
              "assets/icons/logo_big.png",
              scale: !Responsive.isDesktop(context) ? 5 : 1,
            ),
          )
        : IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              key.currentState!.openDrawer();
            },
          ),
    leadingWidth: (Responsive.isDesktop(context))
        ? (!Responsive.isDesktop(context) ? 150 : 200)
        : 50,
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Row(
      children: [
        Expanded(
          child: Container(),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.settings,
            color: dark.withOpacity(0.7),
          ),
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: dark.withOpacity(0.7),
              ),
            ),
            Positioned(
              top: 7,
              right: 7,
              child: Container(
                width: 12,
                height: 12,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: active,
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                  border: Border.all(color: light, width: 2),
                ),
              ),
            ),
          ],
        ),
        Container(
          color: lightGrey,
          height: 22,
          width: 1,
        ),
        const SizedBox(width: 24),
        CustomText(
            text: "Ali Adam".tr(),
            size: 20,
            color: lightGrey,
            weight: FontWeight.bold),
        const SizedBox(
          width: 16,
        ),
        //  SizedBox(
        //       width: ResponsiveWidget.isSmallScreen(context) ? 80 : 120,
        //       child: DropdownButtonHideUnderline(
        //         child: DropdownButton<Widget>(
        //           hint: const Text("Status"),
        //           value: authController.myUser.value.name ?? "No Name",
        //           isDense: true,
        //           onChanged: (String? newValue) {
        //             // setState(() {
        //             //   status = newValue ?? "To do";
        //             // });
        //             //  debugprintstatus);
        //           },
        //           items: navOptions.map((Widget map) {
        //             return DropdownMenuItem<String>(
        //               value: map,
        //               child: Text(map,
        //                   style: TextStyle(
        //                       color: Colors.black,
        //                       fontSize: ResponsiveWidget.isSmallScreen(context)
        //                           ? 10
        //                           : 16)),
        //             );
        //           }).toList(),
        //         ),
        //       ),
        //     ),
      ],
    ),
    iconTheme: IconThemeData(color: dark),
  );
}
