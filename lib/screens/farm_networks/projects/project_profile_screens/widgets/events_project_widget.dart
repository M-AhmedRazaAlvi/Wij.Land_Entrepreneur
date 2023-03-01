import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../../communications/events/widgets/add_events_dialog_widget.dart';
import '../../../../communications/events/widgets/events_card_widgets.dart';
import '../../../../communications/events/widgets/events_constants.dart';
import '../../../../communications/events/widgets/events_data_table_card.dart';
import '../../../../communications/social_media/widgets/social_media_constants.dart';
import '../../../../office/widgets/add_button.dart';

class EventsProjectWidget extends StatefulWidget {
  const EventsProjectWidget({Key? key}) : super(key: key);

  @override
  State<EventsProjectWidget> createState() => _EventsProjectWidgetState();
}

class _EventsProjectWidgetState extends State<EventsProjectWidget> {
  bool _isFilter = false, _isCubed = true, _isList = false, _isElip = false;
  var programList = ['Inspiration', 'Sustainable Farming'];
  var projectList = ['Arable Land', 'August Project', 'Biomass Project'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: Padding(
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
                    size: 30,
                    weight: FontWeight.bold,
                  )),
                  IconHoverButton(
                      icons: FontAwesomeIcons.search, onPress: () {}),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SelectableDropdownWidget(
                              items: programList,
                              title: "Programme",
                              mSelectedValue: "",
                              mOnDropDownChange: (value){},
                              mSelectedItemsList: [],

                            ),
                            SizedBox(width: 40),
                            SelectableDropdownWidget(
                              items: projectList,
                              title: "Project",
                              mSelectedValue: "",
                              mOnDropDownChange: (value){},
                              mSelectedItemsList: [],

                            ),
                            SizedBox(width: 40),
                            SelectableDropdownWidget(
                              items: yearList,
                              title: "Year",
                              mSelectedValue: "",
                              mOnDropDownChange: (value){},
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
                            weight: FontWeight.bold,
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
                                location: 'okr',
                                date: '2-9-2021',
                                onPress: () {
                                  Get.toNamed('/events_details');
                                },
                                imageUrl: '',
                                status: 'Scheduled',
                              ),
                              EventsCardWidget(
                                title: 'Farmer Marker',
                                location: 'dgk',
                                date: '21-3-2022',
                                onPress: () {},
                                imageUrl: '',
                                status: 'Scheduled',
                              ),
                              EventsCardWidget(
                                title: 'image 1',
                                location: 'pew',
                                date: '22-4-2022',
                                onPress: () {},
                                imageUrl: '',
                                status: 'Scheduled',
                              ),
                              EventsCardWidget(
                                title: 'My Events',
                                location: 'multan',
                                date: '3-4-2022',
                                onPress: () {},
                                imageUrl: '',
                                status: 'Scheduled',
                              ),
                              EventsCardWidget(
                                title: 'My farm events',
                                location: 'lahore',
                                date: '5-6-2022',
                                onPress: () {},
                                imageUrl: '',
                                status: 'Scheduled',
                              ),
                            ],
                          )
                        : _isList
                            ? EventsDataTableCard()
                            : Wrap(),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                      child: CustomText(
                        text: 'Past Events',
                        color: darkGreen,
                        size: 30,
                        weight: FontWeight.bold,
                      ),
                    ),
                    _isCubed
                        ? Wrap(
                            children: [
                              EventsCardWidget(
                                title: 'My image',
                                location: 'lhr',
                                date: '12-9-2021',
                                onPress: () {
                                  Get.toNamed('/events_details');
                                },
                                imageUrl: '',
                                status: 'Scheduled',
                              ),
                              EventsCardWidget(
                                title: 'My home',
                                location: 'okr',
                                date: ' lhr 1-2-2021',
                                onPress: () {},
                                imageUrl: '',
                                status: 'Scheduled',
                              ),
                              EventsCardWidget(
                                title: 'image 1',
                                location: 'fsd',
                                date: 'multan 12-12-2021',
                                onPress: () {},
                                imageUrl: '',
                                status: 'Scheduled',
                              ),
                              EventsCardWidget(
                                title: 'My land',
                                location: 'sargodha',
                                date: ' karachi 30-4-2021',
                                onPress: () {},
                                imageUrl: '',
                                status: 'Scheduled',
                              ),
                              EventsCardWidget(
                                title: 'My farm',
                                location: 'karachi',
                                date: ' faisalabad 25-6-2021',
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
