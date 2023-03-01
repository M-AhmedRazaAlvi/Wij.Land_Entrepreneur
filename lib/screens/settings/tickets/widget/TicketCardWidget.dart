


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/controller.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../roles/widgets/constants_value.dart';

class TicketCardWidget extends StatefulWidget {
  final String? title, counts, date;
  // final Function()? onPress;

  const TicketCardWidget(this.title, this.counts, this.date,
      {Key? key,})
      : super(key: key);

  @override
  State<TicketCardWidget> createState() => _TicketCardWidgetState();
}

class _TicketCardWidgetState extends State<TicketCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Card(
        elevation: 3,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            showBottomBorder: true,
            headingRowHeight: 80,
            dividerThickness: 0.5,
            checkboxHorizontalMargin: 4.0,
            dataRowHeight: 80,
            horizontalMargin:
                !Responsive.isDesktop(context) ? 10 : 30,
            headingTextStyle: TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            columnSpacing:
                !Responsive.isDesktop(context) ? 10 : 30,
            columns: <DataColumn>[
              for (int i = 0; i < 5; i++)
                DataColumn(
                  label: Container(
                    width: 200,
                    padding: EdgeInsets.only(bottom: 8),
                    alignment: Alignment.bottomLeft,
                    child: CustomText(
                      text: columnName[i],
                      textAligns: TextAlign.start,
                      size: 13,
                      weight: FontWeight.w600,
                      color: ivoryBlack,
                    ),
                  ),
                ),
            ],
            rows: <DataRow>[
              for (int i = 0; i < 5; i++)
                DataRow(
                  cells: <DataCell>[
                    DataCell(SizedBox(
                      width: 200,
                      child: CustomText(
                        text: "$i " "Ticket".tr(),
                        color: ivoryBlack,
                        size: 13,
                        textAligns: TextAlign.start,
                        weight: FontWeight.w400,
                      ),
                    )),
                    DataCell(SizedBox(
                      width: 200,
                      child: CustomText(
                        text: '$i ' 'under_review'.tr(),
                        color: ivoryBlack,
                        size: 13,
                        textAligns: TextAlign.start,
                        weight: FontWeight.w400,
                      ),
                    )),
                    DataCell(SizedBox(
                      width: 200,
                      child: CustomText(
                        text: 'Admin'.tr(),
                        color: ivoryBlack,
                        size: 13,
                        textAligns: TextAlign.start,
                        weight: FontWeight.w400,
                      ),
                    )),
                    DataCell(SizedBox(
                      width: 200,
                      child: CustomText(
                        text: '${i + 1}-3-2021',
                        size: 13,
                        color: ivoryBlack,
                        textAligns: TextAlign.start,
                        weight: FontWeight.w400,
                      ),
                    )),
                    DataCell(Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconHoverButton(
                            icons: FontAwesomeIcons.solidFolderOpen,
                            onPress: () {
                               navigationController.navigateTo(ticketsDetailsPageRoute);

                            }),
                        SizedBox(
                          width: 1,
                        ),
                        IconHoverButton(
                            icons: FontAwesomeIcons.pen,
                            onPress: () {
                              navigationController.navigateTo(updateTicketsDetailsPageRoute);

                              //  showPopupMenu();
                            }),
                        SizedBox(
                          width: 16,
                        ),
                      ],
                    )),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
