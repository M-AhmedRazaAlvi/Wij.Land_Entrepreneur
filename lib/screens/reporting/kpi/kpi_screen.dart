import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/screens/reporting/kpi/widget/kp_card_widget.dart';
import 'package:wij_land/screens/reporting/kpi/widget/kpi_dialog_widget.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../../routes/routes.dart';
import '../../../utils/controller.dart';
import '../../office/widgets/add_button.dart';

class KpiScreen extends StatelessWidget {
  const KpiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
            Container(
              margin: EdgeInsets.only(left: 24, right: 24.0, bottom: 8, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'KPI\'s',
                    color: third,
                    size: 40,
                    weight: FontWeight.w600,
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: ButtonWithAddIcon(
                      text: 'Add KPI',
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AddKpiDialogWidget();
                            });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Wrap(
              children: [
                for (int i = 0; i < 22; i++)
                  SizedBox(
                    height: 200,
                    width: !Responsive.isDesktop(context)
                        ? getWidth(context) / 4
                        : !Responsive.isDesktop(context)
                            ? getWidth(context) / 2
                            : !Responsive.isDesktop(context)
                                ? getWidth(context)
                                : getWidth(context) / 4,
                    child: KpiCardWidget(
                      'Number of farmers involved with Wij.land $i ',
                      '$i ',
                      '$i-3-2022',
                      onPress: () {
                        navigationController.navigateToWithArguments(
                            routeName: kpisDetailsPageRoute,
                            arguments: [
                              'Number of farmers involved with Wij.land',
                              '$i'
                            ]);
                        // menuController.changeActiveItemTo(
                        //     'kpi_details', kpisDetailsPageRoute);
                        // Get.toNamed(kpisDetailsPageRoute, arguments: ['Number of farmers involved with Wij.land','$i']);
                      },
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
