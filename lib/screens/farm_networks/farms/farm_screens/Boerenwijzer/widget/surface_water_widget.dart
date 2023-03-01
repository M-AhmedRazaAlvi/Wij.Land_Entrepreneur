import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/counter_widget.dart';
import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../../../../utils/functions.dart';

class SurfaceWaterWidget extends StatefulWidget {
  const SurfaceWaterWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SurfaceWaterWidget> createState() => _SurfaceWaterWidgetState();
}

class _SurfaceWaterWidgetState extends State<SurfaceWaterWidget> {
  String? manure = 'Select';
  List<String> manureList = [
    'Select',
    'Yes',
    'No',
  ];
  String? grazed = 'Select';
  List<String> grazedList = [
    'Select',
    'Yes',
    'No',
  ];
  String? usedFilter = 'Select';
  List<String> usedFilterList = [
    'Select',
    'Yes',
    'No',
  ];
  String? ditchBand = 'Select';
  List<String> ditchBandList = [
    'Select',
    'Yes',
    'No',
  ];
  String cleaned = "Drenthe";
  List<String> cleanedList = [
    'Geen slootschonen',
    'Baggerspuit',
    'Anders',
  ];

  bool clicked = false;
  double count = 0.01;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 20,
            children: [
              CustomText(
                text: "Manure free ditch-edges?",
              ),
              SizedBox(
                width: 120,
                child: RealDropDownWidget(
                  value: manure,
                  onChanged: (newValue) {
                    setState(() {
                      manure = newValue;
                    });
                  },
                  items:
                      manureList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 20,
            children: [
              CustomText(
                text: "If yes, how many meters wide?",
              ),
              SizedBox(
                width: 120,
                child: CounterWidget(
                  count: count,
                  onAddTap: () {
                    setState(() {
                      count = double.parse((count + 0.01).toStringAsFixed(2));
                    });
                  },
                  onCloseTap: () {
                    setState(() {
                      count = double.parse((count - 0.01).toStringAsFixed(2));
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 20,
            children: [
              CustomText(
                text: "Manure free ditch-edges?",
              ),
              SizedBox(
                width: 120,
                child: RealDropDownWidget(
                  value: grazed,
                  onChanged: (newValue) {
                    setState(() {
                      grazed = newValue;
                    });
                  },
                  items:
                      grazedList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(text: "How are ditches cleaned?"),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            width: getWidth(context) * 0.6,
            child: SelectableDropdownWidget(
                widthSize: getWidth(context) * 0.58,
                items: cleanedList,
                mSelectedValue: "",
                mOnDropDownChange: (value){},
                mSelectedItemsList: [],

                title: ""),
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 20,
            children: [
              CustomText(
                text: "Use helofytenfilter?",
              ),
              SizedBox(
                width: 120,
                child: RealDropDownWidget(
                  value: usedFilter,
                  onChanged: (newValue) {
                    setState(() {
                      usedFilter = newValue;
                    });
                  },
                  items: usedFilterList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 20,
            children: [
              CustomText(
                text: "Ecofriendly ditch banks?",
              ),
              SizedBox(
                width: 120,
                child: RealDropDownWidget(
                  value: ditchBand,
                  onChanged: (newValue) {
                    setState(() {
                      ditchBand = newValue;
                    });
                  },
                  items: ditchBandList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
