import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/controller.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../routes/routes.dart';
import '../../communications/anecdotes/widgets/anecdotes_constants.dart';
import '../../office/office_programes/Widgets/addicon_and_dialog.dart';
import '../../office/wij_lan_team/person_profile/contract/Dialogs/add_dialog_contract.dart';
import '../projects/project_profile_screens/widgets/add_comment_dialog.dart';
import '../projects/project_profile_screens/widgets/participation_status_dialog.dart';

class PilotContractScreen extends StatefulWidget {
  const PilotContractScreen({Key? key}) : super(key: key);

  @override
  State<PilotContractScreen> createState() => _PilotContractScreenState();
}

class _PilotContractScreenState extends State<PilotContractScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: getWidth(context),
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: getWidth(context),
                child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
                  CustomText(
                    text: "Pilot Contract",
                    size: 25,
                    weight: FontWeight.bold,
                    color: third,
                  ),
                  Wrap(
                    children: [
                      AddIconsAndDialogBox(
                          addText: "Add Contract",
                          icons: Icons.filter_alt,
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AddContractDialog(
                                    profileText: "Add Contract",
                                    submitText: "Add Contract",
                                  );
                                });
                          })
                    ],
                  )
                ]),
              ),
            ),
            // Obx(() => Row(
            //       children: [

            //         // Padding(
            //         //   padding: const EdgeInsets.all(15.0),
            //         //   child: CustomText(
            //         //     text: menuController.activeItemRoute.value,
            //         //     size: 16,
            //         //     weight: FontWeight.bold,
            //         //     color: secondary,
            //         //   ),
            //         // ),
            //       ],
            //     )),
            Stack(
              children: [
                Card(
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
                              child: Text(
                                'Farm Name',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 120,
                              child: Text(
                                'Farm Project\nRepresentative',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 100,
                              child: Text(
                                'Start Date',
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
                                'Participating\nStatus',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              // width: 40,
                              child: Text(
                                'Parcel',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                                width: 60,
                                child: IconHoverButton(
                                    icons: FontAwesomeIcons.ellipsisV,
                                    onPress: () {
                                      setState(() {
                                        showPopupAnecdotesMenu(context, 170);
                                      });
                                    })),
                          ),
                        ],
                        rows: <DataRow>[
                          for (int i = 0; i < 18; i++)
                            DataRow(
                              onSelectChanged: (v) {
                                navigationController
                                    .navigateTo(pilotContractProfileRoute);
                              },
                              cells: <DataCell>[
                                DataCell(SizedBox(
                                  width: 100,
                                  child: Text(
                                    'Farm of Mindy Degroot',
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                                DataCell(SizedBox(
                                  width: 100,
                                  child: Text(
                                    "",
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                                DataCell(SizedBox(
                                  width: 100,
                                  child: Text(
                                    '${i + 1}-3-2021',
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                                DataCell(InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) =>
                                            ParticipationStatusDialog());
                                  },
                                  child: SizedBox(
                                    width: 120,
                                    height: 60,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Center(
                                        child: Text(
                                          'Avtive\nParticipant',
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                                DataCell(SizedBox(
                                    width: 30, child: Icon(Icons.edit))),
                                DataCell(SizedBox(
                                    child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (_) => AddCommentDialog());
                                      },
                                      child: SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Card(
                                            elevation: 2,
                                            child: Icon(
                                                Icons.mode_comment_outlined)),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Card(
                                          elevation: 2,
                                          child: Icon(Icons.history)),
                                    )
                                  ],
                                ))),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
