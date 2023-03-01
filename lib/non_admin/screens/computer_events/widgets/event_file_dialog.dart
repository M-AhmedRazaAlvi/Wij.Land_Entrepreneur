import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/non_admin/providers/farm_computer_projects_provider/farm_computer_events_id_response_provider.dart';
import 'package:wij_land/non_admin/routes/routes.dart';
import 'package:wij_land/non_admin/screens/computer_events/widgets/event_going_button.dart';
import 'package:wij_land/non_admin/screens/computer_events/widgets/event_rsvp_dialog.dart';
import 'package:wij_land/screens/office/widgets/add_text_button_widget.dart';
import 'package:wij_land/utils/controller.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/images.dart';
import 'package:wij_land/utils/responsive.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../models/farm_computer_events/computer_events/request/put_farm_computer_event_attendance_request.dart';
import '../../../providers/farm_computer_projects_provider/farm_computer_events_file_provider.dart';
import '../../../providers/farm_computer_projects_provider/farm_computer_events_provider.dart';

class EventsFileDialogBox extends StatefulWidget {
  const EventsFileDialogBox({
    Key? key,
    this.eventId,
    // this.model,
  }) : super(key: key);
  final eventId;

  //final GetFarmComputerEventsIdResponse? model;

  @override
  State<EventsFileDialogBox> createState() => _EventsFileDialogBoxState();
}

class _EventsFileDialogBoxState extends State<EventsFileDialogBox> {
  @override
  void initState() {
    isLoading = true;
    initData();
    super.initState();
  }

  initData() async {
    await Provider.of<CreateFarmComputerEventsFileProvider>(context, listen: false).getFarmComputerEventFile(eventId: widget.eventId);

    await Provider.of<CreateFarmComputerEventsIdProvider>(context, listen: false).getFarmComputerEventId(eventId: widget.eventId);
    isLoading = false;
    Future.delayed(Duration(seconds: 1), () {
      add_bounds = true;
      setState(() {});
    });
  }

  bool add_bounds = false;
  bool isLoading = false;
  MapController? controller;
  bool setliteView = true;
  double zoom = -3.0;

  @override
  Widget build(BuildContext context) {
    return Consumer3<CreateFarmComputerEventsIdProvider, CreateFarmComputerEventsFileProvider, CreateFarmComputerEventsListProvider>(
        builder: (context, provider, eventProvider, eventSpecific, child) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: SizedBox(
            width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.45,
            child: isLoading
                ? SizedBox(
                    height: getHeight(context) / 2,
                    width: getWidth(context),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : provider.farmComputerEventsIdResponseModel.error?.status == 404
                    ? Container(
                        alignment: Alignment.center,
                        width: getWidth(context) * 0.4,
                        height: getWidth(context) * 0.3,
                        padding: EdgeInsets.all(20),
                        child: CustomText(
                          text: "Only Invited Guests Can View Data".tr(),
                          color: Colors.red,
                          weight: FontWeight.w700,
                          size: Responsive.isMobile(context) ? 12 : 16,
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.all(Responsive.isMobile(context) ? 0 : 1.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 10,
                              alignment: WrapAlignment.start,
                              runSpacing: 10,
                              children: [
                                Container(
                                  // clipBehavior: Clip.hardEdge,
                                  //  padding: EdgeInsets.only(left: 25),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(10))),
                                  child: provider.farmComputerEventsIdResponseModel.data!.eventPicture != null
                                      ? Image.network(
                                          provider.farmComputerEventsIdResponseModel.data!.eventPicture == null
                                              ? "-"
                                              : provider.farmComputerEventsIdResponseModel.data!.eventPicture!.path!,
                                          width: Responsive.isMobile(context) ? getWidth(context) : 170,
                                          height: 148,
                                          fit: BoxFit.cover,
                                        )
                                      : Image(
                                          image: AssetImage(Images.eventImage),
                                          width: Responsive.isMobile(context) ? getWidth(context) : 170,
                                          height: 148,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10),
                                  width: Responsive.isMobile(context) ? getWidth(context) :Responsive.isTablet(context)
                                      ? getWidth(context) * 0.6
                                      :  getWidth(context) * 0.3,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: Responsive.isMobile(context) ? getWidth(context) * 0.1 : getWidth(context) * 0.06,
                                        height: 148,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            CustomText(
                                              size: Responsive.isMobile(context) ? 14 : 22,
                                              color: darkred,
                                              text: englishMonth(
                                                provider.farmComputerEventsIdResponseModel.data!.eventDate == null
                                                    ? "-"
                                                    : provider.farmComputerEventsIdResponseModel.data!.eventDate.toString().substring(3, 6),
                                              ),
                                            ),
                                            CustomText(
                                              size: Responsive.isMobile(context) ? 14 : 22,
                                              weight: FontWeight.bold,
                                              text: provider.farmComputerEventsIdResponseModel.data!.eventDate == null
                                                  ? "-"
                                                  : provider.farmComputerEventsIdResponseModel.data!.eventDate.toString().substring(0, 2),
                                            ),
                                            CustomText(
                                              size: Responsive.isMobile(context) ? 12 : 14,
                                              weight: FontWeight.bold,
                                              color: darkred,
                                              text: provider.farmComputerEventsIdResponseModel.data!.eventDate == null
                                                  ? "-"
                                                  : provider.farmComputerEventsIdResponseModel.data!.eventDate.toString().substring(7, 11),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: Responsive.isMobile(context)
                                            ? getWidth(context) * 0.55
                                            : Responsive.isTablet(context)
                                                ? getWidth(context) * 0.35
                                                : getWidth(context) * 0.2,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CustomText(
                                                text: provider.farmComputerEventsIdResponseModel.data!.eventName == null
                                                    ? "-"
                                                    : provider.farmComputerEventsIdResponseModel.data!.eventName ?? "-",
                                                size: Responsive.isMobile(context) ? 11 : 16,
                                                overflows: TextOverflow.ellipsis,
                                                lines: 2,
                                                color: darkred,
                                                weight: Responsive.isMobile(context) ? FontWeight.w700 : FontWeight.bold),
                                            SizedBox(height: Responsive.isMobile(context) ? 10 : 20),
                                            Wrap(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(right: 5),
                                                  child: CustomText(
                                                    text: "Start Time :".tr(),
                                                    weight: FontWeight.w700,
                                                    size: Responsive.isMobile(context) ? 10 : 14,
                                                  ),
                                                ),
                                                CustomText(
                                                  text: provider.farmComputerEventsIdResponseModel.data!.eventStartTime == null
                                                      ? "-"
                                                      : provider.farmComputerEventsIdResponseModel.data!.eventStartTime ?? '-',
                                                  size: Responsive.isMobile(context) ? 10 : 14,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            Wrap(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(right: 5),
                                                  child: CustomText(
                                                    text: "End Time :".tr(),
                                                    weight: FontWeight.w700,
                                                    size: Responsive.isMobile(context) ? 10 : 14,
                                                  ),
                                                ),
                                                CustomText(
                                                  text: provider.farmComputerEventsIdResponseModel.data!.eventsEndsTime == null
                                                      ? "-"
                                                      : provider.farmComputerEventsIdResponseModel.data!.eventsEndsTime ?? '-',
                                                  size: Responsive.isMobile(context) ? 10 : 14,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: Responsive.isMobile(context) ? 50 : 20),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Wrap(
                                                alignment: WrapAlignment.end,
                                                children: [
                                                  EventGoingButton(
                                                    text: "Going".tr(),
                                                    onTap: () async {
                                                      if (provider.farmComputerEventsIdResponseModel.data!.eventMode!.contains("Hybrid") &&
                                                              provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer!.contains("yes") ||
                                                          provider.farmComputerEventsIdResponseModel.data!.eventMode!.contains("Hybrid") &&
                                                              provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer!.contains("maybe")) {
                                                        showDialog(
                                                            context: context,
                                                            builder: (BuildContext context) {
                                                              return EventsRSVPDialogBox(
                                                                eventId: widget.eventId,
                                                                isAllEvent: false,
                                                                isCalendarBool: true,
                                                                argument: "yes",
                                                              );
                                                            });
                                                      }

                                                      if (provider.farmComputerEventsIdResponseModel.data!.eventMode!.contains("Online")) {
                                                        PutFarmComputerEventAttendanceUpdateRequest request =
                                                            PutFarmComputerEventAttendanceUpdateRequest(attendedMode: "Online", response: "yes");
                                                        await eventSpecific.putfarmComputerEventAttendanceUpdateForSpecificEvent(
                                                            eventID: widget.eventId, requestBody: request);
                                                        await eventProvider.getFarmComputerEventFile(
                                                          eventId: widget.eventId,
                                                        );
                                                        setState(() {});
                                                      }
                                                      if (provider.farmComputerEventsIdResponseModel.data!.eventMode!.contains("Live")) {
                                                        PutFarmComputerEventAttendanceUpdateRequest request =
                                                            PutFarmComputerEventAttendanceUpdateRequest(attendedMode: "Live", response: "yes");
                                                        await eventSpecific.putfarmComputerEventAttendanceUpdateForSpecificEvent(
                                                            eventID: widget.eventId, requestBody: request);
                                                        await eventProvider.getFarmComputerEventFile(
                                                          eventId: widget.eventId,
                                                        );
                                                        setState(() {});
                                                      }
                                                    },
                                                    backColor: (eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer != null &&
                                                            eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer != [] &&
                                                            eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer!.isNotEmpty)
                                                        ? (eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer![0].isNotEmpty &&
                                                                eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer![0]
                                                                    .toLowerCase()
                                                                    .contains("yes"))
                                                            ? darkGreen
                                                            : Colors.transparent
                                                        : Colors.transparent,
                                                    textColor: (eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer != null &&
                                                            eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer != [] &&
                                                            eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer!.isNotEmpty)
                                                        ? eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer![0]
                                                                .toLowerCase()
                                                                .contains("yes")
                                                            ? Colors.white
                                                            : Colors.black
                                                        : Colors.black,
                                                  ),
                                                  EventGoingButton(
                                                    text: "Maybe".tr(),
                                                    onTap: () async {
                                                      if (provider.farmComputerEventsIdResponseModel.data!.eventMode!.contains("Hybrid") &&
                                                              provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer!.contains("yes") ||
                                                          provider.farmComputerEventsIdResponseModel.data!.eventMode!.contains("Hybrid") &&
                                                              provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer!.contains("maybe")) {
                                                        showDialog(
                                                            context: context,
                                                            builder: (BuildContext context) {
                                                              return EventsRSVPDialogBox(
                                                                eventId: widget.eventId,
                                                                isAllEvent: false,
                                                                isCalendarBool: true,
                                                                argument: "maybe",
                                                              );
                                                            });
                                                      }

                                                      if (provider.farmComputerEventsIdResponseModel.data!.eventMode!.contains("Online")) {
                                                        PutFarmComputerEventAttendanceUpdateRequest request =
                                                            PutFarmComputerEventAttendanceUpdateRequest(attendedMode: "Online", response: "maybe");
                                                        await eventSpecific.putfarmComputerEventAttendanceUpdateForSpecificEvent(
                                                            eventID: widget.eventId, requestBody: request);
                                                        await eventProvider.getFarmComputerEventFile(
                                                          eventId: widget.eventId,
                                                        );
                                                        setState(() {});
                                                      }
                                                      if (provider.farmComputerEventsIdResponseModel.data!.eventMode!.contains("Live")) {
                                                        PutFarmComputerEventAttendanceUpdateRequest request =
                                                            PutFarmComputerEventAttendanceUpdateRequest(attendedMode: "Live", response: "maybe");
                                                        await eventSpecific.putfarmComputerEventAttendanceUpdateForSpecificEvent(
                                                            eventID: widget.eventId, requestBody: request);
                                                        await eventProvider.getFarmComputerEventFile(
                                                          eventId: widget.eventId,
                                                        );
                                                        setState(() {});
                                                      }
                                                    },
                                                    backColor: (eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer != null &&
                                                            eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer != [] &&
                                                            eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer!.isNotEmpty)
                                                        ? eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer![0]
                                                                .toLowerCase()
                                                                .contains("maybe")
                                                            ? darkGreen
                                                            : Colors.transparent
                                                        : Colors.transparent,
                                                    textColor: (eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer != null &&
                                                            eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer != [] &&
                                                            eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer!.isNotEmpty)
                                                        ? eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer![0]
                                                                .toLowerCase()
                                                                .contains("maybe")
                                                            ? Colors.white
                                                            : Colors.black
                                                        : Colors.black,
                                                  ),
                                                  EventGoingButton(
                                                    text: "Not going".tr(),
                                                    onTap: () async {
                                                      PutFarmComputerEventAttendanceUpdateRequest request =
                                                          PutFarmComputerEventAttendanceUpdateRequest(attendedMode: "", response: "no");
                                                      await eventSpecific.putfarmComputerEventAttendanceUpdateForSpecificEvent(
                                                          eventID: widget.eventId, requestBody: request);
                                                      await eventProvider.getFarmComputerEventFile(
                                                        eventId: widget.eventId,
                                                      );
                                                      setState(() {});
                                                    },
                                                    backColor: (eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer != null &&
                                                            eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer != [] &&
                                                            eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer!.isNotEmpty)
                                                        ? eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer![0]
                                                                .toLowerCase()
                                                                .contains("no")
                                                            ? darkGreen
                                                            : Colors.transparent
                                                        : Colors.transparent,
                                                    textColor: (eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer != null &&
                                                            eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer != [] &&
                                                            eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer!.isNotEmpty)
                                                        ? eventProvider.farmComputerEventsFileResponseModel.data!.rsvpAnswer![0]
                                                                .toLowerCase()
                                                                .contains("no")
                                                            ? Colors.white
                                                            : Colors.black
                                                        : Colors.black,
                                                  ),
                                                ],
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
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: Responsive.isMobile(context) ? 10 : 20),
                              child: Divider(color: Colors.grey, thickness: 0.5),
                            ),
                            Wrap(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if (provider.farmComputerEventsIdResponseModel.data!.latitude != null &&
                                    provider.farmComputerEventsIdResponseModel.data!.longitude != null)
                                  Padding(
                                    padding: EdgeInsets.only(left: Responsive.isMobile(context) ? 0 : 25),
                                    child: SizedBox(
                                      width: Responsive.isMobile(context) ? getWidth(context) : 170,
                                      height: 148,
                                      child: Builder(builder: (c) {
                                        if (setliteView) {
                                          return Stack(
                                            children: [
                                              SizedBox(
                                                width: double.infinity,
                                                height: double.infinity,
                                                child: FlutterMap(
                                                  options: MapOptions(
                                                    bounds: provider.listofLatLng,
                                                    boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(10)),
                                                    interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                                                  ),
                                                  // mapbox://styles/mapbox/satellite-v9,
                                                  children: [
                                                    TileLayer(
                                                      urlTemplate: "https://api.mapbox.com/styles/v1/mapbox/satellite-v9/tiles/"
                                                          "{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw",
                                                    ),
                                                    MarkerLayer(markers: provider.mMarkersList),
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                top: 0,
                                                right: 10,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    SizedBox(height: 12),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          setliteView = !setliteView;
                                                        });
                                                      },
                                                      child: Container(
                                                        height: getHeight(context) * 0.050,
                                                        width: getHeight(context) * 0.050,
                                                        decoration: BoxDecoration(
                                                            shape: BoxShape.rectangle,
                                                            borderRadius: BorderRadius.all(Radius.circular(4)),
                                                            color: Colors.white),
                                                        padding: EdgeInsets.all(5),
                                                        child: Center(
                                                          child: FaIcon(FontAwesomeIcons.layerGroup, size: 20),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        }
                                        return Stack(
                                          children: [
                                            SizedBox(
                                              width: double.infinity,
                                              height: double.infinity,
                                              child: FlutterMap(
                                                options: MapOptions(
                                                  //controller: controller,
                                                  bounds: provider.listofLatLng,
                                                  boundsOptions: FitBoundsOptions(
                                                    padding: EdgeInsets.all(10.0),
                                                  ),
                                                  interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                                                ),
                                                children: [
                                                  TileLayer(
                                                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                                    retinaMode: true,
                                                    maxZoom: 22,
                                                  ),
                                                  MarkerLayer(
                                                    markers: provider.mMarkersList,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              top: 0,
                                              right: 10,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  SizedBox(height: 12),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        setliteView = !setliteView;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: getHeight(context) * 0.050,
                                                      width: getHeight(context) * 0.050,
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.rectangle,
                                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                                          color: Colors.white),
                                                      padding: EdgeInsets.all(5),
                                                      child: Center(
                                                        child: FaIcon(FontAwesomeIcons.layerGroup, size: 20),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                    ),
                                  )
                                else
                                  Card(
                                    child: Padding(
                                        padding: EdgeInsets.only(left: Responsive.isMobile(context) ? 0 : 25),
                                        child: SizedBox(
                                          width: Responsive.isMobile(context) ? getWidth(context) : 170,
                                          height: 148,
                                          child: Center(
                                            child: CustomText(
                                              textAligns: TextAlign.start,
                                              text: "The location of this event is still unknown".tr(),
                                              color: Colors.red,
                                              weight: FontWeight.w700,
                                              size: Responsive.isMobile(context) ? 10 : 14,
                                              lines: 3,
                                            ),
                                          ),
                                        )),
                                  ),
                                Container(
                                  padding: EdgeInsets.only(
                                    left: Responsive.isMobile(context) ? 0 : 30,
                                    top: Responsive.isMobile(context) ? 10 : 0,
                                  ),
                                  width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: "location address".tr(),
                                        weight: FontWeight.w700,
                                        size: Responsive.isMobile(context) ? 12 : 14,
                                      ),
                                      CustomText(
                                        text: provider.farmComputerEventsIdResponseModel.data!.location ?? "-",
                                        size: Responsive.isMobile(context) ? 10 : 14,
                                        lines: 1,
                                        overflows: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 10),
                                      CustomText(
                                        text: "location description".tr(),
                                        weight: FontWeight.w700,
                                        size: Responsive.isMobile(context) ? 12 : 14,
                                      ),
                                      SizedBox(height: 5),
                                      Html(
                                        data: provider.farmComputerEventsIdResponseModel.data!.eventDescription ?? "-",
                                        style: {
                                          "#": Style(padding: EdgeInsets.zero, margin: EdgeInsets.zero),
                                          "body": Style(
                                            fontWeight: FontWeight.normal,
                                            fontSize: Responsive.isMobile(context) ? FontSize.smaller : FontSize.small,
                                            textAlign: TextAlign.start,
                                            textOverflow: TextOverflow.ellipsis,
                                            maxLines: Responsive.isMobile(context) ? 15 : 10,
                                          ),
                                          "span ": Style(
                                            fontWeight: FontWeight.normal,
                                            fontSize: Responsive.isMobile(context) ? FontSize.smaller : FontSize.small,
                                            textAlign: TextAlign.start,
                                            textOverflow: TextOverflow.ellipsis,
                                            maxLines: Responsive.isMobile(context) ? 15 : 10,
                                          ),
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 25),
                            Align(
                              alignment: Alignment.topCenter,
                              child: AddTextButtonWidget(
                                text: "View Event Profile".tr(),
                                colors: darkyellow,
                                onPress: () {
                                  print("id ====${{"id": widget.eventId}}");
                                  print("id 1====${widget.eventId}");
                                  navigationController
                                      .navigateToWithArguments(routeName: eventsFileScreenPageRoute, arguments: {"event_ids": widget.eventId});
                                  Navigator.of(context).pop();
                                },
                              ),
                            )
                          ],
                        ),
                      ),
          ),
        ),
      );
    });
  }

  String englishMonth(String? month) {
    if (month == null) {
      return "-";
    } else {
      switch (month) {
        case "Jan":
        case "01":
          return "JAN.".tr();
        case "Feb":
        case "02":
          return "FEB.".tr();
        case "Mar":
        case "03":
          return "MAR.".tr();
        case "Apr":
        case "04":
          return "APR.".tr();
        case "May":
        case "05":
          return "MAY.".tr();
        case "Jun":
        case "06":
          return "JUN.".tr();
        case "Jul":
        case "07":
          return "JUL.".tr();
        case "Aug":
        case "08":
          return "AUG.".tr();
        case "Sep":
        case "09":
          return "SEP.".tr();
        case "Oct":
        case "10":
          return "OCT.".tr();
        case "Nov":
        case "11":
          return "NOV.".tr();
        case "Dec":
        case "12":
          return "DEC.".tr();
        default:
          return "-";
      }
    }
  }
}
