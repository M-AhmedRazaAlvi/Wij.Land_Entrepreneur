import 'package:flutter/material.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../app_common_widgets/text_widget.dart';
import '../../../../../utils/functions.dart';
import '../../../../../utils/responsive.dart';
import '../../../../../utils/styles.dart';
import '../../../../office/widgets/add_text_button_widget.dart';

class EditGuestDialogWidget extends StatefulWidget {
  const EditGuestDialogWidget({Key? key}) : super(key: key);

  @override
  State<EditGuestDialogWidget> createState() => _EditGuestDialogWidgetState();
}

class _EditGuestDialogWidgetState extends State<EditGuestDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: getHeight(context) / 2,
      child: SingleChildScrollView(
        child: AlertDialog(
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Edit Internal Guest",
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
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: getHeight(context) / 4,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: CustomText(
                      text: "First Name",
                      size: 14,
                      weight: FontWeight.w400,
                      color: ivoryBlack,
                    )),
                    SizedBox(
                      width: !Responsive.isDesktop(context)
                          ? 6
                          : !Responsive.isDesktop(context)
                              ? 4
                              : 12,
                    ),
                    Expanded(
                        child: CustomText(
                      text: "Last Name",
                      color: ivoryBlack,
                      weight: FontWeight.w400,
                    )),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(child: TextWidgetField()),
                    SizedBox(
                      width: !Responsive.isDesktop(context)
                          ? 6
                          : !Responsive.isDesktop(context)
                              ? 4
                              : 12,
                    ),
                    Expanded(child: TextWidgetField()),
                  ],
                ),
                SizedBox(height: 20),
                CustomText(
                  text: "Email",
                  weight: FontWeight.w400,
                  color: ivoryBlack,
                ),
                SizedBox(height: 6),
                TextWidgetField(),
                SizedBox(height: 20),
                Flexible(
                    child: Center(
                        child: CustomText(
                  text:
                      'You are editing the contact, this will update the person profile',
                  size: 16,
                  color: greyBlue,
                  weight: FontWeight.w300,
                ))),
                SizedBox(height: 20),
              ],
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AddTextButtonWidget(
                    text: "Cancel",
                    colors: dimMetalic3,
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  AddTextButtonWidget(
                    text: "Update",
                    colors: Colors.yellow,
                    onPress: () {},
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
