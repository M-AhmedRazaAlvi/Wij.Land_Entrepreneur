import 'package:flutter/material.dart';

import '../../../../../../../../../utils/controller.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../routes/routes.dart';

class ChecklistProjWidget extends StatelessWidget {
  const ChecklistProjWidget({
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
                    width: 150,
                    child: Text(
                      'Project Name',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataColumn(

                  label: SizedBox(
                    width: 100,
                    child: Text(
                      'Status',
                      textAlign: TextAlign.center,

                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 150,
                    child: Text(
                      'Start date',
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
                      'Participating\nFarm',
                     // textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 300,
                    child: Text(
                      'Hectares',
                      textAlign: TextAlign.center,
                    ),

                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 100,
                    child: Text(
                      'Comment',

                      textAlign: TextAlign.center,
                    ),

                  ),
                ),
              ],
              rows: <DataRow>[
                for (int i = 0; i < 8; i++)
                  DataRow(
                    onSelectChanged: (v){
                      navigationController.navigateTo(projectProfilePageRoute);
                    },
                    cells: <DataCell>[
                      DataCell(SizedBox(
                        width:150,
                        child: Text(
                          '$i Property Scan Project',
                          textAlign: TextAlign.center,
                        ),
                      )),
                      DataCell(SizedBox(
                        width:100,
                        child: Text(
                          'Active',
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
                          '$i 24',
                          textAlign: TextAlign.center,
                        ),
                      )),

                      DataCell(SizedBox(
                        width:300,
                        child: Text(
                          '$i 24, 25',
                          textAlign: TextAlign.center,
                        ),
                      )),
                      DataCell(SizedBox(
                        width:100,
                        child: Text(
                          '$i Amber Lemming',
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