import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/non_admin/models/farm_computer_events/computer_events/request/put_farm_computer_event_attendance_request.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../../screens/office/widgets/add_text_button_widget.dart';
import '../../../../utils/responsive.dart';
import '../../../providers/farm_computer_projects_provider/farm_computer_events_file_provider.dart';
import '../../../providers/farm_computer_projects_provider/farm_computer_events_id_response_provider.dart';
import '../../../providers/farm_computer_projects_provider/farm_computer_events_provider.dart';
import '../farm_computer_events_list_screens.dart';

class EventsRSVPDialogBox extends StatefulWidget {
  EventsRSVPDialogBox({
    required this.eventId,
    Key? key,
    this.argument,
    this.isAllEvent,
    this.isCalendarBool,
  }) : super(key: key);
  final dynamic argument;
  final bool? isAllEvent;
  final bool? isCalendarBool;
  final dynamic eventId;

  @override
  State<EventsRSVPDialogBox> createState() => _EventsRSVPDialogBoxState();
}

class _EventsRSVPDialogBoxState extends State<EventsRSVPDialogBox> {
  @override
  void initState() {
    super.initState();
  }

  bool liveClicked = false, onlineClicked = false;

  @override
  Widget build(BuildContext context) {
    return Consumer3<CreateFarmComputerEventsListProvider, CreateFarmComputerEventsFileProvider, CreateFarmComputerEventsIdProvider>(
      builder: (context, provider, eventFileProvider, eventIdProvider, child) {
        return AlertDialog(
          titlePadding: EdgeInsets.only(
            left: Responsive.isMobile(context) ? 15 : 40,
            top: Responsive.isMobile(context) ? 10 : 40,
            right: Responsive.isMobile(context) ? 15 : 40,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: "Event RSVP".tr(), size: Responsive.isMobile(context) ? 14 : 20, weight: FontWeight.bold, color: newRed),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop("close");
                  },
                  icon: Icon(
                    Icons.close,
                    size: Responsive.isMobile(context) ? 15 : 20,
                  )),
            ],
          ),
          content: Container(
            padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? 7 : 20),
            width: Responsive.isMobile(context) ? getWidth(context) * 0.7 : getWidth(context) * 0.45,
            height: Responsive.isMobile(context) ? getWidth(context) * 0.15 : getHeight(context) * 0.12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: CustomText(
                    text: "Please indicate how you will attend.".tr(),
                    size: Responsive.isMobile(context) ? 10 : 14,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        if (liveClicked) {
                          setState(() {
                            liveClicked = false;
                          });
                        } else {
                          setState(() {
                            liveClicked = true;
                            onlineClicked = false;
                          });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: Responsive.isMobile(context) ? 5 : 8),
                        width: Responsive.isMobile(context) ? 80 : 140,
                        decoration: BoxDecoration(
                          color: liveClicked ? darkGreen : Colors.white,
                          borderRadius: BorderRadius.circular(Responsive.isMobile(context) ? 15 : 20),
                          border: Border.all(color: darkGreen),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person_outline_sharp,
                              color: liveClicked ? Colors.white : Colors.black,
                              size: Responsive.isMobile(context) ? 12 : 20,
                            ),
                            SizedBox(width: Responsive.isMobile(context) ? 8 : 14),
                            CustomText(
                              text: "live".tr(),
                              size: Responsive.isMobile(context) ? 10 : 18,
                              weight: FontWeight.bold,
                              color: liveClicked ? Colors.white : Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (onlineClicked) {
                          setState(() {
                            onlineClicked = false;
                          });
                        } else {
                          setState(() {
                            onlineClicked = true;
                            liveClicked = false;
                          });
                        }
                      },
                      child: Container(
                        width: Responsive.isMobile(context) ? 80 : 140,
                        padding: EdgeInsets.symmetric(vertical: Responsive.isMobile(context) ? 5 : 8),
                        decoration: BoxDecoration(
                          color: onlineClicked ? darkGreen : Colors.white,
                          borderRadius: BorderRadius.circular(Responsive.isMobile(context) ? 15 : 20),
                          border: Border.all(color: darkGreen),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.phonelink,
                              color: onlineClicked ? Colors.white : Colors.black,
                              size: Responsive.isMobile(context) ? 12 : 20,
                            ),
                            SizedBox(width: Responsive.isMobile(context) ? 8 : 14),
                            CustomText(
                              text: "online".tr(),
                              size: Responsive.isMobile(context) ? 10 : 18,
                              weight: FontWeight.bold,
                              color: onlineClicked ? Colors.white : Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          actionsPadding: EdgeInsets.only(
            bottom: Responsive.isMobile(context) ? 15 : 20,
            right: Responsive.isMobile(context) ? 15 : 40,
          ),
          actions: [
            AddTextButtonWidget(
              text: "Apply".tr(),
              colors: darkyellow,
              onPress: () async {
                Map value = {'live': liveClicked, 'online': onlineClicked};
                if (liveClicked == true) {
                  PutFarmComputerEventAttendanceUpdateRequest request =
                      PutFarmComputerEventAttendanceUpdateRequest(attendedMode: "live", response: widget.argument);
                  if (widget.isAllEvent == true) {
                    await provider.putfarmComputerEventAttendanceUpdateForAllEvents(eventID: widget.eventId, requestBody: request);
                    await provider.getFarmComputerEvent();
                  } else {
                    if (widget.isCalendarBool == true) {
                      await provider.putfarmComputerEventAttendanceUpdateForSpecificEvent(eventID: widget.eventId, requestBody: request);
                      await eventFileProvider.getFarmComputerEventFile(eventId: widget.eventId);
                    } else {
                      await provider.putfarmComputerEventAttendanceUpdateForSpecificEvent(eventID: widget.eventId, requestBody: request);
                      await eventIdProvider.getFarmComputerEventId(eventId: widget.eventId);
                    }
                  }
                }
                if (onlineClicked == true) {
                  PutFarmComputerEventAttendanceUpdateRequest request =
                      PutFarmComputerEventAttendanceUpdateRequest(attendedMode: "online", response: widget.argument);
                  if (widget.isAllEvent == true) {
                    await provider.putfarmComputerEventAttendanceUpdateForAllEvents(eventID: widget.eventId, requestBody: request);
                    await provider.getFarmComputerEvent();
                  } else {
                    if (widget.isCalendarBool == true) {
                      await provider.putfarmComputerEventAttendanceUpdateForSpecificEvent(eventID: widget.eventId, requestBody: request);
                      await eventFileProvider.getFarmComputerEventFile(eventId: widget.eventId);
                    } else {
                      await provider.putfarmComputerEventAttendanceUpdateForSpecificEvent(eventID: widget.eventId, requestBody: request);
                      await eventIdProvider.getFarmComputerEventId(eventId: widget.eventId);
                    }
                  }
                }

                Navigator.pop(context, "yes");
              },
            ),
            AddTextButtonWidget(
              text: "Cancel".tr(),
              colors: darkyellow,
              onPress: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
