import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';

class AddFilesWidget extends StatelessWidget {
  final String fileText;
  final String dateText;
  final String subjectText;

  final width;
  const AddFilesWidget({
    Key? key,
    required this.fileText,
    required this.dateText,
    required this.subjectText,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.black26))),
      child: Row(
        children: [
          SizedBox(
              width: width / 3,
              child: Icon(
                Icons.file_present,
              )),
          SizedBox(
            width: width,
            child: CustomText(
              text: fileText,
            ),
          ),
          SizedBox(
            width: width,
            child: CustomText(
              text: dateText,
            ),
          ),
          SizedBox(
            width: width,
            child: CustomText(
              text: subjectText,
            ),
          ),
          SizedBox(
              width: width / 3,
              child: Icon(
                Icons.info_outlined,
              )),
          SizedBox(
              width: width / 3,
              child: Icon(
                Icons.delete_outline,
              )),
        ],
      ),
    );
  }
}
