import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wij_land/anacdots_mobile/app_common_widgets/styles.dart';

void showAnacdotsToast(message) {
  Fluttertoast.showToast(
      msg: '$message',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: darkGreen,
      textColor: Colors.white,
      fontSize: 16.0);
}
