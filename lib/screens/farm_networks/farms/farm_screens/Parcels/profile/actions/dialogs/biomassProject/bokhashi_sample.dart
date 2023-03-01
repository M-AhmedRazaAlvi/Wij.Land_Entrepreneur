import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/biomassProject/add_file_widget.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/biomassProject/bokashi_pilo_dialog.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/biomassProject/card_general_information.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/biomassProject/card_location_info.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/biomassProject/card_map_img.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/biomassProject/dialog_analysis.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/icon_text_container.dart';
import '../../../../../../../../../app_common_widgets/real_date_picker.dart';
import '../../../../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../../../../app_common_widgets/text_widget.dart';
import '../../../../../../../../../utils/controller.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../../../../../../office/office_programes/Widgets/on_hover_button_widget.dart';
import '../../../../../../../../office/widgets/add_text_button_widget.dart';
import '../../../../../../../../office/widgets/comment_text.dart';

class ActionBiomassBokashiSample extends StatefulWidget {
  const ActionBiomassBokashiSample({Key? key}) : super(key: key);

  @override
  State<ActionBiomassBokashiSample> createState() =>
      _ActionBiomassBokashiSampleState();
}

class _ActionBiomassBokashiSampleState
    extends State<ActionBiomassBokashiSample> {
  final TextEditingController actiondate = TextEditingController();
  final TextEditingController sentlabdate = TextEditingController();
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
  String? addPilo = 'Select Status';
  List<String> addPiloList = [
    'Select Status',
    'Planned',
    'Active',
    'Finished',
  ];
  int countBokashi = 0;
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
              text: "Biomass Project /Bokashi Sample",
              size: 25,
              weight: FontWeight.w900,
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(text: "Select Bokashi Pile"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  RealDropDownWidget(
                                    value: pileStatus,
                                    onChanged: (newValue) {
                                      setState(() {
                                        pileStatus = newValue;
                                      });
                                    },
                                    items: pileStatusList
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                          value: value, child: Text(value));
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            OnHoverButtonWidget(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return BokashiPiloAddDialog();
                                      });
                                },
                                icons: Icons.add)
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
                                height: 20,
                              ),
                              CustomText(text: "Sample sent to Lab"),
                              SizedBox(
                                height: 10,
                              ),
                              RealDatePickerWidget(dateController: sentlabdate),
                              SizedBox(
                                height: 20,
                              ),
                              CustomText(text: "Code as sent to Lab"),
                              SizedBox(
                                height: 10,
                              ),
                              TextWidgetField(),
                              SizedBox(
                                height: 20,
                              ),
                              CustomText(text: "Describe conditions"),
                              SizedBox(
                                height: 10,
                              ),
                              CommentTextField(),
                              SizedBox(
                                height: 20,
                              ),
                              CustomText(
                                text: "Files",
                                size: 20,
                              ),
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
