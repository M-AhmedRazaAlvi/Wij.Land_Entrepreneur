import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../app_common_widgets/custom_text.dart';
import '../../../utils/styles.dart';

/// Example without datasource
class DriversTable extends StatelessWidget {
  const DriversTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: active.withOpacity(.4), width: .5),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 30),
      child: DataTable2(
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,
          columns: const [
            DataColumn2(
              label: Text("Name"),
              size: ColumnSize.L,
            ),
            DataColumn(
              label: Text('Location'),
            ),
            DataColumn(
              label: Text('Rating'),
            ),
            DataColumn(
              label: Text('Action'),
            ),
          ],
          rows: List<DataRow>.generate(
              15,
              (index) => DataRow(cells: [
                    DataCell(CustomText(
                      text: "Santos Enoque",
                      size: 16,
                      color: active,
                      weight: FontWeight.normal,
                    )),
                    DataCell(CustomText(
                      text: "New yourk city",
                      size: 16,
                      color: active,
                      weight: FontWeight.normal,
                    )),
                    DataCell(Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.deepOrange,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CustomText(
                          text: "4.5",
                          size: 16,
                          color: active,
                          weight: FontWeight.normal,
                        )
                      ],
                    )),
                    DataCell(Container(
                        decoration: BoxDecoration(
                          color: light,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: active, width: .5),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        child: CustomText(
                          text: "Block",
                          color: active.withOpacity(.7),
                          weight: FontWeight.bold,
                          size: 16,
                        ))),
                  ]))),
    );
  }
}
