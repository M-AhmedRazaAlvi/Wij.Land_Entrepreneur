import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';

class EventsDataTableCard extends StatefulWidget {
  const EventsDataTableCard({
    Key? key,
  }) : super(key: key);

  @override
  State<EventsDataTableCard> createState() => _EventsDataTableCardState();
}

class _EventsDataTableCardState extends State<EventsDataTableCard> {
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
              horizontalMargin:
                  !Responsive.isDesktop(context) ? 10 : 20,
              headingTextStyle: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              columnSpacing: !Responsive.isDesktop(context) ? 10 : 20,
              columns: <DataColumn>[
                DataColumn(
                  label: SizedBox(
                    width: 100,
                    child: CustomText(
                      text: 'Event Name',
                      textAligns: TextAlign.start,
                      size: 16,
                      weight: FontWeight.w600,
                      color: ivoryBlack,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 100,
                    child: CustomText(
                      text: 'Status',
                      textAligns: TextAlign.start,
                      size: 16,
                      weight: FontWeight.w600,
                      color: ivoryBlack,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 100,
                    child: CustomText(
                      text: 'Event Date',
                      textAligns: TextAlign.start,
                      size: 16,
                      weight: FontWeight.w600,
                      color: ivoryBlack,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 100,
                    child: CustomText(
                      text: 'Time',
                      textAligns: TextAlign.start,
                      size: 16,
                      weight: FontWeight.w600,
                      color: ivoryBlack,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 100,
                    child: CustomText(
                      text: 'Location',
                      textAligns: TextAlign.start,
                      size: 16,
                      weight: FontWeight.w600,
                      color: ivoryBlack,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 150,
                    child: CustomText(
                      text: 'Anticipate Guest',
                      textAligns: TextAlign.start,
                      size: 16,
                      weight: FontWeight.w600,
                      color: ivoryBlack,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 100,
                    child: CustomText(
                      text: 'Comment',
                      textAligns: TextAlign.start,
                      size: 16,
                      weight: FontWeight.w600,
                      color: ivoryBlack,
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
                        width: 100,
                        child: CustomText(
                          text: '$i event',
                          textAligns: TextAlign.start,
                          size: 14,
                          weight: FontWeight.w400,
                          color: ivoryBlack,
                        ),
                      )),
                      DataCell(SizedBox(
                        width: 100,
                        child: CustomText(
                          text: '$i Scheduled',
                          textAligns: TextAlign.start,
                          size: 14,
                          weight: FontWeight.w400,
                          color: ivoryBlack,
                        ),
                      )),
                      DataCell(SizedBox(
                        width: 100,
                        child: CustomText(
                          text: '${i + 1}-3-2021',
                          textAligns: TextAlign.start,
                          size: 14,
                          weight: FontWeight.w400,
                          color: ivoryBlack,
                        ),
                      )),
                      DataCell(SizedBox(
                        width: 100,
                        child: CustomText(
                          text: '0$i-10PM',
                          textAligns: TextAlign.start,
                          size: 14,
                          weight: FontWeight.w400,
                          color: ivoryBlack,
                        ),
                      )),
                      DataCell(SizedBox(
                        width: 100,
                        child: CustomText(
                          text: '$i Lahore',
                          textAligns: TextAlign.start,
                          size: 14,
                          weight: FontWeight.w400,
                          color: ivoryBlack,
                        ),
                      )),
                      DataCell(SizedBox(
                        width: 100,
                        child: CustomText(
                          text: '$i Governor',
                          textAligns: TextAlign.start,
                          size: 14,
                          weight: FontWeight.w400,
                          color: ivoryBlack,
                        ),
                      )),
                      DataCell(SizedBox(
                        width: 100,
                        child: CustomText(
                          text: '$i Comments',
                          textAligns: TextAlign.start,
                          size: 14,
                          weight: FontWeight.w400,
                          color: ivoryBlack,
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
