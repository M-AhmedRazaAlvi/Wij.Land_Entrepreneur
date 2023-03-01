import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/counter_widget.dart';
import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../app_common_widgets/selectable_dropdown_widget.dart';

class HerbRichInfoWidget extends StatefulWidget {
  const HerbRichInfoWidget({
    Key? key,
    required this.first,
    required this.size,
    required this.parcelLevel,
    required this.estimate,
    required this.herbsRish,
    required this.mixture,
    required this.natural,
    required this.ingezaaid,
    required this.haIngezaaid,
    this.child,
    this.second = false,
    this.blockChild,
  }) : super(key: key);
  final bool first;
  final bool second;
  final String parcelLevel,
      estimate,
      herbsRish,
      mixture,
      natural,
      ingezaaid,
      haIngezaaid;
  final dynamic child;
  final double size;
  final dynamic blockChild;

  @override
  State<HerbRichInfoWidget> createState() => _HerbRichInfoWidgetState();
}

class _HerbRichInfoWidgetState extends State<HerbRichInfoWidget> {
  String mixture = "Green";
  List<String> mixtureList = [
    'Green',
    'Productief',
    'Biodivers',
    'Zeer kruidenrijk',
    'Puregraze',
    "Wilder Land",
    "Ten Have",
    "Kuikenmengsel",
    "Natuurgraseland",
  ];
  String? naural = 'Select';
  List<String> nauralList = [
    'Select',
    'Yes',
    'No',
  ];
  String? ingezaaid = 'Select';
  List<String> ingezaaidList = [
    'Select',
    'Ingezaaid',
    'Doorgezaaid',
  ];
  int countSolid = 0;
  int countHerbs = 10;
  bool secondChecked = false;

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
              width: widget.size / 1.5,
              child: CustomText(
                text: widget.estimate,
                size: widget.first ? 16 : 14,
                weight: widget.first ? FontWeight.bold : FontWeight.normal,
              ),
            )
          else
            SizedBox(
              width: widget.size / 1.5,
              child: Align(
                alignment: Alignment.topLeft,
                child: Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(5)),
                    value: secondChecked,
                    onChanged: (value) {
                      setState(() {
                        secondChecked = !secondChecked;
                      });
                    }),
              ),
            ),

          //////////////////////////////////
          if (widget.first)
            SizedBox(
              width: widget.size / 2,
              child: CustomText(
                text: widget.herbsRish,
                size: widget.first ? 16 : 14,
                weight: widget.first ? FontWeight.bold : FontWeight.normal,
              ),
            )
          else
            SizedBox(
              width: widget.size / 2,
              child: CounterWidget(
                count: countHerbs,
                onAddTap: () {
                  setState(
                    () {
                      countHerbs++;
                    },
                  );
                },
                onCloseTap: () {
                  setState(
                    () {
                      countHerbs--;
                    },
                  );
                },
              ),
            ),

          SizedBox(
            width: 15,
          ),
          if (widget.first)
            SizedBox(
              width: widget.size,
              child: CustomText(
                text: widget.mixture,
                size: widget.first ? 16 : 14,
                weight: widget.first ? FontWeight.bold : FontWeight.normal,
              ),
            )
          else
            SizedBox(
                width: widget.size,
                child: SelectableDropdownWidget(
                  widthSize: 220,
                  items: mixtureList,
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
              width: widget.size / 2,
              child: CustomText(
                text: widget.natural,
                size: widget.first ? 16 : 14,
                weight: widget.first ? FontWeight.bold : FontWeight.normal,
              ),
            )
          else
            SizedBox(
              width: widget.size / 2,
              child: RealDropDownWidget(
                value: naural,
                onChanged: (newValue) {
                  setState(() {
                    naural = newValue;
                  });
                },
                items: nauralList.map<DropdownMenuItem<String>>((String value) {
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
                text: widget.ingezaaid,
                size: widget.first ? 16 : 14,
                weight: widget.first ? FontWeight.bold : FontWeight.normal,
              ),
            )
          else
            SizedBox(
              width: widget.size,
              child: RealDropDownWidget(
                value: ingezaaid,
                onChanged: (newValue) {
                  setState(() {
                    ingezaaid = newValue;
                  });
                },
                items:
                    ingezaaidList.map<DropdownMenuItem<String>>((String value) {
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
                text: widget.haIngezaaid,
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
