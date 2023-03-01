import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../../office/widgets/add_text_button_widget.dart';

class VisualizationFarmsDataTableWidget extends StatefulWidget {
  final Function(dynamic)? callBACK;

  const VisualizationFarmsDataTableWidget({Key? key, this.callBACK})
      : super(key: key);

  @override
  State<VisualizationFarmsDataTableWidget> createState() =>
      _VisualizationFarmsDataTableWidgetState();
}

class _VisualizationFarmsDataTableWidgetState
    extends State<VisualizationFarmsDataTableWidget> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      showBottomBorder: true,
      headingRowHeight: 80,
      dividerThickness: 0.5,
      checkboxHorizontalMargin: 4.0,
      dataRowHeight: 80,
      horizontalMargin: !Responsive.isDesktop(context) ? 10 : 4,
      columnSpacing: getWidth(context) * 0.25,
      columns: <DataColumn>[
        DataColumn(
          label: CustomText(
            text: 'Farm Name',
            color: ivoryBlack,
            weight: FontWeight.w600,
            size: 16,
          ),
        ),
        DataColumn(
          label: Text(
            '',
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
      rows: <DataRow>[
        for (int i = 0; i < 8; i++)
          DataRow(
            onSelectChanged: (v) {
              print('new $v value $i');
            },
            cells: <DataCell>[
              DataCell(CustomText(
                text: 'Farms of Utrecht with Meat Cattle $i',
                color: ivoryBlack,
                size: 14,
                weight: FontWeight.w400,
              )),
              DataCell(
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconHoverButton(
                      icons: FontAwesomeIcons.pen,
                      onPress: () {
                        widget.callBACK!.call('Farm number is $i');
                      },
                    ),
                    AddTextButtonWidget(
                      onPress: () {
                        Get.toNamed('/visualization_graph',
                            arguments: {'farm': 'Farm number is $i'});
                      },
                      text: 'Visualize',
                      colors: Colors.white,
                      textColor: dimGrey,
                    ),
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }
}
