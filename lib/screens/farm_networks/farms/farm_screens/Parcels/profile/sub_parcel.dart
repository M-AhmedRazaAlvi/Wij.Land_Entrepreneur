import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/widget/sub_dailog.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/widget/sub_parcel_info.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/icon_text_container.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/styles.dart';

class SubParcelScreen extends StatelessWidget {
  const SubParcelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool checkAll = false;
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        width: getWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: getWidth(context),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  CustomText(
                    text: "Sub Parcels",
                    size: 30,
                    color: hoverColor,
                    weight: FontWeight.bold,
                  ),
                  IconAndTextContainer(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SubParcelAddDialog();
                          });
                    },
                    addText: "Sub Parcel",
                  )
                ],
              ),
            ),
            SubParcelInfoRow(checkAll: checkAll)
          ],
        ),
      ),
    );
  }
}
