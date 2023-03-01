import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
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

class AddNewFarmDialogWidget extends StatefulWidget {
  const AddNewFarmDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddNewFarmDialogWidget> createState() => _AddNewFarmDialogWidgetState();
}

class _AddNewFarmDialogWidgetState extends State<AddNewFarmDialogWidget> {
  var farmType = 'Select Type'.tr(),
      format = 'Select Date'.tr(),
      contactText = 'On Website'.tr(),
      contactPerson = false;
  var typeList = [
    'Select Type'.tr(),
    'Normal'.tr(),
    'Certified'.tr(),
    'Planet Proof'.tr(),
    'Bio-dynamic'.tr(),
    'Transition from normal to certified'.tr(),
    'Other'.tr()
  ];
  final TextEditingController _farmTypeController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  // Pick an image
  String? imageFile;
  DateTime fromDate = DateTime.now();
  var textProvince = 'Select Province'.tr(),
      textWaterBoard = 'Select Water Board'.tr(),
      textMunicipal = 'Select Municipal'.tr();
  var provinceList = [
        'Select Province'.tr(),
        'Noord-Holland'.tr(),
        'Zuid-Holland'.tr(),
        'Utrecht'.tr(),
        'Gelderland'.tr(),
        'Overijssel'.tr(),
        'Noord-Brabant'.tr(),
        'Zeeland'.tr(),
        'Limburg'.tr(),
        'Drenthe'.tr(),
        'Groningen'.tr(),
        'Friesland'.tr(),
        'Flevoland'.tr()
      ],
      municipalList = ['Select Municipal'.tr()],
      waterBoardList = ['Select Water Board'.tr()];

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
                      text: "Add Farm".tr(),
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
                        size: 21,
                        color: iconColors,
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
            child: Flex(
              mainAxisSize: MainAxisSize.min,
              direction: !Responsive.isDesktop(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Upload Farm Photo".tr(),
                        size: 14,
                        color: ivoryBlack,
                        weight: FontWeight.w400,
                      ),
                      SizedBox(height: 20),
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
                      SizedBox(height: 20),
                      CustomText(
                        text: "Farm Name".tr(),
                        size: 14,
                        weight: FontWeight.w400,
                        color: ivoryBlack,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      TextWidgetField(),
                      SizedBox(height: 20),
                      CustomText(
                        text: "Farm business Type".tr(),
                        size: 14,
                        weight: FontWeight.w400,
                        color: ivoryBlack,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      RealDropDownWidget(
                        value: farmType,
                        onChanged: (va) {
                          setState(() {
                            farmType = va;
                          });
                        },
                        items: typeList
                            .map<DropdownMenuItem<String>>((String values) {
                          return DropdownMenuItem<String>(
                              value: values,
                              child: CustomText(
                                text: values,
                                color: greyBlue,
                                weight: FontWeight.w300,
                              ));
                        }).toList(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: "Connected to WijLand Since".tr(),
                        size: 14,
                        weight: FontWeight.w400,
                        color: ivoryBlack,
                      ),
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
                        Labeltext: contactText,
                        labelColor: ivoryBlack,
                        labelWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: CustomText(
                            text: "Home Number".tr(),
                            color: ivoryBlack,
                          )),
                          SizedBox(
                            width: !Responsive.isDesktop(context)
                                ? 6
                                : !Responsive.isDesktop(context)
                                    ? 4
                                    : 12,
                          ),
                          Expanded(
                              child: CustomText(
                            text: "Street Number".tr(),
                            color: ivoryBlack,
                          )),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Expanded(child: TextWidgetField()),
                          SizedBox(
                            width: !Responsive.isDesktop(context)
                                ? 6
                                : !Responsive.isDesktop(context)
                                    ? 4
                                    : 12,
                          ),
                          Expanded(child: TextWidgetField()),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                              child: CustomText(
                            text: "Postal Number".tr(),
                            color: ivoryBlack,
                          )),
                          SizedBox(
                            width: !Responsive.isDesktop(context)
                                ? 6
                                : !Responsive.isDesktop(context)
                                    ? 4
                                    : 12,
                          ),
                          Expanded(
                              child: CustomText(
                            text: "Postal Letters".tr(),
                            color: ivoryBlack,
                          )),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Expanded(child: TextWidgetField()),
                          SizedBox(
                            width: !Responsive.isDesktop(context)
                                ? 6
                                : !Responsive.isDesktop(context)
                                    ? 4
                                    : 12,
                          ),
                          Expanded(child: TextWidgetField()),
                        ],
                      ),
                      SizedBox(height: 20),
                      CustomText(
                        text: "City".tr(),
                        color: ivoryBlack,
                      ),
                      SizedBox(height: 6),
                      TextWidgetField(),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                              child: CustomText(
                            text: "Latitude".tr(),
                            color: ivoryBlack,
                          )),
                          SizedBox(
                            width: !Responsive.isDesktop(context)
                                ? 6
                                : !Responsive.isDesktop(context)
                                    ? 4
                                    : 12,
                          ),
                          Expanded(
                              child: CustomText(
                            text: "Longitude".tr(),
                            color: ivoryBlack,
                          )),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Expanded(child: TextWidgetField()),
                          SizedBox(
                            width: !Responsive.isDesktop(context)
                                ? 6
                                : !Responsive.isDesktop(context)
                                    ? 4
                                    : 12,
                          ),
                          Expanded(child: TextWidgetField()),
                        ],
                      ),
                      SizedBox(height: 20),
                      CustomText(
                        text: "Province".tr(),
                        color: ivoryBlack,
                      ),
                      SizedBox(height: 6),
                      RealDropDownWidget(
                        value: textProvince,
                        onChanged: (va) {
                          setState(() {
                            textProvince = va;
                          });
                        },
                        items: provinceList
                            .map<DropdownMenuItem<String>>((String values) {
                          return DropdownMenuItem<String>(
                              value: values,
                              child: CustomText(
                                text: values,
                                color: greyBlue,
                                weight: FontWeight.w300,
                              ));
                        }).toList(),
                      ),
                      SizedBox(height: 20),
                      CustomText(
                        text: "Municipality".tr(),
                        color: ivoryBlack,
                      ),
                      SizedBox(height: 6),
                      RealDropDownWidget(
                        value: textMunicipal,
                        onChanged: (va) {
                          setState(() {
                            textMunicipal = va;
                          });
                        },
                        items: municipalList
                            .map<DropdownMenuItem<String>>((String values) {
                          return DropdownMenuItem<String>(
                              value: values,
                              child: CustomText(
                                text: values,
                                color: greyBlue,
                                weight: FontWeight.w300,
                              ));
                        }).toList(),
                      ),
                      SizedBox(height: 20),
                      CustomText(text: "Water Board".tr()),
                      SizedBox(height: 6),
                      RealDropDownWidget(
                        value: textWaterBoard,
                        onChanged: (va) {
                          setState(() {
                            textWaterBoard = va;
                          });
                        },
                        items: waterBoardList
                            .map<DropdownMenuItem<String>>((String values) {
                          return DropdownMenuItem<String>(
                              value: values,
                              child: CustomText(
                                text: values,
                                color: greyBlue,
                                weight: FontWeight.w300,
                              ));
                        }).toList(),
                      ),
                    ],
                  ),
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
                    text: "Cancel".tr(),
                    colors: dimMetalic3,
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AddTextButtonWidget(
                    text: "Add Farm".tr(),
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
    print('image is $imageFile');
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
