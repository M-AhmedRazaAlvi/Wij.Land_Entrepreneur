import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/real_date_picker.dart';
import '../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../app_common_widgets/selectable_dropdown_widget.dart';

class MeadowBirdsInfoWidget extends StatefulWidget {
  const MeadowBirdsInfoWidget({
    Key? key,
    required this.first,
    required this.size,
    required this.parcelLevel,
    required this.mowing,
    required this.mowingDate,
    required this.protection,
    required this.plasZone,
    this.child,
    this.second = false,
    this.blockChild,
  }) : super(key: key);
  final bool first;
  final bool second;
  final String parcelLevel, mowing, mowingDate, protection, plasZone;
  final dynamic child;
  final double size;
  final dynamic blockChild;

  @override
  State<MeadowBirdsInfoWidget> createState() => _MeadowBirdsInfoWidgetState();
}

class _MeadowBirdsInfoWidgetState extends State<MeadowBirdsInfoWidget> {
  TextEditingController datecontroller = TextEditingController();
  List<String> selectedProvinceList = [];
  String province = "Mozaikbeheer";
  List<String> provinceList = [
    'Mozaikbeheer',
    'Geen nestbestcherming',
    'Voorbeweiden',
    'Uitgesteld maaien',
    'Legselbeheer',
  ];
  String? machinery = 'Select';
  List<String> machineryList = [
    'Select',
    'Yes',
    'No',
  ];
  String? plasZone = 'Select';
  List<String> plasZoneList = [
    'Select',
    'Yes',
    'No',
  ];
  int countSolid = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black26))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.first)
            SizedBox(
              width: widget.size / 1.4,
            )
          else
            SizedBox(width: widget.size / 1.5, child: widget.blockChild),
          if (widget.first)
            SizedBox(
              width: widget.size / 1.5,
              child: CustomText(
                text: widget.parcelLevel,
                size: widget.first ? 16 : 14,
                weight: widget.first ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          if (!widget.second && !widget.first)
            SizedBox(width: widget.size / 1.5, child: widget.child),
          if (widget.second && !widget.first)
            SizedBox(
              width: widget.size / 1.5,
            ),
          if (widget.first)
            SizedBox(
              width: widget.size,
              child: CustomText(
                text: widget.mowing,
                size: widget.first ? 16 : 14,
                weight: widget.first ? FontWeight.bold : FontWeight.normal,
              ),
            )
          else
            SizedBox(
              width: widget.size,
              child: RealDropDownWidget(
                value: machinery,
                onChanged: (newValue) {
                  setState(() {
                    machinery = newValue;
                  });
                },
                items:
                    machineryList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                      value: value, child: Text(value));
                }).toList(),
              ),
            ),
          SizedBox(
            width: 15,
          ),
          if (widget.first)
            SizedBox(
              width: widget.size,
              child: CustomText(
                text: widget.mowingDate,
                size: widget.first ? 16 : 14,
                weight: widget.first ? FontWeight.bold : FontWeight.normal,
              ),
            )
          else
            SizedBox(
                width: widget.size,
                child: RealDatePickerWidget(dateController: datecontroller)),
          SizedBox(
            width: 15,
          ),
          if (widget.first)
            SizedBox(
              width: widget.size,
              child: CustomText(
                text: widget.protection,
                size: widget.first ? 16 : 14,
                weight: widget.first ? FontWeight.bold : FontWeight.normal,
              ),
            )
          else
            SizedBox(
                width: widget.size,
                child: SelectableDropdownWidget(
                  widthSize: 220,
                  items: provinceList,
                  title: "",
                  mSelectedValue: "",
                  mOnDropDownChange: (value) {},
                  mSelectedItemsList: [],
                )),
          SizedBox(
            width: 15,
          ),
          if (widget.first)
            SizedBox(
              width: widget.size,
              child: CustomText(
                text: widget.plasZone,
                size: widget.first ? 16 : 14,
                weight: widget.first ? FontWeight.bold : FontWeight.normal,
              ),
            )
          else
            SizedBox(
              width: widget.size,
              child: RealDropDownWidget(
                value: plasZone,
                onChanged: (newValue) {
                  setState(() {
                    plasZone = newValue;
                  });
                },
                items:
                    plasZoneList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                      value: value, child: Text(value));
                }).toList(),
              ),
            ),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
