import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../utils/functions.dart';
import '../../../../office/widgets/add_text_button_widget.dart';

class AddFileDialogWidget extends StatefulWidget {
  String? title;

  AddFileDialogWidget({Key? key, required this.title}) : super(key: key);

  @override
  State<AddFileDialogWidget> createState() => _AddFileDialogWidgetState();
}

class _AddFileDialogWidgetState extends State<AddFileDialogWidget> {
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
                      text: "Add ${widget.title}",
                      size: 24,
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
          content: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DottedBorder(
                  borderType: BorderType.RRect,
                  dashPattern: const [4, 4],
                  radius: Radius.circular(4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    child: SizedBox(
                      height: 150,
                      width: getWidth(context),
                      child: /*imageFile!=null?Image.file(File('$imageFile')):*/ TextButton
                          .icon(
                        onPressed: () {
                          imagePick();
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.plus,
                          color: Color(0xff3c4b64),
                          size: 16,
                        ),
                        label: Text(
                          'Add Files',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
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
                    text: "Upload",
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
