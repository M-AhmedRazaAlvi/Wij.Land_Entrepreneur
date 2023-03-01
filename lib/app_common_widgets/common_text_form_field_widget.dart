import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/styles.dart';

class CommonTextFormFieldWidget extends StatefulWidget {
  final TextEditingController mTextEditingController;
  final FocusNode? mFocusNode;
  final List<TextInputFormatter>? mInputFormatters;
  final TextInputType? mKeyboardType;
  final String? mLabelText, mHintText;
  final bool isObscureText;
  final bool? mIsEnabled;
  final Widget? mPrefixIconWidget;

  final int? mMaxLines;
  final Function()? mOnTap;
  final Function(dynamic)? onChange;

  const CommonTextFormFieldWidget({
    Key? key,
    required this.mTextEditingController,
    this.mFocusNode,
    this.mInputFormatters,
    this.mKeyboardType,
    this.mHintText,
    this.mLabelText,
    this.mMaxLines,
    required this.isObscureText,
    required this.mIsEnabled,
    this.mPrefixIconWidget,
    this.mOnTap,
    this.onChange,
  }) : super(key: key);

  @override
  State<CommonTextFormFieldWidget> createState() => _CommonTextFormFieldWidgetState();
}

class _CommonTextFormFieldWidgetState extends State<CommonTextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.mTextEditingController,
      cursorColor: Colors.black,
      cursorWidth: 1,
      focusNode: widget.mFocusNode,
      obscureText: widget.isObscureText,
      inputFormatters: widget.mInputFormatters,
      keyboardType: widget.mKeyboardType,
      textInputAction: TextInputAction.done,
      enabled: widget.mIsEnabled,
      style: TextStyle(fontSize: 15,fontFamily: Montserrat_Medium,),
      maxLines: widget.mMaxLines ?? 1,
      onTap: widget.mOnTap,
      onChanged: widget.onChange,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 12, bottom: 12, right: 8),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.black26,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Colors.black26,
            width: 0.5,
          ),
        ),
        prefixIcon: widget.mPrefixIconWidget ?? SizedBox.shrink(),
        hintText: widget.mHintText,
        labelText: widget.mLabelText,
        labelStyle: TextStyle(color: Colors.black,fontFamily: Montserrat_Medium,),
      ),
    );
  }
}
