import 'package:flutter/material.dart';

import '../../../../utils/responsive.dart';

class MediaDataTableCard extends StatelessWidget {
  const MediaDataTableCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 9*80,
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
              columnSpacing:
              !Responsive.isDesktop(context) ? 10 : 20,
              columns: const <DataColumn>[
                DataColumn(
                  label: SizedBox(
                    width: 300,
                    child: Text(
                      'Title',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataColumn(

                  label: SizedBox(
                    width: 100,
                    child: Text(
                      'Date',
                      textAlign: TextAlign.center,

                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 100,
                    child: Text(
                      'Author',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width:100,
                    child: Text(
                      'Impact',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 100,
                    child: Text(
                      'Type',
                      textAlign: TextAlign.center,
                    ),

                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 120,
                    child: Text(
                      'Publish Where',

                      textAlign: TextAlign.center,
                    ),

                  ),
                ),
              ],
              rows: <DataRow>[
                for (int i = 0; i < 8; i++)
                  DataRow(
                    onSelectChanged: (v){},
                    cells: <DataCell>[
                      DataCell(SizedBox(
                        width:300,
                        child: Text(
                          '$i Title',
                          textAlign: TextAlign.center,
                        ),
                      )),
                      DataCell(SizedBox(
                        width:100,
                        child: Text(
                          '${i + 1}-3-2021',
                          textAlign: TextAlign.center,
                        ),
                      )),
                      DataCell(SizedBox(
                        width:100,
                        child: Text(
                          '$i author',
                          textAlign: TextAlign.center,
                        ),
                      )),
                      DataCell(SizedBox(
                        width:100,
                        child: Text(
                          '00$i',
                          textAlign: TextAlign.center,
                        ),
                      )),

                      DataCell(SizedBox(
                        width:100,
                        child: Text(
                          '$i Online',
                          textAlign: TextAlign.center,
                        ),
                      )),
                      DataCell(SizedBox(
                        width:100,
                        child: Text(
                          '$i Nos Journal',
                          textAlign: TextAlign.center,
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
