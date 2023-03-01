import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/contacts/search_attendees_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/contacts/search_farm_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/contacts/search_projects_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/contacts/widgets/add_subject_dialog_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/contacts/widgets/icon_button_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/contacts/widgets/title_widget.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/hex_color.dart';
import 'package:wij_land/utils/responsive.dart';

import '../../../../../app_common_widgets/common_elevated_button.dart';
import '../../../../../app_common_widgets/common_outlined_icon_button.dart';
import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../app_common_widgets/on_hover.dart';
import '../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../app_common_widgets/text_widget.dart';
import '../../../../../models/entrepreneur/request/post_entrepreneur_contact_moment_request.dart';
import '../../../../../models/entrepreneur/request/post_entrepreneur_contact_subject_request.dart';
import '../../../../../models/entrepreneur/request/subject_selection_request_model.dart';
import '../../../../../models/entrepreneur/response/get_entrepreneur_contact_moment_response.dart';
import '../../../../../providers/entrepreneur/entrepreneur_contact_moment_provider.dart';
import '../../../../../utils/app_snackbars.dart';
import '../../../../../utils/controller.dart';
import '../../../../../utils/styles.dart';

class ContactMomentsDetailsViewWidget extends StatefulWidget {
  final int mEntrepreneurID, mContactMomentID, mIndex;
  final ContactMomentsModel contactMomentResponse;
  final String? title;

  const ContactMomentsDetailsViewWidget({
    Key? key,
    required this.contactMomentResponse,
    required this.mContactMomentID,
    required this.mEntrepreneurID,
    required this.mIndex,
    this.title,
  }) : super(key: key);

  @override
  State<ContactMomentsDetailsViewWidget> createState() => _ContactMomentsDetailsViewWidgetState();
}

class _ContactMomentsDetailsViewWidgetState extends State<ContactMomentsDetailsViewWidget> {
  double _containerHeight = 70.0;

  String result = '';
  final HtmlEditorController controller = HtmlEditorController();
  List<ContactSubjects> subjectsList = [];
  List<Tasks> tasksList = [];

  @override
  void initState() {
    // print("Coming Here : ${widget.contactMomentResponse.toJson()}");
    if (widget.contactMomentResponse.contactSubjects != null || widget.contactMomentResponse.contactSubjects != []) {
      subjectsList = widget.contactMomentResponse.contactSubjects!;
    }
    if (widget.contactMomentResponse.tasks != null || widget.contactMomentResponse.tasks != []) {
      tasksList = widget.contactMomentResponse.tasks!;
    }

    final provider = Provider.of<EntrepreneurContactMomentScreenProvider>(context, listen: false);
    provider.mShowProjectListWidget = false;

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
        provider.searchAttendees(value: provider.mAttendeesSearchController.text);
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
    return Consumer<EntrepreneurContactMomentScreenProvider>(builder: (context, _provider, widget) {
      return Container(
        color: HexColor('#F9F9F9'),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                _provider.doUpdate
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 120,
                            child: CommonElevatedButton(
                              mOnTap: () {
                                setState(() {
                                  _provider.doUpdate = !_provider.doUpdate;
                                });
                              },
                              mButtonText: "Cancel".tr(),
                              mButtonColor: Colors.white,
                            ),
                          ),
                          SizedBox(width: 12),
                          SizedBox(
                            width: 120,
                            child: CommonElevatedButton(
                              mOnTap: () async {
                                if (_provider.mContactMomentSubjectController.text.isEmpty) {
                                  showSnack("Contact moment subject is required !");

                                  return;
                                }
                                if (_provider.mContactMomentType.isEmpty) {
                                  showSnack("Kind of contact is required !");
                                  return;
                                }
                                if (_provider.mDateTimeTextController.text.isEmpty) {
                                  showSnack("Date is required!");

                                  return;
                                }

                                if (_provider.mAttendeesSelectedList.isEmpty) {
                                  showSnack("Attendees are required!");
                                  return;
                                }

                                var internalNotes = await _provider.internalNotesController.getText();
                                var attendeeNotes = await _provider.attendeesNotesController.getText();

                                if (internalNotes.isNotEmpty) {
                                  setState(() {
                                    _provider.internalNotesResult = internalNotes;
                                  });
                                }

                                if (attendeeNotes.isNotEmpty) {
                                  setState(() {
                                    _provider.attendeesNotesResult = attendeeNotes;
                                  });
                                }
                                // provider.load = true;
                                // setState(() {});
                                List<ContactSubjectsPost> newSubjectsList = [];
                                List<TasksPost> newTasksList = [];
                                newSubjectsList.clear();
                                newTasksList.clear();
                                for (var i = 0; i < subjectsList.length; i++) {
                                  newSubjectsList
                                      .add(ContactSubjectsPost(contactSubject: subjectsList[i].subject, description: subjectsList[i].description));
                                }

                                for (var i = 0; i < tasksList.length; i++) {
                                  newTasksList.add(
                                    TasksPost(
                                      taskDueDate: tasksList[i].taskDueDate,
                                      taskDescription: tasksList[i].taskDescription,
                                      taskStatus: tasksList[i].taskStatus,
                                      assignedById: authController.myUser.value.id.toString(),
                                      assignedToId: tasksList[i].assignedTo!.id.toString(),
                                      // farmId: tasksList[i].farm.,
                                      // projectId: tasksList[i].project,  //TODO : These ids need from backend
                                    ),
                                  );
                                }

                                List<Attendees> attendeesListForShow = [];

                                for (var i = 0; i < _provider.mAttendeesSelectedList.length; i++) {
                                  attendeesListForShow
                                      .add(Attendees(id: _provider.mAttendeesSelectedList[i].id, name: _provider.mAttendeesSelectedList[i].name));
                                }

                                setState(() {
                                  this.widget.contactMomentResponse.contactMomentDate = _provider.mDateTimeTextController.text;
                                  if (_provider.internalNotesResult.isEmpty) {
                                    _provider.internalNotesResult = this.widget.contactMomentResponse.contactNotes ?? "";
                                  }
                                  this.widget.contactMomentResponse.contactSubject = _provider.mContactMomentSubjectController.text;
                                  this.widget.contactMomentResponse.attendeeNote ?? "";
                                  _provider.mContactMomentType = _provider.mContactMomentType;
                                  this.widget.contactMomentResponse.attendees = attendeesListForShow;

                                  _provider.doUpdate = !_provider.doUpdate;
                                });
                                List<String> attendeesList = [];
                                for (var i = 0; i < _provider.mAttendeesSelectedList.length; i++) {
                                  attendeesList.add(_provider.mAttendeesSelectedList[i].id!.toString());
                                }

                                PostEntrepreneurContactMomentRequest updatedObject = PostEntrepreneurContactMomentRequest(
                                  attendees: attendeesList,
                                  // [_provider.mSearchedAttendeeId.toString()],
                                  contactMomentDate: DateFormat('yyyy-MM-dd').format(_provider.mSelectedDateTimeForTask),
                                  contactMomentType: [_provider.mContactMomentType],
                                  contactNotes: _provider.internalNotesResult,
                                  contactSubject: _provider.mContactMomentSubjectController.text,
                                  farmId: _provider.selectedFarmID,
                                  projectId: _provider.mSearchedProjectId == 0 ? "" : _provider.mSearchedProjectId.toString(),
                                  attendeeNotes: _provider.attendeesNotesResult,
                                  contactSubjects: newSubjectsList,
                                  tasks: newTasksList,
                                );

                                await _provider.updateContactMoment(
                                  mEntrepreneurID: this.widget.mEntrepreneurID,
                                  contactMomentId: this.widget.mContactMomentID,
                                  updateModel: updatedObject,
                                );

                                await _provider.getEntrepreneurContactMomentData(
                                  this.widget.mEntrepreneurID,
                                );

//                                 Navigator.of(context).pop('yes');
                              },
                              mButtonText: "Save & Exit".tr(),
                              mButtonColor: HexColor('#F7EC4D'),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButtonWidget(
                            mIcon: Icons.edit,
                            mOnTap: () {
                              setState(() {
                                _provider.mDateTimeTextController.text = this.widget.contactMomentResponse.contactMomentDate!;
                                _provider.mContactMomentType = this.widget.contactMomentResponse.contactMomentType!;
                                if (_provider.internalNotesResult.isEmpty) {
                                  _provider.internalNotesResult = this.widget.contactMomentResponse.contactNotes ?? "";
                                }
                                _provider.mContactMomentSubjectController.text = this.widget.contactMomentResponse.contactSubject!;
                                _provider.attendeesNotesResult = this.widget.contactMomentResponse.attendeeNote ?? "";

                                _provider.doUpdate = !_provider.doUpdate;
                              });
                            },
                            mShowBorder: false,
                          ),
                          SizedBox(width: 12),
                          IconButtonWidget(
                            mIcon: Icons.close,
                            mOnTap: () async {
                              Navigator.pop(context);
                            },
                            mShowBorder: false,
                          ),
                          SizedBox(width: 12),
                          OnHover(builder: (isHover) {
                            return Material(
                              elevation: 1,
                              color: isHover ? lightGreen : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: PopupMenuButton<int>(
                                  iconSize: !Responsive.isDesktop(context) ? 15 : 20,
                                  itemBuilder: (context) {
                                    return <PopupMenuEntry<int>>[
                                      PopupMenuItem(
                                        child: Text(
                                          'Delete'.tr(),
                                          style: TextStyle(fontFamily: Montserrat_Medium),
                                        ),
                                        onTap: () {
                                          _provider.deleteContactMoment(
                                            contactMomentId: this.widget.mContactMomentID,
                                            mEntrepreneurID: this.widget.mEntrepreneurID,
                                            index: this.widget.mIndex,
                                            context: context,
                                          );
                                        },
                                      )
                                    ];
                                  }),
                            );
                          })
                        ],
                      ),
                SizedBox(height: 10),
                _provider.doUpdate
                    ? Container(
                        width: getWidth(context),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: "${this.widget.title}",
                                            size: !Responsive.isDesktop(context) ? 20 : 26,
                                            weight: FontWeight.bold,
                                            color: HexColor('#A71832'),
                                          ),
                                          SizedBox(height: 29),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: ContactMomentUpdateTitlesWidget(
                                                  mKeyText: 'Attendees'.tr(),
                                                  mIsMandatory: true,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  children: [
                                                    TextFormField(
                                                      controller: _provider.mAttendeesSearchController,
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
                                                    Wrap(
                                                        children: _provider.mAttendeesSelectedList.map((e) {
                                                      return IntrinsicWidth(
                                                          child: Row(
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets.only(left: 10),
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(7),
                                                              color: Colors.blueGrey[50],
                                                            ),
                                                            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                                            child: Text(
                                                              e.name ?? "",
                                                              style: TextStyle(
                                                                fontSize: 13,
                                                                fontFamily: Montserrat_Medium,
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            child: Icon(Icons.close),
                                                            onTap: () {
                                                              _provider.mAttendeesSelectedList.remove(e);
                                                              setState(() {});
                                                            },
                                                          )
                                                        ],
                                                      ));
                                                    }).toList()),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 29),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: ContactMomentUpdateTitlesWidget(
                                                  mKeyText: 'Contact Moment Subject'.tr(),
                                                  mIsMandatory: true,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: TextWidgetField(
                                                  controller: _provider.mContactMomentSubjectController,
                                                  enabled: true,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 29),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: ContactMomentUpdateTitlesWidget(
                                                  mKeyText: 'Kind of Contact'.tr(),
                                                  mIsMandatory: true,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: RealDropDownWidget(
                                                  value: _provider.mContactMomentType,
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      _provider.mContactMomentType = newValue;
                                                    });
                                                  },
                                                  items: _provider.mContactMomentTypDropDown.map<DropdownMenuItem<String>>((String value) {
                                                    return DropdownMenuItem<String>(value: value, child: Text(value));
                                                  }).toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 29),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: ContactMomentUpdateTitlesWidget(
                                                  mKeyText: 'Related Farm'.tr(),
                                                  mIsMandatory: false,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: TextFormField(
                                                  controller: _provider.mContactFarmSearchController,
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
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 29),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: ContactMomentUpdateTitlesWidget(
                                                  mKeyText: 'Related Project'.tr(),
                                                  mIsMandatory: false,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: TextFormField(
                                                  controller: _provider.mProjectSearchController,
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
                                              ),
                                            ],
                                          )
                                        ],
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                      ),
                                      _provider.mShowFarmListWidget
                                          ? Padding(
                                              padding: const EdgeInsets.only(top: 50),
                                              child: SearchFarmDropDownWidget(mIsTaskFarmSearch: false),
                                            )
                                          : _provider.mShowAttendeeListWidget
                                              ? Padding(
                                                  padding: const EdgeInsets.only(top: 100),
                                                  child: SearchAttendeesDropDownWidget(),
                                                )
                                              : _provider.mShowProjectListWidget
                                                  ? Padding(
                                                      padding: const EdgeInsets.only(top: 400),
                                                      child: SearchProjectsDropDownWidget(),
                                                    )
                                                  : SizedBox()
                                    ],
                                  ),
                                  flex: 2,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                                      SizedBox(height: 50),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ContactMomentUpdateTitlesWidget(
                                              mKeyText: 'Date'.tr(),
                                              mIsMandatory: true,
                                            ),
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                _provider.pickDate(context: context, enablePreviousDates: true);
                                              },
                                              child: TextWidgetField(
                                                controller: _provider.mDateTimeTextController,
                                                enabled: false,
                                                suffixIcon: const Icon(Icons.calendar_today),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ]),
                                  ),
                                  flex: 2,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : ExpansionTile(
                        title: Text(
                          "${this.widget.title}",
                          style: TextStyle(
                            fontSize: Responsive.isMobile(context) ? 25 : 35,
                            color: HexColor('#A71832'),
                            fontWeight: FontWeight.bold,
                            fontFamily: Montserrat_Medium,
                          ),
                        ),
                        backgroundColor: Colors.white,
                        collapsedBackgroundColor: Colors.white,
                        trailing: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                this.widget.contactMomentResponse.contactMomentDate!.isEmpty ||
                                        this.widget.contactMomentResponse.contactMomentDate == null
                                    ? ""
                                    : DateFormat('dd-MM-yyyy').format(DateTime.parse(this.widget.contactMomentResponse.contactMomentDate!)),
                                style: TextStyle(
                                  fontSize: Responsive.isMobile(context) ? 14 : 18,
                                  color: HexColor('#231F20'),
                                  fontFamily: Montserrat_Medium,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.15,
                              ),
                              OnHover(
                                builder: (isHover) {
                                  return Material(
                                    elevation: 1,
                                    color: isHover ? lightGreen : Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(
                                          color: HexColor('#231F20'),
                                          width: 0.2,
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        _provider.customTileExpanded ? Icons.expand_less : Icons.expand_more,
                                        size: Responsive.isMobile(context) ? 15 : 20,
                                        color: isHover ? Colors.white : HexColor('#231F20'),
                                      ),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                        children: _provider.listOfExpandedWidgets.map((e) {
                          return ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: e == 0
                                              ? "Attendees".tr()
                                              : e == 1
                                                  ? "Contact Moment Subject".tr()
                                                  : e == 2
                                                      ? "" // "Kind Of Contact".tr()
                                                      : e == 3
                                                          ? "Related Farm".tr()
                                                          : "Related Project".tr(),
                                          style: TextStyle(
                                            color: HexColor('#231F20'),
                                            fontSize: Responsive.isMobile(context) ? 12 : 18.0,
                                            fontFamily: Montserrat_Medium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: e == 0
                                              ? listOfAttachedString(this.widget.contactMomentResponse.attendees == null ||
                                                      this.widget.contactMomentResponse.attendees == []
                                                  ? []
                                                  : this.widget.contactMomentResponse.attendees!)
                                              : e == 1
                                                  ? this.widget.contactMomentResponse.contactSubject ?? ""
                                                  : e == 2
                                                      ? _provider.mContactMomentType
                                                      : e == 3
                                                          ? _provider.mContactFarmSearchController.text
                                                          : _provider.mProjectSearchController.text,
                                          style: TextStyle(
                                            color: HexColor('#231F20'),
                                            fontSize: Responsive.isMobile(context) ? 12 : 18.0,
                                            fontFamily: Montserrat_Medium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }).toList(),
                        onExpansionChanged: (bool expanded) {
                          setState(() => _provider.customTileExpanded = expanded);
                        },
                      ),

                SizedBox(height: 10),
                _provider.doUpdate
                    ? Container(
                        width: getWidth(context),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                            Text(
                              "Meeting Notes ".tr(),
                              style: TextStyle(
                                fontSize: Responsive.isMobile(context) ? 16 : 20,
                                color: HexColor('#48883E'),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              // height: 150,
                              width: getWidth(context),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: SizedBox(
                                height: 450,
                                child: HtmlEditor(
                                  controller: _provider.internalNotesController,
                                  callbacks: Callbacks(
                                    onChangeContent: (str) {
                                      print('content $str');
                                    },
                                    onChangeCodeview: (str) {},
                                  ),
                                  htmlEditorOptions: HtmlEditorOptions(
                                    hint: "Your text here...".tr(),
                                    initialText: _provider.internalNotesResult,
                                    autoAdjustHeight: true,
                                  ),
                                  otherOptions: OtherOptions(
                                    // height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  htmlToolbarOptions: HtmlToolbarOptions(
                                    buttonBorderWidth: 1,
                                    buttonBorderColor: Colors.red,
                                  ),
                                ),
                              ),
                            )
                          ]),
                        ),
                      )
                    : SizedBox(),
                SizedBox(height: _provider.doUpdate ? 10 : 0),
                _provider.doUpdate
                    ? Container(
                        width: getWidth(context),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                            Text(
                              "Attendee Notes".tr(),
                              style: TextStyle(
                                fontSize: Responsive.isMobile(context) ? 16 : 20,
                                color: HexColor('#48883E'),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              height: 450,
                              width: getWidth(context),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: SizedBox(
                                // height: 150,
                                child: HtmlEditor(
                                  controller: _provider.attendeesNotesController,
                                  htmlEditorOptions: HtmlEditorOptions(
                                    hint: "",
                                    autoAdjustHeight: true,
                                    initialText: _provider.attendeesNotesResult,
                                  ),
                                  otherOptions: OtherOptions(
                                    // height: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  htmlToolbarOptions: HtmlToolbarOptions(
                                    buttonBorderWidth: 1,
                                    buttonBorderColor: Colors.red,
                                  ),
                                ),
                              ),
                            )
                          ]),
                        ),
                      )
                    : SizedBox(),

                SizedBox(height: _provider.doUpdate ? 10 : 0),
                Container(
                  width: getWidth(context),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _provider.doUpdate
                            ? SizedBox()
                            : Text(
                                "Internal Notes".tr(),
                                style: TextStyle(
                                  fontSize: Responsive.isMobile(context) ? 16 : 20,
                                  color: HexColor('#48883E'),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: Montserrat_Medium,
                                ),
                              ),
                        _provider.doUpdate ? SizedBox() : SizedBox(height: 15),
                        _provider.doUpdate
                            ? SizedBox()
                            : HtmlWidget(
                                _provider.internalNotesResult,
                                textStyle: TextStyle(
                                  fontSize: Responsive.isMobile(context) ? 12 : 18,
                                  color: HexColor('#231F20'),
                                  fontFamily: Montserrat_Medium,
                                ),
                              ),
                        SizedBox(height: _provider.doUpdate ? 0 : 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subjects".tr(),
                              style: TextStyle(
                                fontSize: Responsive.isMobile(context) ? 16 : 20,
                                color: HexColor('#48883E'),
                                fontWeight: FontWeight.bold,
                                fontFamily: Montserrat_Medium,
                              ),
                            ),
                            SizedBox(
                              width: 158,
                              child: CommonOutlinedIconButton(
                                mLabelText: "Subject".tr(),
                                mButtonAndTextColor: HexColor('#48883E'),
                                mOnPressed: () {
                                  setState(() {
                                    _provider.clearAllSelectedSubjects();
                                    _provider.mSubjectSearchController.clear();
                                    _provider.mSelectedSubjectByUser = "";
                                    _provider.subjectDescriptionInitialText = "";
                                  });
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    useSafeArea: true,
                                    builder: (BuildContext dialogContext) {
                                      return Dialog(
                                        backgroundColor: Colors.transparent,
                                        elevation: 8,
                                        child: AlertDialog(
                                          backgroundColor: Colors.white,
                                          title: Padding(
                                            padding: const EdgeInsets.only(right: 12, left: 12),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: CustomText(
                                                    text: "Subjects".tr(),
                                                    size: !Responsive.isDesktop(context) ? 20 : 26,
                                                    weight: FontWeight.bold,
                                                    color: HexColor('#231F20'),
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    Navigator.pop(dialogContext);
                                                  },
                                                  icon: Icon(
                                                    Icons.close,
                                                    size: 15,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          content: AddNewSubjectDialogWidget(),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadiusDirectional.circular(19),
                                          ),
                                          actions: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 12, bottom: 12),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    child: CommonElevatedButton(
                                                      mOnTap: () {
                                                        Navigator.pop(dialogContext);
                                                      },
                                                      mButtonText: 'Cancel'.tr(),
                                                      mButtonColor: HexColor('#EBEDF4'),
                                                    ),
                                                    width: 120,
                                                  ),
                                                  SizedBox(width: 15),
                                                  SizedBox(
                                                    child: CommonElevatedButton(
                                                      mOnTap: () async {
                                                        print("Coming here 1");
                                                        // List<String> mTagsList = [];
                                                        // mTagsList.clear();
                                                        // setState(() {});
                                                        // for (var i = 0; i < _provider.mCheckBoxDataList.length; i++) {
                                                        //   if (_provider.mCheckBoxDataList[i].status) {
                                                        //     mTagsList.add(_provider.mCheckBoxDataList[i].title);
                                                        //   }
                                                        // }

                                                        var txt = await _provider.subjectController.getText();
                                                        setState(() {
                                                          _provider.subjectDescription = txt;
                                                        });

                                                        if (_provider.mSelectedSubjectByUser.isEmpty) {
                                                          AppSnackBars.showWarningSnackBar(context: dialogContext, message: "Select any Tag!");
                                                          return;
                                                        } else if (txt.isEmpty) {
                                                          AppSnackBars.showWarningSnackBar(
                                                              context: dialogContext, message: "Description is required!");
                                                          return;
                                                        } else {
                                                          var postEntrepreneurContactSubjectRequest = PostEntrepreneurContactSubjectRequest(
                                                            contactSubject: [_provider.mSelectedSubjectByUser], // mTagsList,
                                                            description: _provider.subjectDescription,
                                                          );

                                                          print("ADD NEW SUBJECT Request Object : ${postEntrepreneurContactSubjectRequest.toJson()}");
                                                          Navigator.pop(dialogContext);
                                                          await _provider.addNewSubjectInUpdateContactMoment(
                                                            mEntrepreneurID: this.widget.mEntrepreneurID,
                                                            mContactMomentId: this.widget.mContactMomentID,
                                                            context: context,
                                                            postEntrepreneurContactSubjectRequest: postEntrepreneurContactSubjectRequest,
                                                          );
                                                          print("ADD NEW SUBJECT RESONSE : ${_provider.subjectAddResponseInUpdate.toJson()}");
                                                          setState(() {
                                                            subjectsList.add(
                                                              ContactSubjects(
                                                                description: _provider.subjectAddResponseInUpdate.data!.description,
                                                                id: _provider.subjectAddResponseInUpdate.data!.id,
                                                                insertedAt: _provider.subjectAddResponseInUpdate.data!.insertedAt,
                                                                subject: _provider.subjectAddResponseInUpdate.data!.subject,
                                                                updatedAt: _provider.subjectAddResponseInUpdate.data!.updatedAt,
                                                                writtenBy: _provider.subjectAddResponseInUpdate.data!.writtenBy.toString(),
                                                                writtenById: _provider.subjectAddResponseInUpdate.data!.writtenById,
                                                              ),
                                                            );
                                                          });
                                                        }
                                                      },
                                                      mButtonText: 'Save'.tr(),
                                                      mButtonColor: HexColor('#F7EC4D'),
                                                    ),
                                                    width: 120,
                                                  )
                                                ],
                                                mainAxisAlignment: MainAxisAlignment.end,
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 30),
                        Column(
                          children: subjectsList
                              .map(
                                (subject) => Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 50,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            color: HexColor('#EBEDF4'),
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 2, right: 2),
                                              child: Text(
                                                subject.subject?[0] ?? "",
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontSize: Responsive.isMobile(context) ? 10 : 20,
                                                  color: HexColor('#000000'),
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: Montserrat_Medium,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Expanded(
                                        child: HtmlWidget(
                                          subject.description ?? "",
                                          textStyle: TextStyle(fontFamily: Montserrat_Medium),
                                        ),
                                        flex: 7,
                                      ),
                                      SizedBox(width: 20),
                                      Expanded(
                                        child: Responsive.isMobile(context)
                                            ? Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  IconButtonWidget(
                                                    mIcon: Icons.edit,
                                                    mOnTap: () {
                                                      _provider.clearAllSelectedSubjects();
                                                      _provider.mCheckBoxDataList.clear();

                                                      setState(() {
                                                        _provider.mSubjectSearchController.text = subject.subject![0];
                                                        _provider.subjectController.setText(subject.description!);
                                                        _provider.mSelectedSubjectByUser = subject.subject![0];
                                                        _provider.subjectDescriptionInitialText = subject.description!;
                                                      });
                                                      for (var i = 0; i < _provider.projectDropdown.data!.length; i++) {
                                                        bool isValueMatched = false;
                                                        for (var j = 0; j < subject.subject!.length; j++) {
                                                          if (subject.subject![j] == _provider.projectDropdown.data![i].name) {
                                                            isValueMatched = true;
                                                          }
                                                        }
                                                        if (isValueMatched) {
                                                          _provider.mCheckBoxDataList.add(
                                                            SubjectSelectionRequestModel(
                                                              status: true,
                                                              title: _provider.projectDropdown.data![i].name!,
                                                            ),
                                                          );
                                                        } else {
                                                          _provider.mCheckBoxDataList.add(
                                                            SubjectSelectionRequestModel(
                                                              status: false,
                                                              title: _provider.projectDropdown.data![i].name!,
                                                            ),
                                                          );
                                                        }
                                                      }

                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext dialogContext) {
                                                          return AlertDialog(
                                                            backgroundColor: Colors.white,
                                                            title: Padding(
                                                              padding: const EdgeInsets.only(right: 12, left: 12),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Subjects".tr(),
                                                                    style: TextStyle(
                                                                      fontSize: Responsive.isMobile(context) ? 16 : 26,
                                                                      color: HexColor('#231F20'),
                                                                      fontWeight: FontWeight.bold,
                                                                      fontFamily: Montserrat_Medium,
                                                                    ),
                                                                  ),
                                                                  IconButton(
                                                                    onPressed: () {
                                                                      Navigator.pop(dialogContext);
                                                                    },
                                                                    icon: Icon(
                                                                      Icons.close,
                                                                      size: 15,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            content: AddNewSubjectDialogWidget(),
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadiusDirectional.circular(19),
                                                            ),
                                                            actions: [
                                                              Padding(
                                                                padding: const EdgeInsets.only(right: 12, bottom: 12),
                                                                child: Row(
                                                                  children: [
                                                                    SizedBox(
                                                                      child: CommonElevatedButton(
                                                                        mOnTap: () {
                                                                          Navigator.pop(dialogContext);
                                                                        },
                                                                        mButtonText: 'Cancel'.tr(),
                                                                        mButtonColor: HexColor('#EBEDF4'),
                                                                      ),
                                                                      width: 120,
                                                                    ),
                                                                    SizedBox(width: 15),
                                                                    SizedBox(
                                                                      child: CommonElevatedButton(
                                                                        mOnTap: () async {
                                                                          print("Coming here 2");
                                                                          // List<String> mTagsList = [];
                                                                          // mTagsList.clear();
                                                                          // for (var i = 0; i < _provider.mCheckBoxDataList.length; i++) {
                                                                          //   if (_provider.mCheckBoxDataList[i].status) {
                                                                          //     mTagsList.add(_provider.mCheckBoxDataList[i].title);
                                                                          //   }
                                                                          // }

                                                                          var txt = await _provider.subjectController.getText();
                                                                          setState(() {
                                                                            _provider.subjectDescription = txt;
                                                                          });

                                                                          if (_provider.mSelectedSubjectByUser.isEmpty) {
                                                                            AppSnackBars.showWarningSnackBar(
                                                                                context: dialogContext, message: "Select any Tag!");
                                                                            return;
                                                                          } else if (txt.isEmpty) {
                                                                            AppSnackBars.showWarningSnackBar(
                                                                                context: dialogContext, message: "Description is required!".tr());
                                                                            return;
                                                                          } else {
                                                                            Navigator.pop(dialogContext);
                                                                            var index = subjectsList.indexOf(subject);
                                                                            _provider.updateContactMomentSubject(
                                                                              mEntrepreneurID: this.widget.mEntrepreneurID,
                                                                              contactMomentId: this.widget.mContactMomentID,
                                                                              contactMomentSubjectId: subjectsList[index].id!,
                                                                              contactSubjectsPost: ContactSubjectsPost(
                                                                                contactSubject: [_provider.mSelectedSubjectByUser],
                                                                                description: _provider.subjectDescription,
                                                                              ),
                                                                            );

                                                                            setState(() {
                                                                              subjectsList[index].description = _provider.subjectDescription;
                                                                              subjectsList[index].subject = [_provider.mSelectedSubjectByUser];
                                                                            });
                                                                          }
                                                                        },
                                                                        mButtonText: 'Update'.tr(),
                                                                        mButtonColor: HexColor('#F7EC4D'),
                                                                      ),
                                                                      width: 120,
                                                                    )
                                                                  ],
                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                ),
                                                              )
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    mShowBorder: true,
                                                  ),
                                                  SizedBox(height: 10),
                                                  IconButtonWidget(
                                                    mIcon: Icons.delete,
                                                    mOnTap: () {
                                                      var index = subjectsList.indexOf(subject);
                                                      print("Index    : $index");
                                                      _provider.deleteSubjectFromContactMoment(
                                                        mEntrepreneurID: this.widget.mEntrepreneurID,
                                                        contactMomentId: this.widget.mContactMomentID,
                                                        subjectID: subjectsList[index].id!,
                                                        context: context,
                                                      );

                                                      subjectsList.removeAt(index);
                                                      setState(() {});
                                                    },
                                                    mShowBorder: true,
                                                  ),
                                                ],
                                              )
                                            : Row(
                                                children: [
                                                  IconButtonWidget(
                                                    mIcon: Icons.edit,
                                                    mOnTap: () {
                                                      _provider.clearAllSelectedSubjects();
                                                      _provider.mCheckBoxDataList.clear();
                                                      setState(() {
                                                        _provider.mSubjectSearchController.text = subject.subject![0];
                                                        _provider.mSelectedSubjectByUser = subject.subject![0];
                                                        _provider.subjectController.setText(subject.description!);
                                                        _provider.subjectDescriptionInitialText = subject.description!;
                                                      });
                                                      for (var i = 0; i < _provider.projectDropdown.data!.length; i++) {
                                                        bool isValueMatched = false;
                                                        for (var j = 0; j < subject.subject!.length; j++) {
                                                          if (subject.subject![j] == _provider.projectDropdown.data![i].name) {
                                                            isValueMatched = true;
                                                          }
                                                        }
                                                        if (isValueMatched) {
                                                          _provider.mCheckBoxDataList.add(
                                                            SubjectSelectionRequestModel(
                                                              status: true,
                                                              title: _provider.projectDropdown.data![i].name!,
                                                            ),
                                                          );
                                                        } else {
                                                          _provider.mCheckBoxDataList.add(
                                                            SubjectSelectionRequestModel(
                                                              status: false,
                                                              title: _provider.projectDropdown.data![i].name!,
                                                            ),
                                                          );
                                                        }
                                                      }

                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext dialogContext) {
                                                          return AlertDialog(
                                                            backgroundColor: Colors.white,
                                                            title: Padding(
                                                              padding: const EdgeInsets.only(right: 12, left: 12),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Subjects".tr(),
                                                                    style: TextStyle(
                                                                      fontSize: Responsive.isMobile(context) ? 16 : 26,
                                                                      color: HexColor('#231F20'),
                                                                      fontWeight: FontWeight.bold,
                                                                      fontFamily: Montserrat_Medium,
                                                                    ),
                                                                  ),
                                                                  IconButton(
                                                                    onPressed: () {
                                                                      Navigator.pop(dialogContext);
                                                                    },
                                                                    icon: Icon(
                                                                      Icons.close,
                                                                      size: 15,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            content: AddNewSubjectDialogWidget(),
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadiusDirectional.circular(19),
                                                            ),
                                                            actions: [
                                                              Padding(
                                                                padding: const EdgeInsets.only(right: 12, bottom: 12),
                                                                child: Row(
                                                                  children: [
                                                                    SizedBox(
                                                                      child: CommonElevatedButton(
                                                                        mOnTap: () {
                                                                          Navigator.pop(dialogContext);
                                                                        },
                                                                        mButtonText: 'Cancel'.tr(),
                                                                        mButtonColor: HexColor('#EBEDF4'),
                                                                      ),
                                                                      width: 120,
                                                                    ),
                                                                    SizedBox(width: 15),
                                                                    SizedBox(
                                                                      child: CommonElevatedButton(
                                                                        mOnTap: () async {
                                                                          // print("Coming here 3");
                                                                          // List<String> mTagsList = [];
                                                                          // mTagsList.clear();
                                                                          // for (var i = 0; i < _provider.mCheckBoxDataList.length; i++) {
                                                                          //   if (_provider.mCheckBoxDataList[i].status) {
                                                                          //     mTagsList.add(_provider.mCheckBoxDataList[i].title);
                                                                          //   }
                                                                          // }

                                                                          var txt = await _provider.subjectController.getText();
                                                                          setState(() {
                                                                            _provider.subjectDescription = txt;
                                                                          });

                                                                          if (_provider.mSelectedSubjectByUser.isEmpty) {
                                                                            AppSnackBars.showWarningSnackBar(
                                                                                context: dialogContext, message: "Select any Tag!".tr());
                                                                            return;
                                                                          } else if (txt.isEmpty) {
                                                                            AppSnackBars.showWarningSnackBar(
                                                                                context: dialogContext, message: "Description is required!".tr());
                                                                            return;
                                                                          } else {
                                                                            Navigator.pop(dialogContext);
                                                                            var index = subjectsList.indexOf(subject);
                                                                            _provider.updateContactMomentSubject(
                                                                              mEntrepreneurID: this.widget.mEntrepreneurID,
                                                                              contactMomentId: this.widget.mContactMomentID,
                                                                              contactMomentSubjectId: subjectsList[index].id!,
                                                                              contactSubjectsPost: ContactSubjectsPost(
                                                                                contactSubject: [_provider.mSelectedSubjectByUser],
                                                                                description: _provider.subjectDescription,
                                                                              ),
                                                                            );

                                                                            setState(() {
                                                                              subjectsList[index].description = _provider.subjectDescription;
                                                                              subjectsList[index].subject = [_provider.mSelectedSubjectByUser];
                                                                            });
                                                                          }
                                                                        },
                                                                        mButtonText: 'Update'.tr(),
                                                                        mButtonColor: HexColor('#F7EC4D'),
                                                                      ),
                                                                      width: 120,
                                                                    )
                                                                  ],
                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                ),
                                                              )
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    mShowBorder: true,
                                                  ),
                                                  SizedBox(width: 10),
                                                  IconButtonWidget(
                                                    mIcon: Icons.delete,
                                                    mOnTap: () {
                                                      var index = subjectsList.indexOf(subject);
                                                      print("Index    : $index");
                                                      _provider.deleteSubjectFromContactMoment(
                                                        mEntrepreneurID: this.widget.mEntrepreneurID,
                                                        contactMomentId: this.widget.mContactMomentID,
                                                        subjectID: subjectsList[index].id!,
                                                        context: context,
                                                      );

                                                      subjectsList.removeAt(index);
                                                      setState(() {});
                                                    },
                                                    mShowBorder: true,
                                                  ),
                                                ],
                                              ),
                                        flex: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                //
                // Container(
                //   width: getWidth(context),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(5),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(15.0),
                //     child: Column(
                //       children: [
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(
                //               "Tasks",
                //               style: TextStyle(
                //                 fontSize: Responsive.isMobile(context) ? 16 : 20,
                //                 color: HexColor('#48883E'),
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //             SizedBox(
                //               width: 158,
                //               child: CommonOutlinedIconButton(
                //                 mLabelText: "Tasks",
                //                 mButtonAndTextColor: HexColor('#48883E'),
                //                 mOnPressed: () {
                //                   setState(() {
                //                     _provider.clearTasksFields();
                //                   });
                //                   showDialog(
                //                     context: context,
                //                     builder: (BuildContext context) {
                //                       return AlertDialog(
                //                         title: Row(
                //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                           children: [
                //                             CustomText(
                //                               text: "Add Task",
                //                               size: !Responsive.isDesktop(context) ? 20 : 26,
                //                               weight: FontWeight.bold,
                //                               color: HexColor('#231F20'),
                //                             ),
                //                             IconButton(
                //                               onPressed: () {
                //                                 Navigator.of(context).pop();
                //                               },
                //                               icon: const Icon(
                //                                 Icons.close,
                //                                 size: 20,
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                         content: AddNewTaskDialogWidget(),
                //                         actions: [
                //                           Container(
                //                             padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                //                             child: Row(
                //                               mainAxisAlignment: MainAxisAlignment.end,
                //                               children: [
                //                                 AddTextButtonWidget(
                //                                   text: "Add Task",
                //                                   colors: yellow,
                //                                   onPress: () async {
                //                                     if (_provider.mSearchedPersonId == 0) {
                //                                       AppSnackBars.showWarningSnackBar(context: context, message: "Person is required!");
                //                                       print("Person is missing");
                //                                       return;
                //                                     }
                //                                     if (_provider.mDateTimeTextController.text.isEmpty) {
                //                                       AppSnackBars.showWarningSnackBar(context: context, message: "Date is required!");
                //                                       print("Date time is missing");
                //                                       return;
                //                                     }
                //                                     // if (_provider.selectedTaskStatus == 'Select status') {
                //                                     //   AppSnackBars.showWarningSnackBar(context: context, message: "Task Status is required!");
                //                                     //   print("Task time is missing");
                //                                     //   return;
                //                                     // }
                //                                     if (_provider.mTaskDescriptionController.text.isEmpty) {
                //                                       AppSnackBars.showWarningSnackBar(context: context, message: "Task Description is required!");
                //                                       print("Description is missing");
                //                                       return;
                //                                     }
                //                                     // if (_provider.mSearchedFarmId == 0) {
                //                                     //   AppSnackBars.showWarningSnackBar(context: context, message: "Farm is required!");
                //                                     //   print("Farm is missing");
                //                                     //   return;
                //                                     // }
                //
                //                                     // if (_provider.mSearchedProjectId == 0) {
                //                                     //   AppSnackBars.showWarningSnackBar(context: context, message: "Project is required!");
                //                                     //   print("Project is missing");
                //                                     //   return;
                //                                     // }
                //
                //                                     Navigator.pop(context);
                //                                     late PostEntrepreneurTaskRequest entrepreneurTaskRequest;
                //
                //                                     entrepreneurTaskRequest = PostEntrepreneurTaskRequest(
                //                                         assignedToId: _provider.mSearchedPersonId.toString(),
                //                                         farmId: _provider.mSearchedFarmId == 0 ? "" : _provider.mSearchedFarmId.toString(),
                //                                         projectId: _provider.mSearchedProjectId == 0 ? "" : _provider.mSearchedProjectId.toString(),
                //                                         taskDescription: _provider.mTaskDescriptionController.text,
                //                                         taskDueDate: _provider.mSelectedDateTimeForTask.toString(),
                //                                         assignedById: authController.myUser.value.id.toString(),
                //                                         taskStatus: _provider.selectedTaskStatus == 'Select status'
                //                                             ? []
                //                                             : [
                //                                                 _provider.selectedTaskStatus.toString(),
                //                                               ]);
                //                                     print("ADD NEW TASK BODY OBJECT : ${entrepreneurTaskRequest.toJson()}");
                //                                     await _provider.addNewTaskInContactMoment(
                //                                       mEntrepreneurID: this.widget.mEntrepreneurID,
                //                                       mContactMomentId: this.widget.mContactMomentID,
                //                                       context: context,
                //                                       entrepreneurTaskRequest: entrepreneurTaskRequest,
                //                                       isUpdateScreen: true,
                //                                     );
                //                                     print("ADD NEW TASK RESPONSE OBJECT : ${_provider.postEntrepreneurTaskResponse.toJson()}");
                //
                //                                     tasksList.add(Tasks(
                //                                         id: _provider.postEntrepreneurTaskResponse.data!.id,
                //                                         taskStatus: [_provider.postEntrepreneurTaskResponse.data!.taskStatus.toString()],
                //                                         taskDescription: _provider.postEntrepreneurTaskResponse.data!.taskDescription,
                //                                         taskDueDate: _provider.postEntrepreneurTaskResponse.data!.dueDate,
                //                                         contactSubject: _provider.postEntrepreneurTaskResponse.data!.contactSubject,
                //                                         assignedTo: AssignedTo(
                //                                           lastName: _provider.postEntrepreneurTaskResponse.data!.assignedTo!.lastName!,
                //                                           id: _provider.postEntrepreneurTaskResponse.data!.assignedTo!.id!,
                //                                           firstName: _provider.postEntrepreneurTaskResponse.data!.assignedTo!.firstName!,
                //                                         ),
                //                                         contactMoment: "",
                //                                         farm: "",
                //                                         project: ""));
                //                                   },
                //                                 )
                //                               ],
                //                             ),
                //                           ),
                //                         ],
                //                       );
                //                     },
                //                   );
                //                 },
                //               ),
                //             )
                //           ],
                //         ),
                //         SizedBox(height: 30),
                //         Row(
                //           children: [
                //             Expanded(
                //               child: Text(
                //                 "Assigned to",
                //                 style: TextStyle(
                //                   fontSize: Responsive.isMobile(context) ? 12 : 20,
                //                   color: HexColor('#231F20'),
                //                   fontWeight: Responsive.isMobile(context) ? FontWeight.w500 : FontWeight.bold,
                //                 ),
                //               ),
                //               flex: 1,
                //             ),
                //             Expanded(
                //               child: Text(
                //                 "Status",
                //                 style: TextStyle(
                //                   fontSize: Responsive.isMobile(context) ? 12 : 20,
                //                   color: HexColor('#231F20'),
                //                   fontWeight: Responsive.isMobile(context) ? FontWeight.w500 : FontWeight.bold,
                //                 ),
                //               ),
                //               flex: 1,
                //             ),
                //             Expanded(
                //               child: Text(
                //                 "Due Date",
                //                 style: TextStyle(
                //                   fontSize: Responsive.isMobile(context) ? 12 : 20,
                //                   color: HexColor('#231F20'),
                //                   fontWeight: Responsive.isMobile(context) ? FontWeight.w500 : FontWeight.bold,
                //                 ),
                //               ),
                //               flex: 1,
                //             ),
                //             Expanded(
                //               child: Text(
                //                 "Description",
                //                 style: TextStyle(
                //                   fontSize: Responsive.isMobile(context) ? 12 : 20,
                //                   color: HexColor('#231F20'),
                //                   fontWeight: Responsive.isMobile(context) ? FontWeight.w500 : FontWeight.bold,
                //                 ),
                //               ),
                //               flex: 3,
                //             ),
                //           ],
                //         ),
                //         SizedBox(height: 10),
                //         Column(
                //           children: tasksList
                //               .map(
                //                 (task) => Row(
                //                   mainAxisAlignment: MainAxisAlignment.start,
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Expanded(
                //                       child: Text(
                //                         _provider.setAssignedPersonName(task.assignedTo!.id.toString()),
                //                         style: TextStyle(
                //                           fontSize: Responsive.isMobile(context) ? 12 : 18,
                //                           color: HexColor('#231F20'),
                //                         ),
                //                       ),
                //                       flex: 1,
                //                     ),
                //                     Expanded(
                //                       child: Padding(
                //                         padding: const EdgeInsets.only(right: 15),
                //                         child: Container(
                //                           color: HexColor('#F5F6FA'),
                //                           height: 44,
                //                           child: Padding(
                //                             padding: const EdgeInsets.all(5.0),
                //                             child: Row(
                //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                               children: [
                //                                 Expanded(
                //                                   child: Text(
                //                                     task.taskStatus == [] ? "" : task.taskStatus![0],
                //                                     style: TextStyle(
                //                                       fontSize: Responsive.isMobile(context) ? 12 : 18,
                //                                       color: HexColor('#231F20'),
                //                                     ),
                //                                   ),
                //                                 ),
                //                                 Icon(
                //                                   Icons.arrow_drop_down,
                //                                   color: HexColor('#231F20'),
                //                                   size: Responsive.isMobile(context) ? 12 : 15,
                //                                 )
                //                               ],
                //                             ),
                //                           ),
                //                         ),
                //                       ),
                //                       flex: 1,
                //                     ),
                //                     Expanded(
                //                       child: Text(
                //                         task.taskDueDate ?? "",
                //                         style: TextStyle(
                //                           fontSize: Responsive.isMobile(context) ? 12 : 18,
                //                           color: HexColor('#231F20'),
                //                         ),
                //                       ),
                //                       flex: 1,
                //                     ),
                //                     Expanded(
                //                       child: Row(
                //                         mainAxisAlignment: MainAxisAlignment.start,
                //                         crossAxisAlignment: CrossAxisAlignment.start,
                //                         children: [
                //                           Expanded(
                //                             child: Text(
                //                               task.taskDescription ?? "",
                //                               style: TextStyle(
                //                                 fontSize: Responsive.isMobile(context) ? 12 : 18,
                //                                 color: HexColor('#231F20'),
                //                               ),
                //                             ),
                //                             flex: 3,
                //                           ),
                //                           Expanded(
                //                             child: Responsive.isDesktop(context)
                //                                 ? Row(
                //                                     children: [
                //                                       IconButtonWidget(
                //                                         mIcon: Icons.edit,
                //                                         mOnTap: () {
                //                                           setState(() {
                //                                             _provider.clearTasksFields();
                //                                           });
                //
                //                                           showDialog(
                //                                             context: context,
                //                                             builder: (BuildContext context) {
                //                                               return AlertDialog(
                //                                                 title: Row(
                //                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                                                   children: [
                //                                                     CustomText(
                //                                                       text: "Add Task",
                //                                                       size: !Responsive.isDesktop(context) ? 20 : 26,
                //                                                       weight: FontWeight.bold,
                //                                                       color: HexColor('#231F20'),
                //                                                     ),
                //                                                     IconButton(
                //                                                       onPressed: () {
                //                                                         Navigator.of(context).pop();
                //                                                       },
                //                                                       icon: const Icon(
                //                                                         Icons.close,
                //                                                         size: 20,
                //                                                       ),
                //                                                     ),
                //                                                   ],
                //                                                 ),
                //                                                 content: AddNewTaskDialogWidget(),
                //                                                 actions: [
                //                                                   Container(
                //                                                     padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                //                                                     child: Row(
                //                                                       mainAxisAlignment: MainAxisAlignment.end,
                //                                                       children: [
                //                                                         AddTextButtonWidget(
                //                                                           text: "Update Task",
                //                                                           colors: yellow,
                //                                                           onPress: () async {
                //                                                             if (_provider.mSearchedPersonId == 0) {
                //                                                               AppSnackBars.showWarningSnackBar(
                //                                                                   context: context, message: "Person is required!");
                //                                                               print("Person is missing");
                //                                                               return;
                //                                                             }
                //                                                             if (_provider.mDateTimeTextController.text.isEmpty) {
                //                                                               AppSnackBars.showWarningSnackBar(
                //                                                                   context: context, message: "Date is required!");
                //                                                               print("Date time is missing");
                //                                                               return;
                //                                                             }
                //                                                             // if (_provider.selectedTaskStatus == 'Select status') {
                //                                                             //   AppSnackBars.showWarningSnackBar(
                //                                                             //       context: context, message: "Task Status is required!");
                //                                                             //   print("Task time is missing");
                //                                                             //   return;
                //                                                             // }
                //                                                             if (_provider.mTaskDescriptionController.text.isEmpty) {
                //                                                               AppSnackBars.showWarningSnackBar(
                //                                                                   context: context, message: "Task Description is required!");
                //                                                               print("Description is missing");
                //                                                               return;
                //                                                             }
                //                                                             // if (_provider.mSearchedFarmId == 0) {
                //                                                             //   AppSnackBars.showWarningSnackBar(
                //                                                             //       context: context, message: "Farm is required!");
                //                                                             //   print("Farm is missing");
                //                                                             //   return;
                //                                                             // }
                //                                                             //
                //                                                             // if (_provider.mSearchedProjectId == 0) {
                //                                                             //   AppSnackBars.showWarningSnackBar(
                //                                                             //       context: context, message: "Project is required!");
                //                                                             //   print("Project is missing");
                //                                                             //   return;
                //                                                             // }
                //
                //                                                             Navigator.pop(context);
                //                                                             late PostEntrepreneurTaskRequest entrepreneurTaskRequest;
                //
                //                                                             entrepreneurTaskRequest = PostEntrepreneurTaskRequest(
                //                                                                 assignedToId: _provider.mSearchedPersonId.toString(),
                //                                                                 farmId: _provider.mSearchedFarmId == 0
                //                                                                     ? ""
                //                                                                     : _provider.mSearchedFarmId.toString(),
                //                                                                 projectId: _provider.mSearchedProjectId == 0
                //                                                                     ? ""
                //                                                                     : _provider.mSearchedProjectId.toString(),
                //                                                                 taskDescription: _provider.mTaskDescriptionController.text,
                //                                                                 taskDueDate: _provider.mSelectedDateTimeForTask.toString(),
                //                                                                 assignedById: authController.myUser.value.id.toString(),
                //                                                                 taskStatus: _provider.selectedTaskStatus == 'Select status'
                //                                                                     ? []
                //                                                                     : [
                //                                                                         _provider.selectedTaskStatus.toString(),
                //                                                                       ]);
                //                                                             print("Update TASK BODY OBJECT : ${entrepreneurTaskRequest.toJson()}");
                //                                                             var index = tasksList.indexOf(task);
                //
                //                                                             await _provider.updateContactMomentTask(
                //                                                                 mEntrepreneurID: this.widget.mEntrepreneurID,
                //                                                                 contactMomentId: this.widget.mContactMomentID,
                //                                                                 entrepreneurTaskRequest: entrepreneurTaskRequest,
                //                                                                 contactMomentTaskId: tasksList[index].id!);
                //                                                             print(
                //                                                                 "Update TASK RESPONSE OBJECT : ${_provider.updateEntrepreneurTaskResponse.toJson()}");
                //                                                             setState(() {
                //                                                               task.assignedTo = AssignedTo(
                //                                                                 lastName: _provider
                //                                                                     .updateEntrepreneurTaskResponse.data!.assignedTo!.lastName!,
                //                                                                 id: _provider.updateEntrepreneurTaskResponse.data!.assignedTo!.id!,
                //                                                                 firstName: _provider
                //                                                                     .updateEntrepreneurTaskResponse.data!.assignedTo!.firstName!,
                //                                                               );
                //
                //                                                               task.taskDueDate =
                //                                                                   _provider.updateEntrepreneurTaskResponse.data!.dueDate;
                //                                                               task.taskDescription =
                //                                                                   _provider.updateEntrepreneurTaskResponse.data!.taskDescription;
                //                                                               task.taskStatus = [
                //                                                                 _provider.updateEntrepreneurTaskResponse.data!.taskStatus.toString()
                //                                                               ];
                //                                                             });
                //                                                           },
                //                                                         )
                //                                                       ],
                //                                                     ),
                //                                                   ),
                //                                                 ],
                //                                               );
                //                                             },
                //                                           );
                //                                         },
                //                                         mShowBorder: true,
                //                                       ),
                //                                       SizedBox(width: 10),
                //                                       IconButtonWidget(
                //                                         mIcon: Icons.delete,
                //                                         mOnTap: () {
                //                                           var index = tasksList.indexOf(task);
                //                                           print("Index    : $index");
                //                                           _provider.deleteTaskFromContactMoment(
                //                                             mEntrepreneurID: this.widget.mEntrepreneurID,
                //                                             contactMomentId: this.widget.mContactMomentID,
                //                                             mTaskID: tasksList[index].id!,
                //                                             context: context,
                //                                           );
                //
                //                                           tasksList.removeAt(index);
                //                                           setState(() {});
                //                                         },
                //                                         mShowBorder: true,
                //                                       ),
                //                                     ],
                //                                   )
                //                                 : Column(
                //                                     children: [
                //                                       IconButtonWidget(
                //                                         mIcon: Icons.edit,
                //                                         mOnTap: () {
                //                                           setState(() {
                //                                             _provider.clearTasksFields();
                //                                           });
                //
                //                                           showDialog(
                //                                             context: context,
                //                                             builder: (BuildContext context) {
                //                                               return AlertDialog(
                //                                                 title: Row(
                //                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                                                   children: [
                //                                                     CustomText(
                //                                                       text: "Add Task",
                //                                                       size: !Responsive.isDesktop(context) ? 20 : 26,
                //                                                       weight: FontWeight.bold,
                //                                                       color: HexColor('#231F20'),
                //                                                     ),
                //                                                     IconButton(
                //                                                       onPressed: () {
                //                                                         Navigator.of(context).pop();
                //                                                       },
                //                                                       icon: const Icon(
                //                                                         Icons.close,
                //                                                         size: 20,
                //                                                       ),
                //                                                     ),
                //                                                   ],
                //                                                 ),
                //                                                 content: AddNewTaskDialogWidget(),
                //                                                 actions: [
                //                                                   Container(
                //                                                     padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                //                                                     child: Row(
                //                                                       mainAxisAlignment: MainAxisAlignment.end,
                //                                                       children: [
                //                                                         AddTextButtonWidget(
                //                                                           text: "Update Task",
                //                                                           colors: yellow,
                //                                                           onPress: () async {
                //                                                             if (_provider.mSearchedPersonId == 0) {
                //                                                               AppSnackBars.showWarningSnackBar(
                //                                                                   context: context, message: "Person is required!");
                //                                                               print("Person is missing");
                //                                                               return;
                //                                                             }
                //                                                             if (_provider.mDateTimeTextController.text.isEmpty) {
                //                                                               AppSnackBars.showWarningSnackBar(
                //                                                                   context: context, message: "Date is required!");
                //                                                               print("Date time is missing");
                //                                                               return;
                //                                                             }
                //                                                             // if (_provider.selectedTaskStatus == 'Select status') {
                //                                                             //   AppSnackBars.showWarningSnackBar(
                //                                                             //       context: context, message: "Task Status is required!");
                //                                                             //   print("Task time is missing");
                //                                                             //   return;
                //                                                             // }
                //                                                             if (_provider.mTaskDescriptionController.text.isEmpty) {
                //                                                               AppSnackBars.showWarningSnackBar(
                //                                                                   context: context, message: "Task Description is required!");
                //                                                               print("Description is missing");
                //                                                               return;
                //                                                             }
                //                                                             // if (_provider.mSearchedFarmId == 0) {
                //                                                             //   AppSnackBars.showWarningSnackBar(
                //                                                             //       context: context, message: "Farm is required!");
                //                                                             //   print("Farm is missing");
                //                                                             //   return;
                //                                                             // }
                //                                                             //
                //                                                             // if (_provider.mSearchedProjectId == 0) {
                //                                                             //   AppSnackBars.showWarningSnackBar(
                //                                                             //       context: context, message: "Project is required!");
                //                                                             //   print("Project is missing");
                //                                                             //   return;
                //                                                             // }
                //
                //                                                             Navigator.pop(context);
                //                                                             late PostEntrepreneurTaskRequest entrepreneurTaskRequest;
                //
                //                                                             entrepreneurTaskRequest = PostEntrepreneurTaskRequest(
                //                                                                 assignedToId: _provider.mSearchedPersonId.toString(),
                //                                                                 farmId: _provider.mSearchedFarmId == 0
                //                                                                     ? ""
                //                                                                     : _provider.mSearchedFarmId.toString(),
                //                                                                 projectId: _provider.mSearchedProjectId == 0
                //                                                                     ? ""
                //                                                                     : _provider.mSearchedProjectId.toString(),
                //                                                                 taskDescription: _provider.mTaskDescriptionController.text,
                //                                                                 taskDueDate: _provider.mSelectedDateTimeForTask.toString(),
                //                                                                 assignedById: authController.myUser.value.id.toString(),
                //                                                                 taskStatus: _provider.selectedTaskStatus == 'Select status'
                //                                                                     ? []
                //                                                                     : [
                //                                                                         _provider.selectedTaskStatus.toString(),
                //                                                                       ]);
                //                                                             print("Update TASK BODY OBJECT : ${entrepreneurTaskRequest.toJson()}");
                //                                                             var index = tasksList.indexOf(task);
                //
                //                                                             await _provider.updateContactMomentTask(
                //                                                                 mEntrepreneurID: this.widget.mEntrepreneurID,
                //                                                                 contactMomentId: this.widget.mContactMomentID,
                //                                                                 entrepreneurTaskRequest: entrepreneurTaskRequest,
                //                                                                 contactMomentTaskId: tasksList[index].id!);
                //                                                             print(
                //                                                                 "Update TASK RESPONSE OBJECT : ${_provider.updateEntrepreneurTaskResponse.toJson()}");
                //                                                             setState(() {
                //                                                               task.assignedTo = AssignedTo(
                //                                                                 lastName: _provider
                //                                                                     .updateEntrepreneurTaskResponse.data!.assignedTo!.lastName!,
                //                                                                 id: _provider.updateEntrepreneurTaskResponse.data!.assignedTo!.id!,
                //                                                                 firstName: _provider
                //                                                                     .updateEntrepreneurTaskResponse.data!.assignedTo!.firstName!,
                //                                                               );
                //
                //                                                               task.taskDueDate =
                //                                                                   _provider.updateEntrepreneurTaskResponse.data!.dueDate;
                //                                                               task.taskDescription =
                //                                                                   _provider.updateEntrepreneurTaskResponse.data!.taskDescription;
                //                                                               task.taskStatus = [
                //                                                                 _provider.updateEntrepreneurTaskResponse.data!.taskStatus.toString()
                //                                                               ];
                //                                                             });
                //                                                           },
                //                                                         )
                //                                                       ],
                //                                                     ),
                //                                                   ),
                //                                                 ],
                //                                               );
                //                                             },
                //                                           );
                //                                         },
                //                                         mShowBorder: true,
                //                                       ),
                //                                       SizedBox(height: 10),
                //                                       IconButtonWidget(
                //                                         mIcon: Icons.delete,
                //                                         mOnTap: () {
                //                                           var index = tasksList.indexOf(task);
                //                                           print("Index    : $index");
                //                                           _provider.deleteTaskFromContactMoment(
                //                                             mEntrepreneurID: this.widget.mEntrepreneurID,
                //                                             contactMomentId: this.widget.mContactMomentID,
                //                                             mTaskID: tasksList[index].id!,
                //                                             context: context,
                //                                           );
                //
                //                                           tasksList.removeAt(index);
                //                                           setState(() {});
                //                                         },
                //                                         mShowBorder: true,
                //                                       ),
                //                                     ],
                //                                   ),
                //                             flex: 1,
                //                           ),
                //                         ],
                //                       ),
                //                       flex: 3,
                //                     ),
                //                   ],
                //                 ),
                //               )
                //               .toList(),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );
    });
  }

  String listOfAttachedString(List<Attendees> list) {
    String value = '';
    List<String> attendeesList = [];
    for (var i = 0; i < list.length; i++) {
      attendeesList.add(list[i].name!);
    }
    value = attendeesList.join(', ');
    return value;
  }
}
