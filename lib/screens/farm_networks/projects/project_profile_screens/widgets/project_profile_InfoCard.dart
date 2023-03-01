import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../../../utils/images.dart';
import '../../../../contacts/widgets/popup_menu_button.dart';
import '../../../../office/widgets/information_text_widget.dart';

class ProjectProfileInfoCard extends StatelessWidget {
  const ProjectProfileInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Stack(
              children: [
                Wrap(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      child: Expanded(
                          child: Container(
                        width: !Responsive.isDesktop(context)
                            ? getWidth(context)
                            : getWidth(context) * 0.3,
                        height: !Responsive.isDesktop(context)
                            ? getWidth(context) * 0.6
                            : getWidth(context) * 0.3,
                        child: Image(
                          image: AssetImage(Images.wallpaper),
                          fit: BoxFit.cover,
                        ),
                      )),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 60),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 30),
                                child: CustomText(
                                  text: "Property Scan Project",
                                  size: 35,
                                  weight: FontWeight.bold,
                                  color: third,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Wrap(
                                children: const [
                                  InformativeTextWidget(
                                      textFirst: "Start Date",
                                      textSecond: "23/3/2022"),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  CustomText(text: "Related Links"),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Wrap(
                                children: const [
                                  CustomText(text: "Internal project"),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  CustomText(text: "https://www.google.com/"),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Wrap(
                                children: const [
                                  InformativeTextWidget(
                                      textFirst: "Project Status",
                                      textSecond: "Active"),
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 20,
                  right: 60,
                  //  left: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconHoverButton(icons: Icons.edit, onPress: () {}),
                      PopUpMenuButtonWidget(
                        mOnDeleteTap: () {},
                      )
                    ],
                  ),
                )
              ],
            )
          ])),
    );
  }
}
