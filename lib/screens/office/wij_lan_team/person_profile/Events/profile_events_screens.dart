import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:wij_land/screens/office/wij_lan_team/person_profile/Events/events_info_widgets.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../utils/functions.dart';
import '../../../../../../utils/responsive.dart';
import '../../../../../../utils/styles.dart';
import '../../../../../app_common_widgets/animated_search.dart';
import '../../../../communications/events/events_details_screen.dart';
import '../../../office_programes/Widgets/on_hover_button_widget.dart';

class ProfileEventsScreen extends StatefulWidget {
  const ProfileEventsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileEventsScreen> createState() => _ProfileEventsScreenState();
}

class _ProfileEventsScreenState extends State<ProfileEventsScreen> {
  List<bool> checks = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 2; i++) {
      checks.add(false);
    }
  }

  bool searchTapped = false;
  bool filterTapped = false;
  bool checkAll = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        width: getWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: getWidth(context),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Wrap(
                    children: [
                      CustomText(
                        text: "Events",
                        size: 35,
                        color: darkGreen,
                        weight: FontWeight.bold,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Wrap(
                          children: const [
                            Text("2\t"),
                            Text("Events"),
                          ],
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          primary: Colors.white,
                          backgroundColor: lightGreen,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Wrap(
                          children: const [
                            Text("0%\t"),
                            Text("Attended"),
                          ],
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          primary: Colors.white,
                          backgroundColor: darkGreen,
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    children: [
                      AnimatedSearchWidget(),
                      OnHoverButtonWidget(
                        icons: Icons.filter_alt,
                        onTap: () => setState(
                          () {
                            filterTapped = !filterTapped;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: getWidth(context),
              child: Card(
                color: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50 * 21,
                        width: getWidth(context),
                        child: ListView(
                          shrinkWrap: false,
                          scrollDirection: Axis.horizontal,
                          children: [
                            Column(
                              children: [
                                EventsInfoWidget(
                                  first: true,
                                  check: checkAll,
                                  eventName: "Event Name",
                                  eventDate: "Event Date",
                                  rSVP: "RSVP",
                                  attendance: "Attendance",
                                  invitation: "Invitaion Comment",
                                  size: !Responsive.isDesktop(context)
                                      ? getWidth(context) / 3.5
                                      : getWidth(context) / 8,
                                ),
                                Divider(
                                  color: Colors.black26,
                                  height: 1,
                                ),
                                for (int i = 0; i < 2; i++)
                                  InkWell(
                                    onTap: () {
                                      Get.to(EventsDetailScreen());
                                      // navigationController
                                      //     .navigateTo(eventsDetailPageRoute);
                                    },
                                    child: EventsInfoWidget(
                                      first: false,
                                      check: checkAll,
                                      eventName: "Event Name",
                                      eventDate: "Event Date",
                                      rSVP: "RSVP",
                                      attendance: "Attendance",
                                      invitation: "Invitaion Comment",
                                      size: !Responsive.isDesktop(context)
                                          ? getWidth(context) / 3.5
                                          : getWidth(context) / 8,
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
