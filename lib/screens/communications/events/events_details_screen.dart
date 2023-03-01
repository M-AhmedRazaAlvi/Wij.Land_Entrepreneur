import 'package:flutter/material.dart';
import 'package:wij_land/screens/communications/events/widgets/events_constants.dart';
import 'package:wij_land/screens/communications/events/widgets/events_details_widget/event_description_screen.dart';
import 'package:wij_land/screens/communications/events/widgets/events_social_card.dart';
import 'package:wij_land/screens/communications/events/widgets/events_title_card_widget.dart';
import 'package:wij_land/screens/communications/events/widgets/files_media/event_files_media_screen.dart';
import 'package:wij_land/screens/communications/events/widgets/guest/event_guest_screen.dart';

import '../../../utils/functions.dart';

class EventsDetailScreen extends StatefulWidget {
  const EventsDetailScreen({Key? key}) : super(key: key);

  @override
  State<EventsDetailScreen> createState() => _EventsDetailScreenState();
}

class _EventsDetailScreenState extends State<EventsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          width: getWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              EventsTitleCardWidget('title', 'counts'),
              SizedBox(height: 8),
              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < 4; i++)
                    EventsSocialCardWidget(
                        title: titleEventList[i],
                        counts: countsEventList[i],
                        colors: colorsEventList[i]),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 12, left: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                          color: Color(0xff333333),
                        ),
                        child: Wrap(
                          children: [
                            for (int i = 0; i < 3; i++)
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(6),
                                    topRight: Radius.circular(6),
                                  ),
                                  color: titleEventClicked[i]
                                      ? Colors.white
                                      : Colors.transparent,
                                ),
                                padding: const EdgeInsets.all(8.0),
                                child: TextButton(
                                  child: Text(
                                    eventTitles[i],
                                    style: TextStyle(
                                        color: titleEventClicked[i]
                                            ? Color(0xff333333)
                                            : Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (titleEventClicked.contains(true)) {
                                        titleEventClicked = List.filled(
                                            titleEventClicked.length, false);
                                        titleEventClicked[i] = true;
                                      } else {
                                        titleEventClicked[i] = false;
                                      }
                                    });
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                      titleEventClicked[0]
                          ? EventDescriptionScreen()
                          : titleEventClicked[1]
                              ? EventGuestScreen()
                              : EventFileMediaScreen(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
