import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../../../app_common_widgets/text_widget.dart';
import '../../../../../utils/functions.dart';
import '../../../../../utils/responsive.dart';

class ExternalGuestWidget extends StatefulWidget {
  const ExternalGuestWidget({Key? key}) : super(key: key);

  @override
  State<ExternalGuestWidget> createState() => _ExternalGuestWidgetState();
}

class _ExternalGuestWidgetState extends State<ExternalGuestWidget> {
  bool createP = false;
  int valueCount = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < valueCount; i++)
              SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: CustomText(
                                text: "First Name",
                                size: 14,
                                weight: FontWeight.w500),
                          ),
                          Flexible(
                            child: SizedBox(
                                width: !Responsive.isDesktop(context)
                                    ? getWidth(context)
                                    : getWidth(context) / 5,
                                child: TextWidgetField()),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: CustomText(
                                text: "Last Name",
                                size: 14,
                                weight: FontWeight.w500),
                          ),
                          Flexible(
                            child: SizedBox(
                                width: !Responsive.isDesktop(context)
                                    ? getWidth(context)
                                    : getWidth(context) / 5,
                                child: TextWidgetField()),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: CustomText(
                                text: "Email",
                                size: 14,
                                weight: FontWeight.w500),
                          ),
                          Flexible(
                            child: SizedBox(
                                width: !Responsive.isDesktop(context)
                                    ? getWidth(context)
                                    : getWidth(context) / 5,
                                child: TextWidgetField()),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: RealCheckBoxWidget(
                          value: createP,
                          onChanged: (va) {
                            setState(() {
                              debugPrint('$va value');
                              if (!createP) {
                                createP = true;
                              } else {
                                createP = false;
                              }
                            });
                          },
                          isTop: true,
                          Labeltext: 'Create Person'),
                    ),
                    i != valueCount - 1 || i == 0
                        ? Flexible(
                            child: Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: IconHoverButton(
                              icons: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  if (valueCount > i) {
                                    valueCount++;
                                  }
                                });
                              },
                            ),
                          ))
                        : Flexible(
                            child: Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: IconHoverButton(
                              icons: FontAwesomeIcons.trashAlt,
                              onPress: () {
                                setState(() {
                                  if (valueCount > i) {
                                    valueCount--;
                                  }
                                });
                              },
                            ),
                          )),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
