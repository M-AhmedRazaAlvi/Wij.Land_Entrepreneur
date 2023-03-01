import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../../../app_common_widgets/text_widget.dart';
import '../../../../../utils/functions.dart';
import '../../../../../utils/responsive.dart';
import '../../../../office/widgets/add_text_button_widget.dart';

class EditFileListDialogWidget extends StatefulWidget {
  const EditFileListDialogWidget({Key? key}) : super(key: key);

  @override
  State<EditFileListDialogWidget> createState() =>
      _EditFileListDialogWidgetState();
}

class _EditFileListDialogWidgetState extends State<EditFileListDialogWidget> {
  DateTime fromDate = DateTime.now();
  var format = 'Select Date',
      contactText = 'Share with farm.computer user',
      contactPerson = false,
      farmList = [
        'Farm of Ajay Jadeja',
        'Farm of Donald Roa,Zevenbergen',
        'Farm of Elliot Mass',
        'Farm of FLeurette Goode',
        'Farm of Freya Fionannian'
      ],
      parcelList = ['p01', 'p02', 'p03', 'p04', 'p05' 'p06', 'p07'],
      projectList = [
        'Arable Land',
        'August Project',
        'Biomass Project',
        'Carbon sequestration',
        'Fun Project',
        'Grazing Project'
      ],
      orgList = ['Better Soil', 'LTO', 'Max India', 'Green Leaf'],
      eventList = [
        'Biodiversity Event',
        'Bodemexcursie',
        'check event',
        'Farmer Ellie visit',
        'Farmers market'
      ];
  final TextEditingController _dateController =
      TextEditingController(text: 'Select Date');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Edit File ",
                    size: 26,
                    weight: FontWeight.w700,
                    color: Color(0xff231f20),
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
          width: MediaQuery.of(context).size.width * 0.67,
          height: getHeight(context),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: FaIcon(
                        FontAwesomeIcons.filePdf,
                        color: Color(0xff3C4B64),
                        size: 50,
                      ),
                    ),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(
                                top: 12, left: 50, right: 130, bottom: 12),
                            padding: EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xff7CFC00), width: 3))),
                            child: CustomText(
                              text: "53 Back on Track Meal Planner.pdf",
                              size: 16,
                              color: Color(0xff3c4b64),
                            ))),
                  ],
                ),
                SizedBox(height: 20),
                CustomText(
                  text: "Date",
                  size: 14,
                ),
                SizedBox(height: 6),
                Stack(
                  children: [
                    TextWidgetField(
                      controller: _dateController,
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
                          datePicker(context, _dateController);
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.calendarAlt,
                          color: Color(0xff768192),
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Divider(
                  color: Color(0xffE5E5E5),
                  indent: 8,
                  endIndent: 8,
                  thickness: 0.6,
                ),
                SizedBox(height: 20),
                CustomText(
                  text: "Sharing",
                  size: 18,
                  weight: FontWeight.w700,
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
                  text: "Sharing",
                  size: 14,
                ),
                TextWidgetField(),
                SizedBox(height: 20),
                CustomText(
                  text: "Add Tags",
                  size: 28,
                  weight: FontWeight.bold,
                ),
                SizedBox(height: 8),
                CustomText(
                  text: "These tags will apply to all files",
                  size: 16,
                  weight: FontWeight.w400,
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: SelectableDropdownWidget(
                      title: 'Farms',
                      items: farmList,
                      widthSize: getWidth(context) * 0.35,
                      mSelectedValue: "",
                      mOnDropDownChange: (value) {},
                      mSelectedItemsList: [],
                    )),
                    SizedBox(
                      width: !Responsive.isDesktop(context)
                          ? 6
                          : !Responsive.isDesktop(context)
                              ? 4
                              : 12,
                    ),
                    Expanded(
                        child: SelectableDropdownWidget(
                      title: 'Parcel',
                      items: parcelList,
                      mSelectedValue: "",
                      mOnDropDownChange: (value) {},
                      mSelectedItemsList: [],
                    )),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                    width: getWidth(context) * 0.3,
                    child: SelectableDropdownWidget(
                      title: 'Project',
                      items: projectList,
                      widthSize: getWidth(context) * 0.35,
                      mSelectedValue: "",
                      mOnDropDownChange: (value) {},
                      mSelectedItemsList: [],
                    )),
                SizedBox(height: 20),
                SizedBox(
                    width: getWidth(context) * 0.30,
                    child: SelectableDropdownWidget(
                      title: 'Organization',
                      items: orgList,
                      widthSize: getWidth(context) * 0.35,
                      mSelectedValue: "",
                      mOnDropDownChange: (value) {},
                      mSelectedItemsList: [],
                    )),
                SizedBox(height: 20),
                SizedBox(
                    width: getWidth(context) * 0.3,
                    child: SelectableDropdownWidget(
                      title: 'Event',
                      items: eventList,
                      widthSize: getWidth(context) * 0.35,
                      mSelectedValue: "",
                      mOnDropDownChange: (value) {},
                      mSelectedItemsList: [],
                    )),
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
                  width: 20,
                ),
                AddTextButtonWidget(
                  text: "Update",
                  colors: Colors.yellow,
                  onPress: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
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
}
