


import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';

class DataCellsWidget extends StatelessWidget {
  final listData;
  const DataCellsWidget({Key? key,this.listData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        width:  100,
      child: CustomText(
       text: listData,
        textAligns: TextAlign.start,
        size: 13,
        weight: FontWeight.w400,

      ),
    );
  }
}
