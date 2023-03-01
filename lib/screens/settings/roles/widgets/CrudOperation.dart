import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/screens/settings/roles/widgets/constants_value.dart';
import 'package:wij_land/screens/settings/roles/widgets/data_cell_widget.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';

class CrudOperations extends StatelessWidget {
  const CrudOperations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: CustomText(
            text: 'Roles'.tr(),
            size: 30,
            color: darkGreen,
            weight: FontWeight.w600,
          ),
        ),
        Divider(
          thickness: 0.1,
          height: 0.1,
          color: ivoryBlack,
          indent: 24,
          endIndent: 24,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          height: 30 * 80,
          child: ListView.builder(
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 11,
            itemBuilder: (context, index) => DataTable(
              showBottomBorder: true,
              headingRowHeight: 80,
              dividerThickness: 0.5,
              checkboxHorizontalMargin: 4.0,
              dataRowHeight: 50,
              // dataRowColor: MaterialStateProperty.all(index%2==0?Colors.white:Color(0xffF2F2F3)),
              horizontalMargin: !Responsive.isDesktop(context) ? 10 : 20,
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
                      text: columnName[index],
                      textAligns: TextAlign.start,
                      size: 13,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
              rows: <DataRow>[
                DataRow(
                  color: MaterialStateProperty.all(Colors.blue),
                  cells: [
                    DataCell(DataCellsWidget(
                      listData: '${farmerList[index]} ${columnName.length}',
                    )),
                  ],
                ),
                DataRow(cells: [
                  DataCell(DataCellsWidget(
                    listData: farmsList[index],
                  )),
                ]),
                DataRow(color: MaterialStateProperty.all(mainlyBlue), cells: [
                  DataCell(DataCellsWidget(
                    listData: plotList[index],
                  )),
                ]),
                DataRow(cells: [
                  DataCell(DataCellsWidget(
                    listData: personList[index],
                  )),
                ]),
                DataRow(color: MaterialStateProperty.all(mainlyBlue), cells: [
                  DataCell(DataCellsWidget(
                    listData: kpiList[index],
                  )),
                ]),
                DataRow(cells: [
                  DataCell(DataCellsWidget(
                    listData: realKpiList[index],
                  )),
                ]),
                DataRow(color: MaterialStateProperty.all(mainlyBlue), cells: [
                  DataCell(DataCellsWidget(
                    listData: projectList[index],
                  )),
                ]),
                DataRow(cells: [
                  DataCell(DataCellsWidget(
                    listData: actionList[index],
                  )),
                ]),
                DataRow(color: MaterialStateProperty.all(mainlyBlue), cells: [
                  DataCell(DataCellsWidget(
                    listData: eventsList[index],
                  )),
                ]),
                DataRow(cells: [
                  DataCell(DataCellsWidget(
                    listData: socialList[index],
                  )),
                ]),
                DataRow(color: MaterialStateProperty.all(mainlyBlue), cells: [
                  DataCell(DataCellsWidget(
                    listData: mediaList[index],
                  )),
                ]),
                DataRow(cells: [
                  DataCell(DataCellsWidget(
                    listData: anecdotesList[index],
                  )),
                ]),
                DataRow(color: MaterialStateProperty.all(mainlyBlue), cells: [
                  DataCell(DataCellsWidget(
                    listData: orgList[index],
                  )),
                ]),
                DataRow(cells: [
                  DataCell(DataCellsWidget(
                    listData: networkList[index],
                  )),
                ]),
                DataRow(color: MaterialStateProperty.all(mainlyBlue), cells: [
                  DataCell(DataCellsWidget(
                    listData: businessList[index],
                  )),
                ]),
                DataRow(cells: [
                  DataCell(DataCellsWidget(
                    listData: replicateList[index],
                  )),
                ]),
                DataRow(color: MaterialStateProperty.all(mainlyBlue), cells: [
                  DataCell(DataCellsWidget(
                    listData: contractList[index],
                  )),
                ]),
                DataRow(cells: [
                  DataCell(DataCellsWidget(
                    listData: reportingList[index],
                  )),
                ]),
                DataRow(color: MaterialStateProperty.all(mainlyBlue), cells: [
                  DataCell(DataCellsWidget(
                    listData: soilList[index],
                  )),
                ]),
                DataRow(cells: [
                  DataCell(DataCellsWidget(
                    listData: treatmentList[index],
                  )),
                ]),
                DataRow(color: MaterialStateProperty.all(mainlyBlue), cells: [
                  DataCell(DataCellsWidget(
                    listData: adviceList[index],
                  )),
                ]),
                DataRow(cells: [
                  DataCell(DataCellsWidget(
                    listData: programsList[index],
                  )),
                ]),
                DataRow(color: MaterialStateProperty.all(mainlyBlue), cells: [
                  DataCell(DataCellsWidget(
                    listData: landList[index],
                  )),
                ]),
                DataRow(cells: [
                  DataCell(DataCellsWidget(
                    listData: userList[index],
                  )),
                ]),
                DataRow(color: MaterialStateProperty.all(mainlyBlue), cells: [
                  DataCell(DataCellsWidget(
                    listData: contactsList[index],
                  )),
                ]),
                DataRow(cells: [
                  DataCell(DataCellsWidget(
                    listData: taskList[index],
                  )),
                ]),
                DataRow(color: MaterialStateProperty.all(mainlyBlue), cells: [
                  DataCell(DataCellsWidget(
                    listData: landUserList[index],
                  )),
                ]),
                DataRow(cells: [
                  DataCell(DataCellsWidget(
                    listData: farmerUserList[index],
                  )),
                ]),
                DataRow(color: MaterialStateProperty.all(mainlyBlue), cells: [
                  DataCell(DataCellsWidget(
                    listData: heapList[index],
                  )),
                ]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
