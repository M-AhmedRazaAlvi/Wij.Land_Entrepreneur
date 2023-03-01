import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';

class FileUploadWidget extends StatelessWidget {
  const FileUploadWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Wrap(
        spacing: 10,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black45, width: 2)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 15,
                  width: 15,
                  color: Colors.grey[400],
                  alignment: Alignment.topLeft,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Icon(
                    Icons.file_present_outlined,
                    size: 40,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
          CustomText(text: "Contract.csv"),
        ],
      ),
    );
  }
}
