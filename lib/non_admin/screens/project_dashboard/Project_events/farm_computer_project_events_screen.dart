import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/non_admin/providers/farm_computer_projects_provider/farm_computer_project_events_provider.dart';
import 'package:wij_land/non_admin/routes/routes.dart';
import 'package:wij_land/non_admin/screens/computer_events/widgets/event_file_dialog.dart';
import 'package:wij_land/screens/office/widgets/add_text_button_widget.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../../utils/controller.dart';
import '../../../../utils/images.dart';
import '../../../../utils/responsive.dart';
import '../../../models/farm_computer_project/farm_computer_project_events/response/farm_computer_project_events_response.dart';

class FarmComputerProjectEventsScreens extends StatefulWidget {
  const FarmComputerProjectEventsScreens({Key? key, this.model, this.projectId}) : super(key: key);
  final projectId;
  final GetFarmComputerProjectEventsResponse? model;

  @override
  State<FarmComputerProjectEventsScreens> createState() => _FarmComputerProjectEventsScreensState();
}

class _FarmComputerProjectEventsScreensState extends State<FarmComputerProjectEventsScreens> {
  DateTime setDate = DateTime.now();

  @override
  void initState() {
    isLoading = true;
    initData();
    super.initState();
  }

  initData() async {
    var _provider = Provider.of<CreateFarmComputerProjectEventsProvider>(context, listen: false);
    await _provider.getFarmComputerProjectEvent(projectId: widget.projectId["id"]);
    if (_provider.farmComputerProjectEventsResponseModel.status != 404) {
      _provider.farmComputerProjectEventsResponseModel.data!.pastEvents!.sort((start, end) {
        if (start.date != null && end.date != null) {
          var aDate = DateTime.parse(start.date.toString());
          var bDate = DateTime.parse(end.date.toString());
          return bDate.compareTo(aDate);
        } else {
          if (start.date == null) {
            start.date = DateTime.tryParse("0000-00-00").toString();
            var aDate = DateTime.parse(start.toString());
            var bDate = DateTime.parse(end.toString());
            return bDate.compareTo(aDate);
          } else {
            end.date = DateTime.tryParse("0000-00-00").toString();
            var aDate = DateTime.parse(start.toString());
            var bDate = DateTime.parse(end.toString());
            return bDate.compareTo(aDate);
          }
        }
      });
    }
    if (_provider.farmComputerProjectEventsResponseModel.status != 404) {
      _provider.farmComputerProjectEventsResponseModel.data!.upcomingEvents!.sort((start, end) {
        if (start.date != null && end.date != null) {
          var aDate = DateTime.parse(start.date.toString());
          var bDate = DateTime.parse(end.date.toString());
          return bDate.compareTo(aDate);
        } else {
          if (start.date == null) {
            start.date = DateTime.parse("0000-00-00").toString();
            var aDate = DateTime.parse(start.date.toString());
            var bDate = DateTime.parse(end.date.toString());
            return bDate.compareTo(aDate);
          } else {
            end.date = DateTime.tryParse("0000-00-00").toString();
            var aDate = DateTime.parse(start.toString());
            var bDate = DateTime.parse(end.date.toString());
            return bDate.compareTo(aDate);
          }
        }
      });
    }
    isLoading = false;
    setState(() {});
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateFarmComputerProjectEventsProvider>(builder: (context, provider, child) {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? 6 : 15, vertical: 15),
          child: isLoading
              ? SizedBox(
                  height: getHeight(context),
                  width: getWidth(context),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : (provider.farmComputerProjectEventsResponseModel.error?.status == 404) ||
                      (provider.farmComputerProjectEventsResponseModel.status == 404)
                  ? Container(
                      height: getHeight(context),
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.all(20),
                      child: CustomText(
                        text: "No data found".tr(),
                        color: Colors.red,
                        weight: FontWeight.w700,
                        size: 20,
                      ),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          width: getWidth(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Visibility(
                                visible: Responsive.isMobile(context) ? false : true,
                                child: CustomText(
                                  text: "Upcoming Project Events".tr(),
                                  color: darkGreen,
                                  size: 20,
                                  weight: FontWeight.bold,
                                ),
                              ),
                              AddTextButtonWidget(
                                text: "View All Events".tr(),
                                colors: darkyellow,
                                onPress: () {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: getWidth(context),
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: [
                              /// Mobile View Calendar ///////////////////////////////////////////////////////////////////////
                              Visibility(
                                visible: Responsive.isMobile(context) ? true : false,
                                child: Card(
                                  elevation: 0,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 100,
                                        margin: EdgeInsets.only(left: 15, top: 15),
                                        padding: EdgeInsets.symmetric(vertical: 8),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: darkGrey)),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.calendar_month, size: 12, color: darkGrey),
                                            Center(
                                                child: Text(
                                              DateFormat("yMMMEd").format(DateTime.now()),
                                              style: TextStyle(fontSize: 9, color: darkGrey, fontFamily: Montserrat_Medium),
                                            )),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                        height: getHeight(context) * 0.85,
                                        child: AllProjectEventsCalenderData(
                                          model: provider.farmComputerProjectEventsResponseModel,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    //width: getWidth(context) * 0.45,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ///  Upcoming Project Events Only Mobile View   //////
                                        Visibility(
                                          visible: Responsive.isMobile(context) ? true : false,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(vertical: 20),
                                            child: CustomText(
                                              text: "Upcoming Project Events".tr(),
                                              color: darkGreen,
                                              size: 16,
                                              weight: FontWeight.bold,
                                            ),
                                          ),
                                        ),

                                        for (int i = 0;
                                            i <
                                                (provider.farmComputerProjectEventsResponseModel.data!.upcomingEvents!.isEmpty
                                                    ? 0
                                                    : provider.farmComputerProjectEventsResponseModel.data!.upcomingEvents!.length);
                                            i++)
                                          InkWell(
                                            onTap: () {
                                              print("id ======${provider.farmComputerProjectEventsResponseModel.data!.upcomingEvents![i].id}");
                                              navigationController.navigateToWithArguments(

                                                  arguments:{"event_ids": provider.farmComputerProjectEventsResponseModel.data!.upcomingEvents![i].id},
                                                  routeName: eventsFileScreenPageRoute);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(bottom: 10),
                                              height: Responsive.isMobile(context) ? getHeight(context) * 0.18 : getHeight(context) * 0.2,
                                              child: Card(
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(10))),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                  children: [
                                                    provider.farmComputerProjectEventsResponseModel.data!.upcomingEvents![i].eventPicture != null
                                                        ? Image.network(
                                                            provider
                                                                .farmComputerProjectEventsResponseModel.data!.upcomingEvents![i].eventPicture!.path!,
                                                            width: Responsive.isMobile(context) ? getWidth(context) * 0.15 : getWidth(context) * 0.1,
                                                            height: Responsive.isMobile(context) ? getWidth(context) * 0.2 : getWidth(context) * 0.1,
                                                            fit: BoxFit.cover,
                                                          )
                                                        : Image(
                                                            image: AssetImage(Images.eventImage),
                                                            width: Responsive.isMobile(context) ? getWidth(context) * 0.15 : getWidth(context) * 0.1,
                                                            height: Responsive.isMobile(context) ? getWidth(context) * 0.2 : getWidth(context) * 0.1,
                                                            fit: BoxFit.cover,
                                                          ),
                                                    SizedBox(
                                                      width: Responsive.isMobile(context) ? getWidth(context) * 0.1 : getWidth(context) * 0.06,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          CustomText(
                                                            size: Responsive.isMobile(context) ? 14 : 20,
                                                            color: darkred,
                                                            text: englishMonth(
                                                              provider.farmComputerProjectEventsResponseModel.data!.upcomingEvents![i].date == null
                                                                  ? "-"
                                                                  : provider.farmComputerProjectEventsResponseModel.data!.upcomingEvents![i].date
                                                                      .toString()
                                                                      .substring(5, 7),
                                                            ),
                                                          ),
                                                          CustomText(
                                                            size: Responsive.isMobile(context) ? 14 : 20,
                                                            weight: FontWeight.bold,
                                                            text:
                                                                provider.farmComputerProjectEventsResponseModel.data!.upcomingEvents![i].date == null
                                                                    ? "-"
                                                                    : provider.farmComputerProjectEventsResponseModel.data!.upcomingEvents![i].date
                                                                        .toString()
                                                                        .substring(8, 10),
                                                          ),
                                                          CustomText(
                                                            size: Responsive.isMobile(context) ? 10 : 14,
                                                            color: darkred,
                                                            text:
                                                                provider.farmComputerProjectEventsResponseModel.data!.upcomingEvents![i].date == null
                                                                    ? "-"
                                                                    : provider.farmComputerProjectEventsResponseModel.data!.upcomingEvents![i].date
                                                                        .toString()
                                                                        .substring(0, 4),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Container(
                                                        padding: EdgeInsets.only(right: Responsive.isMobile(context) ? 5 : 10, top: 5),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            CustomText(
                                                                textAligns: TextAlign.start,
                                                                text: provider.farmComputerProjectEventsResponseModel.data!.upcomingEvents![i].name ??
                                                                    "-",
                                                                size: Responsive.isMobile(context) ? 12 : 16,
                                                                color: darkred,
                                                                weight: FontWeight.bold),
                                                            SizedBox(height: 6),
                                                            CustomText(
                                                              textAligns: TextAlign.start,
                                                              text:
                                                                  provider.farmComputerProjectEventsResponseModel.data!.upcomingEvents![i].location ??
                                                                      "-",
                                                              weight: FontWeight.w700,
                                                              size: Responsive.isMobile(context) ? 11 : 14,
                                                            ),
                                                            SizedBox(height: 6),
                                                            Html(
                                                              data: provider
                                                                      .farmComputerProjectEventsResponseModel.data!.upcomingEvents![i].desctiption ??
                                                                  "-",
                                                              style: {
                                                                "#": Style(padding: EdgeInsets.zero, margin: EdgeInsets.zero),
                                                                "body": Style(
                                                                  fontFamily: Montserrat_Medium,
                                                                  fontWeight: FontWeight.normal,
                                                                  fontSize: Responsive.isMobile(context) ? FontSize.smaller : FontSize.small,
                                                                  textAlign: TextAlign.start,
                                                                  textOverflow: TextOverflow.ellipsis,
                                                                  maxLines: 2,
                                                                ),
                                                                "span ": Style(
                                                                  fontFamily: Montserrat_Medium,
                                                                  fontWeight: FontWeight.normal,
                                                                  fontSize: Responsive.isMobile(context) ? FontSize.smaller : FontSize.small,
                                                                  textAlign: TextAlign.start,
                                                                  textOverflow: TextOverflow.ellipsis,
                                                                  maxLines: 2,
                                                                ),
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        CustomText(
                                          text: "Past Events".tr(),
                                          color: darkGreen,
                                          size: Responsive.isMobile(context) ? 16 : 20,
                                          weight: FontWeight.bold,
                                        ),
                                        SizedBox(height: 25),
                                        for (int i = 0;
                                            i <
                                                (provider.farmComputerProjectEventsResponseModel.data!.pastEvents!.isEmpty
                                                    ? 0
                                                    : provider.farmComputerProjectEventsResponseModel.data!.pastEvents!.length);
                                            i++)
                                          InkWell(
                                            onTap: () {

                                              navigationController.navigateToWithArguments(
                                                  arguments: {"event_ids":provider.farmComputerProjectEventsResponseModel.data!.pastEvents![i].id},
                                                  routeName: eventsFileScreenPageRoute);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(bottom: 10),
                                              height: Responsive.isMobile(context) ? getHeight(context) * 0.18 : getHeight(context) * 0.2,
                                              child: Card(
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(10))),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    provider.farmComputerProjectEventsResponseModel.data!.pastEvents![i].eventPicture != null
                                                        ? Image.network(
                                                            provider.farmComputerProjectEventsResponseModel.data!.pastEvents![i].eventPicture!.path!,
                                                            width: Responsive.isMobile(context) ? getWidth(context) * 0.15 : getWidth(context) * 0.1,
                                                            height: Responsive.isMobile(context) ? getWidth(context) * 0.2 : getWidth(context) * 0.1,
                                                            fit: BoxFit.cover,
                                                          )
                                                        : Image(
                                                            image: AssetImage(Images.eventImage),
                                                            width: Responsive.isMobile(context) ? getWidth(context) * 0.15 : getWidth(context) * 0.1,
                                                            height: Responsive.isMobile(context) ? getWidth(context) * 0.2 : getWidth(context) * 0.1,
                                                            fit: BoxFit.cover,
                                                          ),
                                                    SizedBox(
                                                      width: Responsive.isMobile(context) ? getWidth(context) * 0.1 : getWidth(context) * 0.06,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          CustomText(
                                                            size: Responsive.isMobile(context) ? 14 : 20,
                                                            color: darkred,
                                                            text: englishMonth(
                                                              provider.farmComputerProjectEventsResponseModel.data!.pastEvents![i].date!
                                                                  .toString()
                                                                  .substring(5, 7),
                                                            ),
                                                          ),
                                                          CustomText(
                                                            size: Responsive.isMobile(context) ? 14 : 20,
                                                            weight: FontWeight.bold,
                                                            text: provider.farmComputerProjectEventsResponseModel.data!.pastEvents![i].date!
                                                                .toString()
                                                                .substring(8, 10),
                                                          ),
                                                          CustomText(
                                                            size: Responsive.isMobile(context) ? 10 : 14,
                                                            color: darkred,
                                                            text: provider.farmComputerProjectEventsResponseModel.data!.pastEvents![i].date == null
                                                                ? "-"
                                                                : provider.farmComputerProjectEventsResponseModel.data!.pastEvents![i].date
                                                                    .toString()
                                                                    .substring(0, 4),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Container(
                                                        padding: EdgeInsets.only(right: Responsive.isMobile(context) ? 5 : 10, top: 5),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            CustomText(
                                                                textAligns: TextAlign.start,
                                                                text:
                                                                    provider.farmComputerProjectEventsResponseModel.data!.pastEvents![i].name ?? "-",
                                                                size: Responsive.isMobile(context) ? 12 : 16,
                                                                color: darkred,
                                                                weight: FontWeight.bold),
                                                            SizedBox(
                                                              height: 6,
                                                            ),
                                                            CustomText(
                                                              textAligns: TextAlign.start,
                                                              text: provider.farmComputerProjectEventsResponseModel.data!.pastEvents![i].location ??
                                                                  "-",
                                                              weight: FontWeight.w700,
                                                              size: Responsive.isMobile(context) ? 11 : 14,
                                                            ),
                                                            SizedBox(height: 6),
                                                            Html(
                                                              data:
                                                                  provider.farmComputerProjectEventsResponseModel.data!.pastEvents![i].desctiption ??
                                                                      "-",
                                                              style: {
                                                                "#": Style(padding: EdgeInsets.zero, margin: EdgeInsets.zero),
                                                                "body": Style(
                                                                  fontFamily: Montserrat_Medium,
                                                                  fontWeight: FontWeight.normal,
                                                                  fontSize: Responsive.isMobile(context) ? FontSize.smaller : FontSize.small,
                                                                  textAlign: TextAlign.start,
                                                                  textOverflow: TextOverflow.ellipsis,
                                                                  maxLines: 2,
                                                                ),
                                                                "span ": Style(
                                                                  fontFamily: Montserrat_Medium,
                                                                  fontWeight: FontWeight.normal,
                                                                  fontSize: Responsive.isMobile(context) ? FontSize.smaller : FontSize.small,
                                                                  textAlign: TextAlign.start,
                                                                  textOverflow: TextOverflow.ellipsis,
                                                                  maxLines: 2,
                                                                ),
                                                              },
                                                            ),
                                                          ],
                                                        ),
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
                                  SizedBox(width: 10),

                                  /// Desktop and Tablet View Calendar ///////////////////////////////////////////////////////////////////////

                                  Visibility(
                                    visible: Responsive.isMobile(context) ? false : true,
                                    child: Expanded(
                                      flex: 1,
                                      child: Card(
                                        elevation: 0,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Visibility(
                                              visible: Responsive.isTablet(context) ? true : false,
                                              child: Container(
                                                width: 100,
                                                clipBehavior: Clip.hardEdge,
                                                margin: EdgeInsets.only(left: 15, top: 15),
                                                padding: EdgeInsets.symmetric(vertical: 8),
                                                decoration:
                                                    BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: darkGrey)),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.calendar_month, size: 12, color: darkGrey),
                                                    Center(
                                                        child: Text(
                                                      DateFormat("yMMMEd").format(DateTime.now()),
                                                      style: TextStyle(fontSize: 9, color: darkGrey, fontFamily: Montserrat_Medium),
                                                    )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: Responsive.isTablet(context) ? 0 : 10),
                                              height: getHeight(context) * 0.85,
                                              child: Stack(
                                                children: [
                                                  AllProjectEventsCalenderData(
                                                    model: provider.farmComputerProjectEventsResponseModel,
                                                  ),
                                                  Visibility(
                                                    visible: Responsive.isDesktop(context) ? true : false,
                                                    child: Positioned(
                                                      top: Responsive.isTablet(context) ? 6 : 10,
                                                      left: Responsive.isTablet(context) ? 6 : 10,
                                                      child: Container(
                                                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5), border: Border.all(color: darkGrey)),
                                                        child: Row(
                                                          children: [
                                                            Icon(Icons.calendar_month, size: 12, color: darkGrey),
                                                            SizedBox(width: 6),
                                                            Center(
                                                                child: Text(
                                                              DateFormat("yMMMEd").format(DateTime.now()),
                                                              style: TextStyle(fontSize: 9, color: darkGrey, fontFamily: Montserrat_Medium),
                                                            )),
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
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
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
        case "01":
          return "JAN.";
        case "02":
          return "FEB.";
        case "03":
          return "MAR.";
        case "04":
          return "APR.";
        case "05":
          return "MAY.";
        case "06":
          return "JUN.";
        case "07":
          return "JUL.";
        case "08":
          return "AUG.";
        case "09":
          return "SEP.";
        case "10":
          return "OCT.";
        case "11":
          return "NOV.";
        case "12":
          return "DEC.";
        default:
          return "-";
      }
    }
  }
}

class AllProjectEventsCalenderData extends StatefulWidget {
  final GetFarmComputerProjectEventsResponse? model;

  const AllProjectEventsCalenderData({Key? key, this.model}) : super(key: key);

  @override
  State<AllProjectEventsCalenderData> createState() => _AllProjectEventsCalenderDataState();
}

class _AllProjectEventsCalenderDataState extends State<AllProjectEventsCalenderData> {
  MeetingDataSource? _getProjectDataSource;

  @override
  void initState() {
    _getProjectDataSource = getProjectCalenderData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      headerHeight: Responsive.isDesktop(context) ? 60 : 50,
      onTap: ((calendarTapDetails) {
        if (calendarTapDetails.appointments!.isNotEmpty && calendarTapDetails.appointments != null) {
          final dynamic occurrenceAppointment = calendarTapDetails.appointments![0];
          final Appointment? patternAppointment = _getProjectDataSource!.getPatternAppointment(occurrenceAppointment, '') as Appointment?;
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return EventsFileDialogBox(eventId: patternAppointment!.id);
            },
          );
        }
      }),
      allowAppointmentResize: true,
      appointmentTextStyle: TextStyle(
        fontSize: 7,
        color: Colors.white,
      ),
      view: CalendarView.month,
      showNavigationArrow: true,
      headerStyle: CalendarHeaderStyle(
        textAlign: TextAlign.center,
        textStyle: TextStyle(
          fontSize: Responsive.isMobile(context) ? 12 : 16,
          fontStyle: FontStyle.normal,
          letterSpacing: Responsive.isMobile(context) ? 1 : 3,
          fontWeight: FontWeight.w500,
          fontFamily: Montserrat_Medium,
        ),
      ),
      // scheduleViewSettings: ScheduleViewSettings(appointmentItemHeight: 120),
      dataSource: _getProjectDataSource,
      monthViewSettings: MonthViewSettings(
        appointmentDisplayCount: 2,
        dayFormat: 'EEE',
        appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
        showTrailingAndLeadingDates: true,
      ),
    );
  }

  MeetingDataSource getProjectCalenderData() {
    List appointments = [];

    if (widget.model!.data!.pastEvents!.isNotEmpty) {
      for (var i = 0; i < widget.model!.data!.pastEvents!.length; i++) {
        if (widget.model!.data!.pastEvents![i].date != null) {
          appointments.add(Appointment(
            startTime: DateTime.parse(widget.model!.data!.pastEvents![i].date!.toString()),
            endTime: DateTime.parse(widget.model!.data!.pastEvents![i].date!.toString()),
            isAllDay: true,
            id: widget.model!.data!.pastEvents![i].id,
            subject: "${widget.model!.data!.pastEvents![i].name}",
            color: darkRed,
            recurrenceRule: 'FREQ=DAILY;INTERVAL=1;COUNT=1',
            recurrenceExceptionDates: <DateTime>[],
          ));
        }
      }
    }

    if (widget.model!.data!.upcomingEvents!.isNotEmpty) {
      for (var i = 0; i < widget.model!.data!.upcomingEvents!.length; i++) {
        if (widget.model!.data!.upcomingEvents![i].date != null) {
          appointments.add(Appointment(
            startTime: DateTime.parse(widget.model!.data!.upcomingEvents![i].date!.toString()),
            endTime: DateTime.parse(widget.model!.data!.upcomingEvents![i].date!.toString()),
            isAllDay: true,
            id: widget.model!.data!.upcomingEvents![i].id,
            subject: "${widget.model!.data!.upcomingEvents![i].name}",
            color: darkRed,
            // location: '${widget.model!.data!.upcomingEvents![i].id}',
            // notes: '${widget.model!.data!.upcomingEvents![i].id}',
            recurrenceRule: 'FREQ=DAILY;INTERVAL=1;COUNT=1',
            recurrenceExceptionDates: <DateTime>[],
          ));
        }
      }
    }
    return MeetingDataSource(appointments);
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.background, this.isAllDay);

  String eventName;

  Color background;
  bool isAllDay;
}
