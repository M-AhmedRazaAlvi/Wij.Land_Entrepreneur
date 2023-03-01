import 'package:flutter/material.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:provider/provider.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/responsive.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../../utils/images.dart';
import '../../../providers/farm_computer_projects_provider/farm_computer_project_details_dashboard_screen_provider.dart';

class ProjectDashboardWidget extends StatefulWidget {
  final Function()? openMap;
  final Function()? mOnActionsTap, mOnContactTap, mOnParticipatingTap, mOnEventsTap;

  const ProjectDashboardWidget({
    Key? key,
    required this.mOnActionsTap,
    required this.mOnContactTap,
    required this.mOnParticipatingTap,
    this.openMap,
    required this.mOnEventsTap,
  }) : super(key: key);

  @override
  State<ProjectDashboardWidget> createState() => _ProjectDashboardWidgetState();
}

class _ProjectDashboardWidgetState extends State<ProjectDashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FarmComputerProjectDetailsDashboardScreenProvider>(builder: (
      context,
      _provider,
      widget,
    ) {
      if (_provider.isData != true) {
        return Center(child: CircularProgressIndicator());
      }

      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Responsive.isMobile(context) ? getHeight(context) * 1.6 : getHeight(context) * 0.5,
              child: Flex(
                direction: Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomText(
                              text: 'Details about the project:'.tr(),
                              color: darkGreen,
                              size: 16,
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Wrap(
                              children: [
                                CustomText(
                                  text: 'Representative'.tr(),
                                  color: Colors.black,
                                  size: 12,
                                  weight: FontWeight.w700,
                                ),
                                SizedBox(
                                  width: 35,
                                ),
                                (_provider.farmComputersProjectDetailResponseModel!.data!.personResponsibles!.isNotEmpty &&
                                        _provider.farmComputersProjectDetailResponseModel?.data?.personResponsibles != null)
                                    ? CustomText(
                                        text: _provider.farmComputersProjectDetailResponseModel!.data!.personResponsibles![0].firstName! +
                                            _provider.farmComputersProjectDetailResponseModel!.data!.personResponsibles![0].lastName!,
                                        color: Colors.black,
                                        size: 11,
                                        weight: FontWeight.w400,
                                      )
                                    : CustomText(text: "")
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Wrap(
                              children: [
                                CustomText(
                                  text: 'Rep. Contact'.tr(),
                                  color: Colors.black,
                                  size: 12,
                                  weight: FontWeight.w700,
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                (_provider.farmComputersProjectDetailResponseModel!.data!.personResponsibles!.isNotEmpty &&
                                        _provider.farmComputersProjectDetailResponseModel?.data?.personResponsibles != null)
                                    ? CustomText(
                                        text: _provider.farmComputersProjectDetailResponseModel!.data!.personResponsibles![0].emailAddress ?? "",
                                        color: Colors.black,
                                        size: 11,
                                        weight: FontWeight.w400,
                                      )
                                    : CustomText(text: ""),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomText(
                              text: 'Description'.tr(),
                              color: Colors.black,
                              size: 12,
                              weight: FontWeight.w700,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Expanded(
                              child: Html(
                                data: _provider.mShowLoading ? "" : _provider.farmComputersProjectDetailResponseModel?.data?.description ?? "",
                                style: {
                                  "#": Style(
                                    fontFamily: Montserrat_Medium,
                                    maxLines: Responsive.isTablet(context) ? 6 : 10,
                                    textOverflow: TextOverflow.ellipsis,
                                  ),
                                  "table": Style(
                                    backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                                  ),
                                  "tr": Style(
                                    border: Border(bottom: BorderSide(color: Colors.grey)),
                                  ),
                                  "th": Style(
                                    backgroundColor: Colors.grey,
                                  ),
                                  "td": Style(
                                    alignment: Alignment.topLeft,
                                  ),
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            InkWell(
                              onTap: this.widget.mOnActionsTap,
                              child: CustomText(
                                text: _provider.mShowLoading
                                    ? 'Actions in'.tr()
                                    : "Actions in".tr() + "[${_provider.farmComputersProjectDetailResponseModel?.data?.projectName ?? ""}]",
                                color: darkGreen,
                                size: 16,
                              ),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            DataTable(
                                dataRowHeight: 30,
                                showBottomBorder: true,
                                horizontalMargin: 0,
                                columns: [
                                  DataColumn(
                                    label: CustomText(
                                      text: 'Type'.tr(),
                                      color: Colors.black,
                                      size: 12,
                                      weight: FontWeight.w700,
                                    ),
                                  ),
                                  DataColumn(
                                    label: CustomText(
                                      text: 'Date'.tr(),
                                      color: Colors.black,
                                      size: 12,
                                      weight: FontWeight.w700,
                                    ),
                                  ),
                                  DataColumn(
                                    label: CustomText(
                                      text: 'Parcels'.tr(),
                                      color: Colors.black,
                                      size: 12,
                                      weight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                                rows: _provider.mShowLoadingForActions
                                    ? []
                                    : _provider.farmComputerProjectActionResponseModel.data!
                                        .map(
                                          (e) => DataRow(
                                            cells: [
                                              DataCell(
                                                Text(
                                                  e.actionType != [] || e.actionType != null ? e.actionType![0] : "",
                                                  style: TextStyle(fontFamily: Montserrat_Medium),
                                                ),
                                              ),
                                              DataCell(
                                                Text(
                                                  DateFormat('dd-MM-yyyy').format(e.insertedAt),
                                                  style: TextStyle(fontFamily: Montserrat_Medium),
                                                ),
                                              ),
                                              DataCell(
                                                Text(""),
                                              ),
                                            ],
                                          ),
                                        )
                                        .toList()),
                            SizedBox(
                              height: 15,
                            ),
                            Expanded(
                              child: SizedBox.shrink(),
                            ),
                            _provider.mShowLoadingForActions
                                ? SizedBox()
                                : _provider.farmComputerProjectActionResponseModel.status == 404
                                    ? SizedBox()
                                    : _provider.farmComputerProjectActionResponseModel.data != [] ||
                                            _provider.farmComputerProjectActionResponseModel.data != null
                                        ? _provider.farmComputerProjectActionResponseModel.data!.length >= 5
                                            ? Align(
                                                alignment: Alignment.bottomCenter,
                                                child: InkWell(
                                                  onTap: this.widget.mOnActionsTap,
                                                  child: CustomText(
                                                    text: 'See more'.tr(),
                                                    color: Colors.black,
                                                    size: 11,
                                                    weight: FontWeight.w700,
                                                  ),
                                                ),
                                              )
                                            : SizedBox()
                                        : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            InkWell(
                              onTap: this.widget.mOnContactTap,
                              child: CustomText(
                                text: _provider.mShowLoadingForContacts
                                    ? "Contact in".tr()
                                    : "Contact in".tr() + "[${_provider.farmComputersProjectDetailResponseModel!.data!.projectName}]",
                                color: darkGreen,
                                size: 16,
                              ),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            DataTable(
                              dataRowHeight: 30,
                              showBottomBorder: true,
                              horizontalMargin: 0,
                              columnSpacing: Responsive.isDesktop(context) ? 60 : 18,
                              columns: [
                                DataColumn(
                                  label: CustomText(
                                    text: 'Date'.tr(),
                                    color: Colors.black,
                                    size: 12,
                                    weight: FontWeight.w700,
                                  ),
                                ),
                                DataColumn(
                                  label: CustomText(
                                    text: 'Subject'.tr(),
                                    color: Colors.black,
                                    size: 12,
                                    weight: FontWeight.w700,
                                  ),
                                ),
                                DataColumn(
                                  label: CustomText(
                                    text: 'Notes'.tr(),
                                    color: Colors.black,
                                    size: 12,
                                    weight: FontWeight.w700,
                                  ),
                                ),
                              ],
                              rows: _provider.mShowLoadingForContacts
                                  ? []
                                  : _provider.farmComputerContactMomentsResponse.status == 404
                                      ? []
                                      : _provider.farmComputerContactMomentsResponse.data != [] ||
                                              _provider.farmComputerContactMomentsResponse.data != null
                                          ? _provider.farmComputerContactMomentsResponse.data!
                                              .map(
                                                (e) => DataRow(
                                                  cells: [
                                                    DataCell(Text(
                                                      DateFormat('dd-MM-yyyy').format(DateTime.parse(e.contactMomentDate.toString())).toString(),
                                                      style: TextStyle(fontFamily: Montserrat_Medium),
                                                    )),
                                                    DataCell(Text(
                                                      e.contactSubject ?? "",
                                                      style: TextStyle(fontFamily: Montserrat_Medium),
                                                    )),
                                                    DataCell(
                                                      SizedBox(
                                                        width: 100,
                                                        child: Html(
                                                          data: e.contactNotes ?? "",
                                                          style: {
                                                            '#': Style(
                                                              fontFamily: Montserrat_Medium,
                                                              maxLines: 1,
                                                              textOverflow: TextOverflow.ellipsis,
                                                            ),
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                              .toList()
                                          : [],
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            // Expanded(
                            //   child: SizedBox.shrink(),
                            // ),
                            _provider.mShowLoadingForContacts
                                ? SizedBox()
                                : _provider.farmComputerContactMomentsResponse.status == 404
                                    ? SizedBox()
                                    : _provider.farmComputerContactMomentsResponse.data != [] ||
                                            _provider.farmComputerContactMomentsResponse.data != null
                                        ? _provider.farmComputerContactMomentsResponse.data!.length >= 5
                                            ? Align(
                                                alignment: Alignment.bottomCenter,
                                                child: InkWell(
                                                  onTap: this.widget.mOnContactTap,
                                                  child: CustomText(
                                                    text: 'See more'.tr(),
                                                    color: Colors.black,
                                                    size: 11,
                                                    weight: FontWeight.w700,
                                                  ),
                                                ),
                                              )
                                            : SizedBox()
                                        : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            SizedBox(
              width: getWidth(context),
              child: Flex(
                direction: Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: Responsive.isDesktop(context)
                        ? 1
                        : Responsive.isTablet(context)
                            ? 1
                            : 0,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: this.widget.mOnParticipatingTap,
                                  child: CustomText(
                                    text: "Participating Parcels".tr(),
                                    color: darkGreen,
                                    size: 16,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    this.widget.openMap!.call();
                                  },
                                  child: SizedBox(
                                    child: Image.asset("assets/icons/map1.png"),
                                    height: 25,
                                    width: 25,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: SizedBox(
                                height: getHeight(context),
                                child: DataTable(
                                  dataRowHeight: 40,
                                  columnSpacing: 25,
                                  showBottomBorder: true,
                                  horizontalMargin: 0,
                                  columns: [
                                    DataColumn(
                                      label: CustomText(
                                        text: "Parcel Name".tr(),
                                        color: Colors.black,
                                        size: 12,
                                        weight: FontWeight.w700,
                                      ),
                                    ),
                                    DataColumn(
                                      label: CustomText(
                                        text: "Size".tr(),
                                        color: Colors.black,
                                        size: 12,
                                        weight: FontWeight.w700,
                                      ),
                                    ),
                                    DataColumn(
                                      label: CustomText(
                                        text: "Date of Participation".tr(),
                                        color: Colors.black,
                                        size: 12,
                                        weight: FontWeight.w700,
                                      ),
                                    ),
                                    _provider.mShowLoadingForParcels
                                        ? DataColumn(label: SizedBox())
                                        : DataColumn(
                                            label: CustomText(
                                              text: "Row total".tr() + "${_provider.farmComputerProjectParcelsResponse?.data?.totalCount}",
                                              color: Colors.black,
                                              size: 12,
                                              weight: FontWeight.w700,
                                            ),
                                          ),
                                  ],
                                  rows: _provider.mShowLoadingForParcels
                                      ? []
                                      : _provider.farmComputerProjectParcelsResponse!.statusCode == 404
                                          ? []
                                          : _provider.farmComputerProjectParcelsResponse?.data?.parcels != [] ||
                                                  _provider.farmComputerProjectParcelsResponse?.data?.parcels != null
                                              ? _provider.farmComputerProjectParcelsResponse!.data!.parcels!
                                                  .map((e) => DataRow(
                                                        cells: [
                                                          DataCell(Text(
                                                            e.parcelName ?? "",
                                                            style: TextStyle(fontFamily: Montserrat_Medium),
                                                          )),
                                                          DataCell(Text(
                                                            e.size.toString() + " ha",
                                                            style: TextStyle(fontFamily: Montserrat_Medium),
                                                          )),
                                                          DataCell(Text(
                                                            DateFormat('dd-MM-yyyy').format(DateTime.parse(e.insertedAt!)).toString(),
                                                            style: TextStyle(fontFamily: Montserrat_Medium),
                                                          )),
                                                          DataCell(Text("")),
                                                        ],
                                                      ))
                                                  .toList()
                                              : [],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                    height: 12,
                  ),
                  Expanded(
                    flex: Responsive.isDesktop(context)
                        ? 2
                        : Responsive.isTablet(context)
                            ? 2
                            : 0,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: this.widget.mOnEventsTap,
                            child: CustomText(
                              text: "Events".tr(), // widget.detailsResponse.data?.entrepreneurName ?? "",
                              color: darkGreen,
                              size: Responsive.isDesktop(context) ? 16 : 14,
                              weight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            child: Column(
                              children: _provider.mShowLoadingForEvents
                                  ? []
                                  : _provider.farmComputerProjectEventsResponseModels!.status == 404
                                      ? []
                                      : _provider.farmComputerProjectEventsResponseModels?.data?.pastEvents != [] ||
                                              _provider.farmComputerProjectEventsResponseModels?.data?.pastEvents != null
                                          ? _provider.farmComputerProjectEventsResponseModels!.data!.pastEvents!
                                              .map(
                                                (e) => SizedBox(
                                                  height: 150,
                                                  child: Card(
                                                    elevation: 3,
                                                    margin: EdgeInsets.only(left: 4, right: 4, top: 8),
                                                    child: SizedBox(
                                                      height: 150,
                                                      child: Row(
                                                        // crossAxisAlignment:
                                                        //     CrossAxisAlignment
                                                        //         .stretch,
                                                        children: [
                                                          SizedBox(
                                                            width: 150,
                                                            height: 150,
                                                            child: Image.asset(
                                                              Images.wallpaper,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 16,
                                                          ),
                                                          // Column(
                                                          //   mainAxisAlignment:
                                                          //       MainAxisAlignment
                                                          //           .center,
                                                          //   children: [
                                                          //     CustomText(
                                                          //       text: DateFormat(
                                                          //               "MMMM")
                                                          //           .format(DateTime
                                                          //               .parse(e.eventStartTime!))
                                                          //           .toString()
                                                          //           .substring(
                                                          //               0,
                                                          //               3), // widget.detailsResponse.data?.entrepreneurName ?? "",
                                                          //       color: darkRed,
                                                          //       size: Responsive
                                                          //               .isDesktop(
                                                          //                   context)
                                                          //           ? 22
                                                          //           : 14,
                                                          //       weight:
                                                          //           FontWeight
                                                          //               .w400,
                                                          //     ),
                                                          //     CustomText(
                                                          //       text: DateFormat(
                                                          //               'dd')
                                                          //           .format(DateTime
                                                          //               .parse(e
                                                          //                   .date!)),
                                                          //       color: Colors
                                                          //           .black,
                                                          //       size: Responsive
                                                          //               .isDesktop(
                                                          //                   context)
                                                          //           ? 26
                                                          //           : 16,
                                                          //       weight:
                                                          //           FontWeight
                                                          //               .w700,
                                                          //     ),
                                                          //   ],
                                                          // ),
                                                          Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              CustomText(
                                                                text: DateFormat("MMMM")
                                                                    .format(DateTime.parse(e.date!))
                                                                    .toString()
                                                                    .substring(0, 3), // widget.detailsResponse.data?.entrepreneurName ?? "",
                                                                color: darkRed,
                                                                size: Responsive.isDesktop(context) ? 22 : 14,
                                                                weight: FontWeight.w400,
                                                              ),
                                                              CustomText(
                                                                text: DateFormat('dd').format(DateTime.parse(e.date!)),
                                                                color: Colors.black,
                                                                size: Responsive.isDesktop(context) ? 26 : 16,
                                                                weight: FontWeight.w700,
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 16,
                                                          ),
                                                          Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              CustomText(
                                                                text: e.name ?? "",
                                                                color: darkRed,
                                                                size: Responsive.isDesktop(context) ? 22 : 16,
                                                                weight: FontWeight.w800,
                                                              ),
                                                              //           SizedBox(height: 4),
                                                              SizedBox(
                                                                width: Responsive.isDesktop(context)
                                                                    ? getWidth(context) * 0.40
                                                                    : getWidth(context) * 0.36,
                                                                child: CustomText(
                                                                  overflows: TextOverflow.ellipsis,
                                                                  textAligns: TextAlign.left,
                                                                  lines: 1,
                                                                  text: e.location ?? "",
                                                                  color: Colors.black,
                                                                  size: 12,
                                                                ),
                                                              ),
                                                                  SizedBox(height: 4),
                                                              SizedBox(
                                                                width: Responsive.isDesktop(context)
                                                                    ? getWidth(context) * 0.40
                                                                    : Responsive.isTablet(context)
                                                                        ? getWidth(context) * 0.35
                                                                        : getWidth(context) * 0.38,
                                                                child: Html(
                                                                  data: e
                                                                      .desctiption
                                                                      .toString(),
                                                                  style: {
                                                                    '#': Style(
                                                                      fontFamily: Montserrat_Medium,
                                                                      fontSize: FontSize(12),
                                                                      maxLines: 4,
                                                                      textOverflow: TextOverflow.ellipsis,
                                                                    ),
                                                                    "table": Style(
                                                                      backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                                                                    ),
                                                                    "tr": Style(
                                                                      border: Border(bottom: BorderSide(color: Colors.grey)),
                                                                    ),
                                                                    "td": Style(
                                                                      alignment: Alignment.topLeft,
                                                                    ),
                                                                    'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                              .toList()
                                          : [],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     Column(
                  //       children: [Expanded(child:)],
                  //     ),
                  //     Column(
                  //       children: [Expanded(child: "")],
                  //     ),
                  //     Column(
                  //       children: [Expanded(child: "")],
                  //     )
                  //   ],
                  // )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
