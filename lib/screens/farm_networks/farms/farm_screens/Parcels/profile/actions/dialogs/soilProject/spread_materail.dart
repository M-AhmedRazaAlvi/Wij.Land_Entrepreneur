import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../app_common_widgets/counter_widget.dart';
import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../../../../../../../utils/controller.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../../../../../../office/widgets/add_text_button_widget.dart';
import '../biomassProject/card_general_information.dart';
import '../biomassProject/card_location_info.dart';
import '../biomassProject/card_map_img.dart';

class SpreadMaterialAmendment extends StatefulWidget {
  const SpreadMaterialAmendment({Key? key}) : super(key: key);

  @override
  State<SpreadMaterialAmendment> createState() =>
      _SpreadMaterialAmendmentState();
}

class _SpreadMaterialAmendmentState extends State<SpreadMaterialAmendment> {
  final TextEditingController actiondate = TextEditingController();
  final TextEditingController senddate = TextEditingController();
  List<String> parcelList = [
    "Amber Lemming",
    "Arjun Milan ",
    " Bob Martin",
  ];
  List<String> subParcelList = [
    "Amber Lemming",
    "Arjun Milan ",
    " Bob Martin",
  ];

  List<String> actionList = [
    "Amber Lemming",
    "Arjun Milan ",
    " Bob Martin",
  ];

  String? farms = 'Farm of Iona';
  List<String> farmList = [
    'Farm of Iona',
    'Farm of noone',
    'Farm of zikry',
    'Farm of tan',
  ];
  String? season = 'Fall';
  List<String> seasonList = [
    'Fall',
    'Autumn',
    'Spring',
    'Winter',
  ];
  String? pileStatus = 'Select Status';
  List<String> pileStatusList = [
    'Select Status',
    'Planned',
    'Active',
    'Finished',
  ];
  String? amendment = 'Select Amendment';
  List<String> amendmentList = [
    'Select Amendment',
    'Actimin',
    'Vulkamin',
  ];
  String? bokashiPile = 'Select Bokashi Pile';
  List<String> bokashiPileList = [
    'Select Bokashi Pile',
    'test',
    'test comment',
  ];
  final double width = 45;
  int countGift = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Obx(
                () => Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      CustomText(
                        text: menuController.activeItemRoute.value,
                        size: 20,
                        color: secondary,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: CustomText(
              text: "Soil Project / Amendment: spread material",
              size: 25,
              weight: FontWeight.bold,
              color: third,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AddTextButtonWidget(
                text: "Cancel",
                colors: Colors.white,
                onPress: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                width: 10,
              ),
              AddTextButtonWidget(
                text: "Save",
                colors: Colors.yellow,
                onPress: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: getWidth(context),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 20,
              children: [
                SizedBox(
                  width: !Responsive.isDesktop(context)
                      ? getWidth(context)
                      : getWidth(context) * 0.47,
                  child: Column(
                    children: [
                      CardLocationInformation(
                        action: false,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            SelectableDropdownWidget(
                              widthSize: !Responsive.isDesktop(context)
                                  ? getWidth(context) * 0.87
                                  : getWidth(context) * 0.45,
                              items: parcelList,
                              mSelectedValue: "",
                              mOnDropDownChange: (value) {},
                              mSelectedItemsList: [],
                              title: "Parcel",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SelectableDropdownWidget(
                              widthSize: !Responsive.isDesktop(context)
                                  ? getWidth(context) * 0.87
                                  : getWidth(context) * 0.45,
                              items: subParcelList,
                              mSelectedValue: "",
                              mOnDropDownChange: (value) {},
                              mSelectedItemsList: [],
                              title: "Sub Parcel",
                            ),
                          ],
                        ),
                      ),
                      CardGeneralInformation(
                          farmOgrInfo: false,
                          farms: farms,
                          onClickedFarms: (newValue) {
                            setState(() {
                              farms = newValue;
                            });
                          },
                          farmList: farmList,
                          actionList: actionList,
                          actiondate: actiondate,
                          season: season,
                          onClickedseason: (newValue) {
                            setState(() {
                              season = newValue;
                            });
                          },
                          seasonList: seasonList),
                      Card(
                        elevation: 3,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CustomText(
                                text: "Addtional Information",
                                size: 25,
                                color: darkBlue,
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              CustomText(text: "Gift (kg/ha)"),
                              SizedBox(
                                height: 10,
                              ),
                              CounterWidget(
                                count: countGift,
                                onAddTap: () {
                                  setState(() {
                                    countGift++;
                                  });
                                },
                                onCloseTap: () {
                                  setState(() {
                                    countGift--;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              CustomText(text: "Amendment"),
                              SizedBox(
                                height: 5,
                              ),
                              RealDropDownWidget(
                                value: amendment,
                                onChanged: (newValue) {
                                  setState(() {
                                    amendment = newValue;
                                  });
                                },
                                items: amendmentList
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                      value: value, child: Text(value));
                                }).toList(),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              CustomText(text: "Bokashi Pile"),
                              SizedBox(
                                height: 5,
                              ),
                              RealDropDownWidget(
                                value: bokashiPile,
                                onChanged: (newValue) {
                                  setState(() {
                                    bokashiPile = newValue;
                                  });
                                },
                                items: bokashiPileList
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                      value: value, child: Text(value));
                                }).toList(),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: !Responsive.isDesktop(context)
                      ? getWidth(context)
                      : getWidth(context) * 0.47,
                  child: CardMapAndImage(),
                )
              ],
            ),
          )
        ]),
      ),
    ));
  }
}
