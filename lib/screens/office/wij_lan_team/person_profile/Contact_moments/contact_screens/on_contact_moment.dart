import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/menu_popup_widget.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/controller.dart';
import '../../../../../../utils/functions.dart';
import '../../../../../../utils/responsive.dart';
import '../../../../../../utils/styles.dart';
import '../../../../../sustainable_finance/entrepreneurs/contacts/add_subject_in_contact_moment_dialog_widget.dart';
import '../../../../../sustainable_finance/entrepreneurs/contacts/add_task_in_contact_moment_dialog_widget.dart';
import '../../../../widgets/add_button.dart';
import '../../../../widgets/search_widget.dart';
import '../../../../widgets/up_down_button_widget.dart';
import '../widget/on_first_contact_widget.dart';
import '../widget/subject_contact_widget.dart';
import '../widget/task_contact_widget.dart';


class OnContactMoment extends StatefulWidget {
  const OnContactMoment({Key? key}) : super(key: key);

  @override
  State<OnContactMoment> createState() => _OnContactMomentState();
}

class _OnContactMomentState extends State<OnContactMoment> {
  bool onfirstcontact = false;
  bool ontaskContact = false;
  bool onsubject = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Container(
          width: getWidth(context),
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => SizedBox(
                    child: CustomText(
                      text: menuController.activeItemRoute.value,
                      size: 14,
                    ),
                  )),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClickIconButton(
                    clickcolors: Colors.white,
                    icon: Icons.edit,
                    onPressed: () {
                      navigationController.navigateTo(addContactMomentRoute);
                    },
                  ),
                  ClickIconButton(
                    clickcolors: Colors.white,
                    icon: Icons.close,
                    onPressed: () {
                      // navigationController
                      //     .navigateTo(wijLandProfileScreenRoute);
                    },
                  ),
                  const MenuPopupWidget(contents: ["Delete"]),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "Contact Moment",
                          size: 24,
                          color: third,
                          weight: FontWeight.bold,
                        ),
                        UpDownButtonWidget(
                          upDownIcon: onfirstcontact,
                          onPressed: () {
                            setState(() {
                              onfirstcontact = !onfirstcontact;
                            });
                          },
                        ),
                      ],
                    ),
                    onfirstcontact ? Container() : const OnFirstContactWidget(),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: "Tasks",
                              size: 24,
                              color: darkGreen,
                              weight: FontWeight.bold,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ButtonWithAddIcon(
                              text: "Task",
                              onPressed: () {
                                showDialog(
                                    // /////////////////////////////Task DialogBox///////////
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const AddTasksDialogBox();
                                    });
                              },
                            )
                          ],
                        ),
                        UpDownButtonWidget(
                          upDownIcon: ontaskContact,
                          onPressed: () {
                            setState(() {
                              ontaskContact = !ontaskContact;
                            });
                          },
                        ),
                      ],
                    ),
                    ontaskContact
                        ? Container()
                        : Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 30 * 15,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                Column(
                                  children: [
                                    TasksContactWidget(
                                      assignedText: "Assigned To",
                                      statusText: "Status",
                                      subjectText: "Subject",
                                      duedateText: "Due Date",
                                      descriptionText: "Description",
                                      size: 20,
                                      width: !Responsive.isDesktop(context)
                                          ? getWidth(context) / 2.5
                                          : getWidth(context) / 5.5,
                                      weight: FontWeight.bold,
                                      child: SizedBox(
                                        width: 50,
                                      ),
                                    ),
                                    for (int i = 0; i < 3; i++)
                                      TasksContactWidget(
                                        assignedText: "Assigned To",
                                        statusText: "Status",
                                        subjectText: "Subject",
                                        duedateText: "Due Date",
                                        descriptionText: "Description",
                                        size: 14,
                                        width: !Responsive.isDesktop(context)
                                            ? getWidth(context) / 2.5
                                            : getWidth(context) / 5.5,
                                        weight: FontWeight.normal,
                                        child: ClickIconButton(
                                          icon: Icons.delete,
                                          onPressed: () {},
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: "Subjects",
                              size: 24,
                              color: darkGreen,
                              weight: FontWeight.bold,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ButtonWithAddIcon(
                              text: "Subject",
                              onPressed: () {
                                showDialog(
                                    // /////////////////////////////Subject DialogBox///////////
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const SubjectDialogBox(
                                        mEntrepreneurID: 0,
                                        mContactMomentID: 0,
                                      );
                                    });
                              },
                            )
                          ],
                        ),
                        UpDownButtonWidget(
                          upDownIcon: onsubject,
                          onPressed: () {
                            setState(() {
                              onsubject = !onsubject;
                            });
                          },
                        ),
                      ],
                    ),
                    onsubject
                        ? Container()
                        : Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 30 * 15,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                Column(
                                  children: [
                                    SubjectContactWidget(
                                      subjectText: 'Subject',
                                      descriptionText: "Description",
                                      size: 20,
                                      weight: FontWeight.bold,
                                      width: !Responsive.isDesktop(context)
                                          ? getWidth(context) / 2
                                          : getWidth(context) / 2.3,
                                      child: SizedBox(
                                        width: 50,
                                      ),
                                    ),
                                    for (int i = 0; i < 3; i++)
                                      SubjectContactWidget(
                                        subjectText: 'Subject',
                                        descriptionText: "Description",
                                        size: 14,
                                        weight: FontWeight.normal,
                                        width: !Responsive.isDesktop(context)
                                            ? getWidth(context) / 2
                                            : getWidth(context) / 2.3,
                                        child: ClickIconButton(
                                          icon: Icons.delete,
                                          onPressed: () {},
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
