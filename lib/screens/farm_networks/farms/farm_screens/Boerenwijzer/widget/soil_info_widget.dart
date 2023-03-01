import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/real_date_picker.dart';
import '../../../../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../../../../utils/responsive.dart';
import '../../../../../../utils/styles.dart';

class SoilStructureInfoWidget extends StatefulWidget {
  const SoilStructureInfoWidget({
    Key? key,
    required this.first,
    required this.size,
    required this.parcelLevel,
    required this.manureTpye,
    required this.fertilization,
    this.child,
    this.second = false,
    this.blockChild,
  }) : super(key: key);
  final bool first;
  final bool second;
  final String parcelLevel, manureTpye, fertilization;
  final dynamic child;
  final dynamic blockChild;
  final double size;

  @override
  State<SoilStructureInfoWidget> createState() =>
      _SoilStructureInfoWidgetState();
}

class _SoilStructureInfoWidgetState extends State<SoilStructureInfoWidget> {
  TextEditingController datecontroller = TextEditingController();
  List<String> selectedProvinceList = [];
  String province = "Niet beweekt";
  List<String> provinceList = [
    'Niet beweekt',
    'Diepploegen',
    'Molpoot',
    'Gefreesd',
    'Geploegd',
    'Gespit',
    'Niet-Kerende groundbeweking',
  ];
  int countSolid = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black26))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.first)
            SizedBox(
                width: widget.size / 1.4,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(color: lightGreen, width: 8))),
                ))
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
                text: widget.manureTpye,
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
                text: widget.fertilization,
                size: widget.first ? 16 : 14,
                weight: widget.first ? FontWeight.bold : FontWeight.normal,
              ),
            )
          else
            SizedBox(
                width: widget.size,
                child: SelectableDropdownWidget(
                    widthSize: !Responsive.isDesktop(context)
                        ? 260
                        : !Responsive.isDesktop(context)
                            ? 280
                            : 220,
                    mSelectedValue: "",
                    mOnDropDownChange: (value) {},
                    mSelectedItemsList: [],
                    items: provinceList,
                    title: "")),
        ],
      ),
    );
  }
}
