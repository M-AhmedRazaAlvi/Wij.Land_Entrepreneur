import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/non_admin/screens/contact_moments/dialog_contact.dart';
import 'package:wij_land/non_admin/screens/contact_moments/computer_contact_listview.dart';
import 'package:wij_land/non_admin/screens/contact_moments/map_widget_screen.dart';
import 'package:wij_land/screens/office/widgets/search_widget.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/responsive.dart';
import 'package:wij_land/utils/styles.dart';

import '../../app_common_widgets/large_screen.dart';
import '../../models/farm_computer_contact_moments/responce/get_contact_moment_details_responce.dart';
import '../../models/farm_computer_contact_moments/responce/get_contact_moments_responce.dart';
import '../../providers/farm_computer_projects_provider/farm_computer_contact_moments_provider.dart';
import '../computer_events/widgets/event_file_dialog.dart';

class FramComputerContactMomentScreens extends StatefulWidget {
  final farmID,arguments;
  final GetFarmComputerContactMomentsResponse? model;
  final GetFarmComputerContactMomentDetailsResponce? modelData;

  const FramComputerContactMomentScreens({
    Key? key,
    this.farmID,
    this.arguments,
    this.model,
    this.modelData,
  }) : super(key: key);

  @override
  State<FramComputerContactMomentScreens> createState() => _FramComputerContactMomentScreensState();
}

class _FramComputerContactMomentScreensState extends State<FramComputerContactMomentScreens> {
  DateTime setDate = DateTime.now();
  bool viewChecked = true, calendarList = false;

  @override
  void initState() {
    print("id==============${widget.farmID}");
    initData();

    super.initState();
  }

  initData() async {
    await Provider.of<CreateFarmComputerContactMomentsProvider>(context, listen: false).getFarmComputerContactMoment();
    setState(() {});
  }

  bool filterActive = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CreateFarmComputerContactMomentsProvider>(context, listen: false);
    print("arguments ======================== ${widget.arguments}");

    return VisibilityDetector(
      key:  Key('ContactMomentScreen-key'),
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
                'Contact Moments'.tr(),
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
                'Contact Moments'.tr(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: darkRed),
              ),
            ];
          }
        }
      },
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(Responsive.isMobile(context) ? 7 : 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: "Contact Moments".tr(),
                        size: Responsive.isMobile(context) ? 14 : 20,
                        weight: FontWeight.w800,
                        color: darkred,
                      ),
                      SizedBox(
                        width: Responsive.isMobile(context) ? 10 : 20,
                      ),
                      ClickIconButton(
                        clickcolors: viewChecked ? hoverColor : Colors.white,
                        icon: CupertinoIcons.list_dash,
                        iconColor: viewChecked ? Colors.white : dark,
                        onPressed: () {
                          setState(
                            () {
                              viewChecked = true;
                              calendarList = false;
                            },
                          );
                        },
                      ),
                      ClickIconButton(
                        clickcolors: calendarList ? hoverColor : Colors.white,
                        icon: CupertinoIcons.calendar,
                        iconColor: calendarList ? Colors.white : dark,
                        onPressed: () {
                          setState(() {
                            viewChecked = false;
                            calendarList = true;
                          });
                        },
                      ),
                      ClickIconButton(
                        clickcolors: Colors.white,
                        icon: CupertinoIcons.add,
                        iconColor: dark,
                        onPressed: () {
                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapWidgetScreen()));
                        },
                      ),
                    ],
                  ),
                  Visibility(
                    visible: viewChecked ? true : false,
                    child: ClickIconButton(
                      clickcolors: filterActive ? hoverColor : Colors.white,
                      icon: Icons.filter_alt,
                      iconColor: filterActive ? Colors.white : dark,
                      onPressed: () {
                        filterActive = !filterActive;
                        setState(() {});
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: Responsive.isMobile(context) ? 7 : 15),
              calendarList
                  ? Column(
                      children: [
                        Card(
                          elevation: 0,
                          child: ContactCalenderData(
                            model: provider.farmComputerContactMomentsResponseModel,
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    )
                  : FarmContactMomentsListView(activeFilter: filterActive, farmId: widget.farmID)
            ],
          ),
        ),
      ),
    );
  }
}

class ContactCalenderData extends StatefulWidget {
  final GetFarmComputerContactMomentsResponse? model;

  const ContactCalenderData({Key? key, this.model}) : super(key: key);

  @override
  State<ContactCalenderData> createState() => _ContactCalenderDataState();
}

class _ContactCalenderDataState extends State<ContactCalenderData> {
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
        showDatePickerButton: false,
        onTap: ((calendarTapDetails) {
          if (calendarTapDetails.appointments!.isNotEmpty && calendarTapDetails.appointments != null) {
            final dynamic occurrenceAppointment = calendarTapDetails.appointments![0];
            final Appointment? patternAppointment = _getDataSource!.getPatternAppointment(occurrenceAppointment, '') as Appointment?;
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return ContactMomentDialogbox(
                  contactMomentId: patternAppointment!.id,
                );
              },
            );
          }
        }),
        appointmentTextStyle: TextStyle(
          fontSize: 7,
          overflow: TextOverflow.ellipsis,
          fontStyle: FontStyle.normal,
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
        showNavigationArrow: true,
        showWeekNumber: true,
        showCurrentTimeIndicator: true,
        view: CalendarView.month,
        backgroundColor: Colors.white,
        selectionDecoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        headerStyle: CalendarHeaderStyle(
          textAlign: TextAlign.center,
          backgroundColor: Colors.white,
        ),
        scheduleViewSettings: ScheduleViewSettings(appointmentItemHeight: 60),
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
    for (var i = 0; i < widget.model!.data!.length; i++) {
      if (widget.model!.data![i].contactMomentDate != null) {
        appointments.add(Appointment(
          startTime: DateTime.parse(widget.model!.data![i].contactMomentDate!.toString()),
          endTime: DateTime.parse(widget.model!.data![i].contactMomentDate.toString()),
          isAllDay: true,
          id: widget.model!.data![i].id,
          subject: "${widget.model!.data![i].contactSubject}",
          color: darkRed,
          location: '${widget.model!.data![i].id}',
          notes: '${widget.model!.data![i].id}',
          recurrenceRule: 'FREQ=DAILY;INTERVAL=1;COUNT=1',
          recurrenceExceptionDates: <DateTime>[],
        ));
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
