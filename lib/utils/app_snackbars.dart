import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppSnackBars {
  static showWarningSnackBar({required BuildContext context, required String message}) {
    // return ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text(
    //       message,
    //       style: TextStyle(color: Colors.white),
    //     ),
    //     duration: Duration(milliseconds: 700),
    //   ),
    // );
    Fluttertoast.showToast(
        msg: '${message}',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
