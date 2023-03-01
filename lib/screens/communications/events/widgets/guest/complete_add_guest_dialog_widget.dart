import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../app_common_widgets/text_widget.dart';
import '../../../../../utils/styles.dart';
import '../../../../office/widgets/add_text_button_widget.dart';

class CompleteAddGuestsDialogWidget extends StatefulWidget {
  const CompleteAddGuestsDialogWidget({Key? key}) : super(key: key);

  @override
  State<CompleteAddGuestsDialogWidget> createState() =>
      _CompleteAddGuestsDialogWidgetState();
}

class _CompleteAddGuestsDialogWidgetState
    extends State<CompleteAddGuestsDialogWidget> {
  var statusType = 'Select status',
      format = 'Select Date',
      internalGuest = 'Internal guest',
      internalSelect = true,
      externalGuest = 'External guest',
      externalSelect = false;
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
                      text: "Add Guest(s)",
                      size: 26,
                      color: ivoryBlack,
                      weight: FontWeight.w600,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Round of Invitations",
                      size: 14,
                      color: ivoryBlack,
                      weight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: internalSelect
                                    ? Colors.green
                                    : Colors.white,
                                primary: Colors.white,
                                fixedSize: Size(120, 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(32)),
                                )),
                            onPressed: () {
                              setState(() {
                                if (!internalSelect) {
                                  externalSelect = false;
                                  internalSelect = true;
                                }
                              });
                            },
                            icon: CustomText(
                                text: 'Round 1',
                                color: internalSelect
                                    ? Colors.white
                                    : Color(0xff333333)),
                            label: internalSelect
                                ? FaIcon(
                                    FontAwesomeIcons.check,
                                    size: 14,
                                  )
                                : SizedBox.shrink()),
                        SizedBox(
                          width: 24,
                        ),
                        OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: externalSelect
                                    ? Colors.green
                                    : Colors.white,
                                primary: Colors.white,
                                fixedSize: Size(120, 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(32)),
                                )),
                            onPressed: () {
                              setState(() {
                                if (!externalSelect) {
                                  internalSelect = false;
                                  externalSelect = true;
                                }
                              });
                            },
                            icon: CustomText(
                                text: 'Round 2',
                                color: externalSelect
                                    ? Colors.white
                                    : Color(0xff333333)),
                            label: externalSelect
                                ? FaIcon(
                                    FontAwesomeIcons.check,
                                    size: 14,
                                  )
                                : SizedBox.shrink()),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
                CustomText(
                  text: "Add a Note",
                  size: 15,
                  color: ivoryBlack,
                  weight: FontWeight.w400,
                ),
                SizedBox(
                  height: 8,
                ),
                TextWidgetField(
                  textPadding: EdgeInsets.symmetric(vertical: 50),
                ),
                SizedBox(
                  height: 12,
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
                    colors: Color(0xfff2f2f2),
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AddTextButtonWidget(
                    text: "Complete",
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
