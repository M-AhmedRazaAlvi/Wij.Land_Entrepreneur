import 'package:flutter/material.dart';

import '../utils/styles.dart';

class AppLoadingDialog {
  static progressDialog({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          child: SizedBox(
            height: 100,
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(width: 30),
                CircularProgressIndicator(strokeWidth: 2),
                SizedBox(width: 30),
                Text(
                  "Loading...",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: Montserrat_Medium,

                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
