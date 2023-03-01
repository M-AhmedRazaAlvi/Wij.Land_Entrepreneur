import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:wij_land/models/entrepreneur/request/subject_selection_request_model.dart';
import 'package:wij_land/models/entrepreneur/response/get_entrepreneur_contact_moment_response.dart';

import '../../api_clients/dropDown_client.dart';
import '../../api_clients/entrepreneur_client.dart';
import '../../models/entrepreneur/request/post_entrepreneur_contact_moment_request.dart';
import '../../models/entrepreneur/request/post_entrepreneur_contact_subject_request.dart';
import '../../models/entrepreneur/request/post_entrepreneur_task_request.dart';
import '../../models/entrepreneur/response/contact_moment_subject_update_response.dart';
import '../../models/entrepreneur/response/delete_entrepreneur_response.dart';
import '../../models/entrepreneur/response/post_entrepreneur_contact_moment_response.dart';
import '../../models/entrepreneur/response/post_entrepreneur_task_reponse.dart';
import '../../models/entrepreneur_dropDown/attendees_dropDown.dart';
import '../../models/entrepreneur_dropDown/farm_dropDown.dart';
import '../../models/entrepreneur_dropDown/persons_dropDown.dart';
import '../../models/entrepreneur_dropDown/project_dropDown.dart';

class EntrepreneurContactMomentScreenProvider extends ChangeNotifier {
  //* Text Editing Controllers & HTML Controller Variables Start *//
  TextEditingController mPersonSearchController = TextEditingController();
  TextEditingController mFarmSearchController = TextEditingController();
  TextEditingController mContactFarmSearchController = TextEditingController();
  TextEditingController mProjectSearchController = TextEditingController();
  TextEditingController mContactMomentSubjectController =
      TextEditingController();
  TextEditingController mRelationFarmController = TextEditingController();
  TextEditingController mAttendeesSearchController = TextEditingController();
  TextEditingController mRelatedProjectSearchController =
      TextEditingController();
  TextEditingController mDateTimeTextController = TextEditingController();
  TextEditingController mNewSubjectDescriptionController =
      TextEditingController();
  final TextEditingController mTaskDescriptionController =
      TextEditingController();
  TextEditingController mSubjectSearchController = TextEditingController();
  bool mShowSubjectWidget = false;
  String subjectDescriptionInitialText = "";
  List<SubjectSelectionRequestModel> mSearchedSubjectList = [];

  searchSubject({required String value}) {
    mSearchedSubjectList.clear();
    notifyListeners();

    for (var i = 0; i < mCheckBoxDataList.length; i++) {
      if (mCheckBoxDataList[i]
          .title
          .toLowerCase()
          .contains(value.toLowerCase())) {
        mSearchedSubjectList.add(mCheckBoxDataList[i]);
        notifyListeners();
      }
    }
  }

  final HtmlEditorController subjectController = HtmlEditorController();
  HtmlEditorController internalNotesController = HtmlEditorController();
  final HtmlEditorController attendeesNotesController = HtmlEditorController();

  TextEditingController mFilterFromDateController = TextEditingController();
  TextEditingController mFilterToDateController = TextEditingController();
  TextEditingController mFilterSearchStringController = TextEditingController();
  String mFromDateForSend = '', mToDateForSend = '';
  bool searchTapped = false;
  bool isDataNotEmpty = false;
  bool customTileExpanded = false;
  List<int> listOfExpandedWidgets = [0, 1, 2, 3, 4];

  //* Text Editing Controllers & HTML Controller Variables Ends *//

  //* Person Search Work Starts *//

  bool mShowPersonsListWidget = false;
  late PersonsDropdown personsDropdown;
  late List<Persons> mPersonSearchedList = [];
  late int mSearchedPersonId = 0;

  updatePersonID({required int id}) {
    mSearchedPersonId = id;
    notifyListeners();
  }

  getPersonsDropDownData() async {
    personsDropdown = await DropDownClients.getPersonDetailData();
  }

  searchPerson({required String value}) {
    mPersonSearchedList.clear();
    notifyListeners();

    for (var i = 0; i < personsDropdown.data!.length; i++) {
      if (personsDropdown.data![i].name!
          .toLowerCase()
          .contains(value.toLowerCase())) {
        mPersonSearchedList.add(personsDropdown.data![i]);
        notifyListeners();
      }
    }
  }

  //* Person Search Work Ends *//
  //* Farm Search Work Starts *//

  bool mShowFarmListWidget = false;
  late FarmDropDown farmDropDown;
  late List<FarmsList> mFarmSearchedList = [];
  late int mSearchedFarmId = 0;

  updateFarmID({required int id, required bool isTaskId}) {
    if (isTaskId) {
      mSearchedFarmId = id;
      notifyListeners();
    } else {
      selectedFarmID = id.toString();
      notifyListeners();
    }
  }

  getFarmsDropDownData() async {
    farmDropDown = await DropDownClients.getFarmDetailData();
  }

  searchFarm({required String value}) {
    mFarmSearchedList.clear();
    notifyListeners();

    for (var i = 0; i < farmDropDown.data!.length; i++) {
      if (farmDropDown.data![i].name!
          .toLowerCase()
          .contains(value.toLowerCase())) {
        mFarmSearchedList.add(farmDropDown.data![i]);
        notifyListeners();
      }
    }
  }

  //* Farm Search Work Ends *//

  //* Project Search Work Starts *//

  bool mShowProjectListWidget = false;
  late ProjectDropdown projectDropdown = ProjectDropdown();
  late List<ProjectsData> mProjectSearchedList = [];
  late int mSearchedProjectId = 0;

  getProjectsDropDownData() async {
    projectDropdown = await DropDownClients.getProjectsDropDownData();

    for (var i = 0; i < projectDropdown.data!.length; i++) {
      mCheckBoxDataList.add(
        SubjectSelectionRequestModel(
            title: projectDropdown.data![i].name!, status: false),
      );
      notifyListeners();
    }
  }

  updateProjectID({required int id}) {
    mSearchedProjectId = id;
    notifyListeners();
  }

  searchProject({required String value}) {
    mProjectSearchedList.clear();
    notifyListeners();

    for (var i = 0; i < projectDropdown.data!.length; i++) {
      if (projectDropdown.data![i].name!
          .toLowerCase()
          .contains(value.toLowerCase())) {
        mProjectSearchedList.add(projectDropdown.data![i]);
        notifyListeners();
      }
    }
  }

  //* Project Search Work Ends *//

  //* Attendees Search Work Starts *//

  bool mShowAttendeeListWidget = false;
  late AttendeesDropdown attendeesDropdown;
  late List<AttendeesData> mAttendeesSearchedList = [];
  late List<AttendeesData> mAttendeesSelectedList = [];
  late String mAttendeeForFilter;

  getAttendeesDropDownData() async {
    attendeesDropdown = await DropDownClients.getAttendeesDetailData();
    mAttendeeForFilter = attendeesDropdown.data![0].name!;
    notifyListeners();
  }

  searchAttendees({required String value}) {
    mAttendeesSearchedList.clear();
    notifyListeners();

    for (var i = 0; i < attendeesDropdown.data!.length; i++) {
      if (attendeesDropdown.data![i].name!
          .toLowerCase()
          .contains(value.toLowerCase())) {
        mAttendeesSearchedList.add(attendeesDropdown.data![i]);
        notifyListeners();
      }
    }
  }

  //* Attendees Search Work Ends *//

  //* Contact Moment Get Request Work Starts *//

  var _showLoadingWidget = true;

  bool get showLoadingWidget => _showLoadingWidget;
  late GetEntrepreneurContactMomentResponse model;

  late ContactMomentsModel mContactMomentsModel;

  getEntrepreneurContactMomentData(int id) async {
    model = GetEntrepreneurContactMomentResponse();
    notifyListeners();
    model = await EntrepreneurClients.getEntrepreneurContactMomentsData(
      id,
      mSearchString: mFilterSearchStringController.text,
      mFromDate: mFromDateForSend,
      mToDate: mToDateForSend,
      mContactMomentType: mContactMomentTypeForFilter == "Select Contact Moment"
          ? ""
          : mContactMomentTypeForFilter,
    );

    if (model.status == 200) {
      model.data!.sort((a, b) => DateTime.parse(b.contactMomentDate!)
          .compareTo(DateTime.parse(a.contactMomentDate!)));
    }
    _showLoadingWidget = false;
    notifyListeners();
  }

  //* Contact Moment Get Request Work Ends *//

  //* Create Contact Moment POST Request Work Starts *//

  final PostEntrepreneurContactMomentResponse
      _postEntrepreneurContactMomentResponse =
      PostEntrepreneurContactMomentResponse();

  PostEntrepreneurContactMomentResponse
      get postEntrepreneurContactMomentResponse =>
          _postEntrepreneurContactMomentResponse;

  createNewEntrepreneurContactMomentData(
    int id,
    PostEntrepreneurContactMomentRequest postEntrepreneurContactMomentRequest,
  ) async {
    await EntrepreneurClients.createNewContactMoment(
      postEntrepreneurContactMomentRequest,
      id,
    );
    notifyListeners();
  }

  //* Create Contact Moment POST Request Work Ends *//

  //* Delete Contact Moment POST Request Work Starts *//

  deleteContactMoment({
    int? mEntrepreneurID,
    int? contactMomentId,
    required int index,
    required BuildContext context,
  }) async {
    await EntrepreneurClients.deleteContactMomentOfEntrepreneur(
        mEntrepreneurID!, contactMomentId!);
    model.data!.removeAt(index);
    notifyListeners();
    Navigator.pop(context);
  }

  //* Delete Contact Moment POST Request Work Ends *//

  //* Update Contact Moment POST Request Work Starts *//

  updateContactMoment({
    int? mEntrepreneurID,
    int? contactMomentId,
    PostEntrepreneurContactMomentRequest? updateModel,
  }) async {
    await EntrepreneurClients.updateContactMomentsOfEntrepreneur(
      updateModel!,
      mEntrepreneurID!,
      contactMomentId!,
    );
  }

  //* Update Contact Moment POST Request Work Ends *//

  //* Update Contact Moment SUBJECT POST Request Work Starts *//
  late ContactMomentSubjectUpdateResponse contactMomentSubjectUpdateResponse;

  updateContactMomentSubject({
    required int mEntrepreneurID,
    required int contactMomentId,
    required int contactMomentSubjectId,
    required ContactSubjectsPost contactSubjectsPost,
  }) async {
    contactMomentSubjectUpdateResponse =
        await EntrepreneurClients.updateContactMomentSubject(
      contactSubjectsPost,
      mEntrepreneurID,
      contactMomentId,
      contactMomentSubjectId,
    );
  }

  //* Update Contact Moment SUBJECT POST Request Work Ends *//

  //* Update Contact Moment TASK POST Request Work Starts *//
  late PostEntrepreneurTaskResponse updateEntrepreneurTaskResponse;

  updateContactMomentTask({
    required int mEntrepreneurID,
    required int contactMomentId,
    required int contactMomentTaskId,
    required PostEntrepreneurTaskRequest entrepreneurTaskRequest,
  }) async {
    updateEntrepreneurTaskResponse = PostEntrepreneurTaskResponse();
    notifyListeners();
    updateEntrepreneurTaskResponse =
        await EntrepreneurClients.updateContactMomentTask(
      entrepreneurTaskRequest,
      mEntrepreneurID,
      contactMomentId,
      contactMomentTaskId,
    );
  }

  //* Update Contact Moment TASK POST Request Work Ends *//

  //* Add New Subject In Contact Moment UPDATE POST Request Work Starts *//
  late ContactMomentSubjectUpdateResponse subjectAddResponseInUpdate;

  addNewSubjectInUpdateContactMoment({
    required int mEntrepreneurID,
    required int mContactMomentId,
    required BuildContext context,
    required PostEntrepreneurContactSubjectRequest
        postEntrepreneurContactSubjectRequest,
  }) async {
    subjectAddResponseInUpdate = ContactMomentSubjectUpdateResponse();
    notifyListeners();

    subjectAddResponseInUpdate =
        await EntrepreneurClients.createNewSubjectInContactMoment(
      postEntrepreneurContactSubjectRequest,
      mEntrepreneurID,
      mContactMomentId,
    );
    print("Response : ${subjectAddResponseInUpdate.toJson()}");
    notifyListeners();
  }

  //* Add New Subject In Contact Moment UPDATE POST Request Work Ends *//

  //* Add New Subject In Contact Moment POST Request Work Starts *//

  late ContactMomentSubjectUpdateResponse contactSubjectResponse;
  late PostEntrepreneurContactSubjectRequest
      postEntrepreneurContactSubjectRequest;

  late List<SubjectSelectionRequestModel> mCheckBoxDataList = [];

  late List<String> mSelectedDataList = [];

  addNewSubjectInContactMoment({
    required int mEntrepreneurID,
    required int mContactMomentId,
    required BuildContext context,
  }) async {
    postEntrepreneurContactSubjectRequest =
        PostEntrepreneurContactSubjectRequest(
      contactSubject: mSelectedDataList,
      description: mNewSubjectDescriptionController.text,
    );

    contactSubjectResponse =
        await EntrepreneurClients.createNewSubjectInContactMoment(
      postEntrepreneurContactSubjectRequest,
      mEntrepreneurID,
      mContactMomentId,
    );
    Navigator.pop(context);
    Navigator.of(context).pop(true);
  }

  //* Add New Subject In Contact Moment POST Request Work Ends *//

  //* Delete Subject In Contact Moment POST Request Work Starts *//

  late DeleteEntrepreneurResponse deleteSubjectResponse;

  deleteSubjectFromContactMoment({
    required mEntrepreneurID,
    required contactMomentId,
    required int subjectID,
    required BuildContext context,
  }) async {
    deleteSubjectResponse = await EntrepreneurClients
        .deleteContactSubjectInContactMomentOfEntrepreneur(
      mEntrepreneurID,
      contactMomentId,
      subjectID,
    );
  }

  //* Delete Subject In Contact Moment POST Request Work Ends *//

  //* Add New Task In Contact Moment POST Request Work Starts *//

  late PostEntrepreneurTaskResponse postEntrepreneurTaskResponse;

  addNewTaskInContactMoment({
    required int mEntrepreneurID,
    required int mContactMomentId,
    required BuildContext context,
    required PostEntrepreneurTaskRequest entrepreneurTaskRequest,
    required bool isUpdateScreen,
  }) async {
    postEntrepreneurTaskResponse = PostEntrepreneurTaskResponse();
    notifyListeners();
    postEntrepreneurTaskResponse =
        await EntrepreneurClients.createNewTaskInContactMoment(
      entrepreneurTaskRequest,
      mEntrepreneurID,
      mContactMomentId,
    );
    mSearchedPersonId = 0;
    mSearchedFarmId = 0;
    mSearchedProjectId = 0;
    mTaskDescriptionController.clear();
    mDateTimeTextController = TextEditingController();
    selectedTaskStatus = 'Select status';
    notifyListeners();
    if (isUpdateScreen) {
    } else {
      Navigator.pop(context);
      Navigator.of(context).pop(true);
    }
  }

  //* Add New Task In Contact Moment POST Request Work Ends *//

  //* Delete Task In Contact Moment POST Request Work Starts *//

  deleteTaskFromContactMoment({
    required mEntrepreneurID,
    required contactMomentId,
    required int mTaskID,
    required BuildContext context,
  }) async {
    deleteSubjectResponse =
        await EntrepreneurClients.deleteTaskInContactMomentOfEntrepreneur(
      mEntrepreneurID,
      contactMomentId,
      mTaskID,
    );
    // Navigator.of(context).pop(true);
  }

  //* Delete Task In Contact Moment POST Request Work Ends *//

  //* Pick Date Work Starts *//

  late DateTime mSelectedDateTimeForTask;

  pickDate(
      {required BuildContext context,
      required bool enablePreviousDates}) async {
    var mSelectedDateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: enablePreviousDates ? DateTime(2015, 8) : DateTime.now(),
        lastDate: DateTime(2101));
    mSelectedDateTimeForTask = mSelectedDateTime!;
    mDateTimeTextController.text =
        DateFormat('dd-MM-yyyy').format(mSelectedDateTime);
    notifyListeners();
  }

  //* Pick Date Work Ends *//

  //* Clear All Fields Work Starts *//

  clearContactMomentSelectedData() {
    mContactMomentSubjectController.clear();
    mDateTimeTextController.clear();
    mContactFarmSearchController.clear();
    mAttendeesSearchController.clear();
    mProjectSearchController.clear();
    mAttendeesSelectedList.clear();
    mSearchedProjectId = 0;
    selectedFarmID = '';
    isDataNotEmpty = false;
    attendeesNotesResult = '';
    internalNotesResult = '';
    mContactMomentType = "Select Contact Moment";
    notifyListeners();
  }

  // setDataFromAddNotesDialogButton(){
  //   // internalNotesController.setText(contactMomentModel.contactNotes ?? "");
  //   // internalNotesController.insertHtml(contactMomentModel.contactNotes ?? "");
  //   // attendeesNotesController.setText(contactMomentModel.attendeeNote ?? "");
  //   // internalNotesResult = contactMomentModel.contactNotes ?? "";
  //   // attendeesNotesResult = contactMomentModel.attendeeNote ?? "";
  //
  //   notifyListeners();
  //
  // }

  clearTasksFields() {
    mSearchedPersonId = 0;
    mDateTimeTextController.clear();
    selectedTaskStatus = 'Select status';
    mTaskDescriptionController.clear();
    mSearchedFarmId = 0;
    mSearchedProjectId = 0;
    mPersonSearchController.clear();
    mFarmSearchController.clear();
    mProjectSearchController.clear();
    notifyListeners();
  }

  //* Clear All Fields Work Ends *//

  //* Clear All Selected Subjects Work Starts *//

  String mSelectedSubjectByUser = "";

  clearAllSelectedSubjects() {
    mShowSubjectWidget = false;
    // if (mSubjectSearchController.hasListeners) {
    //   mSubjectSearchController.dispose();
    // }
    mCheckBoxDataList.clear();
    notifyListeners();
    for (var i = 0; i < projectDropdown.data!.length; i++) {
      mCheckBoxDataList.add(
        SubjectSelectionRequestModel(
            title: projectDropdown.data![i].name!, status: false),
      );
      notifyListeners();
    }
  }

  //* Clear All Selected Subjects Work Ends *//

  //* Set Assigned person Name in Tasks List Work Starts *//
  String setAssignedPersonName(String id) {
    String name = "";

    for (var i = 0; i < personsDropdown.data!.length; i++) {
      if (id == personsDropdown.data![i].id.toString()) {
        name = personsDropdown.data![i].name!;
        notifyListeners();
      }
    }
    return name;
  }

  //* Set Assigned person Name in Tasks List Work Ends *//

  //* Task Status Work Starts *//
  String? selectedTaskStatus = 'Select status';
  List<String> taskStatusList = <String>[
    'Select status',
    "To do",
    "In progress",
  ];

  //* Task Status Work Ends *//

  //* Contact Moment Type Work Starts *//
  List<String> mContactMomentTypDropDown = [
    "Select Contact Moment",
    "At Event",
    "Chat",
    "Email",
    "Farm Visit",
    "Phone Call",
    "Live Meeting",
    "Video Conference",
    "Webinar/Online event"
  ];
  String mContactMomentType = "Select Contact Moment";
  String mContactMomentTypeForFilter = "Select Contact Moment";

  //* Contact Moment Type Work Ends *//

  //* Other Variables *//
  List<Color> colors = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
  ];
  bool onTaskContact = false;
  bool load = false;
  String selectedFarmID = '';
  String selectedFarmName = '';
  List listOfAttendees = [];
  String mCurrentAttendeesType = '';
  String selectedProjectID = '';
  String selectedProjectName = '';
  late List<ContactSubjectsPost> subjectsListForPost = [];
  late List<TasksPost> tasksListForPost = [];
  double containerHeight = 70.0;
  String subjectDescription = '';
  String internalNotesResult = '';
  String attendeesNotesResult = '';
  bool doUpdate = false;

  //* Other Variables *//

  //* Set Already Assigned Data Before Update Work Start *//

  setAlreadyAssignedDataBeforeUpdate(
      {required ContactMomentsModel contactMomentModel}) {
    //* Set Attendees Name Into Controller
    mAttendeesSelectedList.clear();
    customTileExpanded = false;

    List<AttendeesData> attendeesList = [];
    for (var i = 0; i < contactMomentModel.attendees!.length; i++) {
      attendeesList.add(AttendeesData(
        id: contactMomentModel.attendees![i].id,
        name: contactMomentModel.attendees![i].name,
      ));
    }
    for (var i = 0; i < attendeesList.length; i++) {
      mAttendeesSelectedList.add(attendeesList[i]);
    }

    //* Set Contact Moment Type Into Controller
    for (var i = 0; i < mContactMomentTypDropDown.length; i++) {
      if (contactMomentModel.contactMomentType ==
          mContactMomentTypDropDown[i]) {
        mContactMomentType = contactMomentModel.contactMomentType!;
        notifyListeners();
      }
    }

    //* Set Farm Type Into Controller
    for (var i = 0; i < farmDropDown.data!.length; i++) {
      if (contactMomentModel.farmId == farmDropDown.data![i].id) {
        mContactFarmSearchController.text = farmDropDown.data![i].name!;
        mSearchedFarmId = farmDropDown.data![i].id!;
        notifyListeners();
      }
    }

    //* Set Project Type Into Controller
    for (var i = 0; i < projectDropdown.data!.length; i++) {
      if (contactMomentModel.projectId == projectDropdown.data![i].id) {
        mProjectSearchController.text = projectDropdown.data![i].name!;
        mSearchedProjectId = projectDropdown.data![i].id!;
        notifyListeners();
      }
    }
    internalNotesResult = contactMomentModel.contactNotes ?? "";
    attendeesNotesResult = contactMomentModel.attendeeNote ?? "";
    mDateTimeTextController.text = contactMomentModel.contactMomentDate!;
    mSelectedDateTimeForTask =
        DateTime.parse(contactMomentModel.contactMomentDate!);
    internalNotesController.setText(contactMomentModel.contactNotes ?? "");
    internalNotesController.insertHtml(contactMomentModel.contactNotes ?? "");
    attendeesNotesController.setText(contactMomentModel.attendeeNote ?? "");
    internalNotesResult = contactMomentModel.contactNotes ?? "";
    attendeesNotesResult = contactMomentModel.attendeeNote ?? "";

    notifyListeners();
  }

//* Set Already Assigned Data Before Update Work Ends *//

  //* Filter Work Start *//

  bool mShowFilters = false;

  showFilter({required bool filterValue}) {
    mShowFilters = filterValue;
    notifyListeners();
  }

//* Filter Work End *//

}
