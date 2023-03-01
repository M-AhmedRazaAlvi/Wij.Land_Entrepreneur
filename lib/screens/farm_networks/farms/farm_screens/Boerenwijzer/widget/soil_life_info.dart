import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../../../../utils/responsive.dart';

class SoilLifeInfoWidget extends StatefulWidget {
  const SoilLifeInfoWidget({
    Key? key,
    required this.first,
    required this.size,
    required this.parcelLevel,
    required this.manureTpye,
    required this.fertilization,
    required this.method,
    this.child,
    this.second = false,
    this.blockChild,
  }) : super(key: key);
  final bool first;
  final bool second;
  final String parcelLevel, manureTpye, fertilization, method;
  final dynamic child;
  final double size;
  final dynamic blockChild;

  @override
  State<SoilLifeInfoWidget> createState() => _SoilLifeInfoWidgetState();
}

class _SoilLifeInfoWidgetState extends State<SoilLifeInfoWidget> {
  List<String> selectedProvinceList = [];
  String method = "Drenthe";
  List<String> methodList = [
    'Bovengronds',
    'Green Bemesting',
    'Injecteren',
    'Gelderland',
    'Groningen',
    'ketsplaat',
    'Strooier',
  ];
  String mineralSoil = "Vulkamain";
  List<String> mineralSoilList = [
    'Vulkamain',
    'Eierschalen',
    'Kalk',
    'Kleimineraal',
    'Streenmeel',
    'Gips',
  ];
  String organicSoil = "Bokashi";
  List<String> organicSoilList = [
    'Bokashi',
    'Houtsnippers',
    'Compost',
    'Wormenthee',
    'Koolzaadstro',
    'Wei',
  ];
  int countSolid = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
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
            SizedBox(
              width: widget.size / 1.5,
              child: widget.blockChild,
            ),
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
                child: SelectableDropdownWidget(
                    widthSize: Responsive.isDesktop(context)
                        ? 210
                        : !Responsive.isDesktop(context)
                            ? 100
                            : 220,
                    items: methodList,
                    mSelectedValue: "",
                    mOnDropDownChange: (value) {},
                    mSelectedItemsList: [],
                    title: "")),
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
                    widthSize: Responsive.isDesktop(context)
                        ? 210
                        : !Responsive.isDesktop(context)
                            ? 100
                            : 220,
                    items: mineralSoilList,
                    mSelectedValue: "",
                    mOnDropDownChange: (value) {},
                    mSelectedItemsList: [],
                    title: "")),
          SizedBox(
            width: 15,
          ),
          if (widget.first)
            SizedBox(
              width: widget.size,
              child: CustomText(
                text: widget.method,
                size: widget.first ? 16 : 14,
                weight: widget.first ? FontWeight.bold : FontWeight.normal,
              ),
            )
          else
            SizedBox(
                width: widget.size,
                child: SelectableDropdownWidget(
                    widthSize: Responsive.isDesktop(context)
                        ? 210
                        : !Responsive.isDesktop(context)
                            ? 100
                            : 220,
                    items: organicSoilList,
                    mSelectedValue: "",
                    mOnDropDownChange: (value) {},
                    mSelectedItemsList: [],
                    title: "")),
          SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
