import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';

class KpiDataTableWidget extends StatelessWidget {
  const KpiDataTableWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        showBottomBorder: true,
        headingRowHeight: 40,
        dividerThickness: 0.5,
        checkboxHorizontalMargin: 4.0,
        dataRowHeight: 50,
        horizontalMargin:
        !Responsive.isDesktop(context) ? 10 : 30,
        columnSpacing: getWidth(context)*0.23,
        columns: <DataColumn>[
          DataColumn(
            label: CustomText(
             text: 'Date added',
              size: 16,
              color: ivoryBlack,
              weight: FontWeight.w600,
            ),
          ),
          DataColumn(
            label: CustomText(
             text: 'Name',
              size: 16,
              color: ivoryBlack,
              weight: FontWeight.w600,
            ),
          ),
          DataColumn(
            label: CustomText(
              text: 'Added by',
              size: 16,
              color: ivoryBlack,
              weight: FontWeight.w600,
            ),
          ),
        ],
        rows: <DataRow>[
          for (int i = 0; i < 8; i++)
            DataRow(
              cells: <DataCell>[
                DataCell(CustomText(text: '${i + 1}-3-2021',
                  size: 14,
                  color: ivoryBlack,
                  weight: FontWeight.w400,)),
                DataCell(InkWell(
                    onTap: () {
                     /* navigationController.navigateToWithArguments(routeName: PersonProfileScreen, arguments: [
                        'Number of farmers involved with Wij.land',
                        '$i'
                      ]);*/
                      // menuController.changeActiveItemTo('kpi_details',kpisDetailsPageRoute);

                    },
                    child: CustomText(text: 'Adam',
                      size: 14,
                      color: ivoryBlack,
                      weight: FontWeight.w400,))),
                DataCell(CustomText(text: 'Admin',
                  size: 14,
                  color: ivoryBlack,
                  weight: FontWeight.w400,)),
              ],
            ),
        ],
      ),
    );
  }
}
