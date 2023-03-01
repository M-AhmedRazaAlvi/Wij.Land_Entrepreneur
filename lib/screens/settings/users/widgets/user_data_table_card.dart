
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wij_land/screens/settings/users/widgets/user_edit_dialog_widget.dart';
import 'package:wij_land/screens/settings/users/widgets/user_more_dialog_widget.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/styles.dart';

class UserDataTableCard extends StatelessWidget {
  const UserDataTableCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
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
              horizontalMargin: 6,
              headingTextStyle: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            //  columnSpacing: ResponsiveWidget.isSmallScreen(context) ? 10 : 30,
              columns: <DataColumn>[
                DataColumn(
                  label: SizedBox(
                    width:  getWidth(context)*0.25,
                    child: CustomText(
                      text: 'Name'.tr(),
                      size: 13,
                      weight: FontWeight.w600,
                      color: ivoryBlack,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width:  getWidth(context)*0.25,
                    child: CustomText(
                      text: 'Email'.tr(),
                      size: 13,
                      weight: FontWeight.w600,
                      color: ivoryBlack,
                    ),
                  ),
                ),
                DataColumn(
                  label: CustomText(
                    text: 'Join Date'.tr(),
                    size: 13,
                    weight: FontWeight.w600,
                    color: ivoryBlack,
                  ),
                ),
                DataColumn(
                  label: CustomText(
                    text: 'Status'.tr(),
                    size: 13,
                    weight: FontWeight.w600,
                    color: ivoryBlack,
                  ),
                ),
                DataColumn(
                  label: CustomText(
                    text: 'Profile'.tr(),
                    size: 13,
                    weight: FontWeight.w600,
                    color: ivoryBlack,
                  ),
                ),
                DataColumn(label: Container()),
              ],
              rows: <DataRow>[
                for (int i = 0; i < 8; i++)
                  DataRow(
                    cells: <DataCell>[
                      DataCell(ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: getWidth(context)*0.25),
                        child: CustomText(
                          text: '$i Admin',
                          size: 13,
                          weight: FontWeight.w400,
                          color: ivoryBlack,
                        ),
                      )),
                      DataCell(CustomText(
                        text: '$i Admin@admin.com',
                        size: 13,
                        weight: FontWeight.w400,
                        color: ivoryBlack,
                      )),
                      DataCell(CustomText(
                        text: '${i + 1}-3-2021',
                        size: 13,
                        weight: FontWeight.w400,
                        color: ivoryBlack,
                      )),
                      DataCell(CustomText(
                        text: '$i Active',
                        size: 13,
                        weight: FontWeight.w400,
                        color: ivoryBlack,
                      )),
                      DataCell(SizedBox(
                        height: 40,
                        child: OutlinedButton(
                          onPressed: () {
                           /* navigationController.navigateToWithArguments(PersonProfileScreen,arguments:[
                              'Number of farmers involved with Wij.land',
                              '$i'
                            ] );*/
                          },
                          child: CustomText(
                            text: 'View Profile'.tr(),
                            color: ivoryBlack,
                            size: 13,
                            weight: FontWeight.w400,
                          ),
                        ),
                      )),
                      DataCell(Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconHoverButton(
                                    icons: FontAwesomeIcons.pen,
                                    onPress: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return EditUserDialogWidget();
                                          });
                                    }),
                                SizedBox(
                                  width: 4,
                                ),
                                IconHoverButton(
                                    icons: FontAwesomeIcons.ellipsisV,
                                    onPress: () {
                                      showDialog(context: context, builder: (_)=>UserMoreDialogWidget(name:'$i name'));
                                    }),
                                SizedBox(
                                  width: 4,
                                ),
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
