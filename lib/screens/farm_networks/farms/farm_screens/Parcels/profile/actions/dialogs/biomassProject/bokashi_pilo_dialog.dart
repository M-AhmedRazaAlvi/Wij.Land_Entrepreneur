import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/counter_widget.dart';
import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/text_widget.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../office/widgets/add_text_button_widget.dart';

class BokashiPiloAddDialog extends StatefulWidget {
  const BokashiPiloAddDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<BokashiPiloAddDialog> createState() => _BokashiPiloAddDialogState();
}

class _BokashiPiloAddDialogState extends State<BokashiPiloAddDialog> {
  int countLatitude = 0;
  int countLongitude = 0;
  int countGettext = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
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
                      text: "Bokashi Pile",
                      size: !Responsive.isDesktop(context) ? 20 : 30,
                      weight: FontWeight.bold,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                        size: !Responsive.isDesktop(context) ? 20 : 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          content: Container(
            width: !Responsive.isDesktop(context)
                ? getWidth(context)
                : getWidth(context) * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: "gettext('Tons of Bokashi')%>"),
                CounterWidget(
                  count: countGettext,
                  onAddTap: () {
                    setState(() {
                      countGettext++;
                    });
                  },
                  onCloseTap: () {
                    setState(() {
                      countGettext--;
                    });
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                CustomText(text: "Comment"),
                SizedBox(
                  height: 10,
                ),
                TextWidgetField(),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: getWidth(context),
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: !Responsive.isDesktop(context)
                            ? getWidth(context) * 0.27
                            : getWidth(context) * 0.3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: "Latitude"),
                            CounterWidget(
                              count: countLatitude,
                              onAddTap: () {
                                setState(() {
                                  countLatitude++;
                                });
                              },
                              onCloseTap: () {
                                setState(() {
                                  countLatitude--;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: !Responsive.isDesktop(context)
                            ? getWidth(context) * 0.27
                            : getWidth(context) * 0.3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: "Longitude"),
                            CounterWidget(
                              count: countLongitude,
                              onAddTap: () {
                                setState(() {
                                  countLongitude++;
                                });
                              },
                              onCloseTap: () {
                                setState(() {
                                  countLongitude--;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AddTextButtonWidget(
                    text: "Cancel",
                    colors: Colors.white,
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AddTextButtonWidget(
                    text: "Save",
                    colors: Colors.yellow,
                    onPress: () {
                      Navigator.pop(context);
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
