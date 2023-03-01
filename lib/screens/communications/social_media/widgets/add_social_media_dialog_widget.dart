import 'package:flutter/material.dart';
import 'package:wij_land/screens/communications/social_media/widgets/social_media_constants.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/on_hover.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../app_common_widgets/text_widget.dart';
import '../../../../utils/responsive.dart';
import '../../../office/widgets/add_text_button_widget.dart';

class AddSocialMediaDialogWidget extends StatefulWidget {
  const AddSocialMediaDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddSocialMediaDialogWidget> createState() =>
      _AddSocialMediaDialogWidgetState();
}

class _AddSocialMediaDialogWidgetState
    extends State<AddSocialMediaDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
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
                      text: "Add Data",
                      size: 40,
                      weight: FontWeight.bold,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                        size: 40,
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
                Row(
                  children: [
                    Expanded(child: CustomText(text: "Month")),
                    SizedBox(
                      width: !Responsive.isDesktop(context)
                          ? 6
                          : !Responsive.isDesktop(context)
                              ? 4
                              : 12,
                    ),
                    Expanded(child: CustomText(text: "Year")),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RealDropDownWidget(
                        value: monthType,
                        onChanged: (va) {
                          setState(() {
                            monthType = va;
                          });
                        },
                        items: monthList
                            .map<DropdownMenuItem<String>>((String values) {
                          return DropdownMenuItem<String>(
                              value: values, child: Text(values));
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      width: !Responsive.isDesktop(context)
                          ? 6
                          : !Responsive.isDesktop(context)
                              ? 4
                              : 12,
                    ),
                    Expanded(
                      child: RealDropDownWidget(
                        value: yearType,
                        onChanged: (va) {
                          setState(() {
                            yearType = va;
                          });
                        },
                        items: yearList
                            .map<DropdownMenuItem<String>>((String values) {
                          return DropdownMenuItem<String>(
                              value: values, child: Text(values));
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    Expanded(child: CustomText(text: "Followers")),
                    SizedBox(
                      width: !Responsive.isDesktop(context)
                          ? 6
                          : !Responsive.isDesktop(context)
                              ? 4
                              : 12,
                    ),
                    Expanded(child: CustomText(text: "Post view")),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Expanded(
                      child: OnHover(builder: (hover) {
                        return Stack(
                          children: [
                            TextWidgetField(
                              controller: followersController,
                            ),
                            hover
                                ? Positioned(
                                    top: 5,
                                    right: 7,
                                    child: SizedBox(
                                      height: 38.0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  width: 0.5,
                                                ),
                                              ),
                                            ),
                                            child: InkWell(
                                              child: Icon(
                                                Icons.arrow_drop_up,
                                                size: 18.0,
                                              ),
                                              onTap: () {
                                                int currentValue = int.parse(
                                                    followersController.text);
                                                setState(() {
                                                  currentValue++;
                                                  followersController.text =
                                                      (currentValue)
                                                          .toString(); // incrementing value
                                                });
                                              },
                                            ),
                                          ),
                                          InkWell(
                                            child: Icon(
                                              Icons.arrow_drop_down,
                                              size: 18.0,
                                            ),
                                            onTap: () {
                                              int currentValue = int.parse(
                                                  followersController.text);
                                              setState(() {
                                                print("Setting state");
                                                currentValue--;
                                                followersController
                                                    .text = (currentValue > 0
                                                        ? currentValue
                                                        : 0)
                                                    .toString(); // decrementing value
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        );
                      }),
                    ),
                    SizedBox(
                      width: !Responsive.isDesktop(context)
                          ? 6
                          : !Responsive.isDesktop(context)
                              ? 4
                              : 12,
                    ),
                    Expanded(
                      child: OnHover(builder: (hover) {
                        return Stack(
                          children: [
                            TextWidgetField(
                              controller: postViewController,
                            ),
                            hover
                                ? Positioned(
                                    top: 5,
                                    right: 7,
                                    child: SizedBox(
                                      height: 38.0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  width: 0.5,
                                                ),
                                              ),
                                            ),
                                            child: InkWell(
                                              child: Icon(
                                                Icons.arrow_drop_up,
                                                size: 18.0,
                                              ),
                                              onTap: () {
                                                int currentValue = int.parse(
                                                    postViewController.text);
                                                setState(() {
                                                  currentValue++;
                                                  postViewController.text =
                                                      (currentValue)
                                                          .toString(); // incrementing value
                                                });
                                              },
                                            ),
                                          ),
                                          InkWell(
                                            child: Icon(
                                              Icons.arrow_drop_down,
                                              size: 18.0,
                                            ),
                                            onTap: () {
                                              int currentValue = int.parse(
                                                  postViewController.text);
                                              setState(() {
                                                print("Setting state");
                                                currentValue--;
                                                postViewController
                                                    .text = (currentValue > 0
                                                        ? currentValue
                                                        : 0)
                                                    .toString(); // decrementing value
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    Expanded(child: CustomText(text: "Engagement")),
                    SizedBox(
                      width: !Responsive.isDesktop(context)
                          ? 6
                          : !Responsive.isDesktop(context)
                              ? 4
                              : 12,
                    ),
                    Expanded(child: CustomText(text: "IGTV Reach")),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Expanded(
                      child: OnHover(builder: (hover) {
                        return Stack(
                          children: [
                            TextWidgetField(
                              controller: engagementController,
                            ),
                            hover
                                ? Positioned(
                                    top: 5,
                                    right: 7,
                                    child: SizedBox(
                                      height: 38.0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  width: 0.5,
                                                ),
                                              ),
                                            ),
                                            child: InkWell(
                                              child: Icon(
                                                Icons.arrow_drop_up,
                                                size: 18.0,
                                              ),
                                              onTap: () {
                                                int currentValue = int.parse(
                                                    engagementController.text);
                                                setState(() {
                                                  currentValue++;
                                                  engagementController.text =
                                                      (currentValue)
                                                          .toString(); // incrementing value
                                                });
                                              },
                                            ),
                                          ),
                                          InkWell(
                                            child: Icon(
                                              Icons.arrow_drop_down,
                                              size: 18.0,
                                            ),
                                            onTap: () {
                                              int currentValue = int.parse(
                                                  engagementController.text);
                                              setState(() {
                                                print("Setting state");
                                                currentValue--;
                                                engagementController
                                                    .text = (currentValue > 0
                                                        ? currentValue
                                                        : 0)
                                                    .toString(); // decrementing value
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        );
                      }),
                    ),
                    SizedBox(
                      width: !Responsive.isDesktop(context)
                          ? 6
                          : !Responsive.isDesktop(context)
                              ? 4
                              : 12,
                    ),
                    Expanded(
                      child: OnHover(builder: (hover) {
                        return Stack(
                          children: [
                            TextWidgetField(
                              controller: igtvReachController,
                            ),
                            hover
                                ? Positioned(
                                    top: 5,
                                    right: 7,
                                    child: SizedBox(
                                      height: 38.0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  width: 0.5,
                                                ),
                                              ),
                                            ),
                                            child: InkWell(
                                              child: Icon(
                                                Icons.arrow_drop_up,
                                                size: 18.0,
                                              ),
                                              onTap: () {
                                                int currentValue = int.parse(
                                                    igtvReachController.text);
                                                setState(() {
                                                  currentValue++;
                                                  igtvReachController.text =
                                                      (currentValue)
                                                          .toString(); // incrementing value
                                                });
                                              },
                                            ),
                                          ),
                                          InkWell(
                                            child: Icon(
                                              Icons.arrow_drop_down,
                                              size: 18.0,
                                            ),
                                            onTap: () {
                                              int currentValue = int.parse(
                                                  igtvReachController.text);
                                              setState(() {
                                                print("Setting state");
                                                currentValue--;
                                                igtvReachController
                                                    .text = (currentValue > 0
                                                        ? currentValue
                                                        : 0)
                                                    .toString(); // decrementing value
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
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
                    colors: Colors.black12,
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AddTextButtonWidget(
                    text: "Add Data",
                    colors: Colors.yellow,
                    onPress: () {},
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
