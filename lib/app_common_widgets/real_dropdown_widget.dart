// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/functions.dart';
import '../utils/styles.dart';

class RealDropDownWidget extends StatefulWidget {
  final value;
  final onChanged;
  final items;
  final widthSize;
  final Color? color;
  final String? hint;
  const RealDropDownWidget({
    Key? key,
    required this.value,
    this.onChanged,
    this.items,
    this.widthSize,
    this.color,
    this.hint,
  }) : super(key: key);

  @override
  State<RealDropDownWidget> createState() => _RealDropDownWidgetState();
}

class _RealDropDownWidgetState extends State<RealDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.widthSize ?? getWidth(context),
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: widget.color,
        border: Border.all(
          color: Colors.black26,
          width: 0.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: widget.value,
            isExpanded: true,
            isDense: false,
            underline: null,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Color(0xff333333),
            ),
            iconSize: 20,
            style: const TextStyle(
              color: Color(0xff333333),
              fontSize: 12,
              fontFamily: Montserrat_Medium,
            ),
            hint: widget.hint == null ? null : Text(widget.hint!),
            onChanged: widget.onChanged,
            items: widget.items,
          ),
        ),
      ),
    );
  }
}
