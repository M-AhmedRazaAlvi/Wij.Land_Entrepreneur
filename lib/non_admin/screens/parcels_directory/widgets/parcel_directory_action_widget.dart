import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/non_admin/routes/routes.dart';
import 'package:wij_land/non_admin/screens/parcels_directory/widgets/edit_farmer_parcel_dialog.dart';

import '../../../../utils/controller.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';
import '../../../models/farm_computer_parcels/response/get_farm_computer_parcels_response.dart';
import '../../../providers/farm_computer_parcels_provider/farm_computer_parcels_provider.dart';

class ParcelDirectoryActionWidget extends StatefulWidget {
  ParcelData model;
  ParcelDirectoryActionWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<ParcelDirectoryActionWidget> createState() =>
      _ParcelDirectoryActionWidgetState();
}

class _ParcelDirectoryActionWidgetState
    extends State<ParcelDirectoryActionWidget> {
  // List donebyList = [];

  @override
  void initState() {
    // TODO: implement initState

    //  await Provider.of<FarmComputerParcelsProvider>(context, listen: false)
    //     .getFarmComputerParcelData();

    // for (int i = 0; i < widget.model.parcelActions!.length; i++) {
    //   for (int j = 0; j < widget.model.parcelActions![i].doneBy!.length; i++)
    //     donebyList.insert(j, widget.model.parcelActions![j].doneBy![j].name);
    // }
    print("actioon model data ????/// ${widget.model.parcelActions!.length}");
    super.initState();
  }

  bool isSort = false;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FarmComputerParcelsProvider>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // SizedBox(
        //   height: getHeight(context),
        //   // width: getWidth(context),
        //   child: Align(
        //       alignment: Alignment.topCenter,
        //       child: Padding(
        //         padding: const EdgeInsets.all(25.0),
        //         child: CustomText(
        //           text: provider
        //                   .farmComputerParcelsResponseModel.error!.message ??
        //               "No data found",
        //           color: Colors.red,
        //           weight: FontWeight.w700,
        //           size: 20,
        //         ),
        //       )),
        // ),
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: DataTable(
              dataRowHeight: Responsive.isMobile(context) ? 20 : 40,
              columnSpacing: Responsive.isMobile(context) ? 30 : 60,
              dividerThickness: 0.0,
              showBottomBorder: false,
              sortColumnIndex: 0,
              sortAscending: isSort,
              columns: [
                DataColumn(
                    label: CustomText(
                  text: "Action Name".tr(),
                  size: Responsive.isMobile(context) ? 10 : 13,
                  weight: FontWeight.bold,
                )),
                DataColumn(
                    label: CustomText(
                  text: "Done on Date".tr(),
                  size: Responsive.isMobile(context) ? 10 : 13,
                  weight: FontWeight.bold,
                )),
                DataColumn(
                    label: CustomText(
                  text: "Done By".tr(),
                  size: Responsive.isMobile(context) ? 10 : 13,
                  weight: FontWeight.bold,
                )),
              ],
              rows: <DataRow>[
                for (int i = 0;
                    i <
                        (widget.model.parcelActions!.isNotEmpty
                            ? (widget.model.parcelActions!.length > 10
                                ? 10
                                : widget.model.parcelActions!.length)
                            : 0);
                    i++)
                  DataRow(cells: [
                    widget.model.parcelActions![i].actionName!.isNotEmpty
                        ? DataCell(
                            CustomText(
                              text:
                                  widget.model.parcelActions![i].actionName![0],
                              size: Responsive.isMobile(context) ? 10 : 13,
                            ),
                            onTap: () {
                              provider.getFarmComputerActionDetailData(
                                  id: int.parse(
                                      widget.model.parcelActions![i].id!),
                                  context: this.context);
                            },
                          )
                        : DataCell(
                            CustomText(
                              text: "",
                              size: Responsive.isMobile(context) ? 10 : 13,
                            ),
                          ),
                    DataCell(CustomText(
                      text: widget.model.parcelActions![i].doneOnDate ?? "",
                      size: Responsive.isMobile(context) ? 10 : 13,
                    )),
                    widget.model.parcelActions![i].doneBy!.isNotEmpty
                        ? DataCell(CustomText(
                            textAligns: TextAlign.left,
                            overflows: TextOverflow.ellipsis,
                            lines: 1,
                            text: widget.model.parcelActions![i].doneBy!
                                .map((e) {
                                  return e.name;
                                })
                                .join(',')
                                .toString(),
                            size: Responsive.isMobile(context) ? 10 : 13,
                          ))
                        : DataCell(CustomText(
                            text: "",
                            size: Responsive.isMobile(context) ? 10 : 13,
                          )),
                  ])
              ]),
        ),
        Visibility(
          visible: widget.model.parcelActions!.length >= 10 ? true : false,
          child: InkWell(
            onTap: () {
              navigationController.navigateToWithArguments(
                  routeName: farmComputerActionRoute,
                  arguments: int.parse(widget.model.id!));
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
    );
  }
}
