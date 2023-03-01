import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wij_land/utils/styles.dart';

void showSnack(message) {
  Fluttertoast.showToast(
      msg: '$message',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor: yellowishGreen,
      textColor: Colors.white,
      fontSize: 16.0);
}

double getWidth(context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(context) {
  return MediaQuery.of(context).size.height;
}
