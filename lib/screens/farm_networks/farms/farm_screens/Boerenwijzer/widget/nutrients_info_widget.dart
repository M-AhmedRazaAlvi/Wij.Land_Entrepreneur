import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/counter_widget.dart';
import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../../../../utils/responsive.dart';

class NutrientsInfoWidget extends StatefulWidget {
  const NutrientsInfoWidget({
    Key? key,
    required this.first,
    required this.size,
    required this.parcelLevel,
    required this.manureTpye,
    required this.fertilization,
    required this.method,
    required this.solidManure,
    this.child,
    this.second = false,
    this.blockChild,
  }) : super(key: key);
  final bool first;
  final bool second;
  final String parcelLevel, manureTpye, fertilization, method, solidManure;
  final dynamic child;
  final dynamic blockChild;
  final double size;

  @override
  State<NutrientsInfoWidget> createState() => _NutrientsInfoWidgetState();
}

class _NutrientsInfoWidgetState extends State<NutrientsInfoWidget> {
  List<String> selectedProvinceList = [];
  String province = "Drenthe";
  List<String> provinceList = [
    'Drenthe',
    'Flevoland',
    'Friesland',
    'Gelderland',
    'Groningen',
    'Limburg',
    'Noord-Brabant',
    'Noord-Holland',
    'Overijssel',
    'Utrecht',
    'Zeeland',
    'Zuid-Holland',
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
                text: widget.manureTpye,
                size: widget.first ? 16 : 14,
                weight: widget.first ? FontWeight.bold : FontWeight.normal,
              ),
            )
          else
            SizedBox(
                width: widget.size,
                child: SelectableDropdownWidget(
                    widthSize: !Responsive.isDesktop(context)
                        ? 210
                        : !Responsive.isDesktop(context)
                            ? 100
                            : 220,
                    items: provinceList,
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
                text: widget.method,
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
                text: widget.solidManure,
                size: widget.first ? 16 : 14,
                weight: widget.first ? FontWeight.bold : FontWeight.normal,
              ),
            )
          else
            SizedBox(
              width: widget.size,
              child: CounterWidget(
                count: countSolid,
                onAddTap: () {
                  setState(
                    () {
                      countSolid++;
                    },
                  );
                },
                onCloseTap: () {
                  setState(
                    () {
                      countSolid--;
                    },
                  );
                },
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
