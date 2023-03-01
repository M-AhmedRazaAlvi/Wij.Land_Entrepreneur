import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hovering/hovering.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/non_admin/screens/computer_events/widgets/event_checked_list.dart';
import 'package:wij_land/non_admin/screens/computer_events/widgets/event_going_button.dart';
import 'package:wij_land/non_admin/screens/computer_events/widgets/event_rsvp_dialog.dart';
import 'package:wij_land/non_admin/screens/computer_events/widgets/events_grid_view_widget.dart';
import 'package:wij_land/screens/office/widgets/search_widget.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/images.dart';
import 'package:wij_land/utils/responsive.dart';
import 'package:wij_land/utils/styles.dart';
import '../../app_common_widgets/large_screen.dart';
import '../../models/farm_computer_events/computer_events/request/put_farm_computer_event_attendance_request.dart';
import '../../providers/farm_computer_projects_provider/farm_computer_events_file_provider.dart';
import '../../providers/farm_computer_projects_provider/farm_computer_events_id_response_provider.dart';
import '../../providers/farm_computer_projects_provider/farm_computer_events_provider.dart';
import 'events_participating_widget.dart';

class FarmComputerEventsIdMediaFileScreens extends StatefulWidget {
  const FarmComputerEventsIdMediaFileScreens({Key? key, this.eventId, this.model}) : super(key: key);
  final eventId;

  final CreateFarmComputerEventsIdProvider? model;

  @override
  State<FarmComputerEventsIdMediaFileScreens> createState() => _FarmComputerEventsIdMediaFileScreensState();
}

class _FarmComputerEventsIdMediaFileScreensState extends State<FarmComputerEventsIdMediaFileScreens> {
  List<String> eventTextList = <String>[
    "Event Files",
    "Participating",
  ];
  List<bool> eventTextBool = <bool>[];
  bool checkedGridView = false, checkedList = true;
  Map? value;

  @override
  void initState() {
    eventTextBool = List.filled(2, false);
    initData().then((value) {
      eventTextBool[0] = true;
      setState(() {});
    });
    super.initState();
  }

  Future initData() async {

    value = widget.eventId;
    if (value!.keys.contains('id')) {
      await Provider.of<CreateFarmComputerEventsIdProvider>(context, listen: false).getFarmComputerEventId(eventId: widget.eventId['id']);
      await Provider.of<CreateFarmComputerEventsFileProvider>(context, listen: false).getFarmComputerEventFileMedia(eventId: widget.eventId['id']);
    } else {
      await Provider.of<CreateFarmComputerEventsIdProvider>(context, listen: false).getFarmComputerEventId(eventId: widget.eventId['event_ids']);
      await Provider.of<CreateFarmComputerEventsFileProvider>(context, listen: false)
          .getFarmComputerEventFileMedia(eventId: widget.eventId['event_ids']);
    }

    Future.delayed(Duration(seconds: 1), () {
      add_bounds = true;
      setState(() {});
    });
    isLoading = false;
  }

  ValueNotifier<bool> buttonClickedTimes = ValueNotifier(false);

  upDateStatus() {
    buttonClickedTimes.value = true;
    print(" buttonClickedTimes.value================${buttonClickedTimes.value}");
    setState(() {});
    Future.delayed(Duration(milliseconds: 50), () {
      buttonClickedTimes.value = false;
      print(" buttonClickedTimes.value 1===============${buttonClickedTimes.value}");
    });
  }

  bool isLoading = true;
  MapController? controller;
  bool setliteView = true;
  double zoom = -3.0;

  bool add_bounds = false;

  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<CreateFarmComputerEventsIdProvider>(context);
    // var eventProvider = Provider.of<CreateFarmComputerEventsListProvider>(context);
    // var _provider = Provider.of<CreateFarmComputerEventsFileProvider>(context);
    return VisibilityDetector(
        key: Key('DataOverviewScreen-key'),
        onVisibilityChanged: (visibilityInfo) {
          var visiblePercentage = visibilityInfo.visibleFraction * 100;
          if (visiblePercentage > 50) {
            if (value!.keys.contains('id')) {
              global_farmer_entitiy.value = [
                HoverWidget(
                  child: Text(
                    'Home / '.tr(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: shineGrey,
                      fontFamily: Montserrat_Medium,
                    ),
                  ),
                  hoverChild: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Home / '.tr(),
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: Montserrat_Medium,
                        fontWeight: FontWeight.bold,
                        color: shineGrey,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                  onHover: (event) {},
                ),
                Text(
                  '${widget.eventId['event_name']}',
                  style: TextStyle(
                    fontFamily: Montserrat_Medium,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkRed,
                  ),
                ),
              ];
            } else if (value!.values.contains(null)) {
              global_farmer_entitiy.value = [
                HoverWidget(
                  child: Text(
                    'Events'.tr(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: shineGrey,
                      fontFamily: Montserrat_Medium,
                    ),
                  ),
                  hoverChild: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Events'.tr(),
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: Montserrat_Medium,
                        fontWeight: FontWeight.bold,
                        color: shineGrey,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                  onHover: (event) {},
                ),
                Text(
                  '/ ${widget.eventId['event_name']}',
                  style: TextStyle(
                    fontFamily: Montserrat_Medium,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkRed,
                  ),
                ),
              ];
            } else {
              global_farmer_entitiy.value = [
                Text(
                  'Home / '.tr(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: shineGrey,
                    fontFamily: Montserrat_Medium,
                  ),
                ),
                HoverWidget(
                  child: Text(
                    'Events'.tr(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: shineGrey,
                      fontFamily: Montserrat_Medium,
                    ),
                  ),
                  hoverChild: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Events'.tr(),
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: Montserrat_Medium,
                        fontWeight: FontWeight.bold,
                        color: shineGrey,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                  onHover: (event) {},
                ),
                Text(
                  '/ ${widget.eventId['event_name']}',
                  style: TextStyle(
                    fontFamily: Montserrat_Medium,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkRed,
                  ),
                ),
              ];
            }
          }
        },
        child: Consumer3<CreateFarmComputerEventsIdProvider,CreateFarmComputerEventsListProvider,CreateFarmComputerEventsFileProvider>(
          builder: (context, provider,eventProvider,_provider, child) {
            return Scaffold(
                body: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
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
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.all(20),
                              child: CustomText(
                                text: "Only Invited Guests Can View Data".tr(),
                                color: Colors.red,
                                weight: FontWeight.w700,
                                size: 20,
                              ),
                            )
                          : SizedBox(
                              //width: getWidth(context),
                              // height: getHeight(context) * 0.65,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Stack(
                                      children: [
                                        Card(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(10))),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              ///   /////////////    Mobile View ///////
                                              Visibility(
                                                visible: Responsive.isMobile(context) ? true : false,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: provider.farmComputerEventsIdResponseModel.data!.eventPicture != null
                                                          ? Image.network(
                                                              provider.farmComputerEventsIdResponseModel.data!.eventPicture!.path ?? "-",
                                                              width: getWidth(context) * 0.95,
                                                              height: getHeight(context) * 0.25,
                                                              fit: BoxFit.cover,
                                                            )
                                                          : Image(
                                                              image: AssetImage(Images.eventImage),
                                                              fit: BoxFit.cover,
                                                              width: getWidth(context) * 0.95,
                                                              height: getHeight(context) * 0.25,
                                                            ),
                                                    ),
                                                    SizedBox(height: 20),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          padding: EdgeInsets.symmetric(horizontal: 3),
                                                          width: getWidth(context) * 0.2,
                                                          child: Column(
                                                            children: [
                                                              CustomText(
                                                                size: 14,
                                                                color: darkred,
                                                                text: englishMonth(provider.farmComputerEventsIdResponseModel.data!.eventDate == null
                                                                    ? "-"
                                                                    : provider.farmComputerEventsIdResponseModel.data!.eventDate
                                                                            .toString()
                                                                            .substring(3, 6) ??
                                                                        "-"),
                                                              ),
                                                              CustomText(
                                                                size: 16,
                                                                weight: FontWeight.bold,
                                                                text: provider.farmComputerEventsIdResponseModel.data!.eventDate == null
                                                                    ? "-"
                                                                    : provider.farmComputerEventsIdResponseModel.data!.eventDate
                                                                            .toString()
                                                                            .substring(0, 2) ??
                                                                        "-",
                                                              ),
                                                              CustomText(
                                                                size: 10,
                                                                weight: FontWeight.bold,
                                                                color: darkred,
                                                                text: provider.farmComputerEventsIdResponseModel.data!.eventDate == null
                                                                    ? "-"
                                                                    : provider.farmComputerEventsIdResponseModel.data!.eventDate
                                                                            .toString()
                                                                            .substring(7, 11) ??
                                                                        "-",
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          width: getWidth(context) * 0.7,
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              CustomText(
                                                                  textAligns: TextAlign.left,
                                                                  text: provider.farmComputerEventsIdResponseModel.data!.eventName ?? "",
                                                                  size: 12,
                                                                  color: darkred,
                                                                  weight: FontWeight.bold),
                                                              SizedBox(height: 8),
                                                              CustomText(
                                                                  overflows: TextOverflow.ellipsis,
                                                                  lines: 2,
                                                                  size: 8,
                                                                  text: provider.farmComputerEventsIdResponseModel.data!.location ?? "",
                                                                  weight: FontWeight.w600,
                                                                  textAligns: TextAlign.left),
                                                              SizedBox(height: 8),
                                                              CustomText(
                                                                  size: 8,
                                                                  text: provider.farmComputerEventsIdResponseModel.data!.eventType![0].isEmpty
                                                                      ? "-"
                                                                      : provider.farmComputerEventsIdResponseModel.data!.eventType![0] ?? "-",
                                                                  lines: 1,
                                                                  overflows: TextOverflow.ellipsis,
                                                                  weight: FontWeight.w700,
                                                                  textAligns: TextAlign.left),
                                                              SizedBox(height: 8),
                                                              Wrap(
                                                                children: [
                                                                  CustomText(
                                                                      size: 8,
                                                                      text: provider.farmComputerEventsIdResponseModel.data!.projectConnection == null
                                                                          ? "-"
                                                                          : provider.farmComputerEventsIdResponseModel.data!.projectConnection!
                                                                                  .map((e) {
                                                                                    return e.name;
                                                                                  })
                                                                                  .join(' ,   ')
                                                                                  .toString() ??
                                                                              "-",
                                                                      lines: 5,
                                                                      overflows: TextOverflow.ellipsis,
                                                                      weight: FontWeight.bold,
                                                                      textAligns: TextAlign.left),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 5),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          CustomText(text: "Start: ".tr(), size: 8),
                                                          CustomText(
                                                              text: provider.farmComputerEventsIdResponseModel.data!.eventStartTime ?? "-", size: 8),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 5),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          CustomText(text: "End:  ".tr(), size: 8),
                                                          CustomText(
                                                              text: provider.farmComputerEventsIdResponseModel.data!.eventsEndsTime ?? "-", size: 8),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: getWidth(context) * 0.95,
                                                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                                                      child: Html(
                                                        data: provider.farmComputerEventsIdResponseModel.data!.eventDescription ?? '-',
                                                        style: {
                                                          "#": Style(padding: EdgeInsets.zero, margin: EdgeInsets.zero),
                                                          "body": Style(
                                                            fontSize: FontSize.xSmall,
                                                            textAlign: TextAlign.start,
                                                            textOverflow: TextOverflow.ellipsis,
                                                            maxLines: 10,
                                                          ),
                                                          "span ": Style(
                                                            fontSize: FontSize.xSmall,
                                                            textAlign: TextAlign.start,
                                                            textOverflow: TextOverflow.ellipsis,
                                                            maxLines: 10,
                                                          ),
                                                        },
                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets.all(13),
                                                          child: CustomText(
                                                            size: 11,
                                                            text: "RSVP".tr(),
                                                            weight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        ValueListenableBuilder(
                                                            valueListenable: buttonClickedTimes,
                                                            builder: (BuildContext context, bool? counterValue, Widget? child) {
                                                              if (counterValue == true) {
                                                                return SizedBox();
                                                              }
                                                              return Padding(
                                                                padding: EdgeInsets.only(left: 5, bottom: 15),
                                                                child: Wrap(
                                                                  spacing: 4,
                                                                  runSpacing: 10,
                                                                  children: [
                                                                    EventGoingButton(
                                                                      text: "Going".tr(),
                                                                      onTap: () async {
                                                                        if (provider.farmComputerEventsIdResponseModel.data!.eventMode!
                                                                            .contains("Hybrid") &&
                                                                            provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer!
                                                                                .contains("yes") ||
                                                                            provider.farmComputerEventsIdResponseModel.data!.eventMode!
                                                                                .contains("Hybrid") &&
                                                                                provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer!
                                                                                    .contains("maybe")) {
                                                                          showDialog(
                                                                            context: context,
                                                                            builder: (BuildContext context) {
                                                                              return EventsRSVPDialogBox(
                                                                                eventId: widget.eventId["event_ids"],
                                                                                isAllEvent: false,
                                                                                isCalendarBool: false,
                                                                                argument: "yes",
                                                                              );
                                                                            },
                                                                          );
                                                                        }

                                                                        if (provider.farmComputerEventsIdResponseModel.data!.eventMode!
                                                                            .contains("Online")) {
                                                                          PutFarmComputerEventAttendanceUpdateRequest request =
                                                                          PutFarmComputerEventAttendanceUpdateRequest(
                                                                              attendedMode: "Online", response: "yes");
                                                                          await eventProvider.putfarmComputerEventAttendanceUpdateForSpecificEvent(
                                                                              eventID: widget.eventId["event_ids"], requestBody: request);
                                                                          provider.farmComputerEventsIdResponseModel.data!.eventMode = ["Online"];
                                                                          provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer = ["yes"];
                                                                          upDateStatus();
                                                                        }
                                                                        if (provider.farmComputerEventsIdResponseModel.data!.eventMode!
                                                                            .contains("Live")) {
                                                                          PutFarmComputerEventAttendanceUpdateRequest request =
                                                                          PutFarmComputerEventAttendanceUpdateRequest(
                                                                              attendedMode: "Live", response: "yes");
                                                                          await eventProvider.putfarmComputerEventAttendanceUpdateForSpecificEvent(
                                                                              eventID: widget.eventId["event_ids"], requestBody: request);
                                                                          // await provider.getFarmComputerEventId(
                                                                          //   eventId: widget.eventId["event_ids"],
                                                                          // );
                                                                          provider.farmComputerEventsIdResponseModel.data!.eventMode = ["Live"];
                                                                          provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer = ["yes"];
                                                                          upDateStatus();
                                                                        }
                                                                      },
                                                                      backColor: (provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer !=
                                                                          null &&
                                                                          provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer != [] &&
                                                                          provider
                                                                              .farmComputerEventsIdResponseModel.data!.rsvpAnswer!.isNotEmpty)
                                                                          ? (provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer![0]
                                                                          .isNotEmpty &&
                                                                          provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer![0]
                                                                              .toLowerCase()
                                                                              .contains("yes"))
                                                                          ? darkGreen
                                                                          : Colors.transparent
                                                                          : Colors.transparent,
                                                                      textColor: (provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer !=
                                                                          null &&
                                                                          provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer != [] &&
                                                                          provider
                                                                              .farmComputerEventsIdResponseModel.data!.rsvpAnswer!.isNotEmpty)
                                                                          ? provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer![0]
                                                                          .toLowerCase()
                                                                          .contains("yes")
                                                                          ? Colors.white
                                                                          : Colors.black
                                                                          : Colors.black,
                                                                    ),
                                                                    EventGoingButton(
                                                                      text: "Maybe".tr(),
                                                                      onTap: () async {
                                                                        if (provider.farmComputerEventsIdResponseModel.data!.eventMode!
                                                                            .contains("Hybrid") &&
                                                                            provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer!
                                                                                .contains("yes") ||
                                                                            provider.farmComputerEventsIdResponseModel.data!.eventMode!
                                                                                .contains("Hybrid") &&
                                                                                provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer!
                                                                                    .contains("maybe")) {
                                                                          showDialog(
                                                                              context: context,
                                                                              builder: (BuildContext context) {
                                                                                return EventsRSVPDialogBox(
                                                                                  eventId: widget.eventId["event_ids"],
                                                                                  isAllEvent: false,
                                                                                  isCalendarBool: false,
                                                                                  argument: "maybe",
                                                                                );
                                                                              });
                                                                        }

                                                                        if (provider.farmComputerEventsIdResponseModel.data!.eventMode!
                                                                            .contains("Online")) {
                                                                          PutFarmComputerEventAttendanceUpdateRequest request =
                                                                          PutFarmComputerEventAttendanceUpdateRequest(
                                                                              attendedMode: "Online", response: "maybe");
                                                                          await eventProvider.putfarmComputerEventAttendanceUpdateForSpecificEvent(
                                                                              eventID: widget.eventId["event_ids"], requestBody: request);
                                                                          // await provider.getFarmComputerEventId(
                                                                          //   eventId: widget.eventId["event_ids"],
                                                                          // );
                                                                          provider.farmComputerEventsIdResponseModel.data!.eventMode = ["Online"];
                                                                          provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer = ["maybe"];
                                                                          upDateStatus();
                                                                        }
                                                                        if (provider.farmComputerEventsIdResponseModel.data!.eventMode!
                                                                            .contains("Live")) {
                                                                          PutFarmComputerEventAttendanceUpdateRequest request =
                                                                          PutFarmComputerEventAttendanceUpdateRequest(
                                                                              attendedMode: "Live", response: "maybe");
                                                                          await eventProvider.putfarmComputerEventAttendanceUpdateForSpecificEvent(
                                                                              eventID: widget.eventId["event_ids"], requestBody: request);
                                                                          // await provider.getFarmComputerEventId(
                                                                          //   eventId: widget.eventId["event_ids"],
                                                                          // );
                                                                          provider.farmComputerEventsIdResponseModel.data!.eventMode = ["Live"];
                                                                          provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer = ["maybe"];
                                                                          upDateStatus();
                                                                        }
                                                                      },
                                                                      backColor: (provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer !=
                                                                          null &&
                                                                          provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer != [] &&
                                                                          provider
                                                                              .farmComputerEventsIdResponseModel.data!.rsvpAnswer!.isNotEmpty)
                                                                          ? provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer![0]
                                                                          .toLowerCase()
                                                                          .contains("maybe")
                                                                          ? darkGreen
                                                                          : Colors.transparent
                                                                          : Colors.transparent,
                                                                      textColor: (provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer !=
                                                                          null &&
                                                                          provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer != [] &&
                                                                          provider
                                                                              .farmComputerEventsIdResponseModel.data!.rsvpAnswer!.isNotEmpty)
                                                                          ? provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer![0]
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
                                                                        PutFarmComputerEventAttendanceUpdateRequest(
                                                                            attendedMode: "", response: "no");
                                                                        await eventProvider.putfarmComputerEventAttendanceUpdateForSpecificEvent(
                                                                            eventID: widget.eventId["event_ids"], requestBody: request);
                                                                        await provider.getFarmComputerEventId(
                                                                          eventId: widget.eventId["event_ids"],
                                                                        );
                                                                        setState(() {});
                                                                      },
                                                                      backColor: (provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer !=
                                                                          null &&
                                                                          provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer != [] &&
                                                                          provider
                                                                              .farmComputerEventsIdResponseModel.data!.rsvpAnswer!.isNotEmpty)
                                                                          ? provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer![0]
                                                                          .toLowerCase()
                                                                          .contains("no")
                                                                          ? darkGreen
                                                                          : Colors.transparent
                                                                          : Colors.transparent,
                                                                      textColor: (provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer !=
                                                                          null &&
                                                                          provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer != [] &&
                                                                          provider
                                                                              .farmComputerEventsIdResponseModel.data!.rsvpAnswer!.isNotEmpty)
                                                                          ? provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer![0]
                                                                          .toLowerCase()
                                                                          .contains("no")
                                                                          ? Colors.white
                                                                          : Colors.black
                                                                          : Colors.black,
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            })
                                                      ],
                                                    ),
                                                    Container(
                                                      alignment: Alignment.center,
                                                      padding: EdgeInsets.symmetric(vertical: 15),
                                                      width: getWidth(context) * 0.95,
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          if (provider.farmComputerEventsIdResponseModel.data!.latitude != null ||
                                                              provider.farmComputerEventsIdResponseModel.data!.longitude != null)
                                                            SizedBox(
                                                              //  width: getWidth(context)*0.8,
                                                              height: getHeight(context) * 0.47,
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
                                                                          //mapbox://styles/mapbox/satellite-v9
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
                                                                                height: getHeight(context) * 0.055,
                                                                                width: getHeight(context) * 0.055,
                                                                                decoration: BoxDecoration(
                                                                                    shape: BoxShape.rectangle,
                                                                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                                                                    color: Colors.white),
                                                                                padding: EdgeInsets.all(5),
                                                                                child: Center(
                                                                                  child: FaIcon(FontAwesomeIcons.layerGroup, size: 16),
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
                                                                          bounds: provider.listofLatLng,
                                                                          boundsOptions: FitBoundsOptions(
                                                                            padding: EdgeInsets.all(10.0),
                                                                          ),
                                                                          interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                                                                        ),
                                                                        //mapbox://styles/mapbox/satellite-v9
                                                                        children: [
                                                                          TileLayer(
                                                                            urlTemplate:
                                                                                'http://mt{s}.google.com/vt/lyrs=m@221097413,parking,traffic,lyrs=m&x={x}&y={y}&z={z}',
                                                                            subdomains: ['0', '1', '2', '3'],
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
                                                                              height: getHeight(context) * 0.055,
                                                                              width: getHeight(context) * 0.055,
                                                                              decoration: BoxDecoration(
                                                                                  shape: BoxShape.rectangle,
                                                                                  borderRadius: BorderRadius.all(Radius.circular(4)),
                                                                                  color: Colors.white),
                                                                              padding: EdgeInsets.all(5),
                                                                              child: Center(
                                                                                child: FaIcon(FontAwesomeIcons.layerGroup, size: 16),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              }),
                                                            )
                                                          else
                                                            Container(
                                                              height: getHeight(context) * 0.47,
                                                              padding: EdgeInsets.symmetric(horizontal: 15),
                                                              child: Card(
                                                                child: Center(
                                                                  child: CustomText(
                                                                    text: "The location of this event is still unknown".tr(),
                                                                    color: Colors.red,
                                                                    weight: FontWeight.w700,
                                                                    size: 10,
                                                                    lines: 3,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          Container(
                                                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                                                            alignment: Alignment.bottomLeft,
                                                            child: CustomText(
                                                              text: provider.farmComputerEventsIdResponseModel.data!.locationDescription == false
                                                                  ? "-"
                                                                  : provider.farmComputerEventsIdResponseModel.data!.locationDescription.toString() ??
                                                                      "-",
                                                              weight: FontWeight.w600,
                                                              size: 8,
                                                              lines: 1,
                                                            ),
                                                          ),
                                                          Container(
                                                              padding: EdgeInsets.only(bottom: 13, left: 5),
                                                              alignment: Alignment.bottomLeft,
                                                              child: CustomText(
                                                                  lines: 2,
                                                                  size: 8,
                                                                  text: provider.farmComputerEventsIdResponseModel.data!.location == null
                                                                      ? "-"
                                                                      : provider.farmComputerEventsIdResponseModel.data!.location.toString(),
                                                                  weight: FontWeight.w600,
                                                                  textAligns: TextAlign.left)),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 20),
                                                  ],
                                                ),
                                              ),

                                              ///    ////////////////////////////////Desktop and Tablet view/////////////////////////
                                              Visibility(
                                                visible: Responsive.isMobile(context) ? false : true,
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(bottom: 80),
                                                      clipBehavior: Clip.hardEdge,
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
                                                      child: provider.farmComputerEventsIdResponseModel.data!.eventPicture != null
                                                          ? Image.network(
                                                              provider.farmComputerEventsIdResponseModel.data!.eventPicture!.path ?? "-",
                                                              width: getWidth(context) * 0.23,
                                                              height: getHeight(context) * 0.45,
                                                              fit: BoxFit.cover,
                                                            )
                                                          : Image(
                                                              image: AssetImage(Images.eventImage),
                                                              fit: BoxFit.cover,
                                                              height: getHeight(context) * 0.45,
                                                              width: getWidth(context) * 0.23,
                                                            ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.symmetric(horizontal: Responsive.isTablet(context) ? 2 : 5, vertical: 10),
                                                      width: Responsive.isTablet(context) ? getWidth(context) * 0.11 : getWidth(context) * 0.08,
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          CustomText(
                                                            size: 22,
                                                            color: darkred,
                                                            text: provider.farmComputerEventsIdResponseModel.data!.eventDate == null
                                                                ? ''
                                                                : englishMonth(
                                                                    provider.farmComputerEventsIdResponseModel.data!.eventDate.toString().substring(3, 6)
                                                                    //  ? "-"
                                                                    // : provider.farmComputerEventsIdResponseModel.data!.eventDate.toString().substring(3, 6),
                                                                    ),
                                                          ),
                                                          CustomText(
                                                            size: 30,
                                                            weight: FontWeight.bold,
                                                            text: provider.farmComputerEventsIdResponseModel.data!.eventDate == null
                                                                ? "-"
                                                                : provider.farmComputerEventsIdResponseModel.data!.eventDate.toString().substring(0, 2),
                                                          ),
                                                          CustomText(
                                                            size: 16,
                                                            weight: FontWeight.bold,
                                                            color: darkred,
                                                            text: provider.farmComputerEventsIdResponseModel.data!.eventDate == null
                                                                ? "-"
                                                                : provider.farmComputerEventsIdResponseModel.data!.eventDate.toString().substring(7, 11),
                                                          ),
                                                          SizedBox(height: 30),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              CustomText(text: "Start: ".tr(), size: 11),
                                                              CustomText(
                                                                  text: provider.farmComputerEventsIdResponseModel.data!.eventStartTime ?? "-", size: 11),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              CustomText(text: "End:  ".tr(), size: 11),
                                                              CustomText(
                                                                  text: provider.farmComputerEventsIdResponseModel.data!.eventsEndsTime ?? "-", size: 11),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          //color: Colors.grey,
                                                          padding: EdgeInsets.only(top: 10),
                                                          width: getWidth(context) * 0.3,
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              CustomText(
                                                                  textAligns: TextAlign.left,
                                                                  text: provider.farmComputerEventsIdResponseModel.data!.eventName ?? "-",
                                                                  size: Responsive.isTablet(context) ? 16 : 18,
                                                                  lines: 1,
                                                                  overflows: TextOverflow.ellipsis,
                                                                  color: darkred,
                                                                  weight: FontWeight.bold),
                                                              SizedBox(height: 10),
                                                              CustomText(
                                                                  size: Responsive.isTablet(context) ? 12 : 13,
                                                                  text: provider.farmComputerEventsIdResponseModel.data!.location ?? "-",
                                                                  lines: 1,
                                                                  overflows: TextOverflow.ellipsis,
                                                                  weight: FontWeight.w600,
                                                                  textAligns: TextAlign.left),
                                                              SizedBox(height: 7),
                                                              CustomText(
                                                                  size: Responsive.isTablet(context) ? 12 : 13,
                                                                  text: provider.farmComputerEventsIdResponseModel.data!.eventType![0].isEmpty
                                                                      ? "-"
                                                                      : provider.farmComputerEventsIdResponseModel.data!.eventType![0] ?? "-",
                                                                  lines: 1,
                                                                  overflows: TextOverflow.ellipsis,
                                                                  weight: FontWeight.w600,
                                                                  textAligns: TextAlign.left),
                                                              SizedBox(height: 7),
                                                              Wrap(
                                                                children: [
                                                                  CustomText(
                                                                      size: Responsive.isTablet(context) ? 12 : 13,
                                                                      text: provider.farmComputerEventsIdResponseModel.data!.projectConnection == null
                                                                          ? "-"
                                                                          : provider.farmComputerEventsIdResponseModel.data!.projectConnection!
                                                                                  .map((e) {
                                                                                    return e.name;
                                                                                  })
                                                                                  .join(' ,   ')
                                                                                  .toString() ??
                                                                              "-",
                                                                      lines: 3,
                                                                      overflows: TextOverflow.ellipsis,
                                                                      weight: FontWeight.w600,
                                                                      textAligns: TextAlign.left),
                                                                ],
                                                              ),
                                                              SizedBox(height: 10),
                                                              Html(
                                                                data: provider.farmComputerEventsIdResponseModel.data!.eventDescription ?? "-",
                                                                style: {
                                                                  "#": Style(
                                                                      fontSize: FontSize.medium,
                                                                      fontWeight: FontWeight.w500,
                                                                      padding: EdgeInsets.zero,
                                                                      margin: EdgeInsets.zero),
                                                                  "body": Style(
                                                                      fontSize: FontSize.medium,
                                                                      textAlign: TextAlign.start,
                                                                      textOverflow: TextOverflow.ellipsis,
                                                                      maxLines: 10),
                                                                  "span ": Style(
                                                                      fontSize: FontSize.medium,
                                                                      textAlign: TextAlign.start,
                                                                      textOverflow: TextOverflow.ellipsis,
                                                                      maxLines: 10),
                                                                },
                                                              ),
                                                              Visibility(
                                                                visible: (provider.farmComputerEventsIdResponseModel.data!.eventDescription == null ||
                                                                        provider.farmComputerEventsIdResponseModel.data!.eventDescription!.length <= 100)
                                                                    ? true
                                                                    : false,
                                                                child: SizedBox(height: getWidth(context) * 0.1),
                                                              ),
                                                              SizedBox(height: 20),
                                                              CustomText(
                                                                size: 14,
                                                                text: "RSVP".tr(),
                                                                weight: FontWeight.bold,
                                                              ),
                                                              ValueListenableBuilder(
                                                                  valueListenable: buttonClickedTimes,
                                                                  builder: (BuildContext context, bool? counterValue, Widget? child) {
                                                                    if (counterValue == true) {
                                                                      return SizedBox();
                                                                    }
                                                                    return Padding(
                                                                      padding: EdgeInsets.only(top: 20, bottom: 20),
                                                                      child: Wrap(
                                                                        spacing: 4,
                                                                        runSpacing: 10,
                                                                        children: [
                                                                          EventGoingButton(
                                                                            text: "Going".tr(),
                                                                            onTap: () async {
                                                                              if (provider.farmComputerEventsIdResponseModel.data!.eventMode!
                                                                                          .contains("Hybrid") &&
                                                                                      provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer!
                                                                                          .contains("yes") ||
                                                                                  provider.farmComputerEventsIdResponseModel.data!.eventMode!
                                                                                          .contains("Hybrid") &&
                                                                                      provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer!
                                                                                          .contains("maybe")) {
                                                                                showDialog(
                                                                                  context: context,
                                                                                  builder: (BuildContext context) {
                                                                                    return EventsRSVPDialogBox(
                                                                                      eventId: widget.eventId["event_ids"],
                                                                                      isAllEvent: false,
                                                                                      isCalendarBool: false,
                                                                                      argument: "yes",
                                                                                    );
                                                                                  },
                                                                                );
                                                                              }

                                                                              if (provider.farmComputerEventsIdResponseModel.data!.eventMode!
                                                                                  .contains("Online")) {
                                                                                PutFarmComputerEventAttendanceUpdateRequest request =
                                                                                    PutFarmComputerEventAttendanceUpdateRequest(
                                                                                        attendedMode: "Online", response: "yes");
                                                                                await eventProvider.putfarmComputerEventAttendanceUpdateForSpecificEvent(
                                                                                    eventID: widget.eventId["event_ids"], requestBody: request);
                                                                                provider.farmComputerEventsIdResponseModel.data!.eventMode = ["Online"];
                                                                                provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer = ["yes"];
                                                                                upDateStatus();
                                                                              }
                                                                              if (provider.farmComputerEventsIdResponseModel.data!.eventMode!
                                                                                  .contains("Live")) {
                                                                                PutFarmComputerEventAttendanceUpdateRequest request =
                                                                                    PutFarmComputerEventAttendanceUpdateRequest(
                                                                                        attendedMode: "Live", response: "yes");
                                                                                await eventProvider.putfarmComputerEventAttendanceUpdateForSpecificEvent(
                                                                                    eventID: widget.eventId["event_ids"], requestBody: request);
                                                                                // await provider.getFarmComputerEventId(
                                                                                //   eventId: widget.eventId["event_ids"],
                                                                                // );
                                                                                provider.farmComputerEventsIdResponseModel.data!.eventMode = ["Live"];
                                                                                provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer = ["yes"];
                                                                                upDateStatus();
                                                                              }
                                                                            },
                                                                            backColor: (provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer !=
                                                                                        null &&
                                                                                    provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer != [] &&
                                                                                    provider
                                                                                        .farmComputerEventsIdResponseModel.data!.rsvpAnswer!.isNotEmpty)
                                                                                ? (provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer![0]
                                                                                            .isNotEmpty &&
                                                                                        provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer![0]
                                                                                            .toLowerCase()
                                                                                            .contains("yes"))
                                                                                    ? darkGreen
                                                                                    : Colors.transparent
                                                                                : Colors.transparent,
                                                                            textColor: (provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer !=
                                                                                        null &&
                                                                                    provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer != [] &&
                                                                                    provider
                                                                                        .farmComputerEventsIdResponseModel.data!.rsvpAnswer!.isNotEmpty)
                                                                                ? provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer![0]
                                                                                        .toLowerCase()
                                                                                        .contains("yes")
                                                                                    ? Colors.white
                                                                                    : Colors.black
                                                                                : Colors.black,
                                                                          ),
                                                                          EventGoingButton(
                                                                            text: "Maybe".tr(),
                                                                            onTap: () async {
                                                                              if (provider.farmComputerEventsIdResponseModel.data!.eventMode!
                                                                                          .contains("Hybrid") &&
                                                                                      provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer!
                                                                                          .contains("yes") ||
                                                                                  provider.farmComputerEventsIdResponseModel.data!.eventMode!
                                                                                          .contains("Hybrid") &&
                                                                                      provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer!
                                                                                          .contains("maybe")) {
                                                                                showDialog(
                                                                                    context: context,
                                                                                    builder: (BuildContext context) {
                                                                                      return EventsRSVPDialogBox(
                                                                                        eventId: widget.eventId["event_ids"],
                                                                                        isAllEvent: false,
                                                                                        isCalendarBool: false,
                                                                                        argument: "maybe",
                                                                                      );
                                                                                    });
                                                                              }

                                                                              if (provider.farmComputerEventsIdResponseModel.data!.eventMode!
                                                                                  .contains("Online")) {
                                                                                PutFarmComputerEventAttendanceUpdateRequest request =
                                                                                    PutFarmComputerEventAttendanceUpdateRequest(
                                                                                        attendedMode: "Online", response: "maybe");
                                                                                await eventProvider.putfarmComputerEventAttendanceUpdateForSpecificEvent(
                                                                                    eventID: widget.eventId["event_ids"], requestBody: request);
                                                                                // await provider.getFarmComputerEventId(
                                                                                //   eventId: widget.eventId["event_ids"],
                                                                                // );
                                                                                provider.farmComputerEventsIdResponseModel.data!.eventMode = ["Online"];
                                                                                provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer = ["maybe"];
                                                                                upDateStatus();
                                                                              }
                                                                              if (provider.farmComputerEventsIdResponseModel.data!.eventMode!
                                                                                  .contains("Live")) {
                                                                                PutFarmComputerEventAttendanceUpdateRequest request =
                                                                                    PutFarmComputerEventAttendanceUpdateRequest(
                                                                                        attendedMode: "Live", response: "maybe");
                                                                                await eventProvider.putfarmComputerEventAttendanceUpdateForSpecificEvent(
                                                                                    eventID: widget.eventId["event_ids"], requestBody: request);
                                                                                // await provider.getFarmComputerEventId(
                                                                                //   eventId: widget.eventId["event_ids"],
                                                                                // );
                                                                                provider.farmComputerEventsIdResponseModel.data!.eventMode = ["Live"];
                                                                                provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer = ["maybe"];
                                                                                upDateStatus();
                                                                              }
                                                                            },
                                                                            backColor: (provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer !=
                                                                                        null &&
                                                                                    provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer != [] &&
                                                                                    provider
                                                                                        .farmComputerEventsIdResponseModel.data!.rsvpAnswer!.isNotEmpty)
                                                                                ? provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer![0]
                                                                                        .toLowerCase()
                                                                                        .contains("maybe")
                                                                                    ? darkGreen
                                                                                    : Colors.transparent
                                                                                : Colors.transparent,
                                                                            textColor: (provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer !=
                                                                                        null &&
                                                                                    provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer != [] &&
                                                                                    provider
                                                                                        .farmComputerEventsIdResponseModel.data!.rsvpAnswer!.isNotEmpty)
                                                                                ? provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer![0]
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
                                                                                  PutFarmComputerEventAttendanceUpdateRequest(
                                                                                      attendedMode: "", response: "no");
                                                                              await eventProvider.putfarmComputerEventAttendanceUpdateForSpecificEvent(
                                                                                  eventID: widget.eventId["event_ids"], requestBody: request);
                                                                              await provider.getFarmComputerEventId(
                                                                                eventId: widget.eventId["event_ids"],
                                                                              );
                                                                              setState(() {});
                                                                            },
                                                                            backColor: (provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer !=
                                                                                        null &&
                                                                                    provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer != [] &&
                                                                                    provider
                                                                                        .farmComputerEventsIdResponseModel.data!.rsvpAnswer!.isNotEmpty)
                                                                                ? provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer![0]
                                                                                        .toLowerCase()
                                                                                        .contains("no")
                                                                                    ? darkGreen
                                                                                    : Colors.transparent
                                                                                : Colors.transparent,
                                                                            textColor: (provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer !=
                                                                                        null &&
                                                                                    provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer != [] &&
                                                                                    provider
                                                                                        .farmComputerEventsIdResponseModel.data!.rsvpAnswer!.isNotEmpty)
                                                                                ? provider.farmComputerEventsIdResponseModel.data!.rsvpAnswer![0]
                                                                                        .toLowerCase()
                                                                                        .contains("no")
                                                                                    ? Colors.white
                                                                                    : Colors.black
                                                                                : Colors.black,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  })
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 5,
                                          left: Responsive.isMobile(context) ? 10 : 20,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            // crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              for (int i = 0; i < 2; i++)
                                                InkWell(
                                                  onTap: () {
                                                    setState(
                                                      () {
                                                        if (eventTextBool.contains(true)) {
                                                          eventTextBool = List.filled(2, false);
                                                          eventTextBool[i] = true;
                                                        } else {
                                                          eventTextBool[i] = true;
                                                        }
                                                      },
                                                    );
                                                  },
                                                  child: Transform.translate(
                                                    offset: eventTextBool[i] ? Offset(0.0, 1.5) : Offset(0, 0),
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: Responsive.isMobile(context) ? 5 : 20,
                                                          vertical: Responsive.isMobile(context) ? 2 : 10),
                                                      decoration: BoxDecoration(
                                                          border: Border(
                                                              bottom: BorderSide(
                                                                  color: eventTextBool[i] ? darkGreen : Colors.transparent,
                                                                  width: eventTextBool[i] ? 2 : 0.1))),
                                                      child: CustomText(
                                                          text: eventTextList[i].tr(),
                                                          size: Responsive.isMobile(context)
                                                              ? eventTextBool[i]
                                                                  ? 14
                                                                  : 12
                                                              : eventTextBool[i]
                                                                  ? 18
                                                                  : 14,
                                                          color: eventTextBool[i] ? darkGreen : Colors.black,
                                                          weight: eventTextBool[i] ? FontWeight.bold : FontWeight.w600,
                                                          fontFamily: Montserrat_Bold),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Visibility(
                                    visible: Responsive.isMobile(context) ? false : true,
                                    child: Expanded(
                                      flex: 1,
                                      child: Card(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            if (provider.farmComputerEventsIdResponseModel.data!.latitude != null ||
                                                provider.farmComputerEventsIdResponseModel.data!.longitude != null)
                                              SizedBox(
                                                /// width: 170,
                                                height: getHeight(context) * 0.47,
                                                child: Builder(builder: (c) {
                                                  if (setliteView) {
                                                    return Stack(
                                                      children: [
                                                        SizedBox(
                                                          width: double.infinity,
                                                          height: double.infinity,
                                                          child: FlutterMap(
                                                            options: MapOptions(
                                                              // controller: controller,
                                                              bounds: provider.listofLatLng,
                                                              boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(10)),
                                                              interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                                                            ),
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
                                                              urlTemplate:
                                                                  'http://mt{s}.google.com/vt/lyrs=m@221097413,parking,traffic,lyrs=m&x={x}&y={y}&z={z}',
                                                              subdomains: ['0', '1', '2', '3'],
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
                                              )

                                            ////////////////   latitude == null //////////////////////////
                                            else
                                              Container(
                                                height: getHeight(context) * 0.47,
                                                padding: EdgeInsets.symmetric(horizontal: 15),
                                                child: Center(
                                                  child: CustomText(
                                                    text: "The location of this event is still unknown".tr(),
                                                    color: Colors.red,
                                                    weight: FontWeight.w700,
                                                    size: 14,
                                                    lines: 3,
                                                  ),
                                                ),
                                              ),
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              alignment: Alignment.bottomLeft,
                                              child: CustomText(
                                                text: provider.farmComputerEventsIdResponseModel.data!.locationDescription == false
                                                    ? "-"
                                                    : provider.farmComputerEventsIdResponseModel.data!.locationDescription.toString() ?? "-",
                                                weight: FontWeight.w700,
                                                lines: 1,
                                                overflows: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Container(
                                                padding: EdgeInsets.only(left: 10, bottom: 13),
                                                alignment: Alignment.bottomLeft,
                                                child: CustomText(
                                                    lines: 1,
                                                    overflows: TextOverflow.ellipsis,
                                                    text: provider.farmComputerEventsIdResponseModel.data!.location == null
                                                        ? "-"
                                                        : provider.farmComputerEventsIdResponseModel.data!.location.toString(),
                                                    weight: FontWeight.w700,
                                                    textAligns: TextAlign.left)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? 6 : 20),
                          child: Visibility(
                            visible: isLoading ? false : true,
                            child: SizedBox(
                                width: getWidth(context),
                                child: eventTextBool[0]
                                    ? Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(vertical: Responsive.isMobile(context) ? 15 : 20, horizontal: 10),
                                            child: CustomText(
                                              text: "Event Files".tr(),
                                              size: Responsive.isMobile(context) ? 12 : 16,
                                              color: darkGreen,
                                              weight: FontWeight.bold,
                                            ),
                                          ),
                                          _provider.farmComputerEventsFileMediaResponseModel.status == 200
                                              ? Card(
                                                  child: Stack(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          checkedList
                                                              ? EventsCheckedListWidget(eventId: widget.eventId['event_ids'])
                                                              : EventsGridViewWidget(eventId: widget.eventId['event_ids'])
                                                        ],
                                                      ),
                                                      Positioned(
                                                        right: Responsive.isMobile(context) ? 10 : 20,
                                                        top: 20,
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          children: [
                                                            ClickIconButton(
                                                              clickcolors: checkedGridView ? hoverColor : Colors.white,
                                                              iconColor: checkedGridView ? Colors.white : Colors.black,
                                                              icon: Icons.grid_view_sharp,
                                                              onPressed: () {
                                                                setState(
                                                                  () {
                                                                    checkedGridView = true;
                                                                    checkedList = false;
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                            const SizedBox(
                                                              width: 6,
                                                            ),
                                                            ClickIconButton(
                                                              clickcolors: checkedList ? hoverColor : Colors.white,
                                                              iconColor: checkedList ? Colors.white : Colors.black,
                                                              icon: Icons.view_list,
                                                              onPressed: () {
                                                                setState(() {
                                                                  checkedGridView = false;
                                                                  checkedList = true;
                                                                });
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : _provider.farmComputerEventsFileMediaResponseModel.error!.status == 404
                                                  ? SizedBox(
                                                      height: getHeight(context),
                                                      // width: getWidth(context),
                                                      child: Align(
                                                        alignment: Alignment.topCenter,
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(25.0),
                                                          child: CustomText(
                                                            text: "No Event Files In This Event".tr(),
                                                            color: Colors.red,
                                                            weight: FontWeight.w700,
                                                            size: Responsive.isMobile(context) ? 12 : 16,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : Container(),
                                        ],
                                      )
                                    : EventsParticipationWidget(participatingId: widget.eventId['event_ids'])),
                          ));
                    },
                    childCount: 1,
                  ),
                ),
              ],
            ));
          }
        ));
  }

  String englishMonth(String? month) {
    if (month == null) {
      return "-";
    } else {
      switch (month) {
        case "Jan":
        case "01":
          return "JAN.";
        case "Feb":
        case "02":
          return "FEB.";
        case "Mar":
        case "03":
          return "MAR.";
        case "Apr":
        case "04":
          return "APR.";
        case "May":
        case "05":
          return "MAY.";
        case "Jun":
        case "06":
          return "JUN.";
        case "Jul":
        case "07":
          return "JUL.";
        case "Aug":
        case "08":
          return "AUG.";
        case "Sep":
        case "09":
          return "SEP.";
        case "Oct":
        case "10":
          return "OCT.";
        case "Nov":
        case "11":
          return "NOV.";
        case "Dec":
        case "12":
          return "DEC.";
        default:
          return "-";
      }
    }
  }
}
