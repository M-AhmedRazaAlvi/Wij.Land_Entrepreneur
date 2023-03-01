import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wij_land/routes/routes.dart';
import 'package:wij_land/screens/communications/media/widgets/media_constants.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../../utils/controller.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/images.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';

class MediaTitleCardWidget extends StatefulWidget {
  final String? title, counts;

  const MediaTitleCardWidget(
    this.title,
    this.counts, {
    Key? key,
  }) : super(key: key);

  @override
  State<MediaTitleCardWidget> createState() => _MediaTitleCardWidgetState();
}

class _MediaTitleCardWidgetState extends State<MediaTitleCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      color: Colors.white,
      clipBehavior: Clip.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Wrap(
                spacing: 12,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: !Responsive.isDesktop(context)
                            ? Radius.circular(12)
                            : Radius.zero,
                        bottomLeft: !Responsive.isDesktop(context)
                            ? Radius.zero
                            : Radius.circular(12),
                      ),
                      child: Image.asset(
                        Images.wallpaper,
                        width: !Responsive.isDesktop(context)
                            ? getWidth(context)
                            : getWidth(context) * 0.3,
                        height: getHeight(context) * 0.5,
                        fit: BoxFit.fill,
                      )),
                  !Responsive.isDesktop(context)
                      ? Container(
                          width: !Responsive.isDesktop(context)
                              ? getWidth(context)
                              : getWidth(context) / 1.67,
                          padding:
                              EdgeInsets.only(left: 12, top: 12, right: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CustomText(
                                text: 'Results',
                                color: Colors.red,
                                size: 30,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Wrap(
                                children: [
                                  CustomText(
                                    text: 'Date:',
                                    color: dark,
                                    size: 14,
                                    weight: FontWeight.normal,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: '18-12-2021',
                                    color: dark,
                                    size: 14,
                                    weight: FontWeight.normal,
                                  ),
                                ],
                              ),
                              Wrap(
                                children: [
                                  CustomText(
                                    text: 'Author:',
                                    color: dark,
                                    size: 14,
                                    weight: FontWeight.normal,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: 'Test',
                                    color: dark,
                                    size: 14,
                                    weight: FontWeight.normal,
                                  ),
                                ],
                              ),
                              Wrap(
                                children: [
                                  CustomText(
                                    text: 'Range of Medium: ',
                                    color: dark,
                                    size: 14,
                                    weight: FontWeight.normal,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: 'Test',
                                    color: dark,
                                    size: 14,
                                    weight: FontWeight.normal,
                                  ),
                                ],
                              ),
                              Wrap(
                                children: [
                                  CustomText(
                                    text: 'Scope of article:',
                                    color: dark,
                                    size: 14,
                                    weight: FontWeight.normal,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: '100',
                                    color: dark,
                                    size: 14,
                                    weight: FontWeight.normal,
                                  ),
                                ],
                              ),
                              Wrap(
                                children: [
                                  CustomText(
                                    text: 'Division Factor:',
                                    color: dark,
                                    size: 14,
                                    weight: FontWeight.normal,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: 'test',
                                    color: dark,
                                    size: 14,
                                    weight: FontWeight.normal,
                                  ),
                                ],
                              ),
                              Wrap(
                                children: [
                                  CustomText(
                                    text:
                                        'Scope of this article/Division Factor:',
                                    color: dark,
                                    size: 14,
                                    weight: FontWeight.normal,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: 'Test',
                                    color: dark,
                                    size: 14,
                                    weight: FontWeight.normal,
                                  ),
                                ],
                              ),
                              Wrap(
                                children: [
                                  CustomText(
                                    text: 'Type:',
                                    color: dark,
                                    size: 14,
                                    weight: FontWeight.normal,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: 'Printed Press',
                                    color: dark,
                                    size: 14,
                                    weight: FontWeight.normal,
                                  ),
                                ],
                              ),
                              Wrap(
                                children: [
                                  CustomText(
                                    text: 'Published where:',
                                    color: dark,
                                    size: 14,
                                    weight: FontWeight.normal,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: 'test',
                                    color: dark,
                                    size: 14,
                                    weight: FontWeight.normal,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : Container(
                          width: !Responsive.isDesktop(context)
                              ? getWidth(context)
                              : getWidth(context) / 1.67,
                          padding:
                              EdgeInsets.only(left: 12, top: 12, right: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CustomText(
                                text: 'Results',
                                color: Colors.red,
                                size: 30,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  alignment: WrapAlignment.spaceEvenly,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: getWidth(context) / 3.7,
                                      child: Wrap(
                                        children: [
                                          CustomText(
                                            text: 'Date:',
                                            color: dark,
                                            size: 14,
                                            weight: FontWeight.normal,
                                          ),
                                          SizedBox(width: 8),
                                          CustomText(
                                            text: '18-12-2021',
                                            color: dark,
                                            size: 14,
                                            weight: FontWeight.normal,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: getWidth(context) / 3.7,
                                      child: Wrap(
                                        children: [
                                          CustomText(
                                            text: 'Author:',
                                            color: dark,
                                            size: 14,
                                            weight: FontWeight.normal,
                                          ),
                                          SizedBox(width: 8),
                                          CustomText(
                                            text: 'Test',
                                            color: dark,
                                            size: 14,
                                            weight: FontWeight.normal,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  alignment: WrapAlignment.spaceEvenly,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: getWidth(context) / 3.7,
                                      child: Wrap(
                                        children: [
                                          CustomText(
                                            text: 'Range of Medium:',
                                            color: dark,
                                            size: 14,
                                            weight: FontWeight.normal,
                                          ),
                                          SizedBox(width: 8),
                                          CustomText(
                                            text: 'Test',
                                            color: dark,
                                            size: 14,
                                            weight: FontWeight.normal,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: getWidth(context) / 3.7,
                                      child: Wrap(
                                        children: [
                                          CustomText(
                                            text: 'Scope of article:',
                                            color: dark,
                                            size: 14,
                                            weight: FontWeight.normal,
                                          ),
                                          SizedBox(width: 8),
                                          CustomText(
                                            text: '100',
                                            color: dark,
                                            size: 14,
                                            weight: FontWeight.normal,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  alignment: WrapAlignment.spaceEvenly,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: getWidth(context) / 3.7,
                                      child: Wrap(
                                        children: [
                                          CustomText(
                                            text: 'Division Factor:',
                                            color: dark,
                                            size: 14,
                                            weight: FontWeight.normal,
                                          ),
                                          SizedBox(width: 8),
                                          CustomText(
                                            text: 'test',
                                            color: dark,
                                            size: 14,
                                            weight: FontWeight.normal,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: getWidth(context) / 3.7,
                                      child: Wrap(
                                        children: [
                                          CustomText(
                                            text:
                                                'Scope of this article/Division Factor:',
                                            color: dark,
                                            size: 14,
                                            weight: FontWeight.normal,
                                          ),
                                          SizedBox(width: 8),
                                          CustomText(
                                            text: 'Test',
                                            color: dark,
                                            size: 14,
                                            weight: FontWeight.normal,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  alignment: WrapAlignment.spaceEvenly,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: getWidth(context) / 3.7,
                                      child: Wrap(
                                        children: [
                                          CustomText(
                                            text: 'Type:',
                                            color: dark,
                                            size: 14,
                                            weight: FontWeight.normal,
                                          ),
                                          SizedBox(width: 8),
                                          CustomText(
                                            text: 'Printed Press',
                                            color: dark,
                                            size: 14,
                                            weight: FontWeight.normal,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: getWidth(context) / 3.7,
                                      child: Wrap(
                                        children: [
                                          CustomText(
                                            text: 'Published where:',
                                            color: dark,
                                            size: 14,
                                            weight: FontWeight.normal,
                                          ),
                                          SizedBox(width: 8),
                                          CustomText(
                                            text: 'test',
                                            color: dark,
                                            size: 14,
                                            weight: FontWeight.normal,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
              Positioned(
                top: 10,
                right: 50,
                child: IconHoverButton(
                    icons: FontAwesomeIcons.pen,
                    onPress: () {
                      //   Get.toNamed('/edit_media');
                      navigationController.navigateTo(mediaEditPageRoute);
                    }),
              ),
              Positioned(
                top: 10,
                right: 5,
                child: IconHoverButton(
                    icons: FontAwesomeIcons.ellipsisV,
                    onPress: () {
                      showPopupMenu(context);
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
