import 'package:flutter/material.dart';

import '../../../../app_common_widgets/counter_widget.dart';
import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';

class RightUpdateWidget extends StatefulWidget {
  const RightUpdateWidget({Key? key}) : super(key: key);

  @override
  State<RightUpdateWidget> createState() => _RightUpdateWidgetState();
}

class _RightUpdateWidgetState extends State<RightUpdateWidget> {
  int cowCount = 0,
      weanCount = 0,
      doseCount = 0,
      linksCount = 0,
      laborCount = 0,
      greenElementsCount = 0,
      aShrubsCount = 0,
      mShrubsCount = 0,
      amountTreeCount = 0,
      amountCount = 0,
      treesCount = 0,
      metersCount = 0,
      projectsCount = 0,
      eventsCount = 0,
      jobSatisfactionCount = 0,
      futureProofCount = 0;
  String cattleType = 'Select',
      calfType = 'Select',
      stableType = 'Select',
      medicineType = 'Select',
      pharmacyType = 'Select',
      nightType = 'Select',
      shelterType = 'Select',
      soldType = 'Select',
      familyType = 'Select',
      employeeType = 'Select',
      orgType = 'Select',
      cateringType = 'Select',
      careType = 'Select',
      recreationType = 'Select',
      educationType = 'Select',
      shopType = 'Select',
      ownType = 'Select',
      boardType = 'Select',
      memberType = 'Select',
      advisorType = 'Select',
      aStructuralType = 'Select',
      fToursType = 'Select',
      fStructuralType = 'Select',
      researchType = 'Select',
      multiYearType = 'Select',
      internshipType = 'Select',
      ownWebType = 'Select',
      googlePageType = 'Select';
  List<String> cattleTypeList = ['Select', 'Dairy', 'Meat', 'Arable', 'Mixed'],
      calfTypeList = ['Select', 'yes', 'no'];
  List<String> stableTypeList = [
    'Select',
    'Ligboxen',
    'Ligboxen met extra comfort',
    'Vrijloopstal',
    'Potstal'
  ];
  List<String> medicineTypeList = ['Select', 'yes', 'no'];
  List<String> pharmacyTypeList = ['Select', 'yes', 'no'];
  List<String> nightTypeList = ['Select', 'yes', 'no'];
  List<String> shelterTypeList = ['Select', 'yes', 'no'];
  List<String> familyTypeList = ['Select', 'yes', 'no'];
  List<String> employeesTypeList = ['Select', 'yes', 'no'];
  List<String> ownTypeList = ['Select', 'yes', 'no'];
  List<String> boardTypeList = ['Select', 'yes', 'no'];
  List<String> memberTypeList = ['Select', 'yes', 'no'];
  List<String> advisorTypeList = ['Select', 'yes', 'no'];
  List<String> aStructuralTypeList = ['Select', 'yes', 'no'];
  List<String> fToursTypeList = ['Select', 'yes', 'no'];
  List<String> fStructuralTypeList = ['Select', 'yes', 'no'];
  List<String> researchTypeList = ['Select', 'yes', 'no'];
  List<String> multiYearTypeList = ['Select', 'yes', 'no'];
  List<String> internshipTypeList = ['Select', 'yes', 'no'];
  List<String> ownWebTypeList = ['Select', 'yes', 'no'];
  List<String> googlePageTypeList = ['Select', 'yes', 'no'];
  List<String> cateringTypeList = [
    'Select',
    'None',
    'Occasional',
    'Structural',
    'Professional'
  ];
  List<String> careTypeList = [
    'Select',
    'None',
    'Occasional',
    'Structural',
    'Professional'
  ];
  List<String> recreationTypeList = [
    'Select',
    'None',
    'Occasional',
    'Structural',
    'Professional'
  ];
  List<String> educationTypeList = [
    'Select',
    'None',
    'Occasional',
    'Structural',
    'Professional'
  ];
  List<String> shopTypeList = [
    'Select',
    'None',
    'Occasional',
    'Structural',
    'Professional'
  ];
  List<String> orgTypeList = ['Select', 'yes', 'no'];
  List<String> elementsList = ['Struiken', 'Bomen', 'Hagen', 'Anders'];
  List<String> socialMediaList = [
    'Facebook',
    'Twitter',
    'Instagram',
    'LinkedIn',
    'Youtube'
  ];
  List<String> soldTypeList = [
    'Select',
    '>50% buiten Europa',
    '>50% binnen Europa',
    '>50% buiten Nederland',
    '>50% Lokaal'
  ];

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Animal Welfare',
            size: 28,
            color: darkBlue,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 12,
          ),
          CustomText(
            text: 'Min type cattle farm',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: cattleType,
            onChanged: (newValue) {
              setState(() {
                cattleType = newValue;
              });
            },
            items: cattleTypeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Space per cow',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: cowCount,
              onAddTap: () {
                setState(() {
                  cowCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  cowCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Calf group accommodations',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: calfType,
            onChanged: (newValue) {
              setState(() {
                calfType = newValue;
              });
            },
            items: calfTypeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Time to weaning',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: weanCount,
              onAddTap: () {
                setState(() {
                  weanCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  weanCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Stable type',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: stableType,
            onChanged: (newValue) {
              setState(() {
                stableType = newValue;
              });
            },
            items: stableTypeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Animal Health',
            size: 28,
            color: darkBlue,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 12,
          ),
          CustomText(
            text: 'Daily dose',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: doseCount,
              onAddTap: () {
                setState(() {
                  doseCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  doseCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Preventative medicine',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: medicineType,
            onChanged: (newValue) {
              setState(() {
                medicineType = newValue;
              });
            },
            items:
                medicineTypeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Natural pharmacy',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: pharmacyType,
            onChanged: (newValue) {
              setState(() {
                pharmacyType = newValue;
              });
            },
            items:
                pharmacyTypeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Outdoor at night',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: nightType,
            onChanged: (newValue) {
              setState(() {
                nightType = newValue;
              });
            },
            items: nightTypeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Outdoor shelter',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: shelterType,
            onChanged: (newValue) {
              setState(() {
                shelterType = newValue;
              });
            },
            items:
                shelterTypeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Chain relationships/Ketenrelaties',
            size: 28,
            color: darkBlue,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 12,
          ),
          CustomText(
            text: 'Supplychain links',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: linksCount,
              onAddTap: () {
                setState(() {
                  linksCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  linksCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Where products sold',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: soldType,
            onChanged: (newValue) {
              setState(() {
                soldType = newValue;
              });
            },
            items: soldTypeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Labor/Arbeid',
            size: 28,
            color: darkBlue,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 12,
          ),
          CustomText(
            text: 'Family member employees',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: familyType,
            onChanged: (newValue) {
              setState(() {
                familyType = newValue;
              });
            },
            items: familyTypeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'External employees',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: employeeType,
            onChanged: (newValue) {
              setState(() {
                employeeType = newValue;
              });
            },
            items:
                employeesTypeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'External organization',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: orgType,
            onChanged: (newValue) {
              setState(() {
                orgType = newValue;
              });
            },
            items: orgTypeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Fte Labor',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: laborCount,
              onAddTap: () {
                setState(() {
                  laborCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  laborCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Land Management',
            size: 28,
            color: darkBlue,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 12,
          ),
          CustomText(
            text: 'Percent green elements',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: greenElementsCount,
              onAddTap: () {
                setState(() {
                  greenElementsCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  greenElementsCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          SelectableDropdownWidget(
              items: elementsList,
              mSelectedValue: "",
              mOnDropDownChange: (value) {},
              mSelectedItemsList: [],
              title: 'Which elements',
              widthSize: !Responsive.isDesktop(context)
                  ? getWidth(context) * 0.89
                  : getWidth(context) * 0.48),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Amount shrubs',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: aShrubsCount,
              onAddTap: () {
                setState(() {
                  aShrubsCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  aShrubsCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Meters shrubs',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: mShrubsCount,
              onAddTap: () {
                setState(() {
                  mShrubsCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  mShrubsCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Amount trees',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: amountTreeCount,
              onAddTap: () {
                setState(() {
                  amountTreeCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  amountTreeCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Meters trees',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: treesCount,
              onAddTap: () {
                setState(() {
                  treesCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  treesCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Amount hedges',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: amountCount,
              onAddTap: () {
                setState(() {
                  amountCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  amountCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Meters hedges',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: metersCount,
              onAddTap: () {
                setState(() {
                  metersCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  metersCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Community involvement/Betrokkenheid samenleving',
            size: 28,
            color: darkBlue,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 12,
          ),
          CustomText(
            text: 'Catering intensity on farm',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: cateringType,
            onChanged: (newValue) {
              setState(() {
                cateringType = newValue;
              });
            },
            items:
                cateringTypeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Care facilities intensity',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: careType,
            onChanged: (newValue) {
              setState(() {
                careType = newValue;
              });
            },
            items: careTypeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Recreation intensity on farm',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: recreationType,
            onChanged: (newValue) {
              setState(() {
                recreationType = newValue;
              });
            },
            items: recreationTypeList
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Education intensity on farm',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: educationType,
            onChanged: (newValue) {
              setState(() {
                educationType = newValue;
              });
            },
            items:
                educationTypeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Shop intensity on farm',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: shopType,
            onChanged: (newValue) {
              setState(() {
                shopType = newValue;
              });
            },
            items: shopTypeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Culture and Identity',
            size: 28,
            color: darkBlue,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 12,
          ),
          CustomText(
            text: 'Member at organization',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: memberType,
            onChanged: (newValue) {
              setState(() {
                memberType = newValue;
              });
            },
            items: memberTypeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Board member at organization',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: boardType,
            onChanged: (newValue) {
              setState(() {
                boardType = newValue;
              });
            },
            items: boardTypeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Own organization',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: ownType,
            onChanged: (newValue) {
              setState(() {
                ownType = newValue;
              });
            },
            items: ownTypeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Knowledge Development',
            size: 28,
            color: darkBlue,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 12,
          ),
          CustomText(
            text: 'Number of projects',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: projectsCount,
              onAddTap: () {
                setState(() {
                  projectsCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  projectsCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Knowledge events',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: eventsCount,
              onAddTap: () {
                setState(() {
                  eventsCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  eventsCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Advisor',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: advisorType,
            onChanged: (newValue) {
              setState(() {
                advisorType = newValue;
              });
            },
            items:
                advisorTypeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Advisor occasional structural',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: aStructuralType,
            onChanged: (newValue) {
              setState(() {
                aStructuralType = newValue;
              });
            },
            items: aStructuralTypeList
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Farms tours',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: fToursType,
            onChanged: (newValue) {
              setState(() {
                fToursType = newValue;
              });
            },
            items: fToursTypeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Farm tours occasional structural',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: fStructuralType,
            onChanged: (newValue) {
              setState(() {
                fStructuralType = newValue;
              });
            },
            items: fStructuralTypeList
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Research station',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: researchType,
            onChanged: (newValue) {
              setState(() {
                researchType = newValue;
              });
            },
            items:
                researchTypeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Multiyear research',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: multiYearType,
            onChanged: (newValue) {
              setState(() {
                multiYearType = newValue;
              });
            },
            items:
                multiYearTypeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Internship options',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: internshipType,
            onChanged: (newValue) {
              setState(() {
                internshipType = newValue;
              });
            },
            items: internshipTypeList
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Job Satisfaction',
            size: 28,
            color: darkBlue,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 12,
          ),
          CustomText(
            text: 'Job Satisfaction',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: jobSatisfactionCount,
              onAddTap: () {
                setState(() {
                  jobSatisfactionCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  jobSatisfactionCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Future Proof',
            size: 28,
            color: darkBlue,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 12,
          ),
          CustomText(
            text: 'Future Proof',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          CounterWidget(
              count: futureProofCount,
              onAddTap: () {
                setState(() {
                  futureProofCount++;
                });
              },
              onCloseTap: () {
                setState(() {
                  futureProofCount--;
                });
              }),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Visibility',
            size: 28,
            color: darkBlue,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 12,
          ),
          CustomText(
            text: 'Own website',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: ownWebType,
            onChanged: (newValue) {
              setState(() {
                ownWebType = newValue;
              });
            },
            items: ownWebTypeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomText(
            text: 'Google page',
            size: 15,
            color: ivoryBlack,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 6,
          ),
          RealDropDownWidget(
            value: googlePageType,
            onChanged: (newValue) {
              setState(() {
                googlePageType = newValue;
              });
            },
            items: googlePageTypeList
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(
            height: 6,
          ),
          SelectableDropdownWidget(
              items: socialMediaList,
              title: 'Social Media',
              mSelectedValue: "",
              mOnDropDownChange: (value){},
              mSelectedItemsList: [],

              widthSize: !Responsive.isDesktop(context)
                  ? getWidth(context) * 0.89
                  : getWidth(context) * 0.48),
          SizedBox(
            height: 6,
          ),
        ],
      ),
    );
  }
}
