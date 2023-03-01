import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/app_common_widgets/on_hover.dart';
import 'package:wij_land/non_admin/screens/permissions/widgets/reject_feedback_dialog.dart';
import 'package:wij_land/screens/office/widgets/search_widget.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/images.dart';
import 'package:wij_land/utils/responsive.dart';
import '../../../anacdots_mobile/app_common_widgets/styles.dart';
import '../../../utils/hex_color.dart';
import '../../models/permissions/permission_detail_model.dart';
import '../../providers/permissions_providers/permission_detail_screen_provider.dart';
import '../widgets/reject_request_dialog.dart';
import '../widgets/request_to_rejoin_dialog.dart';

class PermissionRequestDetail extends StatefulWidget {
  final aurguments;

  const PermissionRequestDetail({Key? key, this.aurguments}) : super(key: key);

  @override
  State<PermissionRequestDetail> createState() =>
      _PermissionRequestDetailState();
}

class _PermissionRequestDetailState extends State<PermissionRequestDetail> {
  late String title;
  late String id;
  int sInd = -1;
  int sIndex = -1;

  @override
  void initState() {
    title = widget.aurguments['title'];
    id = widget.aurguments['id'].toString();
    print("IDD : ${widget.aurguments['id']}");
    var provider =
        Provider.of<PermissionDetailScreenProvider>(context, listen: false);
    provider.fetchPermissionDetail(
      id: id,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PermissionDetailScreenProvider>(
      builder: (context, _provider, widget) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            body: _provider.showLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(
                    children: [
                      title != "Pending"
                          ? _provider.hTabPosition == 0
                              ? Container(
                                  margin: EdgeInsets.only(
                                    top: Responsive.isDesktop(context)
                                        ? 170
                                        : 95,
                                  ),
                                  child: information(
                                    _provider,
                                    permissionDetails:
                                        _provider.mPermissionsDetailResponse,
                                  ),
                                )
                              : Container(
                                  margin: EdgeInsets.only(
                                      top: Responsive.isDesktop(context)
                                          ? 170
                                          : 95),
                                  child: sources(
                                    provider: _provider,
                                    permissionDetails:
                                        _provider.mPermissionsDetailResponse,
                                  ),
                                )
                          : _provider.activeStep == 0
                              ? Container(
                                  margin: EdgeInsets.only(
                                    top: Responsive.isDesktop(context)
                                        ? 200
                                        : 120,
                                  ),
                                  child: information(
                                    _provider,
                                    permissionDetails:
                                        _provider.mPermissionsDetailResponse,
                                  ),
                                )
                              : Container(
                                  margin: EdgeInsets.only(
                                      top: Responsive.isDesktop(context)
                                          ? 200
                                          : 120),
                                  child: sources(
                                    provider: _provider,
                                    permissionDetails:
                                        _provider.mPermissionsDetailResponse,
                                  ),
                                ),
                      title != "Pending"
                          ? otherHeaders(
                              _provider,
                              permissionDetails:
                                  _provider.mPermissionsDetailResponse,
                            )
                          : pendingHeader(
                              _provider,
                              permissionDetails:
                                  _provider.mPermissionsDetailResponse,
                            )
                    ],
                  ),
          ),
        );
      },
    );
  }

  Widget otherHeaders(
    PermissionDetailScreenProvider provider, {
    required PermissionDetailModel permissionDetails,
  }) {
    return Column(
      children: [
        SizedBox(
          height: Responsive.isDesktop(context) ? 155 : 185,
          child: Card(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(8),
                      height: 100,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: permissionDetails.data?.image?.path == null
                          ? Image.asset(
                              Images.wallpaper,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              permissionDetails.data!.image!.path!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Expanded(
                    flex: 14,
                    child: OnHover(
                      builder: (hover) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                text: permissionDetails.data?.title ?? "",
                                color: Color(0xffA71832),
                                size: Responsive.isDesktop(context) ? 20 : 16,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
                                decoration: BoxDecoration(
                                  color: title == "Accepted"
                                      ? Colors.green
                                      : title == "Rejected"
                                          ? Colors.red
                                          : Colors.lightBlue,
                                  border: Border.all(
                                      color: title == "Accepted"
                                          ? Colors.green
                                          : title == "Rejected"
                                              ? Colors.red
                                              : Colors.lightBlue),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: CustomText(
                                  text: title,
                                  color: title == "Rejected"
                                      ? Colors.white
                                      : Colors.black,
                                  size: 12,
                                  weight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                title == "Rejected" || title == "Revoke request"
                                    ? DateFormat('dd-MM-yyyy').format(
                                        DateTime.parse(permissionDetails
                                            .data!.insertedAt!))
                                    : "",
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    flex: title == "Re-Invite Request" ? 3 : 2,
                    child: title == "Accepted"
                        ? Container(
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            decoration: BoxDecoration(
                              color: HexColor("#A71832"),
                              border: Border.all(color: HexColor("#A71832")),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Center(
                              child: CustomText(
                                text: 'Revoke Consent'.tr(),
                                color: Colors.white,
                                size: 10,
                                weight: FontWeight.normal,
                              ),
                            ),
                          )
                        : title == "Rejected"
                            ? InkWell(
                                onTap: () async {
                                  var value = await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return RequestToRejoinDialog(
                                        onTap: () async {
                                          await provider
                                              .updatePermissionRequestStatus(
                                            id: id,
                                            status: "re-invite",
                                          );
                                          if (provider.requestStatusUpdateModel
                                                  .status ==
                                              200) {
                                            print(
                                                "coming here : ${provider.requestStatusUpdateModel.status}");
                                            Navigator.pop(context, true);
                                          }
                                        },
                                      );
                                    },
                                  );
                                  print("Value : $value");
                                  if (value) {
                                    Navigator.pop(context, true);
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  width: 55,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: HexColor('#F7ED5B'),
                                    border:
                                        Border.all(color: HexColor('#F7ED5B')),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(4),
                                    ),
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      text: 'Request to rejoin'.tr(),
                                      color: Colors.red,
                                      size: 10,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            : title == "Re-invite Request"
                                ? InkWell(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.only(left: 10),
                                      width: 55,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: HexColor('#979797'),
                                        border: Border.all(
                                            color: HexColor('#979797')),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                      ),
                                      child: Center(
                                        child: CustomText(
                                          text: 'Request to join submitted'.tr(),
                                          color: Colors.red,
                                          size: 10,
                                          weight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      // showDialog(
                                      //   context: context,
                                      //   builder: (BuildContext context) {
                                      //     return RequestToRejoinDialog(
                                      //       onTap: () {
                                      //         // Navigator.pop(context);
                                      //         // provider.updatePermissionRequestStatus(
                                      //         //   id: id,
                                      //         //   status: "re-invite",
                                      //         // );
                                      //       },
                                      //     );
                                      //   },
                                      // );
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      decoration: BoxDecoration(
                                        color: HexColor('#979797'),
                                        border: Border.all(
                                            color: HexColor('#979797')),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: Center(
                                        child: CustomText(
                                          text: 'Revoked consent submitted'.tr(),
                                          color: Colors.black,
                                          size: 10,
                                          weight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                  ),
                  // Expanded(
                  //   flex: title == "Re-Invite Request" ? 3 : 2,
                  //   child: title == "Re-Invite Request"
                  //       ? Container(
                  //           padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  //           decoration: BoxDecoration(
                  //             color: Colors.grey.shade300,
                  //             border: Border.all(color: Colors.grey.shade300),
                  //             borderRadius: BorderRadius.all(
                  //               Radius.circular(5),
                  //             ),
                  //           ),
                  //           child: Center(
                  //             child: CustomText(
                  //               text: 'Request to join submitted',
                  //               color: Colors.black,
                  //               size: 10,
                  //               weight: FontWeight.normal,
                  //             ),
                  //           ),
                  //         )
                  //       : title == "Accepted"
                  //           ? InkWell(
                  //               onTap: () {},
                  //               child: Container(
                  //                 margin: EdgeInsets.only(left: 10),
                  //                 width: 55,
                  //                 height: 25,
                  //                 decoration: BoxDecoration(
                  //                   color: Colors.transparent,
                  //                   border: Border.all(color: Colors.red),
                  //                   borderRadius: BorderRadius.all(
                  //                     Radius.circular(4),
                  //                   ),
                  //                 ),
                  //                 child: Center(
                  //                   child: CustomText(
                  //                     text: 'Revoke Consent',
                  //                     color: Colors.red,
                  //                     size: 10,
                  //                     weight: FontWeight.bold,
                  //                   ),
                  //                 ),
                  //               ),
                  //             )
                  //           : InkWell(
                  //               onTap: () {
                  //                 showDialog(
                  //                   context: context,
                  //                   builder: (BuildContext context) {
                  //                     return RequestToRejoinDialog(
                  //                       onTap: () {
                  //                         // Navigator.pop(context);
                  //                         // provider.updatePermissionRequestStatus(
                  //                         //   id: id,
                  //                         //   status: "re-invite",
                  //                         // );
                  //                       },
                  //                     );
                  //                   },
                  //                 );
                  //               },
                  //               child: Container(
                  //                 padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  //                 decoration: BoxDecoration(
                  //                   color: HexColor('#F7ED5B'),
                  //                   border: Border.all(color: HexColor('#F7ED5B')),
                  //                   borderRadius: BorderRadius.all(
                  //                     Radius.circular(5),
                  //                   ),
                  //                 ),
                  //                 child: Center(
                  //                   child: CustomText(
                  //                     text: 'Request to rejoin',
                  //                     color: Colors.black,
                  //                     size: 10,
                  //                     weight: FontWeight.normal,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  // ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: Visibility(
                      visible: true,
                      child: ClickIconButton(
                        clickcolors: Colors.white,
                        icon: Icons.close,
                        iconColor: Colors.black,
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      padding: EdgeInsets.zero,
                      isScrollable: true,
                      indicatorPadding: EdgeInsets.only(right: 20),
                      labelPadding: EdgeInsets.only(bottom: 10, right: 20),
                      indicatorColor: darkGreen,
                      onTap: (value) {
                        provider.hTabPosition = value;
                        setState(() {});
                        if (value == 0) {
                        } else {}
                      },
                      tabs: [
                        CustomText(
                          text: "Information".tr(),
                          color: provider.hTabPosition == 0 ? darkGreen : Colors.black,
                          size: 12,
                        ),
                        CustomText(
                          size: 12,
                          text: "Sources".tr(),
                          color: provider.hTabPosition == 1 ? darkGreen : Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        )
      ],
    );
  }

  Widget pendingHeader(provider,
      {required PermissionDetailModel permissionDetails}) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: Responsive.isDesktop(context) ? 210 : 110,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: Responsive.isDesktop(context) ? 2 : 1,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      width: Responsive.isDesktop(context) ? 100 : 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: permissionDetails.data?.image?.path == null
                          ? Image.asset(
                              Images.wallpaper,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              permissionDetails.data!.image!.path!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Expanded(
                    flex: Responsive.isDesktop(context) ? 20 : 5,
                    child: OnHover(
                      builder: (hover) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                text: permissionDetails.data?.title ?? "",
                                color: Color(0xffA71832),
                                size: Responsive.isDesktop(context) ? 20 : 12,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(width: 15),
                              Container(
                                padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  border: Border.all(color: Colors.yellow),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: CustomText(
                                  text: 'Pending'.tr(),
                                  color: Colors.black,
                                  size: Responsive.isDesktop(context) ? 12 : 9,
                                  weight: FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Flexible(
                    child: Visibility(
                      visible: true,
                      child: ClickIconButton(
                        clickcolors: Colors.white,
                        icon: Icons.close,
                        iconColor: Colors.black,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: SizedBox(
                  height: 45,
                  width: getWidth(context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                provider.activeStep = 0;
                              });
                            },
                            child: Icon(
                              Icons.looks_one,
                              size: 30,
                              color: Colors.green,
                            ),
                          ),
                          Container(
                            height: 1,
                            width: Responsive.isDesktop(context) ? 250 : 120,
                            color: Colors.grey,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                provider.activeStep = 1;
                              });
                            },
                            child: Icon(
                              Icons.looks_two,
                              size: 30,
                              color: provider.activeStep == 1
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // SizedBox(width: 25),
                          InkWell(
                            onTap: () {
                              setState(() {
                                provider.activeStep = 0;
                              });
                            },
                            child: Text(
                              "Information Sheet".tr(),
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Responsive.isDesktop(context) ? 210 : 92,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                provider.activeStep = 1;
                              });
                            },
                            child: Text(
                              "Sources".tr(),
                              style: TextStyle(
                                color: provider.activeStep == 1
                                    ? Colors.green
                                    : Colors.grey,
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Responsive.isDesktop(context) ? 0 : 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              provider.activeStep == 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {});
                            provider.activeStep = 0;
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            width: 110,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: Colors.yellow),
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            child: Center(
                              child: CustomText(
                                text: 'Back'.tr(),
                                color: Colors.black,
                                size: 10,
                                weight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            provider.hTabPosition = 0;
                            provider.activeStep = 0;
                            await provider.updatePermissionRequestStatus(
                              id: id,
                              status: "accepted",
                            );
                            if (provider.requestStatusUpdateModel.status ==
                                200) {
                              print(
                                  "coming here : ${provider.requestStatusUpdateModel.status}");
                              Navigator.pop(context, true);
                            }
//                            Navigator.of(context).pop();
                          },
                          child: Container(
                              width: 100,
                              height: 25,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                border: Border.all(color: Colors.yellow),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                              child: Center(
                                child: CustomText(
                                  text: 'Submit'.tr(),
                                  color: Colors.black,
                                  size: 10,
                                  weight: FontWeight.bold,
                                ),
                              )),
                        ),
                      ],
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget information(provider,
      {required PermissionDetailModel permissionDetails}) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: getWidth(context),
            margin: EdgeInsets.all(20),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: permissionDetails.status != 200
                    ? Column(
                        children: [
                          Text("No Data Found!".tr()),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Information Page".tr(),
                            color: Color.fromARGB(255, 26, 130, 24),
                            size: Responsive.isDesktop(context) ? 18 : 14,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(height: 25),
                          Row(
                            children: [
                              Expanded(
                                flex: Responsive.isDesktop(context) ? 2 : 1,
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  height:
                                      Responsive.isDesktop(context) ? 130 : 70,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: permissionDetails.data?.image?.path ==
                                          null
                                      ? Image.asset(
                                          Images.wallpaper,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.network(
                                          permissionDetails.data!.image!.path!,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                              SizedBox(
                                  width:
                                      Responsive.isDesktop(context) ? 28 : 5),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:  [
                                    CustomText(
                                      text: "Organization Name".tr(),
                                      size: 10,
                                      weight: FontWeight.bold,
                                    ),
                                    SizedBox(height: 5),
                                    CustomText(
                                      text: "Connected Project".tr(),
                                      size: 10,
                                      weight: FontWeight.bold,
                                    ),
                                    SizedBox(height: 5),
                                    CustomText(
                                      text: "Expected Start Date".tr(),
                                      size: 10,
                                      weight: FontWeight.bold,
                                    ),
                                    SizedBox(height: 5),
                                    CustomText(
                                      text: "Expected End Date".tr(),
                                      size: 10,
                                      weight: FontWeight.bold,
                                    ),
                                    SizedBox(height: 5),
                                  ],
                                ),
                              ),
                              SizedBox(width: 18),
                              Expanded(
                                flex: Responsive.isDesktop(context) ? 12 : 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: permissionDetails.data?.organization
                                              ?.organizationName ??
                                          "",
                                      size: 9,
                                      color: Colors.grey.shade500,
                                      weight: FontWeight.w200,
                                    ),
                                    SizedBox(height: 7),
                                    CustomText(
                                      text: permissionDetails
                                              .data?.project?.projectName ??
                                          "",
                                      size: 9,
                                      color: Colors.grey.shade500,
                                      weight: FontWeight.w200,
                                    ),
                                    SizedBox(height: 7),
                                    CustomText(
                                      text: permissionDetails
                                              .data?.requestStartDate ??
                                          "",
                                      size: 9,
                                      color: Colors.grey.shade500,
                                      weight: FontWeight.w200,
                                    ),
                                    SizedBox(height: 7),
                                    CustomText(
                                      text: permissionDetails
                                              .data?.requestEndDate ??
                                          "",
                                      size: 9,
                                      color: Colors.grey.shade500,
                                      weight: FontWeight.w200,
                                    ),
                                    SizedBox(height: 7),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          CustomText(
                            text: permissionDetails
                                    .data?.metaInfo?.acceptanceMessage ??
                                "",
                            size: Responsive.isDesktop(context) ? 12 : 10,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(height: 20),
                          Text(
                            permissionDetails.data?.metaInfo
                                    ?.acceptanceMessageDescription ??
                                "",
                            maxLines: null,
                            style: TextStyle(
                              fontSize: Responsive.isDesktop(context) ? 10 : 9,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          SizedBox(height: 20),
                          CustomText(
                            text: permissionDetails.data?.metaInfo?.assurance ??
                                "",
                            size: Responsive.isDesktop(context) ? 12 : 10,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(height: 20),
                          Text(
                            permissionDetails
                                    .data?.metaInfo?.assuranceDescription ??
                                "",
                            maxLines: null,
                            style: TextStyle(
                              fontSize: Responsive.isDesktop(context) ? 10 : 9,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          SizedBox(height: 20),
                          CustomText(
                            text: permissionDetails.data?.metaInfo?.benefits ??
                                "",
                            size: Responsive.isDesktop(context) ? 12 : 10,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(height: 20),
                          Text(
                            permissionDetails
                                    .data?.metaInfo?.benefitsDescription ??
                                "",
                            maxLines: null,
                            style: TextStyle(
                              fontSize: Responsive.isDesktop(context) ? 10 : 9,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          SizedBox(height: 20),
                          CustomText(
                            text: permissionDetails.data?.metaInfo?.guideline ??
                                "",
                            size: Responsive.isDesktop(context) ? 12 : 10,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(height: 20),
                          Text(
                            permissionDetails
                                    .data?.metaInfo?.guidelineDescription ??
                                "",
                            maxLines: null,
                            style: TextStyle(
                              fontSize: Responsive.isDesktop(context) ? 10 : 9,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          SizedBox(height: 20),
                          CustomText(
                            text: permissionDetails.data?.metaInfo?.procedure ??
                                "",
                            size: Responsive.isDesktop(context) ? 12 : 10,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(height: 20),
                          Text(
                            permissionDetails
                                    .data?.metaInfo?.procedureDescription ??
                                "",
                            maxLines: null,
                            style: TextStyle(
                              fontSize: Responsive.isDesktop(context) ? 10 : 9,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          SizedBox(height: 20),
                          CustomText(
                            text:
                                permissionDetails.data?.metaInfo?.purpose ?? "",
                            size: Responsive.isDesktop(context) ? 12 : 10,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(height: 20),
                          Text(
                            permissionDetails
                                    .data?.metaInfo?.purposeDescription ??
                                "",
                            maxLines: null,
                            style: TextStyle(
                              fontSize: Responsive.isDesktop(context) ? 10 : 9,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          SizedBox(height: 20),
                          CustomText(
                            text: permissionDetails
                                    .data?.metaInfo?.rejectionMessage ??
                                "",
                            size: Responsive.isDesktop(context) ? 12 : 10,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(height: 20),
                          Text(
                            permissionDetails.data?.metaInfo
                                    ?.rejectionMessageDescription ??
                                "",
                            maxLines: null,
                            style: TextStyle(
                              fontSize: Responsive.isDesktop(context) ? 10 : 9,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          SizedBox(height: 20),
                          CustomText(
                            text: permissionDetails
                                    .data?.metaInfo?.researchDetails ??
                                "",
                            size: Responsive.isDesktop(context) ? 12 : 10,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(height: 20),
                          Text(
                            permissionDetails.data?.metaInfo
                                    ?.researchDetailsDescription ??
                                "",
                            maxLines: null,
                            style: TextStyle(
                              fontSize: Responsive.isDesktop(context) ? 10 : 9,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          SizedBox(height: 20),
                          CustomText(
                            text: permissionDetails.data?.metaInfo?.safeguard ??
                                "",
                            size: Responsive.isDesktop(context) ? 12 : 10,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(height: 20),
                          Text(
                            permissionDetails
                                    .data?.metaInfo?.safeguardDescription ??
                                "",
                            maxLines: null,
                            style: TextStyle(
                              fontSize: Responsive.isDesktop(context) ? 10 : 9,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          SizedBox(height: 20),
                          CustomText(
                            text: permissionDetails.data?.metaInfo?.usage ?? "",
                            size: Responsive.isDesktop(context) ? 12 : 10,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(height: 20),
                          Text(
                            permissionDetails
                                    .data?.metaInfo?.usageDescription ??
                                "",
                            maxLines: null,
                            style: TextStyle(
                              fontSize: Responsive.isDesktop(context) ? 10 : 9,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
              ),
            ),
          ),
          title == "Pending"
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () async {
                        var result = await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return RejectFeedbackDialog(
                              controller: provider.mFeedbackController,
                              mOnTap: () async {
                                await provider.updatePermissionRequestStatus(
                                  id: id,
                                  status: "rejected",
                                );
                                if (provider.requestStatusUpdateModel.status ==
                                    200) {
                                  Navigator.pop(context, true);
                                } else {}
                              },
                            );
                          },
                        );
                        print("Result for Dialog : $result");
                        if (result) {
                          var res = await showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return RejectFeedbackDialog(
                                  controller: provider.mFeedbackController,
                                  mOnTap: () async {},
                                );
                              });
                        }
                      },
                      child: Container(
                        width: 110,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 164, 20, 10),
                          border: Border.all(
                            color: Color.fromARGB(255, 164, 20, 10),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        child: Center(
                          child: CustomText(
                            text: 'Reject'.tr(),
                            color: Colors.white,
                            size: 10,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        setState(() {
                          provider.activeStep = 1;
                        });
                      },
                      child: Container(
                        width: 125,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          border: Border.all(color: Colors.yellow),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        child: Center(
                          child: CustomText(
                            text: 'Accept & Continue'.tr(),
                            color: Colors.black,
                            size: 10,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                )
              : SizedBox.shrink(),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget sources({required PermissionDetailModel permissionDetails, provider}) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: getWidth(context),
            margin: EdgeInsets.all(20),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "Sources".tr(),
                          color: Color.fromARGB(255, 26, 130, 24),
                          size: Responsive.isDesktop(context) ? 18 : 14,
                          weight: FontWeight.bold,
                        ),
                        Visibility(
                          visible: true,
                          child: ClickIconButton(
                            clickcolors: Colors.white,
                            icon: Icons.search,
                            iconColor: Colors.black,
                            onPressed: () {
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    customRequests(
                        permissionDetails: permissionDetails,
                        provider: provider)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customRequests(
      {required PermissionDetailModel permissionDetails, provider}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 60),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DataTable(
                dataRowHeight: 40,
                showBottomBorder: false,
                horizontalMargin: 0,
                columnSpacing: 30,
                columns:  [
                  DataColumn(
                    label: CustomText(
                      text: 'Property'.tr(),
                      color: Colors.black,
                      size: 12,
                      weight: FontWeight.bold,
                    ),
                  ),
                  DataColumn(
                    label: CustomText(
                      text: 'Collection Type'.tr(),
                      color: Colors.black,
                      size: 12,
                      weight: FontWeight.bold,
                    ),
                  ),
                  DataColumn(
                      label: CustomText(
                    text: 'Justifications'.tr(),
                    color: Colors.black,
                    size: 12,
                    weight: FontWeight.bold,
                  )),
                  DataColumn(
                      label: CustomText(
                    text: '',
                    color: Colors.black,
                    size: 12,
                    weight: FontWeight.bold,
                  )),
                  DataColumn(
                    label: Text(
                      '         #',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
                rows: permissionDetails.status != 200
                    ? []
                    : permissionDetails.data?.source != null
                        ? permissionDetails.data!.source!
                            .map(
                              (source) => DataRow(
                                cells: [
                                  DataCell(
                                    CustomText(
                                      text: source.property ?? "",
                                      color: Colors.black,
                                      size: 10,
                                      weight: FontWeight.normal,
                                    ),
                                  ),
                                  DataCell(
                                    CustomText(
                                      text: source.collectionType ?? "",
                                      color: Colors.black,
                                      size: 10,
                                      weight: FontWeight.normal,
                                    ),
                                  ),
                                  DataCell(
                                    CustomText(
                                      text: source.justification ?? "",
                                      color: Colors.black,
                                      size: 10,
                                      weight: FontWeight.normal,
                                    ),
                                  ),
                                  DataCell(Text('')),
                                  DataCell(Container(
                                    child: title == "New" || title == "Pending"
                                        ? Row(
                                            children: [
                                              sInd == source.id!
                                                  ? Container(
                                                      height: 26,
                                                      width: 26,
                                                      color:
                                                          Colors.grey.shade100,
                                                      child: Center(
                                                          child: Icon(
                                                        Icons.message_outlined,
                                                        size: 18,
                                                      )))
                                                  : Container(),
                                              SizedBox(width: 4),
                                              MouseRegion(
                                                onHover: (event) {
                                                  setState(() {
                                                    sInd = source.id!;
                                                    // onHover2 = true;
                                                  });
                                                },
                                                onExit: (event) {
                                                  setState(() {
                                                    sInd = -1;
                                                  });
                                                },
                                                child: InkWell(
                                                  onTap: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return RejectFeedbackDialog(
                                                              controller: provider
                                                                  .mFeedbackController,
                                                              mOnTap: () async {
                                                                await provider.updatePermissionRequestProperties(
                                                                    id: id,
                                                                    status:
                                                                        "false",
                                                                    feedback: provider
                                                                        .mFeedbackController
                                                                        .text,
                                                                    property: source
                                                                        .property);
                                                                Navigator.pop(
                                                                    context);
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return RejectRequestDialog();
                                                                    });
                                                              });
                                                        });
                                                  },
                                                  child: Container(
                                                    height: 26,
                                                    width: 26,
                                                    color: sInd == source.id!
                                                        ? Colors.red.shade900
                                                        : Colors.grey.shade100,
                                                    padding: EdgeInsets.all(3),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      shape: CircleBorder(
                                                          side: BorderSide(
                                                        width: 2,
                                                        color:
                                                            sInd == source.id!
                                                                ? Colors.white
                                                                : Colors.grey
                                                                    .shade500,
                                                      )),
                                                      child: Icon(
                                                        Icons.close,
                                                        size: 18,
                                                        color:
                                                            sInd == source.id!
                                                                ? Colors.white
                                                                : Colors.grey
                                                                    .shade500,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 4),
                                              MouseRegion(
                                                onHover: (event) {
                                                  setState(() {
                                                    sIndex = source.id!;
                                                  });
                                                },
                                                onExit: (event) {
                                                  setState(() {
                                                    sIndex = -1;
                                                  });
                                                },
                                                child: InkWell(
                                                  onTap: () async {
                                                    await provider
                                                        .updatePermissionRequestProperties(
                                                            id: id,
                                                            status: "false",
                                                            feedback: provider
                                                                .mFeedbackController
                                                                .text,
                                                            property: source
                                                                .property);
                                                  },
                                                  child: Container(
                                                    height: 26,
                                                    width: 26,
                                                    color: sIndex == source.id!
                                                        ? Colors.green
                                                        : Colors.grey.shade100,
                                                    child: Icon(
                                                      Icons
                                                          .check_circle_outline_rounded,
                                                      size: 24,
                                                      color:
                                                          sIndex == source.id!
                                                              ? Colors.white
                                                              : Colors.grey
                                                                  .shade500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Text(''),
                                  )),
                                ],
                              ),
                            )
                            .toList()
                        : [],
              ),
            ],
          ),
        ),
        SizedBox(width: 110),
      ],
    );
  }
}
