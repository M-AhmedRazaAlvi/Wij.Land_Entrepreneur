import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../app_common_widgets/text_widget.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../../office/widgets/add_text_button_widget.dart';

class AddEventsDialogWidget extends StatefulWidget {
  const AddEventsDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddEventsDialogWidget> createState() => _AddEventsDialogWidgetState();
}

class _AddEventsDialogWidgetState extends State<AddEventsDialogWidget> {
  var statusType = 'Select status',
      format = 'Select Date',
      contactText = 'Event is at Farm',
      contactPerson = false;
  var statusList = ['Select status', 'Idea', 'Scheduled', 'Cancel'];
  var orgType = 'Select Organization',
      orgList = [
        'Select Organization',
        'Better Soils',
        'Geen Leaf',
        'MAX India',
        'Wij.Land'
      ];
  var eventType = 'Select Type',
      eventList = [
        'Select Type',
        'Course',
        'Evaluation Session',
        'Excursion',
        'Theme afternoon/day/evening',
        'Welcome to Wij.Land',
        'Workshop'
      ];
  var eventMode = 'Select Mode',
      modeList = ['Select Mode', 'Online', 'Live', 'Hybrid'];
  var responsibleType = 'Select Responsible',
      responsibleList = [
        'Select Responsible',
        'Sachin Ramesh',
        'Nelly Robertson',
        'Sajjad Khan',
        'Willemijn van Leeuwen',
        'Julie1 Solano'
      ];
  final TextEditingController _farmTypeController =
      TextEditingController(text: 'dd/MM/yyyy');
  final TextEditingController _startController =
      TextEditingController(text: '--:-- --');
  final TextEditingController _endController =
      TextEditingController(text: '--:-- --');

  final ImagePicker _picker = ImagePicker();

  // Pick an image
  String? imageFile;
  DateTime fromDate = DateTime.now();

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
                      text: "Add event",
                      size: 26,
                      weight: FontWeight.w600,
                      color: ivoryBlack,
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
            width: MediaQuery.of(context).size.width * 0.5,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Upload Event Cover",
                    size: 14,
                    color: ivoryBlack,
                    weight: FontWeight.w400,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DottedBorder(
                        borderType: BorderType.RRect,
                        dashPattern: const [4, 4],
                        radius: Radius.circular(4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          child: SizedBox(
                            height: 80,
                            width: 90,
                            child: /*imageFile!=null?Image.file(File('$imageFile')):*/ IconButton(
                              onPressed: () {
                                imagePick();
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.plus,
                                color: Color(0xff3c4b64),
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Status",
                            size: 14,
                            color: ivoryBlack,
                            weight: FontWeight.w400,
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            width: getWidth(context) / 3.5,
                            child: RealDropDownWidget(
                              value: statusType,
                              onChanged: (va) {
                                setState(() {
                                  statusType = va;
                                });
                              },
                              items: statusList.map<DropdownMenuItem<String>>(
                                  (String values) {
                                return DropdownMenuItem<String>(
                                    value: values,
                                    child: CustomText(
                                      text: values,
                                      color: greyBlue,
                                      size: 14,
                                      weight: FontWeight.w300,
                                    ));
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
                  CustomText(
                      text: "Event Name",
                      size: 14,
                      color: ivoryBlack,
                      weight: FontWeight.w400),
                  SizedBox(
                    height: 6,
                  ),
                  TextWidgetField(),
                  SizedBox(height: 20),
                  CustomText(
                      text: "Project Connections",
                      size: 14,
                      color: ivoryBlack,
                      weight: FontWeight.w400),
                  SizedBox(
                    height: 6,
                  ),
                  TextWidgetField(),
                  SizedBox(height: 20),
                  CustomText(
                      text: "Programme Connections",
                      size: 14,
                      color: ivoryBlack,
                      weight: FontWeight.w400),
                  SizedBox(
                    height: 6,
                  ),
                  TextWidgetField(),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                      text: "Organization Connections",
                      size: 14,
                      color: ivoryBlack,
                      weight: FontWeight.w400),
                  SizedBox(
                    height: 6,
                  ),
                  RealDropDownWidget(
                    value: orgType,
                    onChanged: (va) {
                      setState(() {
                        orgType = va;
                      });
                    },
                    items:
                        orgList.map<DropdownMenuItem<String>>((String values) {
                      return DropdownMenuItem<String>(
                          value: values,
                          child: CustomText(
                            text: values,
                            color: greyBlue,
                            size: 14,
                            weight: FontWeight.w300,
                          ));
                    }).toList(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                      text: "Event Type",
                      size: 14,
                      color: ivoryBlack,
                      weight: FontWeight.w400),
                  SizedBox(
                    height: 6,
                  ),
                  RealDropDownWidget(
                    value: eventType,
                    onChanged: (va) {
                      setState(() {
                        eventType = va;
                      });
                    },
                    items: eventList
                        .map<DropdownMenuItem<String>>((String values) {
                      return DropdownMenuItem<String>(
                          value: values,
                          child: CustomText(
                            text: values,
                            color: greyBlue,
                            size: 14,
                            weight: FontWeight.w300,
                          ));
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  CustomText(
                      text: "Event Description",
                      size: 14,
                      color: ivoryBlack,
                      weight: FontWeight.w400),
                  SizedBox(
                    height: 6,
                  ),
                  TextWidgetField(
                    textPadding: EdgeInsets.symmetric(vertical: 70),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                      text: "Event Mode",
                      size: 14,
                      color: ivoryBlack,
                      weight: FontWeight.w400),
                  SizedBox(
                    height: 6,
                  ),
                  RealDropDownWidget(
                    value: eventMode,
                    onChanged: (va) {
                      setState(() {
                        eventMode = va;
                      });
                    },
                    items:
                        modeList.map<DropdownMenuItem<String>>((String values) {
                      return DropdownMenuItem<String>(
                          value: values,
                          child: CustomText(
                            text: values,
                            color: greyBlue,
                            size: 14,
                            weight: FontWeight.w300,
                          ));
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  CustomText(
                      text: "Target Audience",
                      size: 14,
                      color: ivoryBlack,
                      weight: FontWeight.w400),
                  SizedBox(
                    height: 6,
                  ),
                  TextWidgetField(),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                      text: "Internal Person Responsible",
                      size: 14,
                      color: ivoryBlack,
                      weight: FontWeight.w400),
                  SizedBox(
                    height: 6,
                  ),
                  RealDropDownWidget(
                    value: responsibleType,
                    onChanged: (va) {
                      setState(() {
                        responsibleType = va;
                      });
                    },
                    items: responsibleList
                        .map<DropdownMenuItem<String>>((String values) {
                      return DropdownMenuItem<String>(
                          value: values,
                          child: CustomText(
                            text: values,
                            color: greyBlue,
                            size: 14,
                            weight: FontWeight.w300,
                          ));
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  RealCheckBoxWidget(
                      value: contactPerson,
                      onChanged: (va) {
                        setState(() {
                          if (contactPerson == true) {
                            contactPerson = false;
                          } else {
                            contactPerson = true;
                          }
                        });
                      },
                      Labeltext: contactText),
                  SizedBox(height: 20),
                  CustomText(
                      text: "Location Name",
                      size: 14,
                      color: ivoryBlack,
                      weight: FontWeight.w400),
                  SizedBox(
                    height: 6,
                  ),
                  TextWidgetField(),
                  SizedBox(height: 20),
                  CustomText(
                      text: "Address",
                      size: 14,
                      color: ivoryBlack,
                      weight: FontWeight.w400),
                  SizedBox(
                    height: 6,
                  ),
                  TextWidgetField(),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                      text: "Date",
                      size: 14,
                      color: ivoryBlack,
                      weight: FontWeight.w400),
                  SizedBox(height: 6),
                  Stack(
                    children: [
                      TextWidgetField(
                        controller: _farmTypeController,
                      ),
                      Positioned(
                        right: !Responsive.isDesktop(context)
                            ? getWidth(context) / 100
                            : !Responsive.isDesktop(context)
                                ? getWidth(context) / 100
                                : getWidth(context) / 150,
                        top: !Responsive.isDesktop(context)
                            ? getWidth(context) / 80
                            : !Responsive.isDesktop(context)
                                ? getWidth(context) / 100
                                : getWidth(context) / 200,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            datePicker(context, _farmTypeController);
                          },
                          icon: Icon(
                            Icons.calendar_today_rounded,
                            color: Color(0xff768192),
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: getWidth(context) / 6,
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: "Time Start",
                                size: 14,
                                color: ivoryBlack,
                                weight: FontWeight.w400),
                            SizedBox(height: 6),
                            Stack(
                              children: [
                                TextWidgetField(
                                  controller: _startController,
                                ),
                                Positioned(
                                  right: !Responsive.isDesktop(context)
                                      ? getWidth(context) / 100
                                      : !Responsive.isDesktop(context)
                                          ? getWidth(context) / 100
                                          : getWidth(context) / 150,
                                  top: !Responsive.isDesktop(context)
                                      ? getWidth(context) / 80
                                      : !Responsive.isDesktop(context)
                                          ? getWidth(context) / 100
                                          : getWidth(context) / 200,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      timePicker(context, _startController);
                                    },
                                    icon: FaIcon(
                                      FontAwesomeIcons.clock,
                                      color: Color(0xff768192),
                                      size: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: getWidth(context) / 6,
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: "Time End",
                                size: 14,
                                color: ivoryBlack,
                                weight: FontWeight.w400),
                            SizedBox(height: 6),
                            Stack(
                              children: [
                                TextWidgetField(
                                  controller: _endController,
                                ),
                                Positioned(
                                  right: !Responsive.isDesktop(context)
                                      ? getWidth(context) / 100
                                      : !Responsive.isDesktop(context)
                                          ? getWidth(context) / 100
                                          : getWidth(context) / 150,
                                  top: !Responsive.isDesktop(context)
                                      ? getWidth(context) / 80
                                      : !Responsive.isDesktop(context)
                                          ? getWidth(context) / 100
                                          : getWidth(context) / 200,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      timePicker(context, _endController);
                                    },
                                    icon: FaIcon(
                                      FontAwesomeIcons.clock,
                                      color: Color(0xff768192),
                                      size: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
                    colors: dimMetalic3,
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AddTextButtonWidget(
                    text: "Save",
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

  imagePick() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageFile = image?.path;
    });
    debugPrint('image is $imageFile');
  }

  Future<void> datePicker(BuildContext context, _controller) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: fromDate,
        firstDate: DateTime(2021),
        lastDate: DateTime(2101));
    if (picked != null && picked != fromDate) {
      setState(() {
        var dateString = picked;
        format = Jiffy(dateString).format("dd-MMM-yyyy");
        _controller.text = format;
      });
    }
  }

  void timePicker(BuildContext context, controller) async {
    TimeOfDay _time = TimeOfDay(hour: 9, minute: 00);
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        controller.text = newTime.format(context);
      });
    }
  }
}
