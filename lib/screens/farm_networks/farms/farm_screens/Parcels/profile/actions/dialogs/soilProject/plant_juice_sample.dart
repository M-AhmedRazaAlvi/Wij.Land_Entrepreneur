import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../app_common_widgets/counter_widget.dart';
import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/icon_text_container.dart';
import '../../../../../../../../../app_common_widgets/real_date_picker.dart';
import '../../../../../../../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../../../../../../../app_common_widgets/text_widget.dart';
import '../../../../../../../../../utils/controller.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../../../../../../office/widgets/add_text_button_widget.dart';
import '../biomassProject/add_file_widget.dart';
import '../biomassProject/card_general_information.dart';
import '../biomassProject/card_location_info.dart';
import '../biomassProject/card_map_img.dart';
import '../biomassProject/dialog_analysis.dart';

class PlantJuiceSample extends StatefulWidget {
  const PlantJuiceSample({Key? key}) : super(key: key);

  @override
  State<PlantJuiceSample> createState() => _PlantJuiceSampleState();
}

class _PlantJuiceSampleState extends State<PlantJuiceSample> {
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

//int countBokashi = 0;
  final double width = 45;
  int countpHSoil = 0;
  int countSoilTempre = 0;

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
              text: "Soil Project / Plant Juice Sample",
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
                              mSelectedValue: "",
                              mOnDropDownChange: (value) {},
                              mSelectedItemsList: [],
                              items: subParcelList,
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
                              Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  CustomText(
                                    text: "Addtional Information",
                                    size: 25,
                                    color: darkBlue,
                                  ),
                                  Container(
                                    alignment: Alignment.topRight,
                                    child: IconAndTextContainer(
                                      addText: "Analysis Results",
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return DialogAddAnalysis();
                                            });
                                      },
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              CustomText(text: "Sample send to Lab"),
                              SizedBox(
                                height: 10,
                              ),
                              RealDatePickerWidget(dateController: senddate),
                              SizedBox(
                                height: 15,
                              ),
                              CustomText(text: "Code as sent to Lab"),
                              SizedBox(
                                height: 10,
                              ),
                              TextWidgetField(),
                              SizedBox(
                                height: 15,
                              ),
                              CustomText(text: "pH of the Soil"),
                              SizedBox(
                                height: 10,
                              ),
                              CounterWidget(
                                count: countpHSoil,
                                onAddTap: () {
                                  setState(() {
                                    countpHSoil++;
                                  });
                                },
                                onCloseTap: () {
                                  setState(() {
                                    countpHSoil--;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              CustomText(text: "Soil Temperature °C"),
                              SizedBox(
                                height: 10,
                              ),
                              CounterWidget(
                                count: countSoilTempre,
                                onAddTap: () {
                                  setState(() {
                                    countSoilTempre++;
                                  });
                                },
                                onCloseTap: () {
                                  setState(() {
                                    countSoilTempre--;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomText(text: "Files", size: 20),
                              AddFilesWidget(
                                fileText: "FileName",
                                dateText: "O5-04-2022",
                                subjectText: "Juliel Solano",
                                width: !Responsive.isDesktop(context)
                                    ? getWidth(context) / 5
                                    : getWidth(context) / 10,
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
