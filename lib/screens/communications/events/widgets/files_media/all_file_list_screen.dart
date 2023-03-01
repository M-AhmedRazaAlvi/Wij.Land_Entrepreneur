import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wij_land/screens/communications/events/widgets/files_media/file_delete_dialog_widget.dart';
import 'package:wij_land/screens/communications/events/widgets/files_media/file_list_edit_dialog_widget.dart';

import '../../../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../../../utils/functions.dart';
import '../../../../../utils/responsive.dart';

class AllFileListScreen extends StatelessWidget {
  const AllFileListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SingleChildScrollView(
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
              columnSpacing: getWidth(context) * 0.20,
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'File Name',
                    textAlign: TextAlign.center,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Added by',
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
                    '',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
              rows: <DataRow>[
                for (int i = 0; i < 8; i++)
                  DataRow(
                    onSelectChanged: (v) {},
                    cells: <DataCell>[
                      DataCell(Text(
                        'textFile$i.pdf',
                        textAlign: TextAlign.center,
                      )),
                      DataCell(Text(
                        'Julie1 Solano $i ',
                        textAlign: TextAlign.center,
                      )),
                      DataCell(Text(
                        '${i + 1}-3-2021',
                        textAlign: TextAlign.center,
                      )),
                      DataCell(Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconHoverButton(
                            icons: FontAwesomeIcons.pencilAlt,
                            onPress: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => EditFileListDialogWidget());
                            },
                          ),
                          IconHoverButton(
                            icons: FontAwesomeIcons.solidTrashAlt,
                            onPress: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => DeleteFileDialogWidget());
                            },
                          )
                        ],
                      )),
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
