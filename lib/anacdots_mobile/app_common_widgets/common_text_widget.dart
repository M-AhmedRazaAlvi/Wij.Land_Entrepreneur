import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wij_land/anacdots_mobile/app_common_widgets/styles.dart';

class CommonTextFieldWidget extends StatefulWidget {
  final TextEditingController mEditController;
  final FocusNode? mFocusNode;
  final List<TextInputFormatter>? mInputFormat;
  final TextInputType? mKeyboard;
  final String? mLabelText, mHintText;
  final bool isObscureText;
  final bool? mIsEnabled;
  final bool? mAutoFocus;
  final Widget? mPrefixIconWidget;
  final Widget? mSuffixIconWidget;

  final int? mMaxLines;
  final Function()? mOnTap;
  final Function(dynamic)? onChange;

  const CommonTextFieldWidget({
    Key? key,
    required this.mEditController,
    this.mFocusNode,
    this.mInputFormat,
    this.mKeyboard,
    this.mHintText,
    this.mLabelText,
    this.mMaxLines,
    this.isObscureText=false,
    this.mIsEnabled=true,
    this.mPrefixIconWidget,
    this.mSuffixIconWidget,
    this.mAutoFocus=false,
    this.mOnTap,
    this.onChange,
  }) : super(key: key);

  @override
  State<CommonTextFieldWidget> createState() => _CommonTextFieldWidgetState();
}

class _CommonTextFieldWidgetState extends State<CommonTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.mEditController,
      cursorColor: Colors.black,
      cursorWidth: 1,
      autofocus: widget.mAutoFocus!,
      focusNode: widget.mFocusNode,
      obscureText: widget.isObscureText,
      inputFormatters: widget.mInputFormat,
      keyboardType: widget.mKeyboard,
      textInputAction: TextInputAction.done,
      enabled: widget.mIsEnabled,
      style: TextStyle(fontSize: 15),
      maxLines: widget.mMaxLines ?? 1,
      onTap: widget.mOnTap,
      onChanged: widget.onChange,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 8, bottom: 8, right: 8),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: darkGreen,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: lightGreen,
            width: 0.5,
          ),
        ),
        prefixIcon: widget.mPrefixIconWidget ?? SizedBox.shrink(),
        suffixIcon: widget.mSuffixIconWidget ?? SizedBox.shrink(),
        hintText: widget.mHintText,
        labelText: widget.mLabelText,
        labelStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
