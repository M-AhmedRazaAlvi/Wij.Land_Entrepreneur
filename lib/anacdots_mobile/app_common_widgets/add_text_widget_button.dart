import 'package:flutter/material.dart';

class AddTextWidgetButton extends StatelessWidget {
  final String text;

  final Color backgrundColor;
  final Function()? onPress;

  AddTextWidgetButton({
    Key? key,
    required this.text,
    this.onPress,
    required this.backgrundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: backgrundColor,
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 20,
          )),
      onPressed: onPress,
      child: Text(
        text,
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
