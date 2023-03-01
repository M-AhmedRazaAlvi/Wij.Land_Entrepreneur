import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiffy/jiffy.dart';
import 'package:wij_land/screens/communications/events/widgets/guest/complete_add_guest_dialog_widget.dart';
import 'package:wij_land/screens/communications/events/widgets/guest/external_guest_widget.dart';
import 'package:wij_land/screens/communications/events/widgets/guest/internal_guest_widget.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../../office/widgets/add_text_button_widget.dart';

class AddGuestsDialogWidget extends StatefulWidget {
  const AddGuestsDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddGuestsDialogWidget> createState() => _AddGuestsDialogWidgetState();
}

class _AddGuestsDialogWidgetState extends State<AddGuestsDialogWidget> {
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
                      size: 25,
                      weight: FontWeight.bold,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RealCheckBoxWidget(
                          value: internalSelect,
                          onChanged: (va) {
                            setState(() {
                              if (!internalSelect) {
                                externalSelect = false;
                                internalSelect = true;
                              }
                            });
                          },
                          Labeltext: internalGuest),
                      RealCheckBoxWidget(
                          value: externalSelect,
                          onChanged: (va) {
                            setState(() {
                              if (!externalSelect) {
                                internalSelect = false;
                                externalSelect = true;
                              }
                            });
                          },
                          Labeltext: externalGuest),
                    ],
                  ),
                  SizedBox(height: 40),
                  internalSelect
                      ? InternalGuestWidget()
                      : ExternalGuestWidget(),
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
                    colors: Color(0xfff2f2f2),
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AddTextButtonWidget(
                    text: "Next",
                    colors: Colors.yellow,
                    onPress: () {
                      showDialog(
                          context: context,
                          builder: (_) => CompleteAddGuestsDialogWidget());
                    },
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
