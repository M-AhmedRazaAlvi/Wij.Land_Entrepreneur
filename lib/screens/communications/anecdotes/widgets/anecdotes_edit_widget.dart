import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../app_common_widgets/text_widget.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/images.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../../office/widgets/add_text_button_widget.dart';
import '../../media/widgets/media_constants.dart';

class EditAnecdotesWidget extends StatefulWidget {
  const EditAnecdotesWidget({Key? key}) : super(key: key);

  @override
  State<EditAnecdotesWidget> createState() => _EditAnecdotesWidgetState();
}

class _EditAnecdotesWidgetState extends State<EditAnecdotesWidget> {
  var impactType = 'Select',
      impactList = ['Select', 'Positive', 'Negative', 'Neutral'];
  var projectType = 'Select',
      projectList = [
        'Select',
        'August Project',
        'Biomass Project',
        'Fun Project',
        'Soil Project'
      ];
  var personType = 'Select',
      personList = [
        'Select',
        'Amber Lemming',
        'Ajay Jadeja',
        'Bob Martin',
        'Faraz Akram'
      ];
  var orgType = 'Select',
      orgList = ['Select', 'Better Soils', 'Green Leaf', 'LTO', 'Wij.Land'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: CustomText(
                          size: 28,
                          text: 'Anecdotes',
                          weight: FontWeight.w300,
                          color: darkBlue,
                        )),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
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
                                text: "Update",
                                colors: Colors.yellow,
                                onPress: () {},
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        border: Border.all(color: Colors.black26, width: 0.5),
                      ),
                      padding: EdgeInsets.all(1),
                      width: getWidth(context),
                      height: getHeight(context) / 2,
                      child: Image.asset(
                        Images.wallpaper,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 12),
                    Flex(
                      direction: !Responsive.isDesktop(context)
                          ? Axis.vertical
                          : Axis.horizontal,
                      mainAxisAlignment: !Responsive.isDesktop(context)
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 50),
                          width: !Responsive.isDesktop(context)
                              ? getWidth(context)
                              : getWidth(context) / 3,
                          height: getHeight(context) / 1.9,
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            dashPattern: const [4, 4],
                            radius: Radius.circular(4),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              child: Center(
                                child: TextButton.icon(
                                  onPressed: () {
                                    //  imagePick();
                                  },
                                  icon: FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: greyBlue,
                                    size: 16,
                                  ),
                                  label: CustomText(
                                    text: 'Add a cover image',
                                    color: ivoryBlack,
                                    weight: FontWeight.w300,
                                    size: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Tags",
                              size: 20,
                              color: darkBlue,
                              weight: FontWeight.w300,
                            ),
                            SizedBox(height: 20),
                            CustomText(
                              text: "Project",
                              size: 14,
                              color: ivoryBlack,
                              weight: FontWeight.w400,
                            ),
                            SizedBox(height: 8),
                            SizedBox(
                              width: !Responsive.isDesktop(context)
                                  ? getWidth(context)
                                  : getWidth(context) / 2.5,
                              child: RealDropDownWidget(
                                value: projectType,
                                onChanged: (va) {
                                  setState(() {
                                    projectType = va;
                                  });
                                },
                                items: projectList
                                    .map<DropdownMenuItem<String>>(
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
                            SizedBox(height: 20),
                            CustomText(
                              text: "Person",
                              size: 14,
                              color: ivoryBlack,
                              weight: FontWeight.w400,
                            ),
                            SizedBox(height: 8),
                            SizedBox(
                              width: !Responsive.isDesktop(context)
                                  ? getWidth(context)
                                  : getWidth(context) / 2.5,
                              child: RealDropDownWidget(
                                value: personType,
                                onChanged: (va) {
                                  setState(() {
                                    personType = va;
                                  });
                                },
                                items: personList.map<DropdownMenuItem<String>>(
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
                            SizedBox(height: 20),
                            CustomText(
                              text: "Organization",
                              size: 14,
                              color: ivoryBlack,
                              weight: FontWeight.w400,
                            ),
                            SizedBox(height: 8),
                            SizedBox(
                              width: !Responsive.isDesktop(context)
                                  ? getWidth(context)
                                  : getWidth(context) / 2.5,
                              child: RealDropDownWidget(
                                value: orgType,
                                onChanged: (va) {
                                  setState(() {
                                    orgType = va;
                                  });
                                },
                                items: orgList.map<DropdownMenuItem<String>>(
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
                    SizedBox(height: 28),
                    CustomText(
                      text: "Title",
                      size: 14,
                      color: ivoryBlack,
                      weight: FontWeight.w400,
                    ),
                    SizedBox(height: 8),
                    TextWidgetField(),
                    SizedBox(height: 20),
                    CustomText(
                      text: "Date",
                      size: 14,
                      color: ivoryBlack,
                      weight: FontWeight.w400,
                    ),
                    SizedBox(height: 8),
                    Stack(
                      children: [
                        TextWidgetField(
                          controller: dateController,
                        ),
                        Positioned(
                            right: 5,
                            top: 5,
                            child: IconButton(
                                onPressed: () {
                                  datePicker(context, dateController);
                                },
                                icon: FaIcon(
                                  FontAwesomeIcons.calendar,
                                  color: Colors.black,
                                  size: 16,
                                ))),
                      ],
                    ),
                    SizedBox(height: 20),
                    CustomText(
                      text: "Description",
                      size: 14,
                      color: ivoryBlack,
                      weight: FontWeight.w400,
                    ),
                    SizedBox(height: 8),
                    TextWidgetField(),
                    SizedBox(height: 20),
                    CustomText(
                      text: "Impact Direction",
                      size: 14,
                      color: ivoryBlack,
                      weight: FontWeight.w400,
                    ),
                    SizedBox(height: 8),
                    RealDropDownWidget(
                      value: impactType,
                      onChanged: (va) {
                        setState(() {
                          impactType = va;
                        });
                      },
                      items: impactList
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
                      text: "Who brought it up?",
                      size: 14,
                      color: ivoryBlack,
                      weight: FontWeight.w400,
                    ),
                    SizedBox(height: 8),
                    TextWidgetField(),
                    SizedBox(height: 20),
                    CustomText(
                      text: "Which Communication",
                      size: 14,
                      color: ivoryBlack,
                      weight: FontWeight.w400,
                    ),
                    SizedBox(height: 8),
                    TextWidgetField(),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
                            text: "Update",
                            colors: Colors.yellow,
                            onPress: () {},
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
