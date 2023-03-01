// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../utils/styles.dart';

class ClickIconWidget extends StatelessWidget {
  final icon;

  const ClickIconWidget({
    Key? key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
      height: 45,
      width: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: greenColor, width: 2)),
      child: Icon(icon, color: greenColor, size: 15),
    );
  }
}
