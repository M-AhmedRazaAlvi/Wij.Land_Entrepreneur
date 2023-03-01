import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../app_common_widgets/real_check_box_widget.dart';
import '../../../utils/images.dart';
import '../../office/widgets/information_text_widget.dart';
import '../../office/widgets/search_widget.dart';

class FarmProfileCardWidget extends StatefulWidget {
  const FarmProfileCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<FarmProfileCardWidget> createState() => _FarmProfileCardWidgetState();
}

class _FarmProfileCardWidgetState extends State<FarmProfileCardWidget> {
  bool _onWebChecked = false, onClickList = true, onClickLocation = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 3,
        child: Wrap(
          spacing: 20,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            SizedBox(
              width: !Responsive.isDesktop(context)
                  ? getWidth(context)
                  : getWidth(context) * 0.2,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    width: !Responsive.isDesktop(context)
                        ? getWidth(context)
                        : getWidth(context) * 0.2,
                    height: !Responsive.isDesktop(context)
                        ? getWidth(context) * 0.5
                        : getWidth(context) * 0.22,
                    decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(5))),
                    child: Image(
                      image: AssetImage(Images.farmPic),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: CustomText(
                      text: "Farm Of",
                      color: third,
                      size: 20,
                      weight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Stack(
              children: [
                Positioned(
                  top: !Responsive.isDesktop(context) ? 30 : 20,
                  left: !Responsive.isDesktop(context) ? 20 : 5,
                  child: Wrap(
                    spacing: 4,
                    children: [
                      ClickIconButton(
                        clickcolors: onClickList ? hoverColor : Colors.white,
                        icon: Icons.list,
                        onPressed: () {
                          setState(
                            () {
                              onClickList = true;
                              onClickLocation = false;
                            },
                          );
                        },
                      ),
                      ClickIconButton(
                        clickcolors:
                            onClickLocation ? hoverColor : Colors.white,
                        icon: Icons.location_pin,
                        onPressed: () {
                          setState(
                            () {
                              onClickList = false;
                              onClickLocation = true;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                onClickList
                    ? Container(
                        width: !Responsive.isDesktop(context)
                            ? getWidth(context) / 1.6
                            : !Responsive.isDesktop(context)
                                ? getWidth(context)
                                : getWidth(context) / 2,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: !Responsive.isDesktop(context)
                            ? EdgeInsets.all(20)
                            : EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  left: 120,
                                  bottom: 20,
                                  top: !Responsive.isDesktop(context)
                                      ? 0
                                      : 10),
                              width: getWidth(context),
                              child: CustomText(
                                text: "arman",
                                size: 30,
                                weight: FontWeight.w700,
                                color: darkBlue,
                              ),
                            ),
                            Wrap(
                              spacing: 50,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InformativeTextWidget(
                                      textFirst: "Address:\t\t",
                                      textSecond: "Nijmegen,Nederiand",
                                    ),
                                    InformativeTextWidget(
                                      textFirst: "Area:\t\t",
                                      textSecond: "27 hectares",
                                    ),
                                    InformativeTextWidget(
                                      textFirst: "Municipality:\t\t",
                                      textSecond: "98327863379",
                                    ),
                                    InformativeTextWidget(
                                      textFirst: "Water Body:\t\t",
                                      textSecond: 'Limburg',
                                    ),
                                    InformativeTextWidget(
                                      textFirst: "Business Type:\t\t",
                                      textSecond: 'Normal',
                                    ),
                                    RealCheckBoxWidget(
                                      value: _onWebChecked,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            _onWebChecked = value ?? false;
                                          },
                                        );
                                      },
                                      Labeltext: "On Website",
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    InformativeTextWidget(
                                      textFirst: "Projects:\t\t",
                                      textSecond: "98327863379",
                                    ),
                                    InformativeTextWidget(
                                      textFirst: "Active in project since:\t\t",
                                      textSecond: "27 hectares",
                                    ),
                                    InformativeTextWidget(
                                      textFirst: "Active in Wij.land:\t\t",
                                      textSecond: "Since 28-02-2022",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : onClickLocation
                        ? Container(
                            alignment: Alignment.center,
                            width: !Responsive.isDesktop(context)
                                ? getWidth(context) / 1.6
                                : !Responsive.isDesktop(context)
                                    ? getWidth(context)
                                    : getWidth(context) / 2,
                            margin: EdgeInsets.symmetric(vertical: 20),
                            padding: EdgeInsets.only(bottom: 20),
                            child: CustomText(text: "Map"),
                          )
                        : Container()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
