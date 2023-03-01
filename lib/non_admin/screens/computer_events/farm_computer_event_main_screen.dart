import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/non_admin/screens/computer_events/farm_computer_events_list_screens.dart';
import 'package:wij_land/non_admin/screens/computer_events/widgets/event_file_dialog.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Member/member_screen.dart';
import 'package:wij_land/screens/office/widgets/search_widget.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/styles.dart';
import '../../../utils/responsive.dart';
import '../../app_common_widgets/large_screen.dart';
import '../../providers/farm_computer_projects_provider/farm_computer_events_provider.dart';
import '../member_directory/farm_computer_members_screens.dart';

class FarmComputerEventsMainScreens extends StatefulWidget {
  const FarmComputerEventsMainScreens({Key? key, this.arguments}) : super(key: key);
  final arguments;

  @override
  State<FarmComputerEventsMainScreens> createState() => _FarmComputerEventsMainScreensState();
}

class _FarmComputerEventsMainScreensState extends State<FarmComputerEventsMainScreens> {
  @override
  void initState() {
    // TODO: implement initState
    filterActive = false;
    setState(() {

    });
    super.initState();
  }
  DateTime setDate = DateTime.now();
  bool viewChecked = true, calanderList = false;
  bool filterActive = false;
bool dialogChecked =false;
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key:  Key('EventScreen-key'),
      onVisibilityChanged: (visibilityInfo) {
        var visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 50) {
          if(widget.arguments!=null) {
            global_farmer_entitiy.value = [
              HoverWidget(
                child: Text(
                  'Home / '.tr(),

                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: shineGrey,
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
                'Events'.tr(),
                style: TextStyle(
                  fontFamily: Montserrat_Medium,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: darkRed,
                ),
              ),
            ];
          }else{
            global_farmer_entitiy.value = [
              Text(
                'Events'.tr(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: darkRed),
              ),
            ];
          }
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(Responsive.isMobile(context) ? 10 : 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Events".tr(),
                      size: Responsive.isMobile(context) ? 16 : 20,
                      weight: FontWeight.w800,
                      color: darkred,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ClickIconButton(
                      clickcolors: viewChecked ? hoverColor : Colors.white,
                      icon: CupertinoIcons.list_dash,
                      iconColor: viewChecked ? Colors.white : dark,
                      onPressed: () {
                        setState(
                          () {
                            viewChecked = true;
                            calanderList = false;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    ClickIconButton(
                      clickcolors: calanderList ? hoverColor : Colors.white,
                      icon: CupertinoIcons.calendar,
                      iconColor: calanderList ? Colors.white : dark,
                      onPressed: () {
                        setState(() {
                          viewChecked = false;
                          calanderList = true;
                        });
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                      Expanded(
                      child: Visibility(
                        visible: !calanderList,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ClickIconButton(
                              clickcolors: filterActive ? hoverColor : Colors.white,
                              icon: Icons.filter_alt_sharp,
                              iconColor: filterActive ? Colors.white : dark,
                              onPressed: () {
                                filterActive = !filterActive;
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                calanderList
                    ? Column(
                        children: const [
                          Card(elevation: 0, child: EventCalenderData()),
                          SizedBox(
                            height: 100,
                          ),
                        ],
                      )
                    : FarmComputerEventsListScreen(activeFilter: filterActive,arguments:widget.arguments),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EventCalenderData extends StatefulWidget {
  const EventCalenderData({Key? key}) : super(key: key);

  @override
  State<EventCalenderData> createState() => _EventCalenderDataState();
}

class _EventCalenderDataState extends State<EventCalenderData> {
  MeetingDataSource? _getDataSource;

  @override
  void initState() {
    _getDataSource = getCalenderData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: getWidth(context),
      height: getHeight(context) * 0.8,
      child: SfCalendar(
        onTap: ((calendarTapDetails) {
          if (calendarTapDetails.appointments!.isNotEmpty && calendarTapDetails.appointments != null) {
            final dynamic occurrenceAppointment = calendarTapDetails.appointments![0];
            final Appointment? patternAppointment = _getDataSource!.getPatternAppointment(occurrenceAppointment, '') as Appointment?;

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return EventsFileDialogBox(eventId: patternAppointment!.id

                );
              },
            );
          }
        }),
        appointmentTextStyle: TextStyle(
          fontSize: Responsive.isMobile(context) ? 6 : 10,
          fontStyle: FontStyle.normal,
          fontFamily: Montserrat_Medium,
          color: Colors.white,
        ),
        view: CalendarView.month,
        showNavigationArrow: true,
        backgroundColor: Colors.white,
        selectionDecoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        headerStyle: CalendarHeaderStyle(
          textAlign: TextAlign.center,
        ),
        //scheduleViewSettings: ScheduleViewSettings(appointmentItemHeight: 60),
        dataSource: _getDataSource,
        headerHeight: 70,
        monthViewSettings: MonthViewSettings(
          appointmentDisplayCount: 2,
          dayFormat: 'EEE',
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          showTrailingAndLeadingDates: true,
        ),
      ),
    );
  }

  MeetingDataSource getCalenderData() {
    List appointments = [];
    for (var i in Provider.of<CreateFarmComputerEventsListProvider>(context, listen: false).farmComputerEventsResponseModel.data!) {
      if (i.date != null) {
        if (i.date!.split('-')[0] == "") {
          appointments.add(Appointment(
            startTime: DateTime(int.parse(i.date!.split('-')[1]), int.parse(i.date!.split('-')[2]), int.parse(i.date!.split('-')[3].split( " " )[0])),
            endTime: DateTime(int.parse(i.date!.split('-')[1]), int.parse(i.date!.split('-')[2]), int.parse(i.date!.split('-')[3].split( " " )[0])),
            isAllDay: true,
            id: i.id,
            subject: "${i.name}",
            color: darkred,
            location: '${i.id}',
            notes: '${i.id}',
            recurrenceRule: 'FREQ=DAILY;INTERVAL=1;COUNT=1',
            recurrenceExceptionDates: <DateTime>[],
          ));
        } else {
          appointments.add(Appointment(
            startTime: DateTime(int.parse(i.date!.split('-')[0]), int.parse(i.date!.split('-')[1]), int.parse(i.date!.split('-')[2])),
            endTime: DateTime(int.parse(i.date!.split('-')[0]), int.parse(i.date!.split('-')[1]), int.parse(i.date!.split('-')[2])),
            isAllDay: true,
            id: i.id,
            subject: "${i.name}",
            color: darkred,
            location: '${i.id}',
            notes: '${i.id}',
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
