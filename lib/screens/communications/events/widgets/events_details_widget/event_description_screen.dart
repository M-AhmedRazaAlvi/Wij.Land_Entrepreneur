import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:wij_land/screens/communications/events/widgets/events_details_widget/widgets/chewie_player.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../../../app_common_widgets/text_widget.dart';
import '../../../../../utils/functions.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/responsive.dart';
import '../../../../../utils/styles.dart';

class EventDescriptionScreen extends StatefulWidget {
  const EventDescriptionScreen({Key? key}) : super(key: key);

  @override
  State<EventDescriptionScreen> createState() => _EventDescriptionScreenState();
}

class _EventDescriptionScreenState extends State<EventDescriptionScreen> {
  bool mapOpened = false, isEdit = false, atFarm = false;
  String farmText = 'Event is at Farm';
  TextEditingController dateController =
      TextEditingController(text: 'select video for upload');
  var farmType = 'Select Farm',
      farmList = [
        'Farm of Ajay Jadeja',
        'Farm of Donald Roa,Zevenbergen',
        'Farm of Elliot Mass',
        'Farm of FLeurette Goode',
        'Farm of Freya Fionannian'
      ],
  guestList=['Select','Amber Lemming','Ajay Jadeja','Bob Martin','Faraz Akram'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: isEdit
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: CustomText(
                        text: 'Event Description',
                        color: darkGreen,
                        size: 25,
                        weight: FontWeight.w600,
                      )),
                      /* IconHoverButton(icons: FontAwesomeIcons.search, onPress: (){}),
                IconHoverButton(icons: FontAwesomeIcons.filter, onPress: (){
                  setState(() {
                    _isFilter=!_isFilter;
                  });
                }),*/
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            elevation: 3,
                            fixedSize: Size(100, 40),
                          ),
                          label: Text(
                            'Edit',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            //   Get.toNamed('/add_anecdotes');
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.solidEdit,
                            size: 13,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: !Responsive.isDesktop(context)
                          ? getWidth(context)
                          : !Responsive.isDesktop(context)
                              ? getWidth(context) / 2.5
                              : getWidth(context) / 2.99,
                      height: !Responsive.isDesktop(context)
                          ? getHeight(context) / 2.13
                          : !Responsive.isDesktop(context)
                              ? getHeight(context) / 2
                              : getHeight(context) / 2,
                      child: ChewiePlayers(
                        videoPlayerController: VideoPlayerController.network(
                            "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4"),
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    child: Text(
                        "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue)),
                    onTap: () async {
                      const url =
                          'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4';
                      if (await canLaunch(url)) launch(url);
                    },
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Divider(
                    color: Colors.black45,
                    indent: 4,
                    endIndent: 4,
                    thickness: 0.2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: 'Location Details',
                    color: darkGreen,
                    size: 30,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Flex(
                    direction: !Responsive.isDesktop(context)||!Responsive.isDesktop(context)
                        ? Axis.vertical
                        : Axis.horizontal,
                    crossAxisAlignment: !Responsive.isDesktop(context)||!Responsive.isDesktop(context)
                        ? CrossAxisAlignment.stretch
                        : CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              TextButton.icon(
                                  onPressed: () {},
                                  icon: FaIcon(
                                    Icons.location_on,
                                    size: 16,
                                    color: Colors.black,
                                  ),
                                  label: CustomText(
                                    text:'Address: ',
                                        color: ivoryBlack, size: 16,weight: FontWeight.w300,),
                                  ),
                              CustomText(
                                text: '302-L johar town lahore pk',
                                color: ivoryBlack,
                                size: 16,
                                weight: FontWeight.w300,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: CustomText(
                                   text: 'Location Name: ',
                                        weight: FontWeight.w300,
                                        color: ivoryBlack, size: 16),
                                  ),
                              CustomText(
                                text: 'lahore pk',
                                color: ivoryBlack,
                                size: 16,
                                weight: FontWeight.w300,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: !Responsive.isDesktop(context)
                            ? getWidth(context) * 0.95
                            : !Responsive.isDesktop(context)
                                ? getWidth(context) / 2.5
                                : getWidth(context) / 2,
                        height: getHeight(context) * 0.3,
                        child: Stack(
                          children: [
                            Positioned(
                              right: mapOpened ? 8 : 4,
                              child: Transform.scale(
                                scale: mapOpened ? 1.2 : 1,
                                child: SizedBox(
                                  height: mapOpened ? getHeight(context) : 570,
                                  width: mapOpened
                                      ? getWidth(context)
                                      : !Responsive.isDesktop(context)||!Responsive.isDesktop(context)
                                          ? getWidth(context)
                                          : getWidth(context) / 3.5,
                                  child: InkWell(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(8),
                                      ),
                                      child: Image.asset(
                                        Images.mapImage,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        mapOpened = !mapOpened;
                                        //  isClicked = !isClicked;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 14,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                        color: Colors.white),
                                    child: IconButton(
                                      color: Colors.black,
                                      icon: FaIcon(
                                        FontAwesomeIcons.square,
                                        size: 12,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                        color: Colors.white),
                                    child: IconButton(
                                      color: Colors.black,
                                      icon: FaIcon(
                                        FontAwesomeIcons.layerGroup,
                                        size: 12,
                                      ),
                                      onPressed: () {},
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
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.black45,
                    indent: 4,
                    endIndent: 4,
                    thickness: 0.2,
                  ),
                  CustomText(
                    text: 'Additional Info',
                    color: darkGreen,
                    size: 30,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    children:  [
                      CustomText(
                       text: 'Guest Speaker: ',
                            color: ivoryBlack,
                            size: 16,
                            weight: FontWeight.w600,
                      ),
                      CustomText(
                        text: 'Julie Solano',
                        color: ivoryBlack,
                        size: 16,
                        weight: FontWeight.w300,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Wrap(
                    children:  [
                      CustomText(
                        text:'Maximum number of Guests: ',
                            color: ivoryBlack,
                            size: 16,
                            weight: FontWeight.w600),

                      CustomText(
                        text: '400',
                        color: ivoryBlack,
                        size: 16,
                        weight: FontWeight.w300,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Wrap(
                    children:  [
                      CustomText(
                       text: 'Event Remarks: ',
                            color: ivoryBlack,
                            size: 16,
                            weight: FontWeight.w600),
                      CustomText(
                        text:
                            'A very good event for this journey hope going well in future',
                        color: ivoryBlack,
                        size: 16,
                        weight: FontWeight.w300,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: CustomText(
                        text: 'Event Description',
                        color: darkGreen,
                        size: 25,
                        weight: FontWeight.w600,
                      )),
                      Container(
                        alignment: Alignment.topRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xfff2f2f2),
                            elevation: 3,
                            fixedSize: Size(100, 40),
                          ),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            //   Get.toNamed('/add_anecdotes');
                          },
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.yellowAccent,
                            elevation: 3,
                            fixedSize: Size(100, 40),
                          ),
                          label: Text(
                            'Save',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            //   Get.toNamed('/add_anecdotes');
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.solidSave,
                            size: 13,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: getWidth(context)/2,
                    height: 50,
                    child: Stack(
                      children: [
                        TextWidgetField(
                          controller: dateController,
                        ),
                        Positioned(
                            right: 5,
                            top: 5,
                            child: IconButton(
                                onPressed: () {
                                  // datePicker(context,dateController);
                                },
                                icon: FaIcon(
                                  FontAwesomeIcons.folderPlus,
                                  color: Colors.black,
                                  size: 20,
                                ))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Divider(
                    color: Colors.black45,
                    indent: 4,
                    endIndent: 4,
                    thickness: 0.2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: 'Location Details ',
                    color: darkGreen,
                    size: 25,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Flex(
                    direction: !Responsive.isDesktop(context)||!Responsive.isDesktop(context)
                        ? Axis.vertical
                        : Axis.horizontal,
                    crossAxisAlignment: !Responsive.isDesktop(context)||!Responsive.isDesktop(context)
                        ? CrossAxisAlignment.stretch
                        : CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment:!Responsive.isDesktop(context)?CrossAxisAlignment.stretch: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RealCheckBoxWidget(
                              value: atFarm,
                              onChanged: (va) {
                                setState(() {
                                  if (atFarm == true) {
                                    atFarm = false;
                                  } else {
                                    atFarm = true;
                                  }
                                });
                              },
                              Labeltext: farmText,labelColor: ivoryBlack,labelSize: 14,labelWeight: FontWeight.w400,),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                           text: 'Location Name: ',
                            color: ivoryBlack, size: 14,weight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          atFarm
                              ? RealDropDownWidget(
                                  value: farmType,
                                  onChanged: (va) {
                                    setState(() {
                                      farmType = va;
                                    });
                                  },
                                  items: farmList.map<DropdownMenuItem<String>>(
                                      (String values) {
                                    return DropdownMenuItem<String>(
                                        value: values, child: CustomText(text:values,weight: FontWeight.w300,color: mediumGrey,));
                                  }).toList(),
                                )
                              : SizedBox(
                              height: 50,
                              width: getWidth(context)/3,
                              child: TextWidgetField()),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                          text:  'Address: ',
                           color: ivoryBlack,size: 14,weight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              width: getWidth(context)/3,
                              height: 50,
                              child: TextWidgetField()),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: !Responsive.isDesktop(context)
                            ? getWidth(context) * 0.95
                            : !Responsive.isDesktop(context)
                                ? getWidth(context) / 2.5
                                : getWidth(context) / 3,
                        height: getHeight(context) * 0.3,
                        child: Stack(
                          children: [
                            Positioned(
                              right: mapOpened ? 8 : 2,
                              child: Transform.scale(
                                scale: mapOpened ? 1.2 : 1,
                                child: SizedBox(
                                  height: mapOpened ? getHeight(context) : 570,
                                  width: mapOpened
                                      ? getWidth(context)
                                      : !Responsive.isDesktop(context)||!Responsive.isDesktop(context)
                                          ? getWidth(context)
                                          : getWidth(context) /2.5,
                                  child: InkWell(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(8),
                                      ),
                                      child: Image.asset(
                                        Images.mapImage,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        mapOpened = !mapOpened;
                                        //  isClicked = !isClicked;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 14,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                        color: Colors.white),
                                    child: IconButton(
                                      color: Colors.black,
                                      icon: FaIcon(
                                        FontAwesomeIcons.square,
                                        size: 12,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                        color: Colors.white),
                                    child: IconButton(
                                      color: Colors.black,
                                      icon: FaIcon(
                                        FontAwesomeIcons.layerGroup,
                                        size: 12,
                                      ),
                                      onPressed: () {},
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
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.black45,
                    indent: 4,
                    endIndent: 4,
                    thickness: 0.2,
                  ),
                  CustomText(
                    text: 'Additional Info',
                    color: darkGreen,
                    size: 30,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: getWidth(context)*0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableDropdownWidget(
                          items: guestList,
                          title: "Guest Speaker",
                          mSelectedValue: "",
                          mOnDropDownChange: (value){},
                          mSelectedItemsList: [],

                        ),
                        SizedBox(
                          height: 12,
                        ),
                        CustomText(
                          text:'Maximum number of guests ',
                        color: ivoryBlack, size: 14,weight: FontWeight.w400,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        TextWidgetField(),
                        SizedBox(
                          height: 12,
                        ),
                        CustomText(
                         text: 'Event Remarks',
                          color:ivoryBlack, size: 14,weight: FontWeight.w400,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        TextWidgetField(textPadding: EdgeInsets.symmetric(vertical: 60),),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
