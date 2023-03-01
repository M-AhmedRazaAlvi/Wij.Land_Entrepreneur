import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/controller.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../../../routes/routes.dart';
import '../../../../contacts/widgets/add_member_dialog.dart';
import '../../../../office/office_programes/Widgets/addicon_and_dialog.dart';

class ActionsProjectWidget extends StatelessWidget {
  const ActionsProjectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
           Container(
             padding: EdgeInsets.only(left: 12,top: 20,right: 12),
             width: getWidth(context),
             child: Wrap(
               alignment: WrapAlignment.spaceBetween,
             //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
               CustomText(
                text: "Actions",
                size: 22,
                weight: FontWeight.bold,
                color: darkGreen,
                ),
        Wrap(
             children: [
              AddIconsAndDialogBox(
                  icons: Icons.filter_alt,
                  onIconTap: () {},
                  addText: "Add Actions",
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AddMemberDialog();
                        });
                  })
          ],
        ),
             ],),
           ),
           Column(
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
                      'Action',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataColumn(

                  label: SizedBox(
                    width: 100,
                    child: Text(
                      'Name',
                      textAlign: TextAlign.center,

                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 150,
                    child: Text(
                      'Done by',
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
                      'Report',
                     // textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 300,
                    child: Text(
                      'Image',
                      textAlign: TextAlign.center,
                    ),

                  ),
                ),
              
              ],
              rows: <DataRow>[
                for (int i = 0; i < 8; i++)
                  DataRow(
                     onSelectChanged: (v) {
                                    navigationController.navigateTo(farmActionProfile);
                                  },
                    cells: <DataCell>[
                      DataCell(SizedBox(
                        width:150,
                        child: Text(
                          'Property Scan',
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
                          'Ajay jadeja',
                          textAlign: TextAlign.center,
                        ),
                      )),
                      DataCell(SizedBox(
                        width:100,
                        child: Text(
                          '',
                          textAlign: TextAlign.center,
                        ),
                      )),

                      DataCell(SizedBox(
                        width:300,
                        child: Icon(FontAwesomeIcons.solidImage)
                      )),
                     
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
