import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wij_land/screens/farm_networks/projects/project_profile_screens/widgets/add_comment_dialog.dart';
import 'package:wij_land/screens/farm_networks/projects/project_profile_screens/widgets/participation_status_dialog.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../../../../../../../utils/controller.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../../../app_common_widgets/animated_search.dart';
import '../../../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../../../routes/routes.dart';
import '../../../../communications/anecdotes/widgets/anecdotes_constants.dart';

class InvolvedProjectWidget extends StatefulWidget {
  const InvolvedProjectWidget({Key? key}) : super(key: key);

  @override
  State<InvolvedProjectWidget> createState() => _InvolvedProjectWidgetState();
}

class _InvolvedProjectWidgetState extends State<InvolvedProjectWidget> {
  bool isFilter = false;
  var participatingYearList = [
    '2010',
    '2011',
    '2012',
    '2013',
    '2014',
    '2015',
    '2020',
    '2021',
    '2022'
  ];
  var provinceList = ['Drenthe', 'Flevoland', 'GelderLand', 'FriesLand'];

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
                text: "Involved",
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
                        setState(() {
                          isFilter = !isFilter;
                        });
                      }),
                ],
              )
            ],
          ),
        ),
        isFilter
            ? Card(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SelectableDropdownWidget(
                    items: participatingYearList,
                    title: "Participating year",
                    mSelectedValue: "",
                    mOnDropDownChange: (value) {},
                    mSelectedItemsList: [],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  SelectableDropdownWidget(
                    items: provinceList,
                    title: "Province",
                    mSelectedValue: "",
                    mOnDropDownChange: (value) {},
                    mSelectedItemsList: [],
                  )
                ]),
              )
            : SizedBox.shrink(),
        SingleChildScrollView(
          // scrollDirection: !Responsive.isDesktop(context)? Axis.horizontal:Axis.vertical,
          child: Expanded(
            child: SizedBox(
              //  height: 9 * 80,
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
                      for (int i = 0; i < 28; i++)
                        DataRow(
                          //    onSelectChanged: (v) {},
                          cells: <DataCell>[
                            DataCell(SizedBox(
                              width: 100,
                              child: InkWell(
                                onTap: () {
                                  navigationController
                                      .navigateTo(farmProfileRoute);
                                },
                                child: Text(
                                  'Farm of Mindy Degroot',
                                  textAlign: TextAlign.center,
                                ),
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
                                      border: Border.all(color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: Center(
                                    child: Text(
                                      'Avtive\nParticipant',
                                    ),
                                  ),
                                ),
                              ),
                            )),
                            DataCell(
                                SizedBox(width: 30, child: Icon(Icons.edit))),
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
                                        child:
                                            Icon(Icons.mode_comment_outlined)),
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
          ),
        )
      ]),
    );
  }
}
