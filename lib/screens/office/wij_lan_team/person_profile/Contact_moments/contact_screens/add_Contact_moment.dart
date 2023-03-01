import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wij_land/screens/office/wij_lan_team/person_profile/Contact_moments/widget/first_contact_widget.dart';
import 'package:wij_land/screens/office/wij_lan_team/person_profile/Contact_moments/widget/task_contact_widget.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../utils/controller.dart';
import '../../../../../../utils/functions.dart';
import '../../../../../../utils/responsive.dart';
import '../../../../../../utils/styles.dart';
import '../../../../../sustainable_finance/entrepreneurs/contacts/add_subject_in_contact_moment_dialog_widget.dart';
import '../../../../../sustainable_finance/entrepreneurs/contacts/add_task_in_contact_moment_dialog_widget.dart';
import '../../../../widgets/add_button.dart';
import '../../../../widgets/add_text_button_widget.dart';
import '../../../../widgets/search_widget.dart';
import '../../../../widgets/up_down_button_widget.dart';
import '../widget/subject_contact_widget.dart';

class AddContactMomnet extends StatefulWidget {
  const AddContactMomnet({Key? key}) : super(key: key);

  @override
  _AddContactMomnetState createState() => _AddContactMomnetState();
}

class _AddContactMomnetState extends State<AddContactMomnet> {
  final TextEditingController fName = TextEditingController(),
      date = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    date.dispose();
  }

  bool firstcontact = false;
  bool taskContact = false;
  bool subject = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => SizedBox(
                    child: CustomText(
                      text: menuController.activeItemRoute.value,
                      size: 14,
                    ),
                  )),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                alignment: Alignment.topRight,
                child: Wrap(
                  children: [
                    AddTextButtonWidget(
                      text: "Cancel",
                      colors: Colors.white,
                      onPress: () {},
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    AddTextButtonWidget(
                      text: "Save",
                      colors: Colors.yellow,
                      onPress: () {},
                    )
                  ],
                ),
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
                        CustomText(
                          text: "Contact Moment",
                          size: 24,
                          color: third,
                          weight: FontWeight.bold,
                        ),
                        UpDownButtonWidget(
                          upDownIcon: firstcontact,
                          onPressed: () {
                            setState(() {
                              firstcontact = !firstcontact;
                            });
                          },
                        ),
                      ],
                    ),
                    firstcontact ? Container() : FirstContactWidget(),
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
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const AddTasksDialogBox();
                                    });
                              },
                            )
                          ],
                        ),
                        UpDownButtonWidget(
                          upDownIcon: taskContact,
                          onPressed: () {
                            setState(() {
                              taskContact = !taskContact;
                            });
                          },
                        ),
                      ],
                    ),
                    taskContact
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
                                      return const SubjectDialogBox(mContactMomentID: 0,mEntrepreneurID: 0,);
                                    });
                              },
                            )
                          ],
                        ),
                        UpDownButtonWidget(
                          upDownIcon: subject,
                          onPressed: () {
                            setState(() {
                              subject = !subject;
                            });
                          },
                        ),
                      ],
                    ),
                    subject
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
                                      width: Responsive.isDesktop(context)
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
                                        width: Responsive.isDesktop(context)
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
