import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../office/office_programes/Widgets/addicon_and_dialog.dart';
import '../../../../sustainable_finance/entrepreneurs/contacts/add_task_in_contact_moment_dialog_widget.dart';

class TaskProjectWidget extends StatefulWidget {
  const TaskProjectWidget({Key? key}) : super(key: key);

  @override
  State<TaskProjectWidget> createState() => _TaskProjectWidgetState();
}

class _TaskProjectWidgetState extends State<TaskProjectWidget> {
  bool remember = false;
  String? status = 'Done';
  List<String> statusList = ['Done', 'In progress', 'To do'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.only(left: 12, top: 20, right: 12),
          width: getWidth(context),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "Task",
                size: 22,
                weight: FontWeight.bold,
                color: darkGreen,
              ),
              Wrap(
                children: [
                  AddIconsAndDialogBox(
                      icons: Icons.filter_alt,
                      onIconTap: () {},
                      addText: "Add Task",
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AddTasksDialogBox();
                            });
                      })
                ],
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DataTable(
              showCheckboxColumn: false,
              showBottomBorder: true,
              headingRowHeight: 80,
              dividerThickness: 0.5,
              // checkboxHorizontalMargin: 4.0,
              dataRowHeight: 80,
              horizontalMargin: !Responsive.isDesktop(context) ? 10 : 20,
              headingTextStyle: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              columnSpacing: !Responsive.isDesktop(context) ? 10 : 20,
              columns: const <DataColumn>[
                DataColumn(
                  label: SizedBox(
                    width: 100,
                    child: Text(
                      'Assigned to',
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
                    width: 120,
                    child: Text(
                      'Contact Moment',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 100,
                    child: Text(
                      'Farm Name',
                      // textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 100,
                    child: Text(
                      'Due Date',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 100,
                    child: Text(
                      'Desciption',
                      textAlign: TextAlign.center,
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
                        child: Text(
                          'Juliel Solano',
                          textAlign: TextAlign.center,
                        ),
                      )),
                      DataCell(SizedBox(
                          width: 100,
                          child: Expanded(
                            child: RealDropDownWidget(
                              value: status,
                              onChanged: (newValue) {
                                setState(() {
                                  status = newValue;
                                });
                              },
                              items: statusList.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                    value: value, child: Text(value));
                              }).toList(),
                            ),
                          ))),
                      DataCell(SizedBox(
                          width: 100,
                          child: RealCheckBoxWidget(
                            value: remember,
                            onChanged: (vs) {},
                            Labeltext: '',
                          ))),
                      DataCell(SizedBox(
                        width: 100,
                        child: Text(
                          'Mapple Valley Garden',
                          textAlign: TextAlign.center,
                        ),
                      )),
                      DataCell(SizedBox(width: 100, child: Text("14-7-2021"))),
                      DataCell(SizedBox(width: 100, child: Text("tasks"))),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
