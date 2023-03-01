import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wij_land/screens/communications/events/widgets/edit_events_dialog_widget.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/images.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../../dynamic_filters/widgets/dynamic_filter_constant.dart';

class EventsTitleCardWidget extends StatefulWidget {
  final String? title, counts;

  const EventsTitleCardWidget(
    this.title,
    this.counts, {
    Key? key,
  }) : super(key: key);

  @override
  State<EventsTitleCardWidget> createState() => _EventsTitleCardWidgetState();
}

class _EventsTitleCardWidgetState extends State<EventsTitleCardWidget> {
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
                alignment: WrapAlignment.start,
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
                            : getWidth(context) * 0.2,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CustomText(
                                text: 'Farmers Markets',
                                color: third,
                                size: 40,
                                weight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              Wrap(
                                children: [
                                  SizedBox(
                                    width: getWidth(context) / 6,
                                    child: Row(
                                      children: [
                                        FaIcon(
                                          Icons.location_on,
                                          size: 14,
                                          color: ivoryBlack,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        CustomText(
                                          text: 'Location:',
                                          color: ivoryBlack,
                                          size: 14,
                                          weight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: 'Lahore',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                children: [
                                  SizedBox(
                                    width: getWidth(context) / 6,
                                    child: Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.calendarAlt,
                                          size: 14,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        CustomText(
                                          text: 'Date:',
                                          color: ivoryBlack,
                                          size: 14,
                                          weight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: '10-6-2021',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                children: [
                                  SizedBox(
                                    width: getWidth(context) / 6,
                                    child: Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.solidClock,
                                          size: 14,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        CustomText(
                                          text: 'Status:',
                                          color: ivoryBlack,
                                          size: 14,
                                          weight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: 'Scheduled',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                children: [
                                  CustomText(
                                    text: 'Event Type:',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: '',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                children: [
                                  CustomText(
                                    text: 'Target Audience:',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: '',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                children: [
                                  CustomText(
                                    text: 'Person Responsible:',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: 'Julie1 Solano',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                children: [
                                  CustomText(
                                    text: 'Project Connections:',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: 'Arable Land',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w600,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                children: [
                                  CustomText(
                                    text: 'Programme Connections:',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: 'Inspiration',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                children: [
                                  CustomText(
                                    text: 'Organization Connections:',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: '',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        )
                      : Container(
                          width: !Responsive.isDesktop(context)
                              ? getWidth(context)
                              : !Responsive.isDesktop(context)
                                  ? getWidth(context) / 1.3
                                  : getWidth(context) / 1.8,
                          padding:
                              EdgeInsets.only(left: 12, top: 12, right: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CustomText(
                                  text: 'Farmers Market',
                                  color: third,
                                  size: 40,
                                  weight: FontWeight.w600),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: !Responsive.isDesktop(context)
                                          ? getWidth(context) / 4.5
                                          : !Responsive.isDesktop(context)
                                              ? getWidth(context) / 4
                                              : getWidth(context) / 3.8,
                                      child: Wrap(
                                        children: [
                                          SizedBox(
                                            width:
                                                !Responsive.isDesktop(context)
                                                    ? getWidth(context) * 0.11
                                                    : getWidth(context) * 0.1,
                                            child: Row(
                                              children: [
                                                FaIcon(
                                                  Icons.location_on,
                                                  size: 14,
                                                  color: Colors.black,
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                CustomText(
                                                  text: 'Location:',
                                                  color: ivoryBlack,
                                                  size: 14,
                                                  weight: FontWeight.w400,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          CustomText(
                                            text: 'Lahore',
                                            color: ivoryBlack,
                                            size: 14,
                                            weight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: !Responsive.isDesktop(context)
                                          ? getWidth(context) / 2.1
                                          : getWidth(context) / 4,
                                      child: Wrap(
                                        children: [
                                          CustomText(
                                            text: 'Person Responsible:',
                                            color: ivoryBlack,
                                            size: 14,
                                            weight: FontWeight.w400,
                                          ),
                                          SizedBox(width: 8),
                                          CustomText(
                                            text: 'Julie1 Solano',
                                            color: ivoryBlack,
                                            size: 14,
                                            weight: FontWeight.w600,
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
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: !Responsive.isDesktop(context)
                                          ? getWidth(context) / 4.5
                                          : !Responsive.isDesktop(context)
                                              ? getWidth(context) / 4
                                              : getWidth(context) / 3.8,
                                      child: Wrap(
                                        children: [
                                          SizedBox(
                                            width:
                                                !Responsive.isDesktop(context)
                                                    ? getWidth(context) * 0.11
                                                    : getWidth(context) * 0.08,
                                            child: Row(
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.calendarAlt,
                                                  size: 14,
                                                  color: Colors.black,
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                CustomText(
                                                  text: 'Date:',
                                                  color: ivoryBlack,
                                                  size: 14,
                                                  weight: FontWeight.w400,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          CustomText(
                                            text: '10-6-2021',
                                            color: ivoryBlack,
                                            size: 14,
                                            weight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: !Responsive.isDesktop(context)
                                          ? getWidth(context) / 2.1
                                          : getWidth(context) / 4,
                                      child: Wrap(
                                        children: [
                                          CustomText(
                                            text: 'Project Connections:',
                                            color: ivoryBlack,
                                            size: 14,
                                            weight: FontWeight.w400,
                                          ),
                                          SizedBox(width: 8),
                                          CustomText(
                                            text: 'Arable Land',
                                            color: ivoryBlack,
                                            size: 14,
                                            weight: FontWeight.w600,
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
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: !Responsive.isDesktop(context)
                                          ? getWidth(context) / 4.5
                                          : !Responsive.isDesktop(context)
                                              ? getWidth(context) / 4
                                              : getWidth(context) / 3.8,
                                      child: Wrap(
                                        children: [
                                          SizedBox(
                                            width:
                                                !Responsive.isDesktop(context)
                                                    ? getWidth(context) * 0.11
                                                    : getWidth(context) * 0.08,
                                            child: Row(
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.solidClock,
                                                  size: 14,
                                                  color: Colors.black,
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                CustomText(
                                                  text: 'Status:',
                                                  color: ivoryBlack,
                                                  size: 14,
                                                  weight: FontWeight.w400,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          CustomText(
                                            text: 'Scheduled',
                                            color: ivoryBlack,
                                            size: 14,
                                            weight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: !Responsive.isDesktop(context)
                                          ? getWidth(context) / 2.1
                                          : getWidth(context) / 4,
                                      child: Wrap(
                                        children: [
                                          CustomText(
                                            text: 'Programme Connections:',
                                            color: ivoryBlack,
                                            size: 14,
                                            weight: FontWeight.w400,
                                          ),
                                          SizedBox(width: 8),
                                          CustomText(
                                            text: 'Inspiration',
                                            color: ivoryBlack,
                                            size: 14,
                                            weight: FontWeight.w600,
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
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: !Responsive.isDesktop(context)
                                          ? getWidth(context) / 4.5
                                          : !Responsive.isDesktop(context)
                                              ? getWidth(context) / 4
                                              : getWidth(context) / 3.8,
                                      child: Wrap(
                                        children: [
                                          CustomText(
                                            text: 'Event Type:',
                                            color: ivoryBlack,
                                            size: 14,
                                            weight: FontWeight.w400,
                                          ),
                                          SizedBox(width: 8),
                                          CustomText(
                                            text: '',
                                            color: ivoryBlack,
                                            size: 14,
                                            weight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      child: Wrap(
                                        children: [
                                          CustomText(
                                            text: 'Organization Connections:',
                                            color: ivoryBlack,
                                            size: 14,
                                            weight: FontWeight.w400,
                                          ),
                                          SizedBox(width: 8),
                                          CustomText(
                                            text: '',
                                            color: ivoryBlack,
                                            size: 14,
                                            weight: FontWeight.w600,
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
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: !Responsive.isDesktop(context)
                                          ? getWidth(context) / 5
                                          : !Responsive.isDesktop(context)
                                              ? getWidth(context) / 4
                                              : getWidth(context) / 3.8,
                                      child: Wrap(
                                        children: [
                                          CustomText(
                                            text: 'Target Audience:',
                                            color: ivoryBlack,
                                            size: 14,
                                            weight: FontWeight.w400,
                                          ),
                                          SizedBox(width: 8),
                                          CustomText(
                                            text: '',
                                            color: ivoryBlack,
                                            size: 14,
                                            weight: FontWeight.w600,
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
                      showDialog(
                          context: context,
                          builder: (_) {
                            return EditEventsDialogWidget();
                          });
                    }),
              ),
              Positioned(
                top: 10,
                right: 5,
                child: IconHoverButton(
                    icons: FontAwesomeIcons.ellipsisV,
                    onPress: () {
                      showPopupEMenu(context);
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
