// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:wij_land/utils/styles.dart';

import 'custom_text.dart';

class RealCheckBoxWidget extends StatefulWidget {
  const RealCheckBoxWidget({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.Labeltext,
    this.isTop = false,
    this.labelSize = 14,
    this.labelAlign = TextAlign.justify,
    this.labelColor = Colors.black,
    this.labelWeight = FontWeight.normal,
  }) : super(key: key);
  final bool value;
  final bool isTop;
  final TextAlign labelAlign;
  final FontWeight labelWeight;
  final Color labelColor;
  final double labelSize;
  final onChanged;
  final String Labeltext;

  @override
  State<RealCheckBoxWidget> createState() => _RealCheckBoxWidgetState();
}

class _RealCheckBoxWidgetState extends State<RealCheckBoxWidget> {
  bool _sampler = false;

  @override
  Widget build(BuildContext context) {
    return !widget.isTop
        ? Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              if (widget.isTop) CustomText(text: widget.Labeltext),
              Checkbox(
                  // fillColor: MaterialStateProperty.all(dimMetalic3),
                  overlayColor: MaterialStateProperty.all(dimMetalic3),
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  side: BorderSide(color: dimMetalic2, width: 0),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: dimMetalic2, width: 0),
                      borderRadius: BorderRadius.circular(4)),
                  value: widget.value,
                  onChanged: widget.onChanged),
              if (!widget.isTop) CustomText(text: widget.Labeltext),
            ],
          )
        : Column(
            children: [
              CustomText(
                text: widget.Labeltext,
                size: widget.labelSize,
                color: widget.labelColor,
                weight: widget.labelWeight,
                textAligns: widget.labelAlign,
              ),
              Checkbox(
                  checkColor: lightBlack,
                  activeColor: Colors.green,
                  side: BorderSide(color: dimMetalic2, width: 0),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: dimMetalic2),
                      borderRadius: BorderRadius.circular(5)),
                  value: widget.value,
                  onChanged: widget.onChanged),
            ],
          );
  }
}
