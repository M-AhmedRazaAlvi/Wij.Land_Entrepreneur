import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/tasks/tasks_info_widget.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/icon_text_container.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../../../app_common_widgets/animated_search.dart';
import '../../../../office/widgets/search_widget.dart';
import '../../../../sustainable_finance/entrepreneurs/contacts/add_task_in_contact_moment_dialog_widget.dart';

class TasksScreens extends StatefulWidget {
  const TasksScreens({Key? key}) : super(key: key);

  @override
  State<TasksScreens> createState() => _TasksScreensState();
}

class _TasksScreensState extends State<TasksScreens> {
  String? ditchBank = "Select Season";
  List<String> ditchBankList = <String>[
    "Select Season",
    "Fall/Autumn",
    "Spring",
    "Summer",
    "Winter",
  ];
  bool filterTapped = false;
  bool checkAll = false;

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
              child: !Responsive.isDesktop(context)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            text: "Tasks",
                            size: 30,
                            color: hoverColor,
                            weight: FontWeight.bold,
                          ),
                        ),
                        AnimatedSearchWidget(),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            ClickIconButton(
                              icon: Icons.filter_list,
                              clickcolors:
                                  filterTapped ? hoverColor : Colors.white,
                              onPressed: () {
                                setState(
                                  () {
                                    filterTapped = !filterTapped;
                                  },
                                );
                              },
                            ),
                            IconAndTextContainer(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AddTasksDialogBox();
                                    });
                              },
                              addText: "Task",
                            ),
                          ],
                        )
                      ],
                    )
                  : Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        CustomText(
                          text: "Tasks",
                          size: 30,
                          color: hoverColor,
                          weight: FontWeight.bold,
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            AnimatedSearchWidget(),
                            ClickIconButton(
                              icon: Icons.filter_list,
                              clickcolors:
                                  filterTapped ? hoverColor : Colors.white,
                              onPressed: () {
                                setState(
                                  () {
                                    filterTapped = !filterTapped;
                                  },
                                );
                              },
                            ),
                            IconAndTextContainer(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AddTasksDialogBox();
                                    });
                              },
                              addText: "Task",
                            ),
                          ],
                        )
                      ],
                    ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: getWidth(context),
              child: Stack(
                children: [
                  Card(
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SizedBox(
                        height: 35 * 20,
                        width: getWidth(context),
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            Column(
                              children: [
                                FarmTasksInfoWidget(
                                  first: true,
                                  check: checkAll,
                                  status: "Status",
                                  assigned: "Assigned to",
                                  dueDate: "Due Date",
                                  description: "Description",
                                  project: "Project",
                                  contactMoment: "Contact Moment",
                                  subject: "Subject",
                                  size: !Responsive.isDesktop(context)
                                      ? getWidth(context) / 3.5
                                      : getWidth(context) / 8,
                                ),
                                for (int i = 0; i < 5; i++)
                                  InkWell(
                                    onTap: () {},
                                    child: FarmTasksInfoWidget(
                                      first: false,
                                      check: checkAll,
                                      status: "Status",
                                      assigned: "Assigned to",
                                      dueDate: "Due Date",
                                      description: "Description",
                                      project: "Project",
                                      contactMoment: "Contact Moment",
                                      subject: "Subject",
                                      size: !Responsive.isDesktop(context)
                                          ? getWidth(context) / 3.5
                                          : getWidth(context) / 8,
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
