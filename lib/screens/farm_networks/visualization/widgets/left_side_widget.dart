import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../app_common_widgets/counter_widget.dart';
import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../../app_common_widgets/text_widget.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';

class LeftSideWidget extends StatefulWidget {
  const LeftSideWidget({Key? key}) : super(key: key);

  @override
  State<LeftSideWidget> createState() => _LeftSideWidgetState();
}

class _LeftSideWidgetState extends State<LeftSideWidget> {
  int solidCount = 0,
      nCount = 0,
      nh3Count = 0,
      ditchCount = 0,
      bufferCount = 0,
      windCount = 0,
      herbCount = 0,
      areaCount = 0,
      fruitTreesCount = 0,
      typeTreeCount = 0,
      woodWallCount = 0,
      branchMeterCount = 0,
      boxAmountCount = 0,
      hotelAmountCount = 0,
      grazingHourCount = 0,
      proteinsCount = 0,
      activityCount = 0;
  List<String> tillYearList = ['Select'];
  List<String> freeDitchList = ['Select', 'yes', 'no'];
  List<String> edgeDitchList = ['Select', 'yes', 'no'];
  List<String> machineryList = ['Select', 'yes', 'no'];
  List<String> recoveryList = ['Select', 'yes', 'no'];
  List<String> managementList = ['Select', 'yes', 'no'];
  List<String> infiltrationList = ['Select', 'yes', 'no'];
  List<String> zoneList = ['Select', 'yes', 'no'];
  List<String> herbrichList = ['Select', 'yes', 'no'];
  List<String> protectionList = ['Select', 'true', 'false'];
  List<String> byProductsList = ['Select', 'true', 'false'];
  List<String> measureList = ['Select', 'Estimate', 'Measure'];
  List<String> herbsList = ['Select', 'Ingezaaid', 'Doorgezaaid'];
  List<String> preventHerbsList = [
    'Select',
    'Nee',
    'Alleen op grasland',
    'Op grasland en akkerland'
  ];
  List<String> curativeHerbsList = [
    'Select',
    'Nee',
    'Alleen op grasland',
    'Op grasland en akkerland'
  ];
  List<String> productsList = [
    'Snijmais',
    'Restromen',
    'Lokaal gras',
    'Kuilgras',
    'Krachtvoer'
  ];
  List<String> typeFertileList = ['kas', 'Amine', 'Anders', 'Urenum'];
  List<String> manureTypeList = [
    'Geen mest',
    'Kunstmest',
    'Drijfmest',
    'Vaste Mest',
    'Paardenmest',
    'Varkensmest'
  ];
  List<String> methodFertileList = [
    'Bovengronds',
    'Geen Bemesting',
    'Injecteren',
    'Ketsplaat',
    'Strooier',
    'Sleepslang'
  ];
  List<String> tillTypeList = [
    'Diepploegen',
    'Molpoot',
    'Niet bewerkt',
    'Gefreesd',
    'Geploegd',
    'Gespit',
    'Niet-kerende grondbewerking'
  ];
  List<String> approachList = [
    'Geen slootschonen',
    'Baggerspuit',
    'Helofytefilter',
    'Ecologisch schonen',
  ];
  List<String> protectionsList = [
    'Geen nestbescherming',
    'Mozaikbeheer',
    'Voorbeweiden',
    'Uitgesteld maaien',
    'Legselbeheer'
  ];
  List<String> elementsList = [
    'Bloementuin',
    'Bijenkorf',
    'Erfscan-elementen',
    'Vruchtdragende bomen',
    'Overige bomen en struiken',
    'Nestasten',
    'broedplaatsen voor vogels',
    'voedselhagen',
    'houtwallen',
    'takkenrillen',
    'Amfibieenpoel'
  ];
  List<String> activityList = [
    'Recreatie',
    'Natuursubsidies',
    'Horeca',
    'Overnachting',
    'Zaalverhuur',
    'Educatie',
    'Melktap',
    'Eieren verkoop',
    'Kaas verkoop',
    'Groente verkoop',
    'Winkel'
  ];
  List<String> mineralList = [
    'Geen minerale bodemverbeteraars',
    'Actimin',
    'Vulkamin',
    'Eierschalen',
    'Kalk',
    'Kleimineraal',
    'Gips',
    'Calciumkorrel'
  ];
  List<String> organicList = [
    'Geen organische bodemverbeteraars',
    'Drifmest',
    'Vaste mest',
    'Bokashi',
    'Houtsnippers',
    'Compost',
    'Wormenthee',
    'Koolzaadstro'
  ];
  List<String> appliedList = [
    'Geen',
    'Productief',
    'Biodivers',
    'Zeer kruidenrijk',
    'Puregraze',
    'Wilder Land',
    'Neutkens',
    'Ten Have',
    'Kuikenmengsel',
    'Natuurgrasland',
    'Weidevogelmengsel',
    'Other'
  ];

  String tillYear = 'Select',
      freeDitch = 'Select',
      edgeDitch = 'Select',
      machineryText = 'Select',
      recoveryText = 'Select',
      protectionText = 'Select',
      format = 'Select date',
      managementText = 'Select',
      infiltrationText = 'Select',
      zoneText = 'Select',
      measureText = 'Select',
      herbrichText = 'Select',
      herbsText = 'Select',
      preventHerbsText = 'Select',
      curativeHerbsText = 'Select',
      byProductsText = 'Select';

  TextEditingController dateController =
      TextEditingController(text: 'dd/MM/yyyy');
  DateTime fromDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (int i = 2022; i > 1799; i--) {
      tillYearList.add(i.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Nutrients:',
            size: 28,
            color: darkBlue,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 12,
          ),
          CustomText(
            text: 'Gve',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          TextWidgetField(
            enabled: false,
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Gve ha',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          TextWidgetField(
            enabled: false,
          ),
          SizedBox(
            height: 6,
          ),
          SelectableDropdownWidget(
            items: typeFertileList,
            title: 'Type fertilizer',
            widthSize: !Responsive.isDesktop(context)
                ? getWidth(context) * 0.89
                : getWidth(context) * 0.48,
            mSelectedValue: "",
            mOnDropDownChange: (value) {},
            mSelectedItemsList: [],
          ),
          SizedBox(
            height: 6,
          ),
          SelectableDropdownWidget(
            items: manureTypeList,
            title: 'Manure type',
            widthSize: !Responsive.isDesktop(context)
                ? getWidth(context) * 0.89
                : getWidth(context) * 0.48,
            mSelectedValue: "",
            mOnDropDownChange: (value) {},
            mSelectedItemsList: [],
          ),
          SizedBox(
            height: 6,
          ),
          SelectableDropdownWidget(
            items: methodFertileList,
            title: 'Method fertilization',
            widthSize: !Responsive.isDesktop(context)
                ? getWidth(context) * 0.89
                : getWidth(context) * 0.48,
            mSelectedValue: "",
            mOnDropDownChange: (value) {},
            mSelectedItemsList: [],
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Solid manure',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: solidCount,
              onAddTap: () {
                setState(() {
                  solidCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  solidCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Nutrients n',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: nCount,
              onAddTap: () {
                setState(() {
                  nCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  nCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Nutrients nh3',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: nh3Count,
              onAddTap: () {
                setState(() {
                  nh3Count++;
                });
              },
              onCloseTap: () {
                setState(() {
                  nh3Count--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Soil Structure:',
            size: 28,
            color: darkBlue,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 12,
          ),
          SelectableDropdownWidget(
            items: tillTypeList,
            title: 'Till type',
            widthSize: !Responsive.isDesktop(context)
                ? getWidth(context) * 0.89
                : getWidth(context) * 0.48,
            mSelectedValue: "",
            mOnDropDownChange: (value) {},
            mSelectedItemsList: [],
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Till year',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: tillYear,
            onChanged: (newValue) {
              setState(() {
                tillYear = newValue;
              });
            },
            items: tillYearList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Soil Life:',
            size: 28,
            color: darkBlue,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 12,
          ),
          SelectableDropdownWidget(
            items: mineralList,
            title: 'Mineral Soil treatment',
            widthSize: !Responsive.isDesktop(context)
                ? getWidth(context) * 0.89
                : getWidth(context) * 0.48,
            mSelectedValue: "",
            mOnDropDownChange: (value) {},
            mSelectedItemsList: [],
          ),
          SizedBox(
            height: 6,
          ),
          SelectableDropdownWidget(
            items: organicList,
            title: 'Organic Soil treatment',
            widthSize: !Responsive.isDesktop(context)
                ? getWidth(context) * 0.89
                : getWidth(context) * 0.48,
            mSelectedValue: "",
            mOnDropDownChange: (value) {},
            mSelectedItemsList: [],
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Ground Water',
            size: 28,
            color: darkBlue,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 12,
          ),
          CustomText(
            text: 'Ditch water level',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: ditchCount,
              onAddTap: () {
                setState(() {
                  ditchCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  ditchCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Surface Water',
            size: 28,
            color: darkBlue,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 12,
          ),
          CustomText(
            text: 'Manure free ditch',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: freeDitch,
            onChanged: (newValue) {
              setState(() {
                freeDitch = newValue;
              });
            },
            items: freeDitchList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Manure free ditch buffer',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: bufferCount,
              onAddTap: () {
                setState(() {
                  bufferCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  bufferCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Grazed ditch edge',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: edgeDitch,
            onChanged: (newValue) {
              setState(() {
                edgeDitch = newValue;
              });
            },
            items: edgeDitchList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          SelectableDropdownWidget(
            items: approachList,
            title: 'Ditch clean approach',
            widthSize: !Responsive.isDesktop(context)
                ? getWidth(context) * 0.89
                : getWidth(context) * 0.48,
            mSelectedValue: "",
            mOnDropDownChange: (value) {},
            mSelectedItemsList: [],
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Energy',
            size: 28,
            color: darkBlue,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 12,
          ),
          CustomText(
            text: 'Percent solar wind',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: windCount,
              onAddTap: () {
                setState(() {
                  windCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  windCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Electrification machinery',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: machineryText,
            onChanged: (newValue) {
              setState(() {
                machineryText = newValue;
              });
            },
            items: machineryList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Heat recovery',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: recoveryText,
            onChanged: (newValue) {
              setState(() {
                recoveryText = newValue;
              });
            },
            items: recoveryList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Meadow Birds',
            size: 28,
            color: darkBlue,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 12,
          ),
          CustomText(
            text: 'Mowing nest protection',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: protectionText,
            onChanged: (newValue) {
              setState(() {
                protectionText = newValue;
              });
            },
            items: protectionList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'if yes which date',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
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
                        size: 15,
                      ))),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Mowing management',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: managementText,
            onChanged: (newValue) {
              setState(() {
                managementText = newValue;
              });
            },
            items: managementList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          SelectableDropdownWidget(
            items: protectionsList,
            title: 'Nest protection',
            widthSize: !Responsive.isDesktop(context)
                ? getWidth(context) * 0.89
                : getWidth(context) * 0.48,
            mSelectedValue: "",
            mOnDropDownChange: (value) {},
            mSelectedItemsList: [],
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Trench infiltration',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: infiltrationText,
            onChanged: (newValue) {
              setState(() {
                infiltrationText = newValue;
              });
            },
            items:
                infiltrationList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Plas dras zone',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: zoneText,
            onChanged: (newValue) {
              setState(() {
                zoneText = newValue;
              });
            },
            items: zoneList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Herbal Richness',
            size: 28,
            color: darkBlue,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 12,
          ),
          CustomText(
            text: 'Estimate measure',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: measureText,
            onChanged: (newValue) {
              setState(() {
                measureText = newValue;
              });
            },
            items: measureList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Herb richness',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: herbCount,
              onAddTap: () {
                setState(() {
                  herbCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  herbCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          SelectableDropdownWidget(
            items: appliedList,
            title: 'Herb mixture applied',
            widthSize: !Responsive.isDesktop(context)
                ? getWidth(context) * 0.89
                : getWidth(context) * 0.48,
            mSelectedValue: "",
            mOnDropDownChange: (value) {},
            mSelectedItemsList: [],
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Natural herbrich',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: herbrichText,
            onChanged: (newValue) {
              setState(() {
                herbrichText = newValue;
              });
            },
            items: herbrichList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Sown herbs',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: herbsText,
            onChanged: (newValue) {
              setState(() {
                herbsText = newValue;
              });
            },
            items: herbsList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Sown herbs area',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: areaCount,
              onAddTap: () {
                setState(() {
                  areaCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  areaCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Property Layout',
            size: 28,
            color: darkBlue,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 12,
          ),
          SelectableDropdownWidget(
            items: elementsList,
            title: 'Property scan elements',
            widthSize: !Responsive.isDesktop(context)
                ? getWidth(context) * 0.89
                : getWidth(context) * 0.48,
            mSelectedValue: "",
            mOnDropDownChange: (value) {},
            mSelectedItemsList: [],
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Amount of fruit trees',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: fruitTreesCount,
              onAddTap: () {
                setState(() {
                  fruitTreesCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  fruitTreesCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Types of trees',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: typeTreeCount,
              onAddTap: () {
                setState(() {
                  typeTreeCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  typeTreeCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Woodwall meters',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: woodWallCount,
              onAddTap: () {
                setState(() {
                  woodWallCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  woodWallCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Branch meters',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: branchMeterCount,
              onAddTap: () {
                setState(() {
                  branchMeterCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  branchMeterCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Nest boxes amount',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: boxAmountCount,
              onAddTap: () {
                setState(() {
                  boxAmountCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  boxAmountCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Insect hotels amount',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: hotelAmountCount,
              onAddTap: () {
                setState(() {
                  hotelAmountCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  hotelAmountCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Pesticides',
            size: 28,
            color: darkBlue,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 12,
          ),
          CustomText(
            text: 'Preventative herbicides',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: preventHerbsText,
            onChanged: (newValue) {
              setState(() {
                preventHerbsText = newValue;
              });
            },
            items:
                preventHerbsList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Curative herbicides',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: curativeHerbsText,
            onChanged: (newValue) {
              setState(() {
                curativeHerbsText = newValue;
              });
            },
            items:
                curativeHerbsList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Grazing',
            size: 28,
            color: darkBlue,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 12,
          ),
          CustomText(
            text: 'Hours grazing',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: grazingHourCount,
              onAddTap: () {
                setState(() {
                  grazingHourCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  grazingHourCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Local Protein',
            size: 28,
            color: darkBlue,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 12,
          ),
          CustomText(
            text: 'Import by-products',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: byProductsText,
            onChanged: (newValue) {
              setState(() {
                byProductsText = newValue;
              });
            },
            items: byProductsList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Protein own land',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: proteinsCount,
              onAddTap: () {
                setState(() {
                  proteinsCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  proteinsCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          SelectableDropdownWidget(
            items: productsList,
            title: 'By-products list',
            widthSize: !Responsive.isDesktop(context)
                ? getWidth(context) * 0.89
                : getWidth(context) * 0.48,
            mSelectedValue: "",
            mOnDropDownChange: (value) {},
            mSelectedItemsList: [],
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Concentrates per cow per year',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          TextWidgetField(),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Economic Resilience',
            size: 28,
            color: darkBlue,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 12,
          ),
          CustomText(
            text: 'Secondary income activities',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: activityCount,
              onAddTap: () {
                setState(() {
                  activityCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  activityCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          SelectableDropdownWidget(
            items: activityList,
            title: 'Activities',
            widthSize: !Responsive.isDesktop(context)
                ? getWidth(context) * 0.89
                : getWidth(context) * 0.48,
            mSelectedValue: "",
            mOnDropDownChange: (value) {},
            mSelectedItemsList: [],
          ),
          SizedBox(
            height: 6,
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
