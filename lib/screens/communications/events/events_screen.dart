import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wij_land/routes/routes.dart';
import 'package:wij_land/screens/communications/events/widgets/add_events_dialog_widget.dart';
import 'package:wij_land/screens/communications/events/widgets/events_card_widgets.dart';
import 'package:wij_land/screens/communications/events/widgets/events_constants.dart';
import 'package:wij_land/screens/communications/events/widgets/events_data_table_card.dart';

import '../../../app_common_widgets/animated_search.dart';
import '../../../app_common_widgets/custom_text.dart';
import '../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../utils/controller.dart';
import '../../../utils/responsive.dart';
import '../../../utils/styles.dart';
import '../../office/widgets/add_button.dart';
import '../social_media/widgets/social_media_constants.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  bool _isFilter = false, _isCubed = true, _isList = false, _isElip = false;
  var programList = ['Inspiration', 'Sustainable Farming'];
  var projectList = ['Arable Land', 'August Project', 'Biomass Project'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                      child: CustomText(
                    text: 'Events',
                    color: third,
                    size: 40,
                    weight: FontWeight.w600,
                  )),
                  AnimatedSearchWidget(),
                  IconHoverButton(
                      icons: FontAwesomeIcons.filter,
                      onPress: () {
                        setState(() {
                          _isFilter = !_isFilter;
                        });
                      }),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: ButtonWithAddIcon(
                      text: 'Add Events',
                      onPressed: () {
                        //   Get.toNamed('/add_anecdotes');
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AddEventsDialogWidget();
                            });
                      },
                    ),
                  ),
                ],
              ),
              _isFilter
                  ? Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          children: [
                            SelectableDropdownWidget(
                              items: programList,
                              title: "Programme",
                              mSelectedValue: "",
                              mOnDropDownChange: (value) {},
                              mSelectedItemsList: [],
                            ),
                            SizedBox(width: 40),
                            SelectableDropdownWidget(
                              items: projectList,
                              title: "Project",
                              mSelectedValue: "",
                              mOnDropDownChange: (value) {},
                              mSelectedItemsList: [],
                            ),
                            SizedBox(width: 40),
                            SelectableDropdownWidget(
                              items: yearList,
                              title: "Year",
                              mSelectedValue: "",
                              mOnDropDownChange: (value) {},
                              mSelectedItemsList: [],
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              SizedBox(height: 8),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              !Responsive.isDesktop(context) ? 30 : 20.0,
                          vertical: 20),
                      child: Row(
                        children: [
                          Expanded(
                              child: CustomText(
                            text: 'Upcoming Events',
                            color: darkGreen,
                            size: 30,
                            weight: FontWeight.w600,
                          )),
                          IconHoverButton(
                              icons: FontAwesomeIcons.thLarge,
                              isClick: _isCubed,
                              onPress: () {
                                setState(() {
                                  _isCubed = true;
                                  _isList = false;
                                });
                              }),
                          IconHoverButton(
                              icons: FontAwesomeIcons.listUl,
                              isClick: _isList,
                              onPress: () {
                                setState(() {
                                  _isList = true;
                                  _isCubed = false;
                                });
                              }),
                          _isList
                              ? IconHoverButton(
                                  icons: FontAwesomeIcons.ellipsisV,
                                  isClick: _isElip,
                                  onPress: () {
                                    setState(() {
                                      _isElip = !_isElip;
                                    });
                                    showPopupEventsMenu(context);
                                  })
                              : SizedBox.shrink(),
                        ],
                      ),
                    ),
                    _isCubed
                        ? Wrap(
                            children: [
                              EventsCardWidget(
                                title: 'My image',
                                date: '2-9-2021',
                                location: 'lhr',
                                onPress: () {
                                  navigationController
                                      .navigateTo(eventsDetailPageRoute);
                                },
                                imageUrl: '',
                                status: 'Scheduled',
                              ),
                              EventsCardWidget(
                                title: 'Farmer Marker',
                                date: '21-3-2022',
                                onPress: () {},
                                imageUrl: '',
                                location: 'lhr',
                                status: 'Scheduled',
                              ),
                              EventsCardWidget(
                                title: 'image 1',
                                date: '22-4-2022',
                                onPress: () {},
                                imageUrl: '',
                                location: 'multan',
                                status: 'Scheduled',
                              ),
                              EventsCardWidget(
                                title: 'My Events',
                                date: '3-4-2022',
                                onPress: () {},
                                imageUrl: '',
                                location: 'multan',
                                status: 'Scheduled',
                              ),
                              EventsCardWidget(
                                title: 'My farm events',
                                date: '5-6-2022',
                                onPress: () {},
                                imageUrl: '',
                                location: 'karachi',
                                status: 'Scheduled',
                              ),
                            ],
                          )
                        : _isList
                            ? EventsDataTableCard()
                            : SizedBox.shrink(),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                      child: CustomText(
                        text: 'Past Events',
                        color: darkGreen,
                        size: 30,
                        weight: FontWeight.w600,
                      ),
                    ),
                    _isCubed
                        ? Wrap(
                            children: [
                              EventsCardWidget(
                                title: 'My image',
                                date: '12-9-2021',
                                location: 'lhr',
                                onPress: () {
                                  navigationController
                                      .navigateTo(eventsDetailPageRoute);
                                },
                                imageUrl: '',
                                status: 'Scheduled',
                              ),
                              EventsCardWidget(
                                title: 'My home',
                                date: '1-2-2021',
                                location: 'fsd',
                                onPress: () {},
                                imageUrl: '',
                                status: 'Scheduled',
                              ),
                              EventsCardWidget(
                                title: 'image 1',
                                date: '12-12-2021',
                                location: 'sialkot',
                                onPress: () {},
                                imageUrl: '',
                                status: 'Scheduled',
                              ),
                              EventsCardWidget(
                                title: 'My land',
                                date: '30-4-2021',
                                location: 'okara',
                                onPress: () {},
                                imageUrl: '',
                                status: 'Scheduled',
                              ),
                              EventsCardWidget(
                                title: 'My farm',
                                date: '25-6-2021',
                                location: 'sahiwal',
                                onPress: () {},
                                imageUrl: '',
                                status: 'Scheduled',
                              ),
                            ],
                          )
                        : _isList
                            ? EventsDataTableCard()
                            : SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
