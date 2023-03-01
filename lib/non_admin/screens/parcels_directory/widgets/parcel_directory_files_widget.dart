import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/non_admin/routes/routes.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../utils/controller.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/url_scheme.dart';
import '../../../models/farm_computer_parcels/response/get_farm_computer_parcels_response.dart';

class ParcelDirectoryFilesWidget extends StatefulWidget {
  ParcelData? model;
  ParcelDirectoryFilesWidget({Key? key, required this.model}) : super(key: key);

  @override
  State<ParcelDirectoryFilesWidget> createState() =>
      _ParcelDirectoryFilesWidgetState();
}

class _ParcelDirectoryFilesWidgetState
    extends State<ParcelDirectoryFilesWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: DataTable(
                    dataRowHeight: Responsive.isMobile(context) ? 20 : 40,
                    columnSpacing: Responsive.isMobile(context) ? 30 : 60,
                    dividerThickness: 0.0,
                    showBottomBorder: false,
                    columns: [
                      DataColumn(
                          label: CustomText(
                        text: "File Name".tr(),
                        weight: FontWeight.bold,
                        size: Responsive.isMobile(context) ? 10 : 13,
                      )),
                      DataColumn(
                          label: CustomText(
                        text: "Date".tr(),
                        weight: FontWeight.bold,
                        size: Responsive.isMobile(context) ? 10 : 13,
                      )),
                      DataColumn(
                          label: CustomText(
                        text: "Done By".tr(),
                        weight: FontWeight.bold,
                        size: Responsive.isMobile(context) ? 10 : 13,
                      )),
                    ],
                    rows: <DataRow>[
                      for (int i = 0;
                          i <
                              (widget.model!.files!.isNotEmpty
                                  ? (widget.model!.files!.length > 10
                                      ? 10
                                      : widget.model!.files!.length)
                                  : 0);
                          i++)
                        DataRow(cells: [
                          DataCell(InkWell(
                            onTap: () {
                              launchUrlNewTab(widget.model!.files![i].path!);
                            },
                            child: CustomText(
                              text: widget.model!.files![i].title ?? "",
                              size: Responsive.isMobile(context) ? 10 : 13,
                            ),
                          )),
                          DataCell(CustomText(
                            text: widget.model!.files![i].date ?? "",
                            size: Responsive.isMobile(context) ? 10 : 13,
                          )),
                          DataCell(CustomText(
                            text: widget.model!.files![i].addedBy ?? "",
                            size: Responsive.isMobile(context) ? 10 : 13,
                          ))
                        ])
                    ]),
              ),
              Visibility(
                visible: widget.model!.files!.length >= 10 ? true : false,
                child: InkWell(
                  onTap: () {
                    navigationController.navigateToWithArguments(
                        routeName: farmComputerFileScreensPageRoute,
                        arguments: widget.model!.id!);
                  },
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: CustomText(
                        text: "View more".tr(),
                        color: Colors.grey,
                        size: Responsive.isMobile(context) ? 10 : 13,
                      )),
                ),
              )
            ]),
      ),
    );
  }
}
