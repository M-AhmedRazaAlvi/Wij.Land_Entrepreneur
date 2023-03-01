import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html/dom.dart' as dom;
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:latlong2/latlong.dart' as latLng;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webviewx/webviewx.dart';

import 'package:wij_land/non_admin/models/main_dashboard/get_fc_action.dart';
import 'package:wij_land/non_admin/models/main_dashboard/get_fc_basic_info.dart';
import 'package:wij_land/non_admin/models/main_dashboard/get_fc_contact_moments.dart';
import 'package:wij_land/non_admin/models/main_dashboard/get_fc_events.dart';
import 'package:wij_land/non_admin/models/main_dashboard/get_fc_project.dart';
import 'package:wij_land/non_admin/providers/dashobard_provider/main_dashboard_provider.dart';
import 'package:wij_land/non_admin/screens/dashboard/widgets/edit_dashboard_dialog_widget.dart';
import 'package:wij_land/providers/GlobalProvider/navigation/navigation_provider.dart';
import 'package:wij_land/utils/controller.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/images.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/on_hover.dart';
import '../../../../utils/ShimmerEffect.dart';
import '../../../../utils/responsive.dart';
import '../../../app_common_widgets/MapWithPolygon.dart';
import '../../../models/main_dashboard/get_fc_boerenwijzer.dart';
import '../../../models/main_dashboard/get_fc_files.dart';
import '../../../routes/routes.dart';
import '../../contact_moments/dialog_contact.dart';
import 'dashboard_address_widget.dart';

class DashboardLargeScreenWidget extends StatefulWidget {
  GetFCBasicInfo? basicInfo;
  GetFCFiles? files;
  GetFCProjects? projects;
  GetFCEvents? events;
  GetFCContactMoments? moments;
  GetFCAction action;
  PutFCBoerenwijzer? boerenwijzer;

  DashboardLargeScreenWidget(
      {Key? key,
      required this.basicInfo,
      required this.files,
      required this.projects,
      required this.events,
      required this.moments,
      required this.boerenwijzer,
      required this.action})
      : super(key: key);

  @override
  State<DashboardLargeScreenWidget> createState() => _DashboardLargeScreenWidgetState();
}

class _DashboardLargeScreenWidgetState extends State<DashboardLargeScreenWidget> {
  bool mapOpened = true;
  bool isHeaderClick = false;

  @override
  void initState() {
    apiCalls();
    super.initState();
  }

  bool loadParcel = false;

  apiCalls() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("farmID", widget.basicInfo!.data!.id.toString());

    var provider = Provider.of<MainFCDashboardProvider>(context, listen: false);
    await provider.getParcelData().then((value) {
      if (value == true) {
        setState(() {
          loadParcel = true;
        });
      }
    });
    await provider.getBusinessTyDropDown();
  }

  bool cursoronMap = false;
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Consumer<MainFCDashboardProvider>(builder: (context, _main, child) {
      return SingleChildScrollView(
        physics: cursoronMap ? NeverScrollableScrollPhysics() : BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: InkWell(
                onTap: () {
                  _main.isAddressClick = !_main.isAddressClick;
                  setState(() {});
                },
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.all(10),
                        height: 100,
                        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: widget.basicInfo!.data!.farmPhoto == null
                            ? Image.asset(
                                Images.wallpaper,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                widget.basicInfo!.data!.farmPhoto!,
                                fit: BoxFit.cover,
                              ),
                      ),
                      OnHover(builder: (hover) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                text: widget.basicInfo!.data?.farmName ?? "",
                                color: Color(0xffA71832),
                                size: Responsive.isDesktop(context) ? 20 : 16,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                !_main.isAddressClick ? FontAwesomeIcons.angleUp : FontAwesomeIcons.angleDown,
                                size: 18,
                                color: Color(0xffA71832),
                              ),
                              SizedBox(
                                width: _main.isAddressClick ? 50 : 0,
                              ),
                              !_main.isAddressClick
                                  ? hover
                                      ? SizedBox()
                                      : SizedBox()
                                  : PopupMenuButton<int>(
                                      iconSize: !Responsive.isDesktop(context) ? 15 : 20,
                                      itemBuilder: (context) {
                                        return <PopupMenuEntry<int>>[
                                          PopupMenuItem(
                                            child: Text('Edit'.tr()),
                                            value: 1,
                                            onTap: () {
                                              _main.isAddressClick = false;
                                              setState(() {});
                                              showDialog(
                                                context: context,
                                                builder: (_) => EditDashboardDialogWidget(
                                                  basicInfo: widget.basicInfo,
                                                ),
                                              );
                                            },
                                          ),
                                        ];
                                      },
                                    ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                  _main.isAddressClick
                      ? DashboardAddressWidget(
                          basicInfo: widget.basicInfo!,
                        )
                      : SizedBox.shrink(),
                ]),
              ),
            ),
            Container(
              // height: getHeight(context),
              padding: const EdgeInsets.all(12.0),
              child: Flex(
                direction: Responsive.isDesktop(context) ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: Column(
                      children: [
                        if (Responsive.isDesktop(context))
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Card(
                                      color: Color(0xffFEDE3B),
                                      child: ListTile(
                                        onTap: () {
                                          navigationController.navigateToWithArguments(routeName: farmComputerDataOverviewRoute,arguments: true);
                                        },
                                        minLeadingWidth: 18,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 28, vertical: 8),
                                        leading: Icon(
                                          FontAwesomeIcons.clipboardList,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                        title: CustomText(
                                          text: 'view all farm data in data overview'.tr(),
                                          color: Colors.black,
                                          lines: 2,
                                          textAligns: TextAlign.start,
                                          weight: FontWeight.bold,
                                          size: 11,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: "Your Projects".tr(), // widget.detailsResponse.data?.entrepreneurName ?? "",
                                          color: Color(0xffA71832),
                                          size: Responsive.isDesktop(context) ? 14 : 12,
                                          weight: FontWeight.w800,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            navigationController.navigateToWithArguments(routeName: farmComputerProjectDirectoryPageRoute,
                                                arguments: true);
                                          },
                                          child: CustomText(
                                            text: "View all projects".tr(), // widget.detailsResponse.data?.entrepreneurName ?? "",
                                            color: Colors.black,
                                            size: 11,
                                            weight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: getHeight(context) * 0.57,
                                      width: getWidth(context) * 0.23,
                                      child: widget.projects!.data!.isEmpty
                                          ? Padding(
                                              padding: EdgeInsets.only(top: getHeight(context) * 0.2, right: 4, left: 4),
                                              child: CustomText(
                                                text: 'You are not yet participating in any projects...'.tr(),
                                                size: 12,
                                                color: darkred,
                                                lines: 2,
                                                textAligns: TextAlign.center,
                                                overflows: TextOverflow.visible,
                                                weight: FontWeight.bold,
                                              ),
                                            )
                                          : ListView.builder(
                                              shrinkWrap: true,
                                              padding: EdgeInsets.zero,
                                              itemBuilder: (context, index) => SizedBox(
                                                height: 70,
                                                child: Card(
                                                  elevation: 3,
                                                  clipBehavior: Clip.hardEdge,
                                                  margin: EdgeInsets.only(left: 4, right: 4, top: 8),
                                                  child: InkWell(
                                                    onTap: () {
                                                      navigationController.navigateToWithArguments(
                                                          routeName: farmComputerProjectDashboardPageRoute,
                                                          arguments: {"id":widget.projects!.data![index].projectId,"args":true});
                                                    },
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                      children: [
                                                        widget.projects!.data![index].imagePath == null
                                                            ? Image.asset(
                                                                Images.wallpaper,
                                                                fit: BoxFit.cover,
                                                                width: 80,
                                                                height: 250,
                                                              )
                                                            : Image.network(
                                                                widget.projects!.data![index].imagePath!.path!,
                                                                fit: BoxFit.cover,
                                                                width: 80,
                                                                height: 150,
                                                              ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        /* Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    CustomText(
                                                      text: widget.events!.data!.eventDate == null ? "-" : widget.events!.data!.eventDate!.split(" ")[1],
                                                      color: Color(0xffA71832),
                                                      size: Responsive.isDesktop(context) ? 20 : 16,
                                                      weight: FontWeight.w400,
                                                    ),
                                                    CustomText(
                                                      text: widget.events!.data!.eventDate == null ? "-" : widget.events!.data!.eventDate!.split(" ")[0],
                                                      color: Colors.black,
                                                      size: Responsive.isDesktop(context) ? 30 : 20,
                                                      weight: FontWeight.w700,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 16,
                                                ),*/
                                                        SizedBox(
                                                          width: getWidth(context) * 0.1,
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Expanded(
                                                                child: CustomText(
                                                                  text: widget.projects!.data![index].projectName ?? "",
                                                                  color: Color(0xffA71832),
                                                                  lines: 2,
                                                                  size: Responsive.isDesktop(context) ? 13 : 12,
                                                                  weight: FontWeight.w800,
                                                                  overflows: TextOverflow.visible,
                                                                  textAligns: TextAlign.start,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 2,
                                                                child: Html(
                                                                  shrinkWrap: true,
                                                                  data: widget.projects!.data![index].description ?? "",
                                                                  style: {
                                                                    "body": Style(
                                                                        fontWeight: FontWeight.normal,
                                                                        fontSize: FontSize.xSmall,
                                                                        textAlign: TextAlign.start,
                                                                        textOverflow: TextOverflow.ellipsis,
                                                                        maxLines: 2,
                                                                        padding: EdgeInsets.zero,
                                                                        margin: EdgeInsets.zero),
                                                                    "span ": Style(
                                                                        fontWeight: FontWeight.normal,
                                                                        fontSize: FontSize.xSmall,
                                                                        textAlign: TextAlign.start,
                                                                        textOverflow: TextOverflow.ellipsis,
                                                                        maxLines: 2,
                                                                        padding: EdgeInsets.zero,
                                                                        margin: EdgeInsets.zero),
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              itemCount: widget.projects!.data!.length > 5 ? 5 : widget.projects!.data!.length,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                  flex: 2,
                                  // width:  getWidth(context) * 0.38,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: "Your  Parcels".tr(), // widget
                                            color: Color(0xffA71832),
                                            size: Responsive.isDesktop(context) ? 14 : 12,
                                            weight: FontWeight.w800,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              navigationController.navigateToWithArguments(
                                                  routeName: farmComputerParcelRoute, arguments: widget.basicInfo!.data!.id);
                                            },
                                            child: CustomText(
                                              text: "view all parcel details".tr(),
                                              color: Colors.black,
                                              size: 11,
                                              weight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      MouseRegion(
                                        onEnter: (v) {
                                          setState(() {
                                            cursoronMap = true;
                                          });
                                        },
                                        onExit: (v) {
                                          setState(() {
                                            cursoronMap = false;
                                          });
                                        },
                                        child: SizedBox(
                                          height: getHeight(context) * 0.65,
                                          width: getWidth(context),
                                          child: !loadParcel
                                              ? ShimmerEffect(
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    color: Colors.blue,
                                                  ),
                                                )
                                              : _main.isFeature.isEmpty
                                                  ? Center(
                                                      child: CustomText(
                                                        text: "There are no registered parcels for your farm yet".tr(),
                                                        color: Color(0xffA71832),
                                                        textAligns: TextAlign.center,
                                                        size: 14,
                                                        weight: FontWeight.bold,
                                                      ),
                                                    )
                                                  : Builder(builder: (context) {
                                                      List<List<latLng.LatLng>>? listOfPolygon = [];
                                                      List<String> labelList = [];
                                                      List<int> indexList = [];
                                                      for (var i in _main.listOfPacelData!) {
                                                        if (i.listOfLatLng.isNotEmpty) {
                                                          int index = _main.listOfPacelData!.indexOf(i);
                                                          indexList.add(index);
                                                          labelList.add('${i.farmName}');
                                                          listOfPolygon.add(i.listOfLatLng);
                                                        }
                                                      }
                                                      return MapWithPolygon(
                                                        listOfPolygon: listOfPolygon,
                                                        indexList: indexList,
                                                        labelList: labelList,
                                                        selectedParcel: '',
                                                        showgreen: true,
                                                        outerPadding: 250,
                                                      );
                                                    }),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        if (Responsive.isTablet(context) || Responsive.isMobile(context))
                          SizedBox(
                            width: /*Responsive.isTablet(context)
                                    ? getWidth(context) * 0.3
                                    :*/
                                getWidth(context),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  color: Color(0xffFEDE3B),
                                  child: ListTile(
                                    onTap: () {
                                      navigationController.navigateToWithArguments(routeName: farmComputerDataOverviewRoute);
                                    },
                                    minLeadingWidth: 18,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 28, vertical: 8),
                                    leading: Icon(
                                      FontAwesomeIcons.clipboardList,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                    title: CustomText(
                                      text: 'view all farm data in data overview'.tr(),
                                      color: Colors.black,
                                      lines: 2,
                                      textAligns: TextAlign.start,
                                      weight: FontWeight.bold,
                                      size: 11,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: "Your Projects".tr(), // widget.detailsResponse.data?.entrepreneurName ?? "",
                                      color: Color(0xffA71832),
                                      size: Responsive.isDesktop(context) ? 14 : 12,
                                      weight: FontWeight.w800,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        navigationController.navigateToWithArguments(routeName: farmComputerProjectDirectoryPageRoute,arguments:
                                        true);
                                      },
                                      child: CustomText(
                                        text: "View all projects".tr(), // widget.detailsResponse.data?.entrepreneurName ?? "",
                                        color: Colors.black,
                                        size: 11,
                                        weight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: getHeight(context) * 0.57,
                                  child: widget.projects!.data!.isEmpty
                                      ? Padding(
                                          padding: EdgeInsets.only(top: getHeight(context) * 0.2, right: 4, left: 4),
                                          child: CustomText(
                                            text: 'You are not yet participating in any projects...'.tr(),
                                            size: 12,
                                            color: darkred,
                                            lines: 2,
                                            textAligns: TextAlign.center,
                                            overflows: TextOverflow.visible,
                                            weight: FontWeight.bold,
                                          ),
                                        )
                                      : ListView.builder(
                                          padding: EdgeInsets.zero,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) => SizedBox(
                                            height: 70,
                                            child: Card(
                                              elevation: 3,
                                              clipBehavior: Clip.hardEdge,
                                              margin: EdgeInsets.only(left: 4, right: 4, top: 8),
                                              child: InkWell(
                                                onTap: () {
                                                  navigationController.navigateToWithArguments(
                                                      routeName: farmComputerProjectDashboardPageRoute,
                                                      arguments: widget.projects!.data![index].projectId);
                                                },
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                  children: [
                                                    widget.projects!.data![index].imagePath == null
                                                        ? Image.asset(
                                                            Images.wallpaper,
                                                            fit: BoxFit.cover,
                                                            width: 80,
                                                            height: 250,
                                                          )
                                                        : Image.network(
                                                            widget.projects!.data![index].imagePath!.path!,
                                                            fit: BoxFit.cover,
                                                            width: 80,
                                                            height: 150,
                                                          ),
                                                    SizedBox(
                                                      width: 16,
                                                    ),
                                                    SizedBox(
                                                      width: Responsive.isDesktop(context)
                                                          ? getWidth(context) * 0.12
                                                          : Responsive.isTablet(context)
                                                              ? getWidth(context) * 0.7
                                                              : getWidth(context) * 0.45,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          SizedBox(
                                                            height: 4,
                                                          ),
                                                          SizedBox(
                                                            width: Responsive.isDesktop(context)
                                                                ? getWidth(context) * 0.12
                                                                : Responsive.isTablet(context)
                                                                    ? getWidth(context) * 0.7
                                                                    : getWidth(context) * 0.45,
                                                            child: CustomText(
                                                              text: widget.projects!.data![index].projectName ?? "",
                                                              color: Color(0xffA71832),
                                                              size: Responsive.isDesktop(context) ? 14 : 12,
                                                              weight: FontWeight.w800,
                                                              textAligns: TextAlign.start,
                                                            ),
                                                          ),
                                                          // SizedBox(height: 4),
                                                          SizedBox(
                                                            width: Responsive.isDesktop(context)
                                                                ? getWidth(context) * 0.12
                                                                : Responsive.isTablet(context)
                                                                    ? getWidth(context) * 0.7
                                                                    : getWidth(context) * 0.45,
                                                            // height: 36,
                                                            child: Html(
                                                              shrinkWrap: true,
                                                              data: widget.projects!.data![index].description ?? "",
                                                              style: {
                                                                "body": Style(
                                                                  fontWeight: FontWeight.normal,
                                                                  fontSize: FontSize.xSmall,
                                                                  textAlign: TextAlign.start,
                                                                  textOverflow: TextOverflow.ellipsis,
                                                                  maxLines: 2,
                                                                  padding: EdgeInsets.zero,
                                                                ),
                                                                "span ": Style(
                                                                    fontWeight: FontWeight.normal,
                                                                    fontSize: FontSize.small,
                                                                    textAlign: TextAlign.start,
                                                                    textOverflow: TextOverflow.ellipsis,
                                                                    maxLines: 2,
                                                                    padding: EdgeInsets.zero,
                                                                    margin: EdgeInsets.zero),
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          itemCount: widget.projects!.data!.length > 5 ? 5 : widget.projects!.data!.length,
                                        ),
                                ),
                              ],
                            ),
                          ),
                        if (Responsive.isTablet(context) || Responsive.isMobile(context))
                          SizedBox(
                              width: /* Responsive.isTablet(context)
                                      ? getWidth(context) * 0.6
                                      :*/
                                  getWidth(context),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: "Your Parcels".tr(), // widget
                                        color: Color(0xffA71832),
                                        size: Responsive.isDesktop(context) ? 14 : 12,
                                        weight: FontWeight.w800,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          navigationController.navigateToWithArguments(
                                              routeName: farmComputerParcelRoute, arguments: widget.basicInfo!.data!.id);
                                        },
                                        child: CustomText(
                                          text: "view all parcel details".tr(),
                                          color: Colors.black,
                                          size: 11,
                                          weight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  MouseRegion(
                                    onEnter: (v) {
                                      setState(() {
                                        cursoronMap = true;
                                      });
                                    },
                                    onExit: (v) {
                                      setState(() {
                                        cursoronMap = false;
                                      });
                                    },
                                    child: SizedBox(
                                      height: getHeight(context) * 0.55,
                                      width: getWidth(context),
                                      child: !loadParcel
                                          ? ShimmerEffect(
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                color: Colors.blue,
                                              ),
                                            )
                                          : _main.isFeature.isEmpty
                                              ? Center(
                                                  child: CustomText(
                                                    text: "There are no registered parcels for your farm yet".tr(),
                                                    color: Color(0xffA71832),
                                                    textAligns: TextAlign.center,
                                                    size: 14,
                                                    weight: FontWeight.bold,
                                                  ),
                                                )
                                              : Builder(builder: (context) {
                                                  List<List<latLng.LatLng>>? listOfPolygon = [];
                                                  List<String> labelList = [];
                                                  List<int> indexList = [];
                                                  for (var i in _main.listOfPacelData!) {
                                                    if (i.listOfLatLng.isNotEmpty) {
                                                      int index = _main.listOfPacelData!.indexOf(i);
                                                      indexList.add(index);
                                                      labelList.add('${i.farmName}');
                                                      listOfPolygon.add(i.listOfLatLng);
                                                    }
                                                  }
                                                  return MapWithPolygon(
                                                    listOfPolygon: listOfPolygon,
                                                    indexList: indexList,
                                                    labelList: labelList,
                                                    selectedParcel: '',
                                                    showgreen: true,
                                                    outerPadding: 50,
                                                  );
                                                }),
                                    ),
                                  ),
                                ],
                              )),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 16.0, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Your BoerenWijzer".tr(),
                                color: Color(0xffA71832),
                                size: Responsive.isDesktop(context) ? 14 : 12,
                                weight: FontWeight.w800,
                              ),
                              InkWell(
                                onTap: () {
                                  navigationController.navigateToWithArguments(routeName: farmComputerParcelDataRoute,arguments: true);
                                },
                                child: CustomText(
                                  text: "view data".tr(),
                                  color: Colors.black,
                                  size: 11,
                                  weight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 6),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: SizedBox(
                            width: getWidth(context),
                            // height: getHeight(context) * .7,
                            child: Card(
                              child: widget.boerenwijzer!.data!.isEmpty
                                  ? Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(30.0),
                                        child: CustomText(
                                          text:
                                              'You do not have any scores yet for the BoerenWijzer, to generate scores, pleas contact a Wij.land employee'
                                                  .tr(),
                                          lines: 5,
                                          color: darkRed,
                                          size: 16,
                                          weight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  : Column(
                                      children: const [WebViewXPage()],
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 4,
                    height: 12,
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Your next Event".tr(),
                                color: Color(0xffA71832),
                                size: Responsive.isDesktop(context) ? 14 : 12,
                                weight: FontWeight.w800,
                              ),
                              InkWell(
                                onTap: () {
                                  navigationController.navigateToWithArguments(routeName: eventsCalenderListPageRoute,arguments: true);
                                },
                                child: CustomText(
                                  text: "view all events".tr(),
                                  color: Colors.black,
                                  size: 11,
                                  weight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          // height: 330,
                          width: Responsive.isDesktop(context) ? getWidth(context) * 0.3 : getWidth(context),
                          child: widget.events!.data == null
                              ? Center(
                                  child: CustomText(
                                    text: 'No upcoming events'.tr(),
                                    size: 12,
                                    color: darkred,
                                    weight: FontWeight.bold,
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: widget.events!.data!.length > 3 ? 3 : widget.events!.data!.length,
                                  itemBuilder: (context, index) {
                                    return SizedBox(
                                      height: 110,
                                      child: Card(
                                        elevation: 3,
                                        clipBehavior: Clip.hardEdge,
                                        margin: EdgeInsets.only(left: 4, right: 4, top: 4),
                                        child: InkWell(
                                          onTap: () {
                                            navigationController.navigateToWithArguments(
                                                routeName: eventsFileScreenPageRoute,
                                                arguments: {"id":widget.events!.data![index].id,"event_name":widget.events!.data![index].eventName});
                                          },
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              widget.events!.data![index].eventPic == null
                                                  ? Image.asset(
                                                      Images.wallpaper,
                                                      fit: BoxFit.cover,
                                                      width: 90,
                                                      // height: 70,
                                                    )
                                                  : Image.network(
                                                      widget.events!.data![index].eventPic!,
                                                      fit: BoxFit.cover,
                                                      width: 90,
                                                      // height: 70,
                                                    ),
                                              SizedBox(
                                                width: 12,
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  CustomText(
                                                    text: widget.events!.data![index].eventDate == null
                                                        ? "-"
                                                        : widget.events!.data![index].eventDate!.split(" ")[0].isNotEmpty
                                                            ? widget.events!.data![index].eventDate!.split(" ")[1]
                                                            : widget.events!.data![index].eventDate!.split(" ")[2],
                                                    color: Color(0xffA71832),
                                                    size: Responsive.isDesktop(context) ? 20 : 16,
                                                    weight: FontWeight.w400,
                                                  ),
                                                  CustomText(
                                                    text: widget.events!.data![index].eventDate == null
                                                        ? "-"
                                                        : widget.events!.data![index].eventDate!.split(" ")[0].isNotEmpty
                                                            ? widget.events!.data![index].eventDate!.split(" ")[0]
                                                            : widget.events!.data![index].eventDate!.split(" ")[1],
                                                    color: Colors.black,
                                                    size: Responsive.isDesktop(context) ? 20 : 16,
                                                    weight: FontWeight.w700,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 12,
                                              ),
                                              SizedBox(
                                                width: Responsive.isDesktop(context)
                                                    ? getWidth(context) * 0.14
                                                    : Responsive.isTablet(context)
                                                        ? getWidth(context) * 0.7
                                                        : getWidth(context) * 0.45,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    SizedBox(
                                                      width: Responsive.isDesktop(context)
                                                          ? getWidth(context) * 0.14
                                                          : Responsive.isTablet(context)
                                                              ? getWidth(context) * 0.7
                                                              : getWidth(context) * 0.45,
                                                      child: CustomText(
                                                        text: widget.events!.data![index].eventName ?? " ",
                                                        color: Color(0xffA71832),
                                                        lines: 2,
                                                        textAligns: TextAlign.start,
                                                        overflows: TextOverflow.ellipsis,
                                                        size: Responsive.isDesktop(context) ? 12 : 11,
                                                        weight: FontWeight.w800,
                                                      ),
                                                    ),
                                                    SizedBox(height: 4),
                                                    SizedBox(
                                                      width: Responsive.isDesktop(context)
                                                          ? getWidth(context) * 0.14
                                                          : Responsive.isTablet(context)
                                                              ? getWidth(context) * 0.7
                                                              : getWidth(context) * 0.45,
                                                      // height: 20,
                                                      child: CustomText(
                                                        text: widget.events!.data![index].location ?? " ",
                                                        color: Colors.black,
                                                        size: 11,
                                                        lines: 3,
                                                        textAligns: TextAlign.start,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: Responsive.isDesktop(context)
                                                          ? getWidth(context) * 0.14
                                                          : Responsive.isTablet(context)
                                                              ? getWidth(context) * 0.7
                                                              : getWidth(context) * 0.45,
                                                      // height: 50,
                                                      child: Html(
                                                        data: widget.events!.data![index].eventDescription ?? "",
                                                        style: {
                                                          "body": Style(
                                                              fontWeight: FontWeight.normal,
                                                              fontSize: FontSize.xSmall,
                                                              textAlign: TextAlign.start,
                                                              textOverflow: TextOverflow.ellipsis,
                                                              maxLines: 2,
                                                              padding: EdgeInsets.zero,
                                                              margin: EdgeInsets.zero),
                                                          "span ": Style(
                                                              fontWeight: FontWeight.normal,
                                                              fontSize: FontSize.xSmall,
                                                              textAlign: TextAlign.start,
                                                              textOverflow: TextOverflow.ellipsis,
                                                              maxLines: 2,
                                                              padding: EdgeInsets.zero,
                                                              margin: EdgeInsets.zero),
                                                        },
                                                        onLinkTap: (String? url, RenderContext context, Map<String, String> attributes,
                                                            dom.Element? element) {
                                                          //open URL in webview, or launch URL in browser, or any other logic here
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                        ),
                        SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Your Last Contact".tr(), // widget.detailsResponse.data?.entrepreneurName ?? "",
                                color: Color(0xffA71832),
                                size: Responsive.isDesktop(context) ? 14 : 12,
                                weight: FontWeight.w800,
                              ),
                              InkWell(
                                onTap: () {
                                  navigationController.navigateToWithArguments(routeName: farmComputerContactMomentName,arguments: true);
                                },
                                child: CustomText(
                                  text: "View all contacts".tr(), // widget.detailsResponse.data?.entrepreneurName ?? "",
                                  color: Colors.black,
                                  size: 11,
                                  weight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          height: 110,
                          child: Card(
                            elevation: 3,
                            margin: EdgeInsets.only(left: 4, right: 4, top: 8),
                            child: SizedBox(
                              height: 100,
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ContactMomentDialogbox(
                                        contactMomentId: widget.moments!.data?.id,
                                      );
                                    },
                                  );
                                },
                                child: Row(
                                  children: [
                                    Container(
                                        width: 50,
                                        margin: EdgeInsets.only(left: 12),
                                        height: 50,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey,
                                        ),
                                        child: Center(
                                            child: Icon(
                                          CupertinoIcons.phone,
                                          size: 16,
                                        ))),
                                    SizedBox(
                                      width: 14,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          text: widget.moments!.data?.contactMomentDate == null
                                              ? "-"
                                              : widget.moments!.data!.contactMomentDate!.split(" ")[2].toUpperCase(),
                                          color: darkGreen,
                                          size: Responsive.isDesktop(context) ? 20 : 16,
                                          weight: FontWeight.w400,
                                        ),
                                        CustomText(
                                          text: widget.moments!.data?.contactMomentDate == null
                                              ? "-"
                                              : widget.moments!.data!.contactMomentDate!.split(" ")[1],
                                          color: Colors.black,
                                          size: Responsive.isDesktop(context) ? 30 : 20,
                                          weight: FontWeight.w700,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 14,
                                    ),
                                    SizedBox(
                                      width: Responsive.isDesktop(context)
                                          ? getWidth(context) * 0.17
                                          : Responsive.isTablet(context)
                                              ? getWidth(context) * 0.75
                                              : getWidth(context) * 0.45,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 4,
                                          ),
                                          CustomText(
                                            text: widget.moments!.data?.contactSubject ?? "",
                                            color: darkGreen,
                                            size: Responsive.isDesktop(context) ? 13 : 12,
                                            weight: FontWeight.w800,
                                          ),
                                          SizedBox(height: 4),
                                          CustomText(
                                            text: widget.moments!.data?.contactMomentType ?? "-",
                                            color: Colors.black,
                                            size: 11,
                                          ),
                                          SizedBox(height: 4),
                                          SizedBox(
                                            width: Responsive.isDesktop(context)
                                                ? getWidth(context) * 0.17
                                                : Responsive.isTablet(context)
                                                    ? getWidth(context) * 0.75
                                                    : getWidth(context) * 0.45,
                                            height: 50,
                                            child: Html(
                                              shrinkWrap: true,
                                              data: widget.moments!.data?.contactNotes ?? "-",
                                              style: {
                                                "body": Style(
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: FontSize.xSmall,
                                                    textAlign: TextAlign.start,
                                                    textOverflow: TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    padding: EdgeInsets.zero,
                                                    margin: EdgeInsets.zero),
                                                "span ": Style(
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: FontSize.xSmall,
                                                    textAlign: TextAlign.start,
                                                    textOverflow: TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    padding: EdgeInsets.zero,
                                                    margin: EdgeInsets.zero),
                                              },
                                              onLinkTap: (String? url, RenderContext context, Map<String, String> attributes, dom.Element? element) {
                                                //open URL in webview, or launch URL in browser, or any other logic here
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Actions".tr(), // widget.detailsResponse.data?.entrepreneurName ?? "",
                                color: Color(0xffA71832),
                                size: Responsive.isDesktop(context) ? 14 : 12,
                                weight: FontWeight.w800,
                              ),
                              InkWell(
                                onTap: () {
                                  navigationController.navigateToWithArguments(routeName: farmComputerActionRoute,arguments: true);
                                },
                                child: CustomText(
                                  text: "View all actions".tr(), // widget.detailsResponse.data?.entrepreneurName ?? "",
                                  color: Colors.black,
                                  size: 11,
                                  weight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: getHeight(context) * 0.25,
                          child: Card(
                            elevation: 3,
                            margin: EdgeInsets.only(left: 4, right: 4, top: 8),
                            child: Container(
                              height: 100,
                              margin: EdgeInsets.only(top: 12),
                              child: Column(
                                children: [
                                  Flexible(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: CustomText(
                                            text: 'Action name'.tr(),
                                            size: 12,
                                            textAligns: TextAlign.center,
                                            weight: FontWeight.w600,
                                          ),
                                        ),
                                        Expanded(
                                          child: CustomText(
                                            text: 'Date'.tr(),
                                            size: 12,
                                            textAligns: TextAlign.center,
                                            weight: FontWeight.w600,
                                          ),
                                        ),
                                        Expanded(
                                          child: CustomText(
                                            text: 'Done by'.tr(),
                                            size: 12,
                                            textAligns: TextAlign.center,
                                            weight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  for (int i = 0; i < (widget.action.data!.length >= 5 ? 5 : widget.action.data!.length); i++)
                                    Flexible(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: CustomText(
                                              text: widget.action.data![i].actionName ?? "",
                                              size: 11,
                                              weight: FontWeight.w300,
                                              textAligns: TextAlign.center,
                                            ),
                                          ),
                                          Expanded(
                                            child: CustomText(
                                              text: widget.action.data![i].doneOnDate ?? "",
                                              size: 11,
                                              textAligns: TextAlign.center,
                                              weight: FontWeight.w300,
                                            ),
                                          ),
                                          Expanded(
                                            child: CustomText(
                                              text: widget.action.data![i].doneBy!.isEmpty ? "" : widget.action.data![i].doneBy![0].name!,
                                              size: 11,
                                              textAligns: TextAlign.center,
                                              weight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Files".tr(),
                                color: Color(0xffA71832),
                                size: Responsive.isDesktop(context) ? 14 : 12,
                                weight: FontWeight.w800,
                              ),
                              InkWell(
                                onTap: () {
                                  navigationController.navigateToWithArguments(routeName: farmComputerFileScreensPageRoute,arguments: true);
                                },
                                child: CustomText(
                                  text: "View all files".tr(),
                                  color: Colors.black,
                                  size: 11,
                                  weight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          height: 100,
                          child: Card(
                            elevation: 3,
                            margin: EdgeInsets.only(left: 4, right: 4, top: 8),
                            child: Container(
                              width: getWidth(context),
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 8),
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.start,
                                alignment: WrapAlignment.spaceAround,
                                spacing: Responsive.isDesktop(context) ? getWidth(context) * 0.01 : getWidth(context) * 0.1,
                                children: [
                                  for (int i = 0; i < (widget.files!.data!.isNotEmpty?(widget.files!.data!.length>5?5:widget.files!.data!.length):0);
      i++)
                                    SizedBox(
                                      width: getWidth(context) * 0.05,
                                      child: widget.files!.data!.isEmpty
                                          ? CustomText(text: 'No files available for your farm..'.tr())
                                          : Column(
                                              children: [
                                                FaIcon(
                                                  widget.files!.data![i].mime != null
                                                      ? widget.files!.data![i].mime!.split('/')[1].toLowerCase() == 'pdf'
                                                          ? FontAwesomeIcons.solidFilePdf
                                                          : FontAwesomeIcons.solidFileImage
                                                      : FontAwesomeIcons.solidFileImage,
                                                  size: 35,
                                                  color: widget.files!.data![i].mime != null
                                                      ? widget.files!.data![i].mime!.split('/')[1].toLowerCase() == 'pdf'
                                                          ? Colors.red
                                                          : herbal
                                                      : herbal,
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                CustomText(
                                                  text: widget.files!.data![i].title!.split('.')[0],
                                                  size: 9,
                                                ),
                                              ],
                                            ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final int indexId;
  final Color textColor;

  const Indicator({
    Key? key,
    required this.color,
    required this.text,
    required this.indexId,
    required this.isSquare,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        SizedBox(
          width: getWidth(context) * 0.08,
          child: Text(
            toBeginningOfSentenceCase(text)!,
            maxLines: 2,
            overflow: TextOverflow.visible,
            softWrap: true,
            style: TextStyle(
                fontSize: 12, fontFamily: Montserrat_Medium, fontWeight: indexId > 0 ? FontWeight.bold : FontWeight.normal, color: textColor),
          ),
        )
      ],
    );
  }
}

class WebViewXPage extends StatefulWidget {
  const WebViewXPage({
    Key? key,
  }) : super(key: key);

  @override
  _WebViewXPageState createState() => _WebViewXPageState();
}

class _WebViewXPageState extends State<WebViewXPage> {
  late WebViewXController webviewController;
  final initialContent = '<h4><h2>';
  final executeJsErrorMessage = 'Failed to execute this task because the current content is (probably) URL that allows iframe embedding, on Web.\n\n'
      'A short reason for this is that, when a normal URL is embedded in the iframe, you do not actually own that content so you cant call your custom functions\n'
      '(read the documentation to find out why).';

  Size get screenSize => MediaQuery.of(context).size;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      _setUrl();
    });
    super.initState();
  }

  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: _buildWebViewX(),
    );
  }

  Widget _buildWebViewX() {
    return WebViewX(
      key: const ValueKey('webviewx'),
      initialContent: initialContent,
      initialSourceType: SourceType.html,
      height: screenSize.height + 200,
      width: getWidth(context),
      onWebViewCreated: (controller) => webviewController = controller,
      onPageStarted: (src) => debugPrint('A new page has started loading: $src\n'),
      onPageFinished: (src) => debugPrint('The page has finished loading: $src\n'),
      jsContent: const {
        EmbeddedJsContent(
          js: "function testPlatformIndependentMethod() { console.log('Hi from JS') }",
        ),
        EmbeddedJsContent(
          webJs: "function testPlatformSpecificMethod(msg) { TestDartCallback('Web callback says: ' + msg) }",
          mobileJs: "function testPlatformSpecificMethod(msg) { TestDartCallback.postMessage('Mobile callback says: ' + msg) }",
        ),
      },
      dartCallBacks: {
        DartCallback(
          name: 'TestDartCallback',
          callBack: (msg) => showSnackBar(msg.toString(), context),
        )
      },
      webSpecificParams: const WebSpecificParams(
        printDebugInfo: true,
      ),
      mobileSpecificParams: const MobileSpecificParams(
        androidEnableHybridComposition: true,
      ),
      navigationDelegate: (navigation) {
        debugPrint(navigation.content.sourceType.toString());
        return NavigationDecision.navigate;
      },
    );
  }

  void _setUrl() {
    webviewController.loadContent(
      'https://$gloal_base_path/farm_computer/boerenwijzer_graph/${authController.myUser.value.token!}',
      SourceType.url,
    );
    setState(() {});
  }

  void _setUrlBypass() {
    webviewController.loadContent(
      'https://news.ycombinator.com/',
      SourceType.urlBypass,
    );
  }

  void _setHtml() {
    webviewController.loadContent(
      initialContent,
      SourceType.html,
    );
  }

  void _setHtmlFromAssets() {
    webviewController.loadContent(
      'assets/test.html',
      SourceType.html,
      fromAssets: true,
    );
  }

  Future<void> _goForward() async {
    if (await webviewController.canGoForward()) {
      await webviewController.goForward();
      showSnackBar('Did go forward', context);
    } else {
      showSnackBar('Cannot go forward', context);
    }
  }

  Future<void> _goBack() async {
    if (await webviewController.canGoBack()) {
      await webviewController.goBack();
      showSnackBar('Did go back', context);
    } else {
      showSnackBar('Cannot go back', context);
    }
  }

  void _reload() {
    webviewController.reload();
  }

  void _toggleIgnore() {
    final ignoring = webviewController.ignoresAllGestures;
    webviewController.setIgnoreAllGestures(!ignoring);
    showSnackBar('Ignore events = ${!ignoring}', context);
  }

  Future<void> _evalRawJsInGlobalContext() async {
    try {
      final result = await webviewController.evalRawJavascript(
        '2+2',
        inGlobalContext: true,
      );
      showSnackBar('The result is $result', context);
    } catch (e) {
      showAlertDialog(
        executeJsErrorMessage,
        context,
      );
    }
  }

  Future<void> _callPlatformIndependentJsMethod() async {
    try {
      await webviewController.callJsMethod('testPlatformIndependentMethod', []);
    } catch (e) {
      showAlertDialog(
        executeJsErrorMessage,
        context,
      );
    }
  }

  Future<void> _callPlatformSpecificJsMethod() async {
    try {
      await webviewController.callJsMethod('testPlatformSpecificMethod', ['Hi']);
    } catch (e) {
      showAlertDialog(
        executeJsErrorMessage,
        context,
      );
    }
  }

  Future<void> _getWebviewContent() async {
    try {
      final content = await webviewController.getContent();
      showAlertDialog(content.source, context);
    } catch (e) {
      showAlertDialog('Failed to execute this task.', context);
    }
  }

  Widget buildSpace({
    Axis direction = Axis.horizontal,
    double amount = 0.2,
    bool flex = true,
  }) {
    return flex
        ? Flexible(
            child: FractionallySizedBox(
              widthFactor: direction == Axis.horizontal ? amount : null,
              heightFactor: direction == Axis.vertical ? amount : null,
            ),
          )
        : SizedBox(
            width: direction == Axis.horizontal ? amount : null,
            height: direction == Axis.vertical ? amount : null,
          );
  }

  List<Widget> _buildButtons() {
    return [
      buildSpace(direction: Axis.vertical, flex: false, amount: 20.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: createButton(onTap: _goBack, text: 'Back')),
          buildSpace(amount: 12, flex: false),
          Expanded(child: createButton(onTap: _goForward, text: 'Forward')),
          buildSpace(amount: 12, flex: false),
          Expanded(child: createButton(onTap: _reload, text: 'Reload')),
        ],
      ),
      buildSpace(direction: Axis.vertical, flex: false, amount: 20.0),
      createButton(
        text: 'Change content to URL that allows iframes embedding\n(https://flutter.dev)',
        onTap: _setUrl,
      ),
      buildSpace(direction: Axis.vertical, flex: false, amount: 20.0),
      createButton(
        text: 'Change content to URL that doesnt allow iframes embedding\n(https://news.ycombinator.com/)',
        onTap: _setUrlBypass,
      ),
      buildSpace(direction: Axis.vertical, flex: false, amount: 20.0),
      createButton(
        text: 'Change content to HTML (hardcoded)',
        onTap: _setHtml,
      ),
      buildSpace(direction: Axis.vertical, flex: false, amount: 20.0),
      createButton(
        text: 'Change content to HTML (from assets)',
        onTap: _setHtmlFromAssets,
      ),
      buildSpace(direction: Axis.vertical, flex: false, amount: 20.0),
      createButton(
        text: 'Toggle on/off ignore any events (click, scroll etc)',
        onTap: _toggleIgnore,
      ),
      buildSpace(direction: Axis.vertical, flex: false, amount: 20.0),
      createButton(
        text: 'Evaluate 2+2 in the global "window" (javascript side)',
        onTap: _evalRawJsInGlobalContext,
      ),
      buildSpace(direction: Axis.vertical, flex: false, amount: 20.0),
      createButton(
        text: 'Call platform independent Js method (console.log)',
        onTap: _callPlatformIndependentJsMethod,
      ),
      buildSpace(direction: Axis.vertical, flex: false, amount: 20.0),
      createButton(
        text: 'Call platform specific Js method, that calls back a Dart function',
        onTap: _callPlatformSpecificJsMethod,
      ),
      buildSpace(direction: Axis.vertical, flex: false, amount: 20.0),
      createButton(
        text: 'Show current webview content',
        onTap: _getWebviewContent,
      ),
    ];
  }
}

void showAlertDialog(String content, BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => WebViewAware(
      child: AlertDialog(
        content: Text(content),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: const Text('Close'),
          ),
        ],
      ),
    ),
  );
}

void showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(content),
        duration: const Duration(seconds: 1),
      ),
    );
}

Widget createButton({
  VoidCallback? onTap,
  required String text,
}) {
  return ElevatedButton(
    onPressed: onTap,
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    ),
    child: Text(text),
  );
}
