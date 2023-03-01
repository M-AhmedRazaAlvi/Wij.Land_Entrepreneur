import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/models/entrepreneur/response/farm_supplier_response.dart';
import 'package:wij_land/providers/entrepreneur/farm_supplier_provider.dart';
import 'package:wij_land/utils/functions.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../providers/GlobalProvider/navigation/navigation_provider.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/controller.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/url_scheme.dart';
import '../../../contacts/widgets/popup_menu_button.dart';

class FarmSupplierDataTableCard extends StatefulWidget {
  final GetFarmSupplierResponse model;

  const FarmSupplierDataTableCard({Key? key, required this.model}) : super(key: key);

  @override
  State<FarmSupplierDataTableCard> createState() => _FarmSupplierDataTableCardState();
}

class _FarmSupplierDataTableCardState extends State<FarmSupplierDataTableCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GetFarmSupplier>(
      builder: (context, _provider, widget) {
        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  offset: Offset(0, 15),
                  blurRadius: 25,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: DataTable(
                      showBottomBorder: false,
                      headingRowHeight: !Responsive.isDesktop(context) ? 50 : 80,
                      dividerThickness: 0.2,
                      horizontalMargin: 16,
                      dataRowColor: MaterialStateProperty.resolveWith(_getDataRowColor),
                      dataRowHeight: !Responsive.isDesktop(context) ? 50 : 80,
                      columnSpacing: getWidth(context) * 0.04,
                      headingTextStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: !Responsive.isDesktop(context) ? 14 : 16,
                        fontWeight: !Responsive.isDesktop(context) ? FontWeight.w600 : FontWeight.bold,
                      ),
                      columns: <DataColumn>[
                        DataColumn(
                          label: SizedBox(
                            width: getWidth(context) * 0.25,
                            child: CustomText(
                              text: 'Farm Name'.tr(),
                              textAligns: TextAlign.start,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: getWidth(context) * 0.2,
                            child: CustomText(
                              text: 'Farm Rep'.tr(),
                              textAligns: TextAlign.start,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: getWidth(context) * 0.15,
                            child: CustomText(
                              text: 'Supplying to # Entrepreneurs'.tr(),
                              weight: FontWeight.bold,
                              lines: 2,
                              textAligns: TextAlign.center,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: getWidth(context) * 0.07,
                            child: CustomText(
                              text: "Total: ".tr()+ "${this.widget.model.data!.length}",
                              textAligns: TextAlign.start,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: getWidth(context) * 0.03,
                            child: PopUpMenuFarmSupplierButtonWidget(
                              mOnEmailTap: () {},
                            ),
                          ),
                        ),
                      ],
                      rows: <DataRow>[
                        for (int i = 0; i < this.widget.model.data!.length; i++)
                          DataRow(
                            selected: _provider.selected[i],
                            onSelectChanged: (bool? value) {
                              setState(
                                () {
                                  _provider.selected[i] = value!;
                                },
                              );
                            },
                            cells: <DataCell>[
                              DataCell(
                                SizedBox(
                                  width: getWidth(context) * 0.25,
                                  child: CustomText(
                                    text: '${this.widget.model.data![i].farmAutoName!.isEmpty ? '' : this.widget.model.data![i].farmAutoName}',
                                    textAligns: TextAlign.left,
                                    size: 12,
                                  ),
                                ),
                                onTap: () {
                                  launchUrl('https://$gloal_base_path/farms/${this.widget.model.data![i].farmId}');
                                },
                              ),
                              DataCell(
                                SizedBox(
                                  width: getWidth(context) * 0.15,
                                  child: CustomText(
                                    text:
                                        "${this.widget.model.data![i].farmRepresentativeName!.isEmpty ? '' : this.widget.model.data![i].farmRepresentativeName}",
                                    textAligns: TextAlign.left,
                                    size: 12,
                                  ),
                                ),
                                onTap: () {
                                  launchUrl('https://$gloal_base_path/farms/${this.widget.model.data![i].farmId}');
                                },
                              ),
                              DataCell(
                                SizedBox(
                                  width: getWidth(context) * 0.15,
                                  child: Center(
                                    child: CustomText(
                                      text: "${this.widget.model.data![i].entrepreneursCount}",
                                      textAligns: TextAlign.left,
                                      size: 12,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  launchUrl('https://$gloal_base_path/farms/${this.widget.model.data![i].farmId}');
                                },
                              ),
                              DataCell(SizedBox.shrink()),
                              DataCell(SizedBox.shrink()),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getDataRowColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };

    if (states.any(interactiveStates.contains)) {
      return Colors.transparent;
    }
    //return Colors.green; // Use the default value.
    return Colors.transparent;
  }
}
