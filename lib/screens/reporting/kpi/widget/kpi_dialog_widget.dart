import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/text_widget.dart';
import '../../../../utils/styles.dart';
import '../../../office/widgets/add_text_button_widget.dart';


class AddKpiDialogWidget extends StatefulWidget {
  const AddKpiDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddKpiDialogWidget> createState() => _AddKpiDialogWidgetState();
}

class _AddKpiDialogWidgetState extends State<AddKpiDialogWidget> {

  @override
  Widget build(BuildContext context) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: AlertDialog(
                title: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Add Kpi",
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
                              color: iconColors,
                              size: 21,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                content: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "KPI name",color: ivoryBlack,weight: FontWeight.w400,),
                      SizedBox(height: 6,),
                      TextWidgetField(),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(text: "Description",color: ivoryBlack,weight: FontWeight.w400,),
                      SizedBox(height: 6,),
                      TextWidgetField(textPadding: EdgeInsets.symmetric(vertical: 70),),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(text: "KPI unit",color: ivoryBlack,weight: FontWeight.w400,),
                      SizedBox(height: 6,),
                      TextWidgetField(),
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
                          colors:dimMetalic3,
                          onPress: () {
                            Navigator.of(context).pop();

                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        AddTextButtonWidget(
                          text: "Add KPI",
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


