import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/counter_widget.dart';
import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/real_dropdown_widget.dart';

class EnergyWidget extends StatefulWidget {
  const EnergyWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<EnergyWidget> createState() => _EnergyWidgetState();
}

class _EnergyWidgetState extends State<EnergyWidget> {
  String? machinery = 'Select';
  List<String> machineryList = [
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

  double count = 1;

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
                text: "Self-generated solar/wind energy?",
              ),
              SizedBox(
                width: 120,
                child: CounterWidget(
                  count: count,
                  onAddTap: () {
                    setState(() {
                      count++;
                    });
                  },
                  onCloseTap: () {
                    setState(() {
                      count--;
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
                text: "Electrification of machinery?",
              ),
              SizedBox(
                width: 120,
                child: RealDropDownWidget(
                  value: machinery,
                  onChanged: (newValue) {
                    setState(() {
                      machinery = newValue;
                    });
                  },
                  items: machineryList
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
                text: "Heat recovery from manure production?",
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
        ],
      ),
    );
  }
}
