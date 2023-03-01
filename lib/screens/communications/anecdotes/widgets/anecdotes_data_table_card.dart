import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';

class AnecdotesDataTableCard extends StatelessWidget {
  const AnecdotesDataTableCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 9 * 80,
        width: 1366,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DataTable(
              showBottomBorder: true,
              headingRowHeight: 80,
              dividerThickness: 0.5,
              checkboxHorizontalMargin: 4.0,
              dataRowHeight: 80,
              horizontalMargin: !Responsive.isDesktop(context) ? 10 : 20,
              headingTextStyle: TextStyle(
                color: ivoryBlack,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              columnSpacing: !Responsive.isDesktop(context) ? 10 : 20,
              columns: <DataColumn>[
                DataColumn(
                  label: SizedBox(
                    width: 150,
                    child: CustomText(
                      text: 'Title',
                      textAligns: TextAlign.start,
                      size: 16,
                      color: ivoryBlack,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 100,
                    child: CustomText(
                      text: 'Date',
                      textAligns: TextAlign.start,
                      size: 16,
                      color: ivoryBlack,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 150,
                    child: CustomText(
                      text: 'Impact Direction',
                      textAligns: TextAlign.start,
                      size: 16,
                      color: ivoryBlack,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 100,
                    child: CustomText(
                      text: 'Project',
                      textAligns: TextAlign.start,
                      size: 16,
                      color: ivoryBlack,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 300,
                    child: CustomText(
                      text: 'Organization',
                      textAligns: TextAlign.start,
                      size: 16,
                      color: ivoryBlack,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 100,
                    child: CustomText(
                      text: 'Person',
                      textAligns: TextAlign.start,
                      size: 16,
                      color: ivoryBlack,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
              rows: <DataRow>[
                for (int i = 0; i < 8; i++)
                  DataRow(
                    onSelectChanged: (v) {},
                    cells: <DataCell>[
                      DataCell(SizedBox(
                        width: 150,
                        child: CustomText(
                          text: '$i Title',
                          textAligns: TextAlign.start,
                          size: 14,
                          color: ivoryBlack,
                          weight: FontWeight.w400,
                        ),
                      )),
                      DataCell(SizedBox(
                        width: 100,
                        child: CustomText(
                          text: '${i + 1}-3-2021',
                          textAligns: TextAlign.start,
                          size: 14,
                          color: ivoryBlack,
                          weight: FontWeight.w400,
                        ),
                      )),
                      DataCell(SizedBox(
                        width: 100,
                        child: CustomText(
                          text: '$i Positive',
                          textAligns: TextAlign.start,
                          size: 14,
                          color: ivoryBlack,
                          weight: FontWeight.w400,
                        ),
                      )),
                      DataCell(SizedBox(
                        width: 100,
                        child: CustomText(
                          text: '$i Project',
                          textAligns: TextAlign.start,
                          size: 14,
                          color: ivoryBlack,
                          weight: FontWeight.w400,
                        ),
                      )),
                      DataCell(SizedBox(
                        width: 300,
                        child: CustomText(
                          text: '$i Organization',
                          textAligns: TextAlign.start,
                          size: 14,
                          color: ivoryBlack,
                          weight: FontWeight.w400,
                        ),
                      )),
                      DataCell(SizedBox(
                        width: 100,
                        child: CustomText(
                          text: '$i Amber Lemming',
                          textAligns: TextAlign.start,
                          size: 14,
                          color: ivoryBlack,
                          weight: FontWeight.w400,
                        ),
                      )),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
