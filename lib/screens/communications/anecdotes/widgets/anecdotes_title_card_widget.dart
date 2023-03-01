import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wij_land/routes/routes.dart';
import 'package:wij_land/screens/communications/anecdotes/widgets/anecdotes_constants.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../../utils/controller.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/images.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';

class AnecdotesTitleCardWidget extends StatefulWidget {
  final String? title, counts;

  const AnecdotesTitleCardWidget(
    this.title,
    this.counts, {
    Key? key,
  }) : super(key: key);

  @override
  State<AnecdotesTitleCardWidget> createState() =>
      _AnecdotesTitleCardWidgetState();
}

class _AnecdotesTitleCardWidgetState extends State<AnecdotesTitleCardWidget> {
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
                                text: 'Title Name',
                                color: third,
                                size: 40,
                                weight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              Wrap(
                                children: [
                                  CustomText(
                                    text: 'Date:',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: '18-12-2021',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                ],
                              ),
                              Wrap(
                                children: [
                                  CustomText(
                                    text: 'Amber Lamming',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                ],
                              ),
                              Wrap(
                                children: [
                                  CustomText(
                                    text: 'Poject:',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w600,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: 'test',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                ],
                              ),
                              Wrap(
                                children: [
                                  CustomText(
                                    text: 'Organization:',
                                    color: dark,
                                    size: 14,
                                    weight: FontWeight.bold,
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
                                    text: 'Person:',
                                    color: dark,
                                    size: 14,
                                    weight: FontWeight.bold,
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
                                text: 'Title Name',
                                color: third,
                                size: 40,
                                weight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              Wrap(
                                children: [
                                  CustomText(
                                    text: 'Date:',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: '18-12-2021',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Wrap(
                                children: [
                                  CustomText(
                                    text: 'Amber Lamming',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Wrap(
                                children: [
                                  CustomText(
                                    text: 'Poject:',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w600,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: 'test',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Wrap(
                                children: [
                                  CustomText(
                                    text: 'Organization:',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w600,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: 'Printed Press',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Wrap(
                                children: [
                                  CustomText(
                                    text: 'Person:',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w600,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(
                                    text: 'test',
                                    color: ivoryBlack,
                                    size: 14,
                                    weight: FontWeight.w400,
                                  ),
                                ],
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
                      // Get.toNamed('/edit_anecdotes');
                      navigationController.navigateTo(anecdotesEditPageRoute);
                    }),
              ),
              Positioned(
                top: 10,
                right: 5,
                child: IconHoverButton(
                    icons: FontAwesomeIcons.ellipsisV,
                    onPress: () {
                      showPopupAnecdotesMenu(context, 100);
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
