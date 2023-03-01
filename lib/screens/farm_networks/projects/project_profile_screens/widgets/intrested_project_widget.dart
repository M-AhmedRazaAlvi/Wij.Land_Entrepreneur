import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../../../app_common_widgets/animated_search.dart';
import '../../../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../../communications/anecdotes/widgets/anecdotes_constants.dart';
import 'add_comment_dialog.dart';
import 'participation_status_dialog.dart';

class IntrestedProjectWidget extends StatefulWidget {
  const IntrestedProjectWidget({Key? key}) : super(key: key);

  @override
  State<IntrestedProjectWidget> createState() => _IntrestedProjectWidgetState();
}

class _IntrestedProjectWidgetState extends State<IntrestedProjectWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "Intrested",
                color: darkGreen,
                weight: FontWeight.bold,
                size: 25,
              ),
              Row(
                children: [
                  AnimatedSearchWidget(),
                  IconHoverButton(
                      icons: FontAwesomeIcons.filter,
                      onPress: () {
                        setState(() {});
                      }),
                ],
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: 9 * 80,
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
                          'Participation Status',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 100,
                        child: Text(
                          'Intrest Status',
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
                          'Updated At',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        // width: 40,
                        child: Text(
                          'Updated By',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        // width: 40,
                        child: Text(
                          'Comment',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                          width: 100,
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
                    for (int i = 0; i < 3; i++)
                      DataRow(
                        onSelectChanged: (v) {},
                        cells: <DataCell>[
                          DataCell(SizedBox(
                            width: 100,
                            child: Text(
                              'Farm of Jp vn',
                              textAlign: TextAlign.center,
                            ),
                          )),
                          DataCell(InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => ParticipationStatusDialog());
                            },
                            child: SizedBox(
                              width: 80,
                              height: 50,
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Center(
                                  child: Text(
                                    'Unknown',
                                  ),
                                ),
                              ),
                            ),
                          )),
                          DataCell(InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => ParticipationStatusDialog());
                            },
                            child: SizedBox(
                              width: 120,
                              height: 60,
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Center(
                                  child: Text(
                                    'Intrested',
                                  ),
                                ),
                              ),
                            ),
                          )),
                          DataCell(SizedBox(
                            width: 100,
                            child: Text(
                              '${i + 1}-3-2021',
                              textAlign: TextAlign.center,
                            ),
                          )),
                          DataCell(SizedBox(
                            width: 100,
                            child: Text(
                              'Julie Solano',
                              textAlign: TextAlign.center,
                            ),
                          )),
                          DataCell(SizedBox(
                            width: 100,
                            child: Text(
                              ' ',
                              textAlign: TextAlign.center,
                            ),
                          )),
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
                                      child: Icon(Icons.mode_comment_outlined)),
                                ),
                              ),
                              SizedBox(width: 5),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Card(
                                    elevation: 2, child: Icon(Icons.history)),
                              )
                            ],
                          ))),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
