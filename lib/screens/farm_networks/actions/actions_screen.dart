import 'package:flutter/material.dart';
import 'package:wij_land/routes/routes.dart';

import '../../../app_common_widgets/custom_text.dart';
import '../../../utils/controller.dart';
import '../../../utils/functions.dart';
import '../../../utils/responsive.dart';
import '../../../utils/styles.dart';
import '../../contacts/widgets/popup_menu_button.dart';
import '../../office/office_programes/Widgets/addicon_and_dialog.dart';
import '../farms/farm_screens/Parcels/profile/actions/dialogs/parcel_action_add_dialog.dart';

class ActionsScreen extends StatelessWidget {
  const ActionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
          width: getWidth(context),
          height: getHeight(context),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  width: getWidth(context),
                  child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
                    CustomText(
                      text: "Actions",
                      size: 25,
                      weight: FontWeight.bold,
                      color: third,
                    ),
                    Wrap(
                      children: [
                        AddIconsAndDialogBox(
                            addText: "Add Action",
                            icons: Icons.filter_alt,
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ParcelActionAddDialog();
                                  });
                            })
                      ],
                    )
                  ]),
                ),
              ),
              Stack(
                children: [
                  Card(
                    elevation: 2,
                    margin: EdgeInsets.all(20),
                    child: SizedBox(
                      width: getWidth(context),
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
                                !Responsive.isDesktop(context) ? 10 : 10,
                            headingTextStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                            columnSpacing: 10,
                            //ResponsiveWidget.isSmallScreen(context) ? 10 : 15,
                            columns: const <DataColumn>[
                              DataColumn(
                                label: SizedBox(
                                  width: 50,
                                  child: Text(
                                    'Action',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: SizedBox(
                                  width: 150,
                                  child: Text(
                                    'Farm/Organization',
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: SizedBox(
                                  width: 300,
                                  child: Text(
                                    'Location',
                                    textAlign: TextAlign.left,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: SizedBox(
                                  width: 70,
                                  child: Text(
                                    'Date',
                                    // textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: SizedBox(
                                  width: 100,
                                  child: Text(
                                    'Project',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: SizedBox(
                                  width: 100,
                                  child: Text(
                                    'Persons',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                            rows: <DataRow>[
                              for (int i = 0; i < 18; i++)
                                DataRow(
                                  onSelectChanged: (v) {
                                    navigationController
                                        .navigateTo(farmActionProfile);
                                  },
                                  cells: <DataCell>[
                                    DataCell(SizedBox(
                                      width: 150,
                                      child: Text(
                                        ' Property Scan ',
                                        textAlign: TextAlign.left,
                                      ),
                                    )),
                                    DataCell(SizedBox(
                                      width: 150,
                                      child: Text(
                                        'Farm of Ioana Ahren',
                                        textAlign: TextAlign.left,
                                      ),
                                    )),
                                    DataCell(SizedBox(
                                      width: 300,
                                      child: Text(
                                        ' ',
                                        textAlign: TextAlign.left,
                                      ),
                                    )),
                                    DataCell(SizedBox(
                                      width: 100,
                                      child: Text(
                                        '${i + 1}-3-2021',
                                        textAlign: TextAlign.left,
                                      ),
                                    )),
                                    DataCell(SizedBox(
                                      width: 100,
                                      child: Text(
                                        'Property Scan',
                                        textAlign: TextAlign.left,
                                      ),
                                    )),
                                    DataCell(SizedBox(
                                      width: 100,
                                      child: Text(
                                        'Bob Martin,Arjun Mi Lans',
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
                  ),
                  Positioned(
                    top: 15,
                    right: 15,
                    child: PopUpMenuButtonWidget( mOnDeleteTap: () {},),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
