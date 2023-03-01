import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';
import 'package:wij_land/screens/dynamic_filters/widgets/dynamic_filter_data_table_widget.dart';
import 'package:wij_land/screens/dynamic_filters/widgets/dynamic_shared_data_table_widget.dart';

import '../../app_common_widgets/animated_search.dart';
import '../../app_common_widgets/custom_text.dart';
import '../../app_common_widgets/icons_hover_buttons.dart';
import '../../utils/controller.dart';
import '../../utils/functions.dart';
import '../../utils/responsive.dart';
import '../../utils/styles.dart';
import '../communications/events/widgets/events_constants.dart';
import '../office/widgets/add_button.dart';

class DynamicFilterScreen extends StatefulWidget {
  const DynamicFilterScreen({Key? key}) : super(key: key);

  @override
  State<DynamicFilterScreen> createState() => _DynamicFilterScreenState();
}

class _DynamicFilterScreenState extends State<DynamicFilterScreen> {
  bool isFilter = true, isShared = false;
  final List<String> messages = ['Entities', 'Properties'];

  bool isEdgeIndex(int index) {
    return index == 0 || index == messages.length + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => SizedBox(
                    child: CustomText(
                      text: menuController.activeItemRoute.value,
                      size: 14,
                    ),
                  )),
              SizedBox(width: 50),
              Row(
                children: [
                  Expanded(
                      child: CustomText(
                    text: 'Dynamic Filters',
                    color: third,
                    size: 30,
                    weight: FontWeight.bold,
                  )),

                  AnimatedSearchWidget(),

                  // IconHoverButton(
                  //     icons: FontAwesomeIcons.search, onPress: () {}),
                  ButtonWithAddIcon(
                    text: 'Filter',
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 4,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: !Responsive.isDesktop(context)
                                ? getWidth(context) * 0.6
                                : getWidth(context) * 0.35,
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: dimMetalic3, width: 2)),
                            ),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (!isFilter) {
                                        isFilter = true;
                                        isShared = false;
                                      } else {
                                        isFilter = false;
                                      }
                                    });
                                  },
                                  child: Transform.translate(
                                      offset: Offset(0, 2),
                                      child: Container(
                                          // optional
                                          padding: const EdgeInsets.only(
                                              top: 12, bottom: 6),
                                          // margin: EdgeInsets.only(left: 4),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      width: 2.0,
                                                      color: isFilter
                                                          ? dimMetalic
                                                          : dimMetalic3))),
                                          child: Text(
                                            'My Filters',
                                            style: TextStyle(fontSize: 16),
                                          ))),
                                ),
                                SizedBox(width: getWidth(context) * 0.1),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (!isShared) {
                                        isFilter = false;
                                        isShared = true;
                                      } else {
                                        isShared = false;
                                      }
                                    });
                                  },
                                  child: Transform.translate(
                                      offset: Offset(0, 2),
                                      child: Container(
                                          // optional
                                          padding: const EdgeInsets.only(
                                              top: 12, bottom: 6),
                                          // margin: EdgeInsets.only(left: 4),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      width: 2.0,
                                                      color: isShared
                                                          ? dimMetalic
                                                          : dimMetalic3))),
                                          child: Text('Shared with me',
                                              style: TextStyle(fontSize: 16)))),
                                )
                              ],
                            ),
                          ),
                          isFilter
                              ? IconHoverButton(
                                  icons: FontAwesomeIcons.ellipsisV,
                                  onPress: () {
                                    showPopupEMenu(context);
                                  })
                              : SizedBox.shrink(),
                        ],
                      ),
                      isFilter
                          ? FilterDataTableWidget()
                          : SharedDataTableWidget(),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: FixedTimeline.tileBuilder(
                    theme: TimelineTheme.of(context).copyWith(
                      nodePosition: 0,
                      connectorTheme:
                          TimelineTheme.of(context).connectorTheme.copyWith(
                                thickness: 1.0,
                              ),
                      indicatorTheme:
                          TimelineTheme.of(context).indicatorTheme.copyWith(
                                size: 10.0,
                                position: 0.5,
                              ),
                    ),
                    builder: TimelineTileBuilder(
                      indicatorBuilder: (_, index) => !isEdgeIndex(index)
                          ? Indicator.outlined(borderWidth: 1.0)
                          : null,
                      startConnectorBuilder: (_, index) =>
                          Connector.solidLine(),
                      endConnectorBuilder: (_, index) => Connector.solidLine(),
                      contentsBuilder: (_, index) {
                        if (isEdgeIndex(index)) {
                          return null;
                        }

                        return Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(messages[index - 1].toString()),
                        );
                      },
                      itemExtentBuilder: (_, index) =>
                          isEdgeIndex(index) ? 10.0 : 30.0,
                      nodeItemOverlapBuilder: (_, index) =>
                          isEdgeIndex(index) ? true : null,
                      itemCount: messages.length + 2,
                    ),
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
