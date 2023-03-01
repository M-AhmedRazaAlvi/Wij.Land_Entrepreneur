


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/text_widget.dart';
import '../../../../utils/styles.dart';
import '../../../office/widgets/add_text_button_widget.dart';

class AddTicketWidget extends StatefulWidget {
  const AddTicketWidget({Key? key}) : super(key: key);

  @override
  State<AddTicketWidget> createState() => _AddTicketWidgetState();
}

class _AddTicketWidgetState extends State<AddTicketWidget> {

  String textValue='no file choosen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [

          SizedBox(
            height: 8,
          ),
          Card(
            shape:RoundedRectangleBorder(
                side: BorderSide(color:ivoryBlack, width:0.3),
                borderRadius: BorderRadius.circular(4.0)),
            margin: EdgeInsets.all(14),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomText(
                    text: "Ticket".tr(),
                    size: 26,
                    weight: FontWeight.w600,
                    color: ivoryBlack,
                  ),
                  SizedBox(
                    height: 16
                  ),
                  CustomText(
                    text: "Title".tr(),
                    size: 14,
                    weight: FontWeight.w400,
                    color: ivoryBlack,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextWidgetField(),
                  SizedBox(
                    height: 12,
                  ),
                  CustomText(
                    text: "description".tr(),
                    size: 14,
                    color: ivoryBlack,
                    weight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextWidgetField(),
                  SizedBox(
                    height: 12,
                  ),
                  CustomText(
                    text: "url".tr(),
                    size: 14,
                    color: ivoryBlack,
                    weight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextWidgetField(),

                  SizedBox(
                    height: 12,
                  ),
                  CustomText(
                    text: "Steps to Reproduce".tr(),
                    size: 14,
                    weight: FontWeight.w400,
                    color: ivoryBlack,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextWidgetField(textPadding: EdgeInsets.symmetric(vertical: 70),),
                  SizedBox(
                    height: 12,
                  ),
                  CustomText(
                    text: "User Agent".tr(),
                    size: 14,
                    weight: FontWeight.w400,
                    color: ivoryBlack,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextWidgetField(enabled: false,),
                  SizedBox(
                    height: 12,
                  ),
                  CustomText(
                    text: "Screen Shots".tr(),
                    size: 14,
                    color: ivoryBlack,
                    weight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      boxShadow: const [BoxShadow(color: Colors.black26,spreadRadius: 0.5)]
                    ),
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Color(0xff768192),elevation: 0),
                            onPressed: (){}, child: Text('Choose File'.tr(),style: TextStyle(color: Colors.white),)),
                        SizedBox(
                          width: 12,
                        ),
                        CustomText(text: textValue,),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AddTextButtonWidget(
                              text: "Cancel".tr(),
                              colors: dimMetalic3,
                              onPress: () {
                                Navigator.of(context).pop();

                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            AddTextButtonWidget(
                              text: "Add Ticket".tr(),
                              colors: Colors.yellow,
                              onPress: () {

                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
