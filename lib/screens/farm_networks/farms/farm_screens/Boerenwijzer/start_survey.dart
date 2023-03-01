import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Boerenwijzer/widget/energy_widget.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Boerenwijzer/widget/ground_water_widget.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Boerenwijzer/widget/herb_richness_widget.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Boerenwijzer/widget/lanscape_element.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Boerenwijzer/widget/meadow_birds_widget.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Boerenwijzer/widget/nutrients_widget.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Boerenwijzer/widget/property_layout_widget.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Boerenwijzer/widget/soil_life_widget.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Boerenwijzer/widget/soil_structure.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Boerenwijzer/widget/surface_water_widget.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../utils/functions.dart';
import '../../../../../utils/responsive.dart';
import '../../../../../utils/styles.dart';
import '../../../../office/widgets/add_text_button_widget.dart';

class BoerenwijzerStartSurvey extends StatefulWidget {
  const BoerenwijzerStartSurvey({Key? key}) : super(key: key);

  @override
  State<BoerenwijzerStartSurvey> createState() =>
      _BoerenwijzerStartSurveyState();
}

class _BoerenwijzerStartSurveyState extends State<BoerenwijzerStartSurvey> {
  List<String> selectedProvinceList = [];
  List<String> textTimeline = <String>[
    "Nutrients",
    "Soil Structure",
    "Soil Life",
    "Ground Water",
    "Surface Water",
    "Energy",
    "Meadow Birds",
    "Herb Richness",
    "Property Layout",
    "Landscape Elements",
    "Pesticides",
    "Grazing",
    "Local Protein",
    "Animal Welfare",
    "Animal Health",
    "Economic Resilience",
    "Labour",
    "Chain Relationships",
    "Community Involvement",
    "Culture and Identity",
    "Knowledge Development",
    "Job Satisfaction",
    "Future Proof",
    "Visibility",
  ];
  List<bool> titelBool = <bool>[];
  @override
  void initState() {
    super.initState();
    titelBool = List.filled(24, false);
    titelBool[0] = true;
  }

  bool nextClicked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(children: [
            SizedBox(
              width: getWidth(context),
              child: Wrap(
                runSpacing: 20,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: !Responsive.isDesktop(context)
                        ? getWidth(context)
                        : getWidth(context) * 0.15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomText(
                          text: "Theme Title",
                          size: 22,
                          color: darkBlue,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        for (int i = 0; i < 24; i++)
                          InkWell(
                            child: TimelineTile(
                              isFirst: false,
                              afterLineStyle: LineStyle(color: Colors.black12),
                              beforeLineStyle: LineStyle(color: Colors.black12),
                              indicatorStyle: IndicatorStyle(
                                color: Colors.purple,
                                iconStyle: IconStyle(
                                  color: Colors.white,
                                  iconData: Icons.insert_emoticon,
                                ),
                              ),
                              endChild: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.all(10),
                                child: CustomText(
                                  text: textTimeline[i],
                                  size: titelBool[i] ? 18 : 14,
                                  weight: titelBool[i]
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                if (nextClicked == true) {
                                  titelBool[i] = false;
                                  titelBool[i + 1] = true;
                                }
                                if (titelBool.contains(true)) {
                                  titelBool = List.filled(24, false);
                                  titelBool[i] = true;
                                  nextClicked = false;
                                } else {
                                  titelBool[i] = false;
                                  titelBool[i + 1] = true;
                                }
                              });
                            },
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: !Responsive.isDesktop(context)
                        ? getWidth(context)
                        : getWidth(context) * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (int i = 0; i < 24; i++)
                                  titelBool[i] == true
                                      ? CustomText(
                                          text: textTimeline[i],
                                          size: 22,
                                        )
                                      : SizedBox(),
                              ],
                            ),
                            if (nextClicked)
                              Align(
                                alignment: Alignment.topRight,
                                child: AddTextButtonWidget(
                                  text: "Next",
                                  colors: Colors.yellow,
                                  onPress: () {
                                    setState(() {
                                      if (titelBool[0] == true) {
                                        nextClicked = true;
                                      } else {
                                        nextClicked = false;
                                      }
                                    });
                                  },
                                ),
                              )
                            else
                              Align(
                                alignment: Alignment.topRight,
                                child: Wrap(
                                  spacing: 15,
                                  children: [
                                    AddTextButtonWidget(
                                      text: "Previous",
                                      colors: Colors.yellow,
                                      onPress: () {
                                        setState(() {
                                          nextClicked = !nextClicked;
                                        });
                                      },
                                    ),
                                    AddTextButtonWidget(
                                      text: "Next",
                                      colors: Colors.yellow,
                                      onPress: () {
                                        // setState(() {
                                        //   nextClicked = !nextClicked;
                                        // });
                                      },
                                    ),
                                  ],
                                ),
                              )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        titelBool[0] ? NutrientsWidget() : Container(),
                        titelBool[1] ? SoilStructureWidget() : Container(),
                        titelBool[2] ? SoilLifeWidget() : Container(),
                        titelBool[3] ? GroundWaterWidget() : Container(),
                        titelBool[4] ? SurfaceWaterWidget() : Container(),
                        titelBool[5] ? EnergyWidget() : Container(),
                        titelBool[6] ? MeadowBirdsWidget() : Container(),
                        titelBool[7] ? HerbRichNessWidget() : Container(),
                        titelBool[8] ? PropertyLayoutWidget() : Container(),
                        titelBool[9] ? LandscapeElementWidget() : Container(),
                        //   titelBool[10] ? SoilStructureWidget() : Container(),
                        //   titelBool[11] ? SoilLifeWidget() : Container(),
                        //   titelBool[12] ? NutrientsWidget() : Container(),
                        //   titelBool[13] ? SoilStructureWidget() : Container(),
                        //   titelBool[14] ? SoilLifeWidget() : Container(),
                        //   titelBool[15] ? NutrientsWidget() : Container(),
                        //   titelBool[16] ? SoilStructureWidget() : Container(),
                        //   titelBool[17] ? SoilLifeWidget() : Container(),
                        //   titelBool[18] ? SoilLifeWidget() : Container(),
                        //   titelBool[19] ? NutrientsWidget() : Container(),
                        //   titelBool[20] ? SoilStructureWidget() : Container(),
                        //   titelBool[21] ? SoilLifeWidget() : Container(),
                        //   titelBool[22] ? NutrientsWidget() : Container(),
                        //   titelBool[23] ? SoilStructureWidget() : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
