import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wij_land/screens/farm_networks/actions/widgets/on_edit_button.dart';

import '../../../app_common_widgets/custom_text.dart';
import '../../../app_common_widgets/on_hover.dart';
import '../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../app_common_widgets/text_widget.dart';
import '../../../utils/functions.dart';
import '../../../utils/responsive.dart';
import '../../../utils/styles.dart';
import '../../office/widgets/comment_text.dart';

class FarmActionProfileScreen extends StatefulWidget {
  const FarmActionProfileScreen({Key? key}) : super(key: key);

  @override
  State<FarmActionProfileScreen> createState() =>
      _FarmActionProfileScreenState();
}

class _FarmActionProfileScreenState extends State<FarmActionProfileScreen> {
  final TextEditingController date = TextEditingController();
  var actionList = ['Amber Lemming , Arjun Milan , Bob Martin'];
  String? farms = 'Farm of Iona';
  List<String> farmList = [
    'Farm of Iona',
    'Farm of noone',
    'Farm of zikry',
    'Farm of tan'
  ];
  String? season = 'Fall';
  List<String> seasonList = ['Fall', 'Autumn', 'Spring', 'Winter'];
  bool onClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      //  scrollDirection: A,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Row(
        //   children: [
        //     Obx(() => Padding(
        //           padding: const EdgeInsets.all(15),
        //           child: Row(
        //             children: [
        //               CustomText(
        //                 text: menuController.activeItemRoute.value,
        //                 size: 20,
        //                 color: secondary,
        //               )
        //             ],
        //           ),
        //         )),
        //   ],
        // ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: CustomText(
            text: "Property Scan Project / Property Scan",
            size: 25,
            weight: FontWeight.bold,
            color: third,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  children: [
                    onClicked
                        ? OnEditButton(
                            text: "Cancel",
                            colors: Colors.white,
                            onPress: () {
                              setState(() {
                                onClicked = !onClicked;
                              });
                            },
                          )
                        : Container(),
                    Padding(padding: EdgeInsets.only(right: 5)),
                    onClicked
                        ? OnEditButton(
                            text: "Save",
                            colors: Colors.yellow,
                            onPress: () {
                              setState(() {
                                onClicked = !onClicked;
                              });
                            },
                          )
                        : Container(),
                  ],
                ),
              ),
              onClicked
                  ? Container()
                  : OnHover(
                      builder: (isHovered) => Card(
                          color: isHovered ? hoverColor : Colors.white,
                          child: SizedBox(
                              height: 30,
                              width: 30,
                              child: InkWell(
                                onTap: () {
                                  {
                                    setState(() {
                                      onClicked = !onClicked;
                                    });
                                  }
                                },
                                child: Icon(
                                  Icons.edit,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                              ))),
                    ),
              onClicked
                  ? Container()
                  : Card(
                      child: SizedBox(
                          height: 30,
                          width: 30,
                          child: Icon(
                            Icons.close,
                            size: 15,
                            color: Colors.grey,
                          ))),
              onClicked
                  ? Container()
                  : OnHover(
                      builder: ((isHovered) => Card(
                          color: isHovered ? hoverColor : Colors.white,
                          child: SizedBox(
                              height: 30,
                              width: 30,
                              child: PopupMenuButton(
                                  icon: Icon(
                                    FontAwesomeIcons.ellipsisV,
                                    size: 12,
                                    color: Colors.grey,
                                  ),
                                  // iconSize: 15,

                                  itemBuilder: (context) => [
                                        PopupMenuItem(
                                            value: 1,
                                            child: Row(
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      2, 2, 8, 2),
                                                  child: Icon(
                                                    Icons.delete,
                                                    size: 12,
                                                    color: Colors.greenAccent,
                                                  ),
                                                ),
                                                Text('Delete',
                                                    style:
                                                        TextStyle(fontSize: 12))
                                              ],
                                            )),
                                        PopupMenuItem(
                                            value: 2,
                                            child: Row(
                                              children: const <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      2, 2, 8, 2),
                                                  child: Icon(
                                                    Icons.download,
                                                    size: 12,
                                                    color: Colors.greenAccent,
                                                  ),
                                                ),
                                                Text(
                                                  'Download CSV',
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                )
                                              ],
                                            )),
                                      ])))),
                    )
            ],
          ),
        ),
        Flex(
            direction: !Responsive.isDesktop(context)
                ? Axis.vertical
                : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            // shrinkWrap: true,
            children: [
              SizedBox(
                width: !Responsive.isDesktop(context)
                    ? getWidth(context)
                    : getWidth(context) * 0.4,
                child: Column(
                  children: [
                    SizedBox(
                      width: getWidth(context),
                      child: Row(
                        children: [
                          SizedBox(
                            width: !Responsive.isDesktop(context)
                                ? getWidth(context)
                                : getWidth(context) * 0.4,
                            height: 30 * 26,
                            child: Card(
                              margin: EdgeInsets.all(20),
                              elevation: 3,

                              // color: Colors.red,
                              child: Padding(
                                padding: const EdgeInsets.all(28.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      CustomText(
                                        text: "General Information",
                                        size: 20,
                                        //  color: Colors.grey,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      CustomText(
                                          text: "Farm/Organizations", size: 12),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 40,
                                        width: 100,
                                        child: RealDropDownWidget(
                                          value: farms,
                                          onChanged: (newValue) {
                                            setState(() {
                                              farms = newValue;
                                            });
                                          },
                                          items: farmList
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value));
                                          }).toList(),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      SelectableDropdownWidget(
                                        items: farmList,
                                        title: "Action done by",
                                        mSelectedValue: "",
                                        mOnDropDownChange: (value) {},
                                        mSelectedItemsList: [],
                                      ),
                                      SizedBox(height: 10),
                                      CustomText(
                                          text: "Date of Action", size: 12),
                                      SizedBox(height: 10),
                                      InkWell(
                                        onTap: () {
                                          showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2001),
                                                  lastDate: DateTime(2023))
                                              .then((d) {
                                            debugPrint("$d");
                                            if (d != null) {
                                              setState(() {
                                                date.text =
                                                    d.toString().split(" ")[0];
                                              });
                                            }
                                          });
                                        },
                                        child: SizedBox(
                                          height: 40,
                                          child: TextWidgetField(
                                            controller: date,
                                            enabled: false,
                                            suffixIcon:
                                                Icon(Icons.calendar_today),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      CustomText(
                                        text: "Done In season",
                                        size: 12,
                                      ),
                                      SizedBox(height: 10),
                                      SizedBox(
                                        child: RealDropDownWidget(
                                          value: season,
                                          onChanged: (newValue) {
                                            setState(() {
                                              season = newValue;
                                            });
                                          },
                                          items: seasonList
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value));
                                          }).toList(),
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      CustomText(
                                          text: "Method Description", size: 12),
                                      SizedBox(
                                        height: 100,
                                        width: 200,
                                        child: CommentTextField(),
                                      ),
                                      InkWell(
                                          onTap: null,
                                          child: CustomText(
                                              text: "Method Description",
                                              size: 12)),
                                      SizedBox(
                                        height: 100,
                                        width: 200,
                                        child: CommentTextField(),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: !Responsive.isDesktop(context)
                    ? EdgeInsets.all(12)
                    : EdgeInsets.all(8),
                width: !Responsive.isDesktop(context)
                    ? getWidth(context)
                    : getWidth(context) * 0.4,
                child: Column(
                  children: [
                    SizedBox(
                      height: 300,
                      width: !Responsive.isDesktop(context)
                          ? getWidth(context)
                          : getWidth(context) * 0.4,
                      child: Card(
                          color: Colors.grey,
                          child: Center(child: Text("Map"))),
                    ),
                    SizedBox(
                      height: 300,
                      width: !Responsive.isDesktop(context)
                          ? getWidth(context)
                          : getWidth(context) * 0.4,
                      child: Card(
                          color: Colors.grey,
                          child: Center(child: Text("Picture"))),
                    ),
                  ],
                ),
              )
            ]),
      ]),
    ));
  }
}
