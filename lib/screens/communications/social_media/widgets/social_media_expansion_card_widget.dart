import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wij_land/screens/communications/social_media/widgets/social_media_constants.dart';

import '../../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../utils/functions.dart';

class SocialMediaExpansionCardWidget extends StatefulWidget {
  final IconData icons;
  final Color iconColor;
  var yearList,
      yearType,
      followersCountList,
      tFollowers,
      engagementCountList,
      tEngagement,
      postViewCountList,
      tPostView,
      igtvCountList,
      tIgtvReach,
      titleName;
  final onPress, onAddPress, yearChange;
  bool isClick = false;

  SocialMediaExpansionCardWidget(
      {Key? key,
      required this.yearList,
      required this.followersCountList,
      required this.tFollowers,
      required this.engagementCountList,
      required this.tEngagement,
      required this.postViewCountList,
      required this.tPostView,
      required this.igtvCountList,
      required this.tIgtvReach,
      required this.titleName,
      required this.onAddPress,
      required this.isClick,
      required this.onPress,
      required this.icons,
      required this.iconColor,
      required this.yearType,
      required this.yearChange})
      : super(key: key);

  @override
  State<SocialMediaExpansionCardWidget> createState() =>
      _SocialMediaExpansionCardWidgetState();
}

class _SocialMediaExpansionCardWidgetState
    extends State<SocialMediaExpansionCardWidget> {
  int j = 0, max = 6;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 4, right: 16),
      child: InkWell(
        onTap: widget.onPress,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: getWidth(context),
            height: widget.isClick ? 6 * 75 : 75,
            child: Card(
              semanticContainer: false,
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Padding(
                padding: widget.isClick
                    ? EdgeInsets.all(8)
                    : EdgeInsets.only(top: 8.0, left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: widget.isClick
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              FaIcon(
                                widget.icons,
                                size: 26,
                                color: widget.iconColor,
                              ),
                              SizedBox(width: 12),
                              Text(
                                widget.titleName,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 12),
                              widget.isClick
                                  ? FaIcon(
                                      FontAwesomeIcons.angleUp,
                                      size: 14,
                                    )
                                  : FaIcon(
                                      FontAwesomeIcons.angleDown,
                                      size: 14,
                                    ),
                            ],
                          ),
                        ),
                        widget.isClick
                            ? IconHoverButton(
                                icons: FontAwesomeIcons.penSquare,
                                onPress: widget.onAddPress)
                            : SizedBox.shrink(),
                      ],
                    ),
                    widget.isClick
                        ? Padding(
                            padding: const EdgeInsets.only(top: 12.0, left: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: getWidth(context) / 6,
                                  child: RealDropDownWidget(
                                    value: yearType,
                                    onChanged: (va) {
                                      setState(() {
                                        yearType = va;
                                      });
                                    },
                                    items: widget.yearList
                                        .map<DropdownMenuItem<String>>(
                                            (String values) {
                                      return DropdownMenuItem<String>(
                                          value: values, child: Text(values));
                                    }).toList(),
                                  ),
                                ),
                                SizedBox(
                                  width: getWidth(context) / 1.7,
                                  height: 60,
                                  child: Card(
                                    color: Color(0xffF5F6FA),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              j = 0;
                                              max = 6;
                                            });
                                          },
                                          icon: FaIcon(
                                            FontAwesomeIcons.angleLeft,
                                            size: 14,
                                          ),
                                        ),
                                        for (int i = j; i < max; i++)
                                          Expanded(
                                              child: Text(
                                            shortMonth[i],
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          )),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                j = 6;
                                                max = 12;
                                              });
                                            },
                                            icon: FaIcon(
                                              FontAwesomeIcons.angleRight,
                                              size: 14,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  'Total',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        : SizedBox.shrink(),
                    widget.isClick
                        ? Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, left: 22, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: getWidth(context) / 6,
                                      child: Text(
                                        'Followers',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(
                                      width: getWidth(context) / 2,
                                      height: 60,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          for (int i = j; i < max; i++)
                                            Expanded(
                                                child: Text(
                                              widget.followersCountList[i],
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight.normal),
                                              textAlign: TextAlign.center,
                                            )),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      widget.tFollowers,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                indent: 8,
                                endIndent: 8,
                                height: 0.1,
                                thickness: 0.2,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, left: 24, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: getWidth(context) / 6,
                                      child: Text(
                                        'Engagement',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(
                                      width: getWidth(context) / 2,
                                      height: 60,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          for (int i = j; i < max; i++)
                                            Expanded(
                                                child: Text(
                                              widget.engagementCountList[i],
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight.normal),
                                              textAlign: TextAlign.center,
                                            )),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      widget.tEngagement,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                indent: 8,
                                endIndent: 8,
                                height: 0.1,
                                thickness: 0.2,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, left: 24, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: getWidth(context) / 6,
                                      child: Text(
                                        'Post view',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(
                                      width: getWidth(context) / 2,
                                      height: 60,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          for (int i = j; i < max; i++)
                                            Expanded(
                                                child: Text(
                                              widget.postViewCountList[i],
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight.normal),
                                              textAlign: TextAlign.center,
                                            )),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      widget.tPostView,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                indent: 8,
                                endIndent: 8,
                                height: 0.1,
                                thickness: 0.2,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, left: 24, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: getWidth(context) / 6,
                                      child: Text(
                                        'IGTV Reach',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(
                                      width: getWidth(context) / 2,
                                      height: 60,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          for (int i = j; i < max; i++)
                                            Expanded(
                                                child: Text(
                                              widget.igtvCountList[i],
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight.normal),
                                              textAlign: TextAlign.center,
                                            )),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      widget.tIgtvReach,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                indent: 8,
                                endIndent: 8,
                                height: 0.1,
                                thickness: 0.2,
                                color: Colors.grey,
                              ),
                            ],
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
