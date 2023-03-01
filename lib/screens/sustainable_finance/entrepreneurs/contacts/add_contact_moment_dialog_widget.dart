import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/contacts/add_contact_moment_screen.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/contacts/search_attendees_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/contacts/search_farm_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/contacts/search_projects_widget.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/hex_color.dart';

import '../../../../app_common_widgets/common_outlined_button.dart';
import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../app_common_widgets/text_widget.dart';
import '../../../../models/entrepreneur/request/post_entrepreneur_contact_moment_request.dart';
import '../../../../providers/entrepreneur/entrepreneur_contact_moment_provider.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../../office/widgets/add_text_button_widget.dart';

class EntreContactDialog extends StatefulWidget {
  final int? mEntrepreneurID;
  final bool? isUUpdate;
  final int? mContractTypeId;
  final String entrepreneurName;

  const EntreContactDialog({
    Key? key,
    required this.mEntrepreneurID,
    this.isUUpdate,
    this.mContractTypeId,
    required this.entrepreneurName,
  }) : super(key: key);

  @override
  State<EntreContactDialog> createState() => _EntreContactDialogState();
}

class _EntreContactDialogState extends State<EntreContactDialog> {
  @override
  void initState() {
    final provider = Provider.of<EntrepreneurContactMomentScreenProvider>(
        context,
        listen: false);

    provider.mContactFarmSearchController.addListener(() {
      if (provider.mContactFarmSearchController.text.isNotEmpty) {
        provider.searchFarm(value: provider.mContactFarmSearchController.text);
        setState(() {
          provider.mShowFarmListWidget = true;
        });
      } else {
        setState(() {
          provider.mShowFarmListWidget = false;
        });
      }
    });

    provider.mAttendeesSearchController.addListener(() {
      if (provider.mAttendeesSearchController.text.isNotEmpty) {
        provider.searchAttendees(
            value: provider.mAttendeesSearchController.text);
        setState(() {
          provider.mShowAttendeeListWidget = true;
        });
      } else {
        setState(() {
          provider.mShowAttendeeListWidget = false;
        });
      }
    });

    provider.mProjectSearchController.addListener(() {
      if (provider.mProjectSearchController.text.isNotEmpty) {
        provider.searchProject(value: provider.mProjectSearchController.text);
        setState(() {
          provider.mShowProjectListWidget = true;
        });
      } else {
        setState(() {
          provider.mShowProjectListWidget = false;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurContactMomentScreenProvider>(
        builder: (context, provider, widget) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: AlertDialog(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomText(
                        text: "Add Contact Moment".tr(),
                        size: !Responsive.isDesktop(context) ? 20 : 26,
                        weight: FontWeight.bold,
                        color: HexColor('#231F20'),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                        size: !Responsive.isDesktop(context) ? 20 : 30,
                      ),
                    ),
                  ],
                ),
                content: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          CustomText(
                            text: "Organization".tr(),
                            size: 18.0,
                            color: HexColor('#231F20'),
                          ),
                          const SizedBox(height: 10),
                          TextWidgetField(
                            controller: TextEditingController(
                                text: this.widget.entrepreneurName),
                            enabled: false,
                            textPadding: EdgeInsets.only(left: 20, right: 20),
                          ),
                          const SizedBox(height: 10),
                          CustomText(
                            text: "Contact Moment Subject".tr(),
                            size: 18.0,
                            color: HexColor('#231F20'),
                          ),
                          const SizedBox(height: 10),
                          TextWidgetField(
                            controller:
                                provider.mContactMomentSubjectController,
                            enabled: true,
                            textPadding: EdgeInsets.only(left: 20, right: 20),
                          ),
                          provider.isDataNotEmpty &&
                                  provider.mContactMomentSubjectController.text
                                      .isEmpty
                              ? CustomText(
                                  text: "Contact Moment Subject is required!"
                                      .tr(),
                                  size: 11,
                                  color: Colors.red,
                                )
                              : SizedBox.shrink(),
                          SizedBox(height: 10),
                          CustomText(
                            text: "Kind of Contact".tr(),
                            size: 18.0,
                            color: HexColor('#231F20'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RealDropDownWidget(
                            value: provider.mContactMomentType,
                            onChanged: (newValue) {
                              setState(() {
                                provider.mContactMomentType = newValue;
                              });
                            },
                            items: provider.mContactMomentTypDropDown
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value, child: Text(value));
                            }).toList(),
                          ),
                          provider.isDataNotEmpty &&
                                  provider.mContactMomentType ==
                                      "Select Contact Moment"
                              ? CustomText(
                                  text: "Contact Moment type is required!".tr(),
                                  size: 11,
                                  color: Colors.red,
                                )
                              : SizedBox.shrink(),
                          const SizedBox(height: 10),
                          CustomText(
                            text: "Date of Contact Moment".tr(),
                            size: 18.0,
                            color: HexColor('#231F20'),
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              provider.pickDate(
                                  context: context, enablePreviousDates: true);
                            },
                            child: TextWidgetField(
                              controller: provider.mDateTimeTextController,
                              enabled: false,
                              suffixIcon: const Icon(Icons.calendar_today),
                            ),
                          ),
                          provider.isDataNotEmpty &&
                                  provider.mDateTimeTextController.text.isEmpty
                              ? CustomText(
                                  text: "Contact Moment Date is required!".tr(),
                                  size: 11,
                                  color: Colors.red,
                                )
                              : SizedBox.shrink(),
                          const SizedBox(height: 10),
                          CustomText(
                            text: "Related Farm".tr(),
                            size: 18.0,
                            color: HexColor('#231F20'),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: provider.mContactFarmSearchController,
                            cursorColor: Colors.black,
                            cursorWidth: 1,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors.black26,
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.black26,
                                    width: 0.5,
                                  ),
                                ),
                                suffixIcon: Icon(Icons.search)),
                          ),
                          const SizedBox(height: 10),
                          CustomText(
                            text: "Related Project".tr(),
                            size: 18.0,
                            color: HexColor('#231F20'),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: provider.mProjectSearchController,
                            cursorColor: Colors.black,
                            cursorWidth: 1,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors.black26,
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.black26,
                                    width: 0.5,
                                  ),
                                ),
                                suffixIcon: Icon(Icons.search)),
                          ),
                          const SizedBox(height: 10),
                          CustomText(
                            text: "Attendees".tr(),
                            size: 18.0,
                            color: HexColor('#231F20'),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: provider.mAttendeesSearchController,
                            cursorColor: Colors.black,
                            cursorWidth: 1,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors.black26,
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.black26,
                                    width: 0.5,
                                  ),
                                ),
                                suffixIcon: Icon(Icons.search)),
                          ),
                          provider.isDataNotEmpty &&
                                  provider.mAttendeesSelectedList.isEmpty
                              ? CustomText(
                                  text: "Contact Moment Attendees are required!"
                                      .tr(),
                                  size: 11,
                                  color: Colors.red,
                                )
                              : SizedBox.shrink(),
                          const SizedBox(height: 10),
                          Wrap(
                            children: provider.mAttendeesSelectedList.map(
                              (e) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Chip(
                                    avatar: CircleAvatar(
                                      backgroundColor: Colors.grey.shade800,
                                      child: Text(
                                        e.name![0].toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontFamily: Montserrat_Medium,
                                        ),
                                      ),
                                    ),
                                    label: Text(
                                      '${e.name}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: Montserrat_Medium,
                                      ),
                                    ),
                                    backgroundColor: Colors.blueGrey[50],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    elevation: 0,
                                    onDeleted: () {
                                      for (var i = 0;
                                          i <
                                              provider.mAttendeesSelectedList
                                                  .length;
                                          i++) {
                                        if (e.id ==
                                            provider
                                                .mAttendeesSelectedList[i].id) {
                                          provider.mAttendeesSelectedList
                                              .removeAt(i);
                                          setState(() {});
                                        }
                                      }
                                    },
                                    deleteIcon: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                      size: 18,
                                    ),
                                    deleteIconColor: Colors.red,
                                    labelPadding: EdgeInsets.all(5),
                                  ),
                                );
                                //
                                //   IntrinsicWidth(
                                //   child: Padding(
                                //     padding: const EdgeInsets.all(5.0),
                                //     child: Row(
                                //       children: [
                                //         Container(
                                //           margin: EdgeInsets.only(left: 10),
                                //           decoration: BoxDecoration(
                                //             borderRadius: BorderRadius.circular(7),
                                //             color: Colors.blueGrey[50],
                                //           ),
                                //           padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                //           child: Text(
                                //             '${e.name}',
                                //             style: TextStyle(fontSize: 13),
                                //           ),
                                //         ),
                                //         InkWell(
                                //           child: Icon(Icons.close),
                                //           onTap: () {
                                //             for (var i = 0; i < provider.mAttendeesSelectedList.length; i++) {
                                //               if (e.id == provider.mAttendeesSelectedList[i].id) {
                                //                 provider.mAttendeesSelectedList.removeAt(i);
                                //                 setState(() {});
                                //               }
                                //             }
                                //           },
                                //         )
                                //       ],
                                //     ),
                                //   ),
                                // );
                              },
                            ).toList(),
                          ),
                        ],
                      ),
                      provider.mShowFarmListWidget
                          ? Padding(
                              padding: const EdgeInsets.only(top: 470),
                              child: SearchFarmDropDownWidget(
                                  mIsTaskFarmSearch: false),
                            )
                          : provider.mShowProjectListWidget
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 570),
                                  child: SearchProjectsDropDownWidget(),
                                )
                              : provider.mShowAttendeeListWidget
                                  ? Padding(
                                      padding: EdgeInsets.only(top: 680),
                                      child: SearchAttendeesDropDownWidget(),
                                    )
                                  : SizedBox()
                    ],
                  ),
                ),
                actions: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: AddTextButtonWidget(
                            text: "Cancel".tr(),
                            colors: HexColor('#F5F6FA'),
                            onPress: () {
                              Navigator.pop(context);
                            },
                          ),
                          flex: 1,
                        ),
                        SizedBox(width: 22),
                        Expanded(
                          flex: 2,
                          child: CommonOutlinedButton(
                            mOnPressed: () async {
                              setState(() {
                                provider.isDataNotEmpty = true;
                              });
                              if (provider.mContactMomentSubjectController.text
                                  .isEmpty) {
                                return;
                              }
                              if (provider
                                  .mDateTimeTextController.text.isEmpty) {
                                return;
                              }
                              if (provider.mAttendeesSelectedList.isEmpty) {
                                return;
                              }
                              if (provider.mContactMomentType ==
                                  "Select Contact Moment") {
                                return;
                              }

                              List<String> attendeesList = [];
                              for (var i = 0;
                                  i < provider.mAttendeesSelectedList.length;
                                  i++) {
                                attendeesList.add(provider
                                    .mAttendeesSelectedList[i].id!
                                    .toString());
                              }

                              // provider.load = true;
                              // setState(() {});

                              String newDate = DateFormat('yyyy-MM-dd')
                                  .format(provider.mSelectedDateTimeForTask)
                                  .toString();

                              PostEntrepreneurContactMomentRequest postObject =
                                  PostEntrepreneurContactMomentRequest(
                                attendees: attendeesList,
                                // [provider.mSearchedAttendeeId.toString()],
                                contactMomentDate: newDate,
                                contactMomentType: [
                                  provider.mContactMomentType
                                ],
                                contactNotes: provider.internalNotesResult,
                                contactSubject: provider
                                    .mContactMomentSubjectController.text,
                                farmId: provider.selectedFarmID,
                                projectId: provider.mSearchedProjectId == 0
                                    ? ""
                                    : provider.mSearchedProjectId.toString(),
                                attendeeNotes: provider.attendeesNotesResult,
                                contactSubjects: provider.subjectsListForPost,
                                tasks: provider.tasksListForPost,
                              );
                              await provider
                                  .createNewEntrepreneurContactMomentData(
                                      this.widget.mEntrepreneurID!, postObject);
                              await provider.getEntrepreneurContactMomentData(
                                  this.widget.mEntrepreneurID!);
                              Navigator.of(context).pop('yes');
                            },
                            mLabelText: "Complete".tr(),
                            mButtonColor: HexColor('#F5DB3C'),
                            mTextColor: HexColor('#000000'),
                          ),
                        ),
                        SizedBox(width: 13),
                        Expanded(
                          flex: 1,
                          child: AddTextButtonWidget(
                            text: "Add Notes".tr(),
                            colors: HexColor('#F6DC3D'),
                            onPress: () async {
                              setState(() {
                                provider.isDataNotEmpty = true;
                                provider.customTileExpanded = false;
                              });
                              if (provider.mContactMomentSubjectController.text
                                  .isEmpty) {
                                return;
                              }
                              if (provider
                                  .mDateTimeTextController.text.isEmpty) {
                                return;
                              }
                              if (provider.mAttendeesSelectedList.isEmpty) {
                                return;
                              }
                              if (provider.mContactMomentType ==
                                  "Select Contact Moment") {
                                return;
                              }
                              String attendees = "";
                              for (var i = 0;
                                  i < provider.mAttendeesSelectedList.length;
                                  i++) {
                                if (i == 0) {
                                  attendees = attendees +
                                      "${provider.mAttendeesSelectedList[i].name}";
                                } else {
                                  attendees = attendees +
                                      ", ${provider.mAttendeesSelectedList[i].name}";
                                }
                              }

                              Navigator.pop(context);

                              showDialog(
                                  context: this.context,
                                  builder: (context) {
                                    return AddContactMomentScreen(
                                      mDisplayDataOnly: false,
                                      mHeader: this.widget.entrepreneurName,
                                      mHeaderDate:
                                          provider.mDateTimeTextController.text,
                                      mHeaderAttendees: attendees,
                                      mHeaderContactMomentSubject: provider
                                          .mContactMomentSubjectController.text,
                                      mHeaderKindOfContact:
                                          provider.mContactMomentType ==
                                                  "Select Contact Moment"
                                              ? ""
                                              : provider.mContactMomentType,
                                      mHeaderRelatedFarm: provider
                                          .mContactFarmSearchController.text,
                                      mHeaderRelatedProject: provider
                                          .mProjectSearchController.text,
                                    );
                                  }).then((value) async {
                                if (value == true) {
                                  List<String> attendeesList = [];
                                  for (var i = 0;
                                      i <
                                          provider
                                              .mAttendeesSelectedList.length;
                                      i++) {
                                    attendeesList.add(provider
                                        .mAttendeesSelectedList[i].id!
                                        .toString());
                                  }

                                  // provider.load = true;
                                  // setState(() {});

                                  String newDate = DateFormat('yyyy-MM-dd')
                                      .format(provider.mSelectedDateTimeForTask)
                                      .toString();

                                  PostEntrepreneurContactMomentRequest
                                      postObject =
                                      PostEntrepreneurContactMomentRequest(
                                    attendees: attendeesList,
                                    // [provider.mSearchedAttendeeId.toString()],
                                    contactMomentDate: newDate,
                                    contactMomentType: [
                                      provider.mContactMomentType
                                    ],
                                    contactNotes: provider.internalNotesResult,
                                    contactSubject: provider
                                        .mContactMomentSubjectController.text,
                                    farmId: provider.selectedFarmID,
                                    projectId: provider.mSearchedProjectId == 0
                                        ? ""
                                        : provider.mSearchedProjectId
                                            .toString(),
                                    attendeeNotes:
                                        provider.attendeesNotesResult,
                                    contactSubjects:
                                        provider.subjectsListForPost,
                                    tasks: provider.tasksListForPost,
                                  );
                                  await provider
                                      .createNewEntrepreneurContactMomentData(
                                          this.widget.mEntrepreneurID!,
                                          postObject);
                                  await provider
                                      .getEntrepreneurContactMomentData(
                                          this.widget.mEntrepreneurID!);
                                  //    Navigator.of(context).pop('yes');
                                } else {
                                  print("Do not add Contact Moment");
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: provider.load,
              child: SizedBox(
                child: Center(child: CircularProgressIndicator()),
                width: getWidth(context),
                height: getHeight(context),
              ),
            ),
          ],
        ),
      );
    });
  }
}
