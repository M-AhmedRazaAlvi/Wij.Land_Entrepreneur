import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/functions.dart';
import '../../../utils/responsive.dart';

class SharedDataTableWidget extends StatelessWidget {
  const SharedDataTableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        showBottomBorder: true,
        headingRowHeight: 80,
        dividerThickness: 0.5,
        checkboxHorizontalMargin: 4.0,
        dataRowHeight: 80,
        horizontalMargin: !Responsive.isDesktop(context) ? 10 : 20,
        headingTextStyle: TextStyle(
          color: Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        showCheckboxColumn: false,
        columnSpacing: getWidth(context) * 0.11,
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Filter Name',
              textAlign: TextAlign.center,
            ),
          ),
          DataColumn(
            label: Text(
              'Date',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          DataColumn(
            label: Text(
              'Creater',
              textAlign: TextAlign.center,
            ),
          ),
          DataColumn(
            label: Text(
              'Description',
              textAlign: TextAlign.center,
            ),
          ),
          DataColumn(
            label: SizedBox(
                width: 40,
                child: FaIcon(
                  FontAwesomeIcons.hashtag,
                  size: 14,
                )),
          ),
        ],
        rows: <DataRow>[
          for (int i = 0; i < 8; i++)
            DataRow(
              onSelectChanged: (v) {
                print('new $v value $i');
              },
              cells: <DataCell>[
                DataCell(Text(
                  'Farms in Utrecht with Meat Cattle $i',
                  textAlign: TextAlign.center,
                )),
                DataCell(Text(
                  '${i + 1}-3-2021',
                  textAlign: TextAlign.center,
                )),
                DataCell(Text(
                  'Willemijn van Leevuwen, $i ',
                  textAlign: TextAlign.center,
                )),
                DataCell(SizedBox(
                  width: getWidth(context) * 0.3,
                  child: Text(
                    'This shows the farms within Utrecht with meat as their main type of cattle type $i',
                    textAlign: TextAlign.justify,
                  ),
                )),
                DataCell(
                  Icon(
                    Icons.open_in_new_rounded,
                    size: 20,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
