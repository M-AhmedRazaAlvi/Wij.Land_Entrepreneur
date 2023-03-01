// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatefulWidget {
  final Color primary;
  final Color bgColor;
  final onPressed;
  final String text;
  const ElevatedButtonWidget({
    Key? key,
    required this.primary,
    required this.bgColor,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  State<ElevatedButtonWidget> createState() => _ElevatedButtonWidgetState();
}

class _ElevatedButtonWidgetState extends State<ElevatedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ElevatedButton(
        style: TextButton.styleFrom(
            elevation: 0,
            padding: const EdgeInsets.all(20),
            primary: widget.primary,
            backgroundColor: widget.bgColor),
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
