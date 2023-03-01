import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wij_land/screens/communications/anecdotes/widgets/anecdotes_card_widgets.dart';
import 'package:wij_land/screens/communications/anecdotes/widgets/anecdotes_constants.dart';
import 'package:wij_land/screens/communications/anecdotes/widgets/anecdotes_data_table_card.dart';

import '../../../app_common_widgets/animated_search.dart';
import '../../../app_common_widgets/custom_text.dart';
import '../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../routes/routes.dart';
import '../../../utils/controller.dart';
import '../../../utils/responsive.dart';
import '../../../utils/styles.dart';
import '../../office/widgets/add_button.dart';

class AnecdotesScreen extends StatefulWidget {
  const AnecdotesScreen({Key? key}) : super(key: key);

  @override
  State<AnecdotesScreen> createState() => _AnecdotesScreenState();
}

class _AnecdotesScreenState extends State<AnecdotesScreen> {
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
                    text: 'Anecdotes',
                    color: third,
                    size: 40,
                    weight: FontWeight.w600,
                  )),
                  AnimatedSearchWidget(),
                  IconHoverButton(
                      icons: FontAwesomeIcons.filter,
                      onPress: () {
                        /*setState(() {
                      _isFilter=!_isFilter;
                    });*/
                      }),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: ButtonWithAddIcon(
                      text: 'Add Anecdote',
                      onPressed: () {
                        // Get.toNamed('/add_anecdotes');
                        navigationController.navigateTo(anecdotesAddPageRoute);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Card(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: !Responsive.isDesktop(context)
                              ? 30
                              : _isList
                                  ? 30
                                  : 20.0,
                          vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: CustomText(
                            text: 'Results',
                            color: darkGreen,
                            size: 30,
                            weight: FontWeight.w600,
                          )),
                          IconHoverButton(
                              icons: FontAwesomeIcons.thLarge,
                              isClick: _isCubed,
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
                              isClick: _isList,
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
                          _isList
                              ? IconHoverButton(
                                  icons: FontAwesomeIcons.ellipsisV,
                                  onPress: () {
                                    setState(() {
                                      showPopupAnecdotesMenu(context, 170);
                                    });
                                  })
                              : SizedBox.shrink(),
                        ],
                      ),
                    ),
                    _isCubed
                        ? Wrap(
                            children: [
                              AnecdotesCardWidget(
                                title: 'My image',
                                date: '2-9-2021',
                                onPress: () {
                                  navigationController
                                      .navigateTo(anecdotesDetailPageRoute);
                                },
                                imageUrl: '',
                                status: 'Positive',
                              ),
                              AnecdotesCardWidget(
                                title: 'My home',
                                date: '21-2-2021',
                                onPress: () {},
                                imageUrl: '',
                                status: 'Negative',
                              ),
                              AnecdotesCardWidget(
                                title: 'image 1',
                                date: '22-12-2021',
                                onPress: () {},
                                imageUrl: '',
                                status: 'Neutral',
                              ),
                              AnecdotesCardWidget(
                                title: 'My land',
                                date: '3-4-2021',
                                onPress: () {},
                                imageUrl: '',
                                status: 'Positive',
                              ),
                              AnecdotesCardWidget(
                                title: 'My farm',
                                date: '5-6-2021',
                                onPress: () {},
                                imageUrl: '',
                                status: 'Neutral',
                              ),
                            ],
                          )
                        : _isList
                            ? AnecdotesDataTableCard()
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
