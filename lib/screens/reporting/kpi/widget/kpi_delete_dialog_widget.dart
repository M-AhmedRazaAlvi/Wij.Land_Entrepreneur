import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../utils/styles.dart';
import '../../../office/widgets/add_text_button_widget.dart';


class DeleteKpiDialogWidget extends StatefulWidget {
  const DeleteKpiDialogWidget({Key? key}) : super(key: key);

  @override
  State<DeleteKpiDialogWidget> createState() => _DeleteKpiDialogWidgetState();
}

class _DeleteKpiDialogWidgetState extends State<DeleteKpiDialogWidget> {

  @override
  Widget build(BuildContext context) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: SingleChildScrollView(
              child: AlertDialog(
                title: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Delete",
                            size: 26,
                            color: ivoryBlack,
                            weight: FontWeight.w600,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.close,
                              size: 24,
                              color: iconColors,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                content: Container(
                  width: MediaQuery.of(context).size.width * 0.52,
                  height: 80,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children:  [
                          Icon(
                            Icons.delete_rounded,
                            color: darkBlue,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Flexible(
                            child: CustomText(text: 'Are you sure you would like to delete this?',
                                  color: darkBlue,
                                  size: 20,
                                  textAligns: TextAlign.center,
                                  weight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: [
                  Container(
                    padding: EdgeInsets.only(bottom: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AddTextButtonWidget(
                          text: "No, do not delete",
                          colors: dimMetalic3,
                          onPress: () {
                            Navigator.of(context).pop();

                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        AddTextButtonWidget(
                          text: "Yes, Delete",
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


