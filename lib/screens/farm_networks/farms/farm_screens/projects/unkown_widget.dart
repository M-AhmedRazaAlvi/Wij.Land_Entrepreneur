import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/projects/dialog_unknown.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/styles.dart';

class UnknownWidget extends StatelessWidget {
  const UnknownWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DialogUnknownBox();
                });
          },
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black26)),
              child: CustomText(
                text: "Unknown",
                color: darkBlue,
              )),
        ),
      ],
    );
  }
}
