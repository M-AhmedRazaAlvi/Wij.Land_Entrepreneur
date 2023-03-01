import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/utils/styles.dart';

class EventTextSearchWidget extends StatelessWidget {
  final String hintText;
  final dynamic onChangeValue;
  dynamic onSubmit;
  dynamic onTap;
  final width;
  final Icon? sufixIcon;
  final TextEditingController? controller;
  EventTextSearchWidget({
    Key? key,
    required this.hintText,
    this.width = 250,
    this.onSubmit,
    this.onChangeValue,
    this.onTap,
    this.sufixIcon = const Icon(
      Icons.search,
      size: 18,
    ),
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        onChanged: onChangeValue,
        onSubmitted: onSubmit,
        onTap: onTap,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.only(left: 6, right: 2),
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: Montserrat_Medium,
          ),
          suffixIconConstraints: BoxConstraints(minWidth: 4, minHeight: 4),
          suffixIcon: sufixIcon,
          border: InputBorder.none,
          fillColor: normalGrey,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Colors.black26, width: 0.1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Colors.black26, width: 0.1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Colors.black26, width: 0.1),
          ),
          //  errorText: _errorText
        ),
      ),
    );
  }
}
