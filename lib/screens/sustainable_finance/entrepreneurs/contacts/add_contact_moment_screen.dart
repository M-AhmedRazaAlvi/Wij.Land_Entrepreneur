import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_dart';
import 'package:hovering/hovering.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:wij_land/app_common_widgets/common_elevated_button.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/contacts/widgets/add_subject_dialog_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/contacts/widgets/add_task_dialog_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/contacts/widgets/contact_moments_details_view_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/contacts/widgets/icon_button_widget.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/hex_color.dart';
import 'package:wij_land/utils/responsive.dart';

import '../../../../../app_common_widgets/common_outlined_icon_button.dart';
import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../models/entrepreneur/request/post_entrepreneur_contact_moment_request.dart';
import '../../../../../models/entrepreneur/request/subject_selection_request_model.dart';
import '../../../../../providers/entrepreneur/entrepreneur_contact_moment_provider.dart';
import '../../../../../utils/app_snackbars.dart';
import '../../../../../utils/controller.dart';
import '../../../../../utils/styles.dart';
import '../../../../app_common_widgets/large_screen.dart';
import '../../../../app_common_widgets/on_hover.dart';
import '../../../../models/entrepreneur/response/get_entrepreneur_contact_moment_response.dart';
import '../../../office/widgets/add_text_button_widget.dart';

class AddContactMomentScreen extends StatefulWidget {
  final int? mEntrepreneurID, mContactPersonID, mIndex;
  final ContactMomentsModel? contactMomentResponse;
  final bool? mDisplayDataOnly;
  final String? mHeader,
      mHeaderDate,
      mHeaderAttendees,
      mHeaderContactMomentSubject,
      mHeaderKindOfContact,
      mHeaderRelatedFarm,
      mHeaderRelatedProject,
      title;

  const AddContactMomentScreen({
    Key? key,
    this.mEntrepreneurID,
    this.mContactPersonID,
    this.contactMomentResponse,
    this.mDisplayDataOnly,
    this.mHeader,
    this.mHeaderDate,
    this.mHeaderAttendees,
    this.mHeaderContactMomentSubject,
    this.mHeaderKindOfContact,
    this.mHeaderRelatedFarm,
    this.mHeaderRelatedProject,
    this.mIndex,
    this.title,
  }) : super(key: key);

  @override
  State<AddContactMomentScreen> createState() => _AddContactMomentScreenState();
}

class _AddContactMomentScreenState extends State<AddContactMomentScreen> {
  @override
  Widget build(BuildContext context) {
    print('Data Visible ewoijfiwefgje');
    return VisibilityDetector(
      key: Key('Contact-key'),
      onVisibilityChanged: (visibilityInfo) {
        var visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 50) {
          global_entitiy.value = [
            HoverWidget(
              child: Text(
                "Entrepreneurs / ".tr(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: shineGrey,
                  fontFamily: Montserrat_Medium,
                ),
              ),
              hoverChild: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Entrepreneurs / ".tr(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: shineGrey,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                    fontFamily: Montserrat_Medium,
                  ),
                ),
              ),
              onHover: (event) {},
            ),
            HoverWidget(
              child: Text(
                '${widget.title} / ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: shineGrey),
              ),
              hoverChild: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  '${widget.title} / ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: shineGrey,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                    fontFamily: Montserrat_Medium,
                  ),
                ),
              ),
              onHover: (event) {},
            ),
            Text(
              '${widget.contactMomentResponse!.contactMomentType}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: darkRed,
                fontFamily: Montserrat_Medium,
              ),
            ),
          ];
        }
      },
      child: Scaffold(
        body: widget.mDisplayDataOnly == true
            ? ContactMomentsDetailsViewWidget(
                contactMomentResponse: widget.contactMomentResponse!,
                mContactMomentID: widget.mContactPersonID!,
                mEntrepreneurID: widget.mEntrepreneurID!,
                mIndex: widget.mIndex!,
                title: widget.title,
              )
            : Consumer<EntrepreneurContactMomentScreenProvider>(
                builder: (context, _provider, widget) {
                  return Container(
                    color: HexColor('#F9F9F9'),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 120,
                                  child: CommonElevatedButton(
                                    mOnTap: () {
                                      _provider.subjectsListForPost.clear();
                                      _provider.tasksListForPost.clear();
                                      _provider.internalNotesResult = '';
                                      _provider.attendeesNotesResult = '';
                                      Navigator.pop(context, false);
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
                                      _provider.internalNotesResult = await _provider.internalNotesController.getText();
                                      _provider.attendeesNotesResult = await _provider.attendeesNotesController.getText();

                                      setState(() {});
                                      Navigator.pop(context, true);
                                    },
                                    mButtonText: "Save & Exit".tr(),
                                    mButtonColor: HexColor('#F7EC4D'),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            ExpansionTile(
                              title: Text(
                                this.widget.mHeader ?? "",
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
                                      this.widget.mHeaderDate ?? "",
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
                                                    ? this.widget.mHeaderAttendees ?? ""
                                                    : e == 1
                                                        ? this.widget.mHeaderContactMomentSubject ?? ""
                                                        : e == 2
                                                            ? this.widget.mHeaderKindOfContact ?? ""
                                                            : e == 3
                                                                ? this.widget.mHeaderRelatedFarm ?? ""
                                                                : this.widget.mHeaderRelatedProject ?? "",
                                                style: TextStyle(
                                                  color: HexColor('#231F20'),
                                                  fontSize: Responsive.isMobile(context) ? 12 : 18.0,
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
                                    Text(
                                      "Internal Notes".tr(),
                                      style: TextStyle(
                                        fontSize: Responsive.isMobile(context) ? 16 : 20,
                                        color: HexColor('#48883E'),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: Montserrat_Medium,
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    SizedBox(
                                      height: 150,
                                      child: HtmlEditor(
                                        controller: _provider.internalNotesController, //required
                                        htmlEditorOptions: HtmlEditorOptions(
                                          hint: "Your text here...".tr(),
                                          autoAdjustHeight: true,
                                          initialText: _provider.internalNotesResult,
                                        ),
                                        otherOptions: OtherOptions(
                                          height: 100,
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
                                          textStyle: TextStyle(fontFamily: Montserrat_Medium),
                                          buttonBorderWidth: 1,
                                          buttonBorderColor: Colors.red,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Attendees Notes".tr(),
                                      style: TextStyle(
                                        fontSize: Responsive.isMobile(context) ? 16 : 20,
                                        color: HexColor('#48883E'),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: Montserrat_Medium,
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    //
                                    SizedBox(
                                      height: 150,
                                      child: HtmlEditor(
                                        controller: _provider.attendeesNotesController, //required
                                        htmlEditorOptions: HtmlEditorOptions(
                                            hint: "Attendee Notes".tr(), autoAdjustHeight: true, initialText: _provider.attendeesNotesResult),
                                        otherOptions: OtherOptions(
                                          height: 150,
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
                                          textStyle: TextStyle(fontFamily: Montserrat_Medium),
                                          buttonBorderWidth: 1,
                                          buttonBorderColor: Colors.red,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 30),
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
                                                _provider.mSelectedSubjectByUser = "";
                                                _provider.mSubjectSearchController.clear();
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
                                                                      setState(
                                                                        () {
                                                                          _provider.subjectsListForPost.add(
                                                                            ContactSubjectsPost(
                                                                              contactSubject: [_provider.mSubjectSearchController.text],
                                                                              description: _provider.subjectDescription,
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
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
                                      children: _provider.subjectsListForPost.map(
                                        (subject) {
                                          return Padding(
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
                                                          subject.contactSubject![0],
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                            fontSize: Responsive.isMobile(context) ? 10 : 20,
                                                            color: HexColor('#000000'),
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 20),
                                                Expanded(
                                                  child: HtmlWidget(subject.description ?? ""),
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
                                                                setState(() {
                                                                  _provider.clearAllSelectedSubjects();
                                                                  _provider.mCheckBoxDataList.clear();
                                                                  _provider.mSubjectSearchController.text = subject.contactSubject![0];
                                                                  _provider.mSelectedSubjectByUser = subject.contactSubject![0];

                                                                  _provider.subjectController.setText(subject.description!);
                                                                  _provider.subjectDescriptionInitialText = subject.description!;
                                                                });
                                                                for (var i = 0; i < _provider.projectDropdown.data!.length; i++) {
                                                                  bool isValueMatched = false;
                                                                  for (var j = 0; j < _provider.subjectsListForPost[i].contactSubject!.length; j++) {
                                                                    if (_provider.subjectsListForPost[i].contactSubject![j] ==
                                                                        _provider.projectDropdown.data![i].name) {
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
                                                                      title: Row(
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
                                                                      content: AddNewSubjectDialogWidget(),
                                                                      shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadiusDirectional.circular(19),
                                                                      ),
                                                                      actions: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(12.0),
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

                                                                                    if (_provider.mSubjectSearchController.text.isEmpty) {
                                                                                      AppSnackBars.showWarningSnackBar(
                                                                                          context: dialogContext, message: "Select any Tag!".tr());
                                                                                      return;
                                                                                    } else if (txt.isEmpty) {
                                                                                      AppSnackBars.showWarningSnackBar(
                                                                                          context: dialogContext,
                                                                                          message: "Description is required!".tr());
                                                                                      return;
                                                                                    } else {
                                                                                      Navigator.pop(dialogContext);
                                                                                      setState(
                                                                                        () {
                                                                                          _provider.subjectsListForPost.add(
                                                                                            ContactSubjectsPost(
                                                                                              contactSubject: [
                                                                                                _provider.mSubjectSearchController.text
                                                                                              ],
                                                                                              description: _provider.subjectDescription,
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      );
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
                                                                var index = _provider.subjectsListForPost.indexOf(subject);
                                                                _provider.subjectsListForPost.removeAt(index);
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
                                                                setState(() {
                                                                  _provider.clearAllSelectedSubjects();
                                                                  _provider.mCheckBoxDataList.clear();
                                                                  _provider.mSubjectSearchController.text = subject.contactSubject![0];
                                                                  _provider.mSelectedSubjectByUser = subject.contactSubject![0];
                                                                  _provider.subjectController.setText(subject.description!);
                                                                  _provider.subjectDescriptionInitialText = subject.description!;
                                                                });
                                                                var subjectIndex = _provider.subjectsListForPost.indexOf(subject);

                                                                for (var i = 0; i < _provider.projectDropdown.data!.length; i++) {
                                                                  late bool isValueMatched;
                                                                  setState(() {
                                                                    isValueMatched = false;
                                                                  });
                                                                  for (var j = 0;
                                                                      j < _provider.subjectsListForPost[subjectIndex].contactSubject!.length;
                                                                      j++) {
                                                                    if (_provider.subjectsListForPost[subjectIndex].contactSubject![j] ==
                                                                        _provider.projectDropdown.data![i].name) {
                                                                      setState(() {
                                                                        isValueMatched = true;
                                                                      });
                                                                    }
                                                                  }
                                                                  if (isValueMatched == true) {
                                                                    setState(() {
                                                                      _provider.mCheckBoxDataList.add(
                                                                        SubjectSelectionRequestModel(
                                                                          status: true,
                                                                          title: _provider.projectDropdown.data![i].name!,
                                                                        ),
                                                                      );
                                                                    });
                                                                  } else {
                                                                    setState(() {
                                                                      _provider.mCheckBoxDataList.add(
                                                                        SubjectSelectionRequestModel(
                                                                          status: false,
                                                                          title: _provider.projectDropdown.data![i].name!,
                                                                        ),
                                                                      );
                                                                    });
                                                                  }
                                                                }

                                                                showDialog(
                                                                  context: context,
                                                                  builder: (BuildContext dialogContext) {
                                                                    return AlertDialog(
                                                                      backgroundColor: Colors.white,
                                                                      title: Row(
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
                                                                      content: AddNewSubjectDialogWidget(),
                                                                      shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadiusDirectional.circular(19),
                                                                      ),
                                                                      actions: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(12.0),
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

                                                                                    if (_provider.mSubjectSearchController.text.isEmpty) {
                                                                                      AppSnackBars.showWarningSnackBar(
                                                                                          context: dialogContext, message: "Select any Tag!".tr());
                                                                                      return;
                                                                                    } else if (txt.isEmpty) {
                                                                                      AppSnackBars.showWarningSnackBar(
                                                                                          context: dialogContext,
                                                                                          message: "Description is required!".tr());
                                                                                      return;
                                                                                    } else {
                                                                                      Navigator.pop(dialogContext);
                                                                                      setState(
                                                                                        () {
                                                                                          _provider.subjectsListForPost[subjectIndex].contactSubject =
                                                                                              [_provider.mSubjectSearchController.text];
                                                                                          _provider.subjectsListForPost[subjectIndex].description =
                                                                                              _provider.subjectDescription;
                                                                                          // _provider.subjectsListForPost.add(
                                                                                          //   ContactSubjectsPost(
                                                                                          //     contactSubject: mTagsList,
                                                                                          //     description: _provider.result,
                                                                                          //   ),
                                                                                          // );
                                                                                        },
                                                                                      );
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
                                                                var index = _provider.subjectsListForPost.indexOf(subject);
                                                                _provider.subjectsListForPost.removeAt(index);
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
                                          );
                                        },
                                      ).toList(),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: getWidth(context),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Tasks".tr(),
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
                                            mLabelText: "Tasks".tr(),
                                            mButtonAndTextColor: HexColor('#48883E'),
                                            mOnPressed: () {
                                              setState(() {
                                                _provider.clearTasksFields();
                                              });
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        CustomText(
                                                          text: "Add Task".tr(),
                                                          size: !Responsive.isDesktop(context) ? 20 : 26,
                                                          weight: FontWeight.bold,
                                                          color: HexColor('#231F20'),
                                                        ),
                                                        IconButton(
                                                          onPressed: () {
                                                            Navigator.of(context).pop();
                                                          },
                                                          icon: const Icon(
                                                            Icons.close,
                                                            size: 20,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    content: AddNewTaskDialogWidget(),
                                                    actions: [
                                                      Container(
                                                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          children: [
                                                            AddTextButtonWidget(
                                                              text: "Add Task".tr(),
                                                              colors: yellow,
                                                              onPress: () {
                                                                if (_provider.mSearchedPersonId == 0) {
                                                                  AppSnackBars.showWarningSnackBar(
                                                                      context: context, message: "Person is required!".tr());
                                                                  return;
                                                                }
                                                                if (_provider.mDateTimeTextController.text.isEmpty) {
                                                                  AppSnackBars.showWarningSnackBar(
                                                                      context: context, message: "Date is required!".tr());
                                                                  return;
                                                                }
                                                                if (_provider.selectedTaskStatus == 'Select status') {
                                                                  AppSnackBars.showWarningSnackBar(
                                                                      context: context, message: "Task Status is required!".tr());
                                                                  return;
                                                                }
                                                                if (_provider.mTaskDescriptionController.text.isEmpty) {
                                                                  AppSnackBars.showWarningSnackBar(
                                                                      context: context, message: "Task Description is required!".tr());
                                                                  return;
                                                                }
                                                                if (_provider.mSearchedFarmId == 0) {
                                                                  AppSnackBars.showWarningSnackBar(
                                                                      context: context, message: "Farm is required!".tr());
                                                                  return;
                                                                }

                                                                if (_provider.mSearchedProjectId == 0) {
                                                                  AppSnackBars.showWarningSnackBar(
                                                                      context: context,
                                                                      message: "Project is "
                                                                              "required!"
                                                                          .tr());
                                                                  return;
                                                                }

                                                                Navigator.pop(context);
                                                                setState(
                                                                  () {
                                                                    _provider.tasksListForPost.add(
                                                                      TasksPost(
                                                                        taskDueDate: _provider.mSelectedDateTimeForTask.toString(),
                                                                        taskDescription: _provider.mTaskDescriptionController.text,
                                                                        projectId: _provider.mSearchedProjectId.toString(),
                                                                        farmId: _provider.mSearchedFarmId.toString(),
                                                                        assignedToId: _provider.mSearchedPersonId.toString(),
                                                                        assignedById: authController.myUser.value.id.toString(),
                                                                        taskStatus: [
                                                                          _provider.selectedTaskStatus.toString(),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 30),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Assigned to".tr(),
                                            style: TextStyle(
                                              fontSize: Responsive.isMobile(context) ? 12 : 20,
                                              color: HexColor('#231F20'),
                                              fontWeight: Responsive.isMobile(context) ? FontWeight.w500 : FontWeight.bold,
                                              fontFamily: Montserrat_Medium,
                                            ),
                                          ),
                                          flex: 1,
                                        ),
                                        Expanded(
                                          child: Text(
                                            "Status".tr(),
                                            style: TextStyle(
                                              fontSize: Responsive.isMobile(context) ? 12 : 20,
                                              color: HexColor('#231F20'),
                                              fontWeight: Responsive.isMobile(context) ? FontWeight.w500 : FontWeight.bold,
                                              fontFamily: Montserrat_Medium,
                                            ),
                                          ),
                                          flex: 1,
                                        ),
                                        Expanded(
                                          child: Text(
                                            "Subject".tr(),
                                            style: TextStyle(
                                              fontSize: Responsive.isMobile(context) ? 12 : 20,
                                              color: HexColor('#231F20'),
                                              fontWeight: Responsive.isMobile(context) ? FontWeight.w500 : FontWeight.bold,
                                              fontFamily: Montserrat_Medium,
                                            ),
                                          ),
                                          flex: 1,
                                        ),
                                        Expanded(
                                          child: Text(
                                            "Due Date".tr(),
                                            style: TextStyle(
                                              fontSize: Responsive.isMobile(context) ? 12 : 20,
                                              color: HexColor('#231F20'),
                                              fontWeight: Responsive.isMobile(context) ? FontWeight.w500 : FontWeight.bold,
                                              fontFamily: Montserrat_Medium,
                                            ),
                                          ),
                                          flex: 1,
                                        ),
                                        Expanded(
                                          child: Text(
                                            "Description".tr(),
                                            style: TextStyle(
                                              fontSize: Responsive.isMobile(context) ? 12 : 20,
                                              color: HexColor('#231F20'),
                                              fontWeight: Responsive.isMobile(context) ? FontWeight.w500 : FontWeight.bold,
                                              fontFamily: Montserrat_Medium,
                                            ),
                                          ),
                                          flex: 3,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Column(
                                      children: _provider.tasksListForPost
                                          .map(
                                            (task) => Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    _provider.setAssignedPersonName(task.assignedToId!),
                                                    style: TextStyle(
                                                      fontSize: Responsive.isMobile(context) ? 12 : 18,
                                                      color: HexColor('#231F20'),
                                                    ),
                                                  ),
                                                  flex: 1,
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(right: 15),
                                                    child: Container(
                                                      color: HexColor('#F5F6FA'),
                                                      height: 44,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(5.0),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                task.taskStatus![0],
                                                                style: TextStyle(
                                                                  fontSize: Responsive.isMobile(context) ? 12 : 18,
                                                                  color: HexColor('#231F20'),
                                                                ),
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons.arrow_drop_down,
                                                              color: HexColor('#231F20'),
                                                              size: Responsive.isMobile(context) ? 12 : 15,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  flex: 1,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "OnBoarding".tr(),
                                                    style: TextStyle(
                                                      fontSize: Responsive.isMobile(context) ? 12 : 18,
                                                      color: HexColor('#231F20'),
                                                      fontFamily: Montserrat_Medium,
                                                    ),
                                                  ),
                                                  flex: 1,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    task.taskDueDate ?? "",
                                                    style: TextStyle(
                                                      fontSize: Responsive.isMobile(context) ? 12 : 18,
                                                      color: HexColor('#231F20'),
                                                      fontFamily: Montserrat_Medium,
                                                    ),
                                                  ),
                                                  flex: 1,
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          task.taskDescription ?? "",
                                                          style: TextStyle(
                                                            fontSize: Responsive.isMobile(context) ? 12 : 18,
                                                            color: HexColor('#231F20'),
                                                            fontFamily: Montserrat_Medium,
                                                          ),
                                                        ),
                                                        flex: 3,
                                                      ),
                                                      Expanded(
                                                        child: Responsive.isDesktop(context)
                                                            ? Row(
                                                                children: [
                                                                  IconButtonWidget(
                                                                    mIcon: Icons.edit,
                                                                    mOnTap: () {},
                                                                    mShowBorder: true,
                                                                  ),
                                                                  SizedBox(width: 10),
                                                                  IconButtonWidget(
                                                                    mIcon: Icons.delete,
                                                                    mOnTap: () {
                                                                      var index = _provider.tasksListForPost.indexOf(task);
                                                                      _provider.tasksListForPost.removeAt(index);
                                                                      setState(() {});
                                                                    },
                                                                    mShowBorder: true,
                                                                  ),
                                                                ],
                                                              )
                                                            : Column(
                                                                children: [
                                                                  IconButtonWidget(
                                                                    mIcon: Icons.edit,
                                                                    mOnTap: () {},
                                                                    mShowBorder: true,
                                                                  ),
                                                                  SizedBox(height: 10),
                                                                  IconButtonWidget(
                                                                    mIcon: Icons.delete,
                                                                    mOnTap: () {
                                                                      var index = _provider.tasksListForPost.indexOf(task);
                                                                      _provider.tasksListForPost.removeAt(index);
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
                                                  flex: 3,
                                                ),
                                              ],
                                            ),
                                          )
                                          .toList(),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
