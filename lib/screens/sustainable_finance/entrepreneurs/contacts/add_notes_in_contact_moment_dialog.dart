import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/app_common_widgets/icon_text_container.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/contacts/add_task_in_contact_moment_dialog_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/contacts/task_entre.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../models/entrepreneur/response/get_entrepreneur_contact_moment_response.dart';
import '../../../../providers/entrepreneur/entrepreneur_contact_moment_provider.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../../office/widgets/add_button.dart';
import '../../../office/widgets/add_text_button_widget.dart';
import '../../../office/widgets/comment_text.dart';
import '../../../office/widgets/search_widget.dart';
import '../../../office/wij_lan_team/person_profile/Contact_moments/widget/subject_contact_widget.dart';
import 'add_subject_in_contact_moment_dialog_widget.dart';

class EntreAddNotes extends StatefulWidget {
  final int mEntrepreneurID, mContactMomentID;
  final ContactMomentsModel contactMomentsModel;

  const EntreAddNotes({
    Key? key,
    required this.mEntrepreneurID,
    required this.mContactMomentID,
    required this.contactMomentsModel,
  }) : super(key: key);

  @override
  State<EntreAddNotes> createState() => _EntreAddNotesState();
}

class _EntreAddNotesState extends State<EntreAddNotes> {
  @override
  void initState() {
    super.initState();
  }

  // @override
  // void initState() {
  //   final provider = Provider.of<EntrepreneurContactMomentScreenProvider>(
  //       context,
  //       listen: false);
  //
  //   super.initState();
  // }

  String subjectsList(int index) {
    String subjects = "";
    if (widget.contactMomentsModel.contactSubjects!.isNotEmpty) {
      subjects = widget.contactMomentsModel.contactSubjects![index].subject!
          .join(', ');
    }

    return subjects;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurContactMomentScreenProvider>(
        builder: (context, provider, widget) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.7,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AddTextButtonWidget(
                  text: "Cancel".tr(),
                  colors: lightBlack,
                  onPress: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                AddTextButtonWidget(
                  text: "Save & Exit".tr(),
                  colors: Colors.yellow,
                  onPress: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            content: Container(
              width: getWidth(context) * 0.7,
              child: Column(
                children: [
                  Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Title".tr(),
                            color: third,
                            size: 20,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: "Attendee,Attendee".tr()),
                              CustomText(text: "dd.mm.yyyy".tr()),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Note".tr(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CommentTextField(),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "Subjects".tr(),
                                    size: 24,
                                    color: darkGreen,
                                    weight: FontWeight.bold,
                                  ),
                                  IconAndTextContainer(
                                    addText: "Subject".tr(),
                                    onTap: () {
                                      showDialog(
                                          // /////////////////////////////Subject DialogBox///////////
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SubjectDialogBox(
                                              mEntrepreneurID:
                                                  this.widget.mEntrepreneurID,
                                              mContactMomentID:
                                                  this.widget.mContactMomentID,
                                            );
                                          });
                                    },
                                  ),
                                ],
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: SingleChildScrollView(
                                  // physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    children: [
                                      SubjectContactWidget(
                                        subjectText: 'Subject'.tr(),
                                        descriptionText: "Description".tr(),
                                        size: 20,
                                        weight: FontWeight.bold,
                                        width: !Responsive.isDesktop(context)
                                            ? getWidth(context) / 3
                                            : getWidth(context) / 4,
                                        child: SizedBox(
                                          width: 50,
                                        ),
                                      ),
                                      for (int i = 0;
                                          i <
                                              this
                                                  .widget
                                                  .contactMomentsModel
                                                  .contactSubjects!
                                                  .length;
                                          i++)
                                        SubjectContactWidget(
                                          subjectText: subjectsList(i),
                                          descriptionText: this
                                              .widget
                                              .contactMomentsModel
                                              .contactSubjects![i]
                                              .description!,
                                          size: 14,
                                          weight: FontWeight.normal,
                                          width: !Responsive.isDesktop(context)
                                              ? getWidth(context) / 3
                                              : getWidth(context) / 4,
                                          child: ClickIconButton(
                                            icon: Icons.delete,
                                            onPressed: () {
                                              provider
                                                  .deleteSubjectFromContactMoment(
                                                mEntrepreneurID:
                                                    this.widget.mEntrepreneurID,
                                                contactMomentId: this
                                                    .widget
                                                    .mContactMomentID,
                                                subjectID: this
                                                    .widget
                                                    .contactMomentsModel
                                                    .contactSubjects![i]
                                                    .id!,
                                                context: context,
                                              );
                                            },
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "Tasks".tr(),
                                    size: 24,
                                    color: darkGreen,
                                    weight: FontWeight.bold,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  ButtonWithAddIcon(
                                    text: "Task".tr(),
                                    onPressed: () {
                                      showDialog(
                                          // /////////////////////////////Task DialogBox///////////
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AddTasksDialogBox(
                                              mEntrepreneurID:
                                                  this.widget.mEntrepreneurID,
                                              mContactPersonID:
                                                  this.widget.mContactMomentID,
                                            );
                                          });
                                    },
                                  )
                                ],
                              ),
                              // UpDownButtonWidget(
                              //   upDownIcon: provider.onTaskContact,
                              //   onPressed: () {
                              //     setState(() {
                              //       provider.onTaskContact =
                              //           !provider.onTaskContact;
                              //     });
                              //   },
                              // ),
                            ],
                          ),
                          provider.onTaskContact
                              ? Container()
                              : Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Column(
                                      children: [
                                        TaskEntrepreneur(
                                          first: true,
                                          assignedText: "Assigned to".tr(),
                                          statusText: "Status".tr(),
                                          subjectText: "Subject".tr(),
                                          duedateText: "Due Date".tr(),
                                          descriptionText: "Description".tr(),
                                          width: !Responsive.isDesktop(context)
                                              ? getWidth(context) / 3
                                              : getWidth(context) / 6,
                                          size: 20,
                                          weight: FontWeight.bold,
                                          child: SizedBox(
                                            width: 50,
                                          ),
                                        ),
                                        for (int i = 0;
                                            i <
                                                this
                                                    .widget
                                                    .contactMomentsModel
                                                    .tasks!
                                                    .length;
                                            i++)
                                          TaskEntrepreneur(
                                            first: false,
                                            assignedText: this
                                                    .widget
                                                    .contactMomentsModel
                                                    .tasks![i]
                                                    .assignedTo!
                                                    .firstName! +
                                                this
                                                    .widget
                                                    .contactMomentsModel
                                                    .tasks![i]
                                                    .assignedTo!
                                                    .lastName!,
                                            statusText: this
                                                .widget
                                                .contactMomentsModel
                                                .tasks![i]
                                                .taskStatus![0],
                                            subjectText: "Subject".tr(),
                                            duedateText: this
                                                .widget
                                                .contactMomentsModel
                                                .tasks![i]
                                                .taskDueDate!,
                                            descriptionText: this
                                                .widget
                                                .contactMomentsModel
                                                .tasks![i]
                                                .taskDescription!,
                                            size: 14,
                                            width:
                                                !Responsive.isDesktop(context)
                                                    ? getWidth(context) / 3
                                                    : getWidth(context) / 6,
                                            weight: FontWeight.normal,
                                            child: ClickIconButton(
                                              icon: Icons.delete,
                                              onPressed: () {
                                                provider
                                                    .deleteTaskFromContactMoment(
                                                  mEntrepreneurID: this
                                                      .widget
                                                      .mEntrepreneurID,
                                                  contactMomentId: this
                                                      .widget
                                                      .mContactMomentID,
                                                  mTaskID: this
                                                      .widget
                                                      .contactMomentsModel
                                                      .tasks![i]
                                                      .id!,
                                                  context: context,
                                                );
                                              },
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  // Card(
                  //   elevation: 2,
                  //   margin: EdgeInsets.symmetric(vertical: 20),
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(5),
                  //   ),
                  //   child: Padding(
                  //     padding:
                  //         const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Row(
                  //           children: [
                  //             CustomText(
                  //               text: "Tasks",
                  //               size: 24,
                  //               color: darkGreen,
                  //               weight: FontWeight.bold,
                  //             ),
                  //             const SizedBox(
                  //               width: 20,
                  //             ),
                  //             AddButtonWidget(
                  //               text: "Task",
                  //               onPressed: () {
                  //                 showDialog(
                  //                     // /////////////////////////////Task DialogBox///////////
                  //                     context: context,
                  //                     builder: (BuildContext context) {
                  //                       return const TaskDialogBox();
                  //                     });
                  //               },
                  //             )
                  //           ],
                  //         ),
                  //         Container(
                  //           margin: const EdgeInsets.symmetric(vertical: 10),
                  //           height: 250,
                  //           child: ListView(
                  //             shrinkWrap: true,
                  //             scrollDirection: Axis.horizontal,
                  //             children: [
                  //               Column(
                  //                 children: [
                  //                   TasksContactWidget(
                  //                     assignedText: "Assigned to",
                  //                     statusText: "Status",
                  //                     subjectText: "Subject",
                  //                     duedateText: "Due Date",
                  //                     descriptionText: "Description",
                  //                     width: !Responsive.isDesktop(context)
                  //                         ? getWidth(context) / 3
                  //                         : getWidth(context) / 6,
                  //                     size: 20,
                  //                     weight: FontWeight.bold,
                  //                     child: SizedBox(
                  //                       width: 50,
                  //                     ),
                  //                   ),
                  //                   for (int i = 0; i < 1; i++)
                  //                     TasksContactWidget(
                  //                       assignedText: "Assigned To",
                  //                       statusText: "Status",
                  //                       subjectText: "Subject",
                  //                       duedateText: "Due Date",
                  //                       descriptionText: "Description",
                  //                       size: 14,
                  //                       width: !Responsive.isDesktop(context)
                  //                           ? getWidth(context) / 3
                  //                           : getWidth(context) / 6,
                  //                       weight: FontWeight.normal,
                  //                       child: ClickIconButton(
                  //                         icon: Icons.delete,
                  //                         onPressed: () {},
                  //                       ),
                  //                     ),
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
