import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/farm_data/update_farm/all_farm_screens.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../utils/functions.dart';
import '../../../../../../utils/responsive.dart';
import '../../../../../../utils/styles.dart';
import '../../../../../office/widgets/comment_text.dart';

class ManagementFarmWidget extends StatelessWidget {
  const ManagementFarmWidget({
    Key? key,
    required this.checkAll,
    required this.checkedValue,
  }) : super(key: key);

  final bool checkAll;
  final bool checkedValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70 * 15,
      child: ListView(
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            child: Column(
              children: [
                Container(
                  width: !Responsive.isDesktop(context)
                      ? getWidth(context) * 1.5
                      : getWidth(context) * 0.9,
                  padding: EdgeInsets.all(15),
                  color: lightskin,
                  child: CustomText(
                    text: "Management",
                    size: 18,
                  ),
                ),
                Column(
                  children: [
                    for (int i = 0; i < 5; i++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FarmAllDataWidget(
                          first: false,
                          check: checkAll,
                          contactType: "Management Comment",
                          contactDate: "Normal",
                          peopleInvolved: "03-05-2022",
                          comment: "",
                          size: !Responsive.isDesktop(context)
                              ? getWidth(context) / 2
                              : getWidth(context) / 3.2,
                          titleFarmButtonList: const [
                            "Management_comments",
                          ],
                          chekedValue: checkedValue,
                          child: CommentTextField(),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
