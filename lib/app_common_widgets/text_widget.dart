// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wij_land/utils/styles.dart';

class TextWidgetField extends StatelessWidget {
  const TextWidgetField(
      {Key? key,
      this.controller,
      this.suffixIcon,
      this.prefixIcons,
      this.enabled,
      this.dense,
      this.hintText,
      this.textPadding,
      this.isObscureText = false,
      this.maxLine = 1,
      this.mFillColor,
      this.onChange,
      this.onSubmit,
      this.textInputType = TextInputType.text,
      this.fillColor})
      : super(key: key);
  final TextEditingController? controller;
  final Widget? suffixIcon, prefixIcons;
  final bool? enabled, dense;
  final String? hintText;
  final EdgeInsets? textPadding;
  final Color? fillColor;
  final dynamic onChange, isObscureText, onSubmit;
  final TextInputType? textInputType;
  final int? maxLine;
  final Color? mFillColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      maxLines: maxLine,
      obscureText: isObscureText,
      style: TextStyle(fontSize: 14, fontFamily: Montserrat_Medium),
      keyboardType: textInputType,
      controller: controller ?? TextEditingController(),
      decoration: InputDecoration(
        isDense: dense,
        contentPadding: textPadding,
        prefixIcon: prefixIcons,
        suffixIcon: suffixIcon,
        suffixIconConstraints: BoxConstraints(maxWidth: suffixIcon != null ? 40 : 0),
        prefixIconConstraints: BoxConstraints(maxWidth: prefixIcons != null ? 40 : 0),
        enabled: enabled ?? true,
        hintText: hintText ?? "",
        filled: enabled == null || enabled == true ? false : true,
        fillColor: fillColor == null ? dimMetalic3 : normalGrey,
        ///  border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.black26, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.black26, width: 0.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.black26, width: 0.5),
        ),
      ),
    );
  }

  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = controller?.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text!.isEmpty) {
      return ' Field Can\'t be empty';
    }
    // return null if the text is valid
    return null;
  }
}
