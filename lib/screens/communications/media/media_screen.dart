import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wij_land/routes/routes.dart';
import 'package:wij_land/screens/communications/media/widgets/media_card_widgets.dart';
import 'package:wij_land/screens/communications/media/widgets/media_constants.dart';
import 'package:wij_land/screens/communications/media/widgets/media_data_table_card.dart';

import '../../../app_common_widgets/animated_search.dart';
import '../../../app_common_widgets/custom_text.dart';
import '../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../utils/controller.dart';
import '../../../utils/responsive.dart';
import '../../../utils/styles.dart';
import '../../office/widgets/add_button.dart';

class MediaScreen extends StatefulWidget {
  const MediaScreen({Key? key}) : super(key: key);

  @override
  State<MediaScreen> createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {
  bool _isFilter = false, _isCubed = true, _isList = false, _isChart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                      child: CustomText(
                    text: 'Media range',
                    color: third,
                    size: 30,
                    weight: FontWeight.bold,
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
                      text: 'Media',
                      onPressed: () {
                        navigationController.navigateTo(mediaAddPageRoute);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              _isFilter
                  ? Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SelectableDropdownWidget(
                              items: categoryList,
                              title: "Media Type",
                              mSelectedValue: "",
                              mOnDropDownChange: (value) {},
                              mSelectedItemsList: [],
                            ),
                            SizedBox(width: 40),
                            SelectableDropdownWidget(
                              items: activeSinceList,
                              title: "Publication Year",
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
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              !Responsive.isDesktop(context) ? 30 : 100.0,
                          vertical: 20),
                      child: Row(
                        children: [
                          Expanded(
                              child: CustomText(
                            text: 'Results',
                            color: darkGreen,
                            size: 30,
                            weight: FontWeight.bold,
                          )),
                          IconHoverButton(
                              icons: FontAwesomeIcons.thLarge,
                              onPress: () {
                                setState(() {
                                  if (_isCubed) {
                                    _isCubed = false;
                                  } else {
                                    _isCubed = true;
                                    _isList = false;
                                    _isChart = false;
                                  }
                                });
                              }),
                          IconHoverButton(
                              icons: FontAwesomeIcons.listUl,
                              onPress: () {
                                setState(() {
                                  if (_isList) {
                                    _isList = false;
                                  } else {
                                    _isList = true;
                                    _isCubed = false;
                                    _isChart = false;
                                  }
                                });
                              }),
                          IconHoverButton(
                              icons: FontAwesomeIcons.chartBar,
                              onPress: () {
                                setState(() {
                                  if (_isChart) {
                                    _isChart = false;
                                  } else {
                                    _isChart = true;
                                    _isList = false;
                                    _isCubed = false;
                                  }
                                });
                              }),
                        ],
                      ),
                    ),
                    _isCubed
                        ? Wrap(
                            children: [
                              MediaCardWidget(
                                title: 'My image',
                                date: '2-9-2021',
                                onPress: () {
                                  navigationController
                                      .navigateTo(mediaDetailPageRoute);
                                },
                                imageUrl: '',
                                status: 'Online',
                              ),
                              MediaCardWidget(
                                title: 'My home',
                                date: '21-2-2021',
                                onPress: () {},
                                imageUrl: '',
                                status: 'Online',
                              ),
                              MediaCardWidget(
                                title: 'image 1',
                                date: '22-12-2021',
                                onPress: () {},
                                imageUrl: '',
                                status: 'Radio & TV',
                              ),
                              MediaCardWidget(
                                title: 'My land',
                                date: '3-4-2021',
                                onPress: () {},
                                imageUrl: '',
                                status: 'Online',
                              ),
                              MediaCardWidget(
                                title: 'My farm',
                                date: '5-6-2021',
                                onPress: () {},
                                imageUrl: '',
                                status: 'Printed Press',
                              ),
                            ],
                          )
                        : _isList
                            ? MediaDataTableCard()
                            : Wrap(),
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
