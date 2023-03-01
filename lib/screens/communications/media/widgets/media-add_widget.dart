import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:wij_land/screens/communications/media/widgets/media_constants.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/on_hover.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../app_common_widgets/text_widget.dart';
import '../../../../utils/functions.dart';
import '../../../office/widgets/add_text_button_widget.dart';

class AddMediaWidget extends StatefulWidget {
  const AddMediaWidget({Key? key}) : super(key: key);

  @override
  State<AddMediaWidget> createState() => _AddMediaWidgetState();
}

class _AddMediaWidgetState extends State<AddMediaWidget> {
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
                          size: 26,
                          text: 'Media Range',
                        )),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 30),
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
                                text: "Add Media",
                                colors: Colors.yellow,
                                onPress: () {},
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      width: getWidth(context),
                      height: getHeight(context) / 2.5,
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        dashPattern: const [4, 4],
                        radius: Radius.circular(4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          child: Center(
                            child: TextButton.icon(
                              onPressed: () {
                                //  imagePick();
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.plus,
                                color: Color(0xff3c4b64),
                                size: 16,
                              ),
                              label: Text(
                                'Add a cover image',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomText(
                      text: "Add File",
                      size: 14,
                      color: Color(0xff231f20),
                      weight: FontWeight.w800,
                    ),
                    SizedBox(height: 12),
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
                              // imagePick();
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
                    SizedBox(height: 20),
                    CustomText(
                      text: "Title",
                      size: 14,
                      color: Color(0xff231f20),
                      weight: FontWeight.w800,
                    ),
                    SizedBox(height: 8),
                    TextWidgetField(),
                    SizedBox(height: 20),
                    CustomText(
                      text: "Date",
                      size: 14,
                      color: Color(0xff231f20),
                      weight: FontWeight.w800,
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
                      color: Color(0xff231f20),
                      weight: FontWeight.w800,
                    ),
                    SizedBox(height: 8),
                    TextWidgetField(),
                    SizedBox(height: 20),
                    CustomText(
                      text: "Type",
                      size: 14,
                      color: Color(0xff231f20),
                      weight: FontWeight.w800,
                    ),
                    SizedBox(height: 8),
                    RealDropDownWidget(
                      value: categoryType,
                      onChanged: (va) {
                        setState(() {
                          categoryType = va;
                        });
                      },
                      items: categoryList
                          .map<DropdownMenuItem<String>>((String values) {
                        return DropdownMenuItem<String>(
                            value: values, child: Text(values));
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    CustomText(
                      text: "Published where",
                      size: 14,
                      color: Color(0xff231f20),
                      weight: FontWeight.w800,
                    ),
                    SizedBox(height: 8),
                    TextWidgetField(),
                    SizedBox(height: 20),
                    CustomText(
                      text: "Range of medium (#people)",
                      size: 14,
                      color: Color(0xff231f20),
                      weight: FontWeight.w800,
                    ),
                    SizedBox(height: 8),
                    OnHover(builder: (hover) {
                      return Stack(
                        children: [
                          TextWidgetField(),
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
                                              int currentValue =
                                                  int.parse(controller.text);
                                              setState(() {
                                                currentValue++;
                                                controller.text = (currentValue)
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
                                            int currentValue =
                                                int.parse(controller.text);
                                            setState(() {
                                              print("Setting state");
                                              currentValue--;
                                              controller.text = (currentValue >
                                                          0
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
                    SizedBox(height: 20),
                    CustomText(
                      text: "Reach of article (#people)",
                      size: 14,
                      color: Color(0xff231f20),
                      weight: FontWeight.w800,
                    ),
                    SizedBox(height: 8),
                    OnHover(builder: (hover) {
                      return Stack(
                        children: [
                          TextWidgetField(),
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
                                              int currentValue =
                                                  int.parse(controller.text);
                                              setState(() {
                                                currentValue++;
                                                controller.text = (currentValue)
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
                                            int currentValue =
                                                int.parse(controller.text);
                                            setState(() {
                                              print("Setting state");
                                              currentValue--;
                                              controller.text = (currentValue >
                                                          0
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
                    SizedBox(height: 20),
                    CustomText(
                      text: "Division Factor",
                      size: 14,
                      color: Color(0xff231f20),
                      weight: FontWeight.w800,
                    ),
                    SizedBox(height: 8),
                    OnHover(builder: (hover) {
                      return Stack(
                        children: [
                          TextWidgetField(
                            controller: controller,
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
                                              int currentValue =
                                                  int.parse(controller.text);
                                              setState(() {
                                                currentValue++;
                                                controller.text = (currentValue)
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
                                            int currentValue =
                                                int.parse(controller.text);
                                            setState(() {
                                              print("Setting state");
                                              currentValue--;
                                              controller.text = (currentValue >
                                                          0
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
                    SizedBox(height: 20),
                    CustomText(
                      text: "Remarks",
                      size: 14,
                      color: Color(0xff231f20),
                      weight: FontWeight.w800,
                    ),
                    SizedBox(height: 8),
                    TextWidgetField(),
                    SizedBox(height: 20),
                    CustomText(
                      text: "Links",
                      size: 14,
                      color: Color(0xff231f20),
                      weight: FontWeight.w800,
                    ),
                    SizedBox(height: 8),
                    TextWidgetField(),
                    SizedBox(height: 20),
                    CustomText(
                      text: "Reason",
                      size: 14,
                      color: Color(0xff231f20),
                      weight: FontWeight.w800,
                    ),
                    SizedBox(height: 8),
                    TextWidgetField(),
                    SizedBox(height: 20),
                    CustomText(
                      text: "Responsible",
                      size: 14,
                      color: Color(0xff231f20),
                      weight: FontWeight.w800,
                    ),
                    SizedBox(height: 8),
                    RealDropDownWidget(
                      value: responseType,
                      onChanged: (va) {
                        setState(() {
                          responseType = va;
                        });
                      },
                      items: responseList
                          .map<DropdownMenuItem<String>>((String values) {
                        return DropdownMenuItem<String>(
                            value: values, child: Text(values));
                      }).toList(),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
                            text: "Add Media",
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
