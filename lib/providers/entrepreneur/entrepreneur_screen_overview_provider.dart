import 'dart:convert';
import 'dart:developer';
import 'package:universal_html/html.dart' as html;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:wij_land/app_common_widgets/loading_dialog.dart';
import 'package:wij_land/models/entrepreneur/request/put_enterpreneur_person_request.dart';
import 'package:wij_land/models/entrepreneur_dropDown/organize_person_dropDown.dart';
import '../../api_clients/BaseClass.dart';
import '../../api_clients/dropDown_client.dart';
import '../../api_clients/entrepreneur_client.dart';
import '../../models/entrepreneur/request/overview_csv_download_request_model.dart';
import '../../models/entrepreneur/request/post_entrepreneur_person_request.dart';
import '../../models/entrepreneur/request/post_entrepreneur_request.dart';
import '../../models/entrepreneur/request/update_person_of_entrepreneur_request.dart';
import '../../models/entrepreneur/response/delete_entrepreneur_response.dart';
import '../../models/entrepreneur/response/get_entrepreneur_detail_response.dart';
import '../../models/entrepreneur/response/get_entrepreneur_overview.dart';
import '../../models/entrepreneur/response/get_entrepreneur_response.dart';
import '../../models/entrepreneur/response/post_entrepreneur_person_response.dart';
import '../../models/entrepreneur/response/post_entrepreneur_response.dart';
import '../../models/entrepreneur/response/put_entrepreneur_person_response.dart';
import '../../models/entrepreneur_dropDown/entrepreneur_relation_to_wijland_drop_down_model.dart';
import '../../models/entrepreneur_dropDown/focus_area_drop_down_model.dart';
import '../../models/entrepreneur_dropDown/legal_structure_drop_down_model.dart';
import '../../models/entrepreneur_dropDown/persons_dropDown.dart';
import '../../models/entrepreneur_dropDown/products_drop_down_model.dart';
import '../../models/entrepreneur_dropDown/project_dropDown.dart';
import '../../models/entrepreneur_dropDown/relation_to_wijland_drop_down_model.dart';
import '../../models/file_upload/response/file_upload_response.dart';

class EntrepreneurOverviewScreenProvider extends ChangeNotifier {
  //* Text Editing Controllers Variables Start *//
  TextEditingController mFirstNameController = TextEditingController();
  TextEditingController mLastNameController = TextEditingController();
  TextEditingController mEmailAddressController = TextEditingController();
  TextEditingController mMailingAddressController = TextEditingController();
  TextEditingController mMobileNumberController = TextEditingController();
  TextEditingController mPhoneNumberController = TextEditingController();
  TextEditingController mCommentsController = TextEditingController();
  TextEditingController mPersonSearchController = TextEditingController();
  TextEditingController mEnterpriseNameController = TextEditingController();
  TextEditingController mPositionController = TextEditingController();
  TextEditingController mPostAddressController = TextEditingController();
  TextEditingController mVisitingAddressController = TextEditingController();
  TextEditingController mProductsController = TextEditingController();
  TextEditingController mHelpRequestController = TextEditingController();
  TextEditingController mWebsiteLinkController = TextEditingController();
  TextEditingController mInstagramLinkController = TextEditingController();
  TextEditingController mInstagramFollowersController = TextEditingController();
  TextEditingController mLinkedInLinkController = TextEditingController();
  TextEditingController mLinkedInFollowersController = TextEditingController();
  TextEditingController mFacebookLinkController = TextEditingController();
  TextEditingController mFacebookFollowersController = TextEditingController();
  TextEditingController mTwitterLinkController = TextEditingController();
  TextEditingController mTwitterFollowersController = TextEditingController();
  TextEditingController mDateTimeTextController = TextEditingController();
  TextEditingController mDateTextController = TextEditingController();
  TextEditingController mYearController = TextEditingController();
  TextEditingController mAmountController = TextEditingController();
  TextEditingController mProjectController = TextEditingController();
  TextEditingController mOrganizationController = TextEditingController();

  //* Text Editing Controllers Variables Ends *//

  ///* CSV DOWNLOAD WORK STARTS *///
  List<int> allCheckedBoxId = [];

  downloadCSV() async {
    var url = "$baseURL/farm_computer/download/persons";

    if (allCheckedBoxId.isNotEmpty) {
      var uri = Uri.parse(url);
      OverviewCSVDownloadRequestModel csvRequestModel =
          OverviewCSVDownloadRequestModel(
        prefixEntity: "",
        property: Property(
          personEmailAddress: "on",
          personFirstName: "on",
          personLastName: "on",
          personPhoneNumberHome: "on",
          personPhoneNumberMobile: "on",
        ),
        selectedIds: allCheckedBoxId,
      );

      print('Request Object : ${csvRequestModel.toJson()}');

      var response = await http.post(
        uri,
        headers: header,
        body: jsonEncode(
          csvRequestModel,
        ),
      );
      print('Download CSV Response Status Code : ${response.statusCode}');
      print('Download CSV Response : ${response.body}');

      if (response.statusCode == 200) {
        final blob = html.Blob([response.bodyBytes]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.document.createElement('a') as html.AnchorElement
          ..href = url
          ..style.display = 'none'
          ..download = "person.csv";
        html.document.body!.children.add(anchor);

        anchor.click();

        html.document.body!.children.remove(anchor);
        html.Url.revokeObjectUrl(url);
      }
    }
  }

  ///* CSV DOWNLOAD WORK ENDS *///

  //* Image Picker Method Start *//

  bool isFirst = false, isLast = false, isMobile = false;

  updateUI(bool first, bool last, bool mobile) {
    isFirst = first;
    isLast = last;
    isMobile = mobile;

    notifyListeners();
  }

  var mUserImagePath;

  late PlatformFile mPickedFile;
  late FilePickerResult? mFilePickerResult;

  pickUserImage() async {
    mFilePickerResult = await FilePicker.platform.pickFiles();

    if (mFilePickerResult != null) {
      mPickedFile = mFilePickerResult!.files.first;
      var f = mPickedFile.bytes;
      isFIlePicked = true;
      mUserImagePath = f;
      notifyListeners();
    }
  }

  //* Image Picker Method Ends *//

  //* DateTime Picker Start *//

  DateTime? mSelectedDateTime;

  pickDateTime({required BuildContext context}) async {
    mSelectedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      confirmText: '',
      cancelText: '',
    );

    mDateTimeTextController.text =
        DateFormat('dd-MM-yyyy').format(mSelectedDateTime!);
    notifyListeners();
  }

  pickDate({required BuildContext context}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: SizedBox(
              width: 300,
              height: 400,
              child: SfDateRangePicker(
                initialDisplayDate: DateTime.tryParse('dd-MM-yyyy'),
                initialSelectedDate: DateTime.now(),
                onSelectionChanged: (args) {
                  mDateTimeTextController.text =
                      DateFormat('dd-MM-yyyy').format(args.value!);
                  Future.delayed(Duration(milliseconds: 500), () {
                    Navigator.pop(context);
                  });
                  notifyListeners();
                },
                selectionMode: DateRangePickerSelectionMode.single,
              ),
            ),
          );
        });
  }

  //* DateTime Picker Ends *//

  //* Year Picker Starts *//

  pickYear({required BuildContext context}) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Select Year"),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
              ),
            ],
          ),
          content: SizedBox(
            width: 300,
            height: 400,
            child: YearPicker(
              firstDate: DateTime(DateTime.now().year - 100, 1),
              lastDate: DateTime(DateTime.now().year + 100, 1),
              initialDate: DateTime.now(),
              selectedDate: DateTime.now(),
              onChanged: (DateTime dateTime) {
                mYearController.text = DateFormat('yyyy').format(dateTime);
                notifyListeners();
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  //* Year Picker Ends *//

  //* Person Drop down and Search Work Start *//

  late PersonsDropdown personsDropdown;
  late OrganizePersonDropDown organizePersonDropDown;

  late List<Persons> mPersonSearchedList = [];
  late List<OrganizePerson> mOrgPersonSearchedList = [];

  late int mSearchedPersonId = 0;

  updatePersonID({required int id}) {
    mSearchedPersonId = id;
    notifyListeners();
  }

  getPersonsDropDownData() async {
    personsDropdown = await DropDownClients.getPersonDetailData();
  }

  getOrganizationPerson({required int id}) async {
    organizePersonDropDown =
        await DropDownClients.getOrganizePersonDetailData(id: id);
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

  searchOrganizePerson({required String value}) {
    mOrgPersonSearchedList.clear();
    notifyListeners();

    for (var i = 0; i < organizePersonDropDown.data!.length; i++) {
      if (organizePersonDropDown.data![i].personName!
          .toLowerCase()
          .contains(value.toLowerCase())) {
        mOrgPersonSearchedList.add(organizePersonDropDown.data![i]);
        notifyListeners();
      }
    }
  }

  //* Person Drop down and Search Work Ends *//

  //* Overview Get Request Work Start *//

  var showLoadingWidget = false.obs;
  late GetEntrepreneurOverviewResponse mOverviewData;
  late List<bool> selected;
  List<Products> productData = [];

  getOverviewData(
    int id,
    bool getDetail, {
    bool? comingFromInitState,
    BuildContext? context,
  }) async {
    showLoadingWidget.value = true;
    mOverviewData = GetEntrepreneurOverviewResponse();
    notifyListeners();

    mOverviewData =
        await EntrepreneurClients.getOverviewData(mEntrepreneurID: id);
    selected = List<bool>.filled(mOverviewData.data!.persons!.length, false);

    mInstagramLinkController.text =
        mOverviewData.data!.entrepreneur?.instagram ?? "";
    mInstagramFollowersController.text =
        mOverviewData.data!.entrepreneur!.instagramFollowers.toString();
    mLinkedInLinkController.text =
        mOverviewData.data!.entrepreneur?.linkedin ?? "";
    mLinkedInFollowersController.text =
        mOverviewData.data!.entrepreneur!.linkedinFollower.toString();

    mFacebookLinkController.text =
        mOverviewData.data!.entrepreneur?.facebook ?? "";
    mFacebookFollowersController.text =
        mOverviewData.data!.entrepreneur!.facebookFollower.toString();
    mTwitterLinkController.text =
        mOverviewData.data!.entrepreneur?.twitter ?? "";
    mTwitterFollowersController.text =
        mOverviewData.data!.entrepreneur!.twitterFollower.toString();
    mHelpRequestController.text =
        mOverviewData.data!.entrepreneur?.helpRequest ?? "";

    notifyListeners();
    if (getDetail) {
      getEntrepreneurDetail(id, context,
          comingFromInitState: comingFromInitState ?? false);
    } else {
      showLoadingWidget.value = false;
      notifyListeners();
    }
  }

  //* Overview Get Request Work Ends *//

  //* Entrepreneur Detail Get Request Work Start *//

  late GetEntrepreneurDetailsResponse detailsResponse;
  late String mPostAddressLatitude;
  late String mPostAddressLongitude;
  late List<DetailProducts> comingProductsList = [];

  late RelationToWijLandDropDownModel relationToWijLandDropDownModel;
  List<String> mSelectedRelationToWijLandList = [];
  List<String> mSelectedEntrepreneurRelationToWijLandList = [];
  String mSelectedRelationToWijLandType = "";
  String mSelectedEntrepreneurRelationToWijLandType = "";

  getEntrepreneurDetail(
    int id,
    BuildContext? context, {
    bool? comingFromInitState,
  }) async {
    comingProductsList.clear();
    mSelectedEntrepreneurProductsList.clear();
    notifyListeners();
    detailsResponse = await EntrepreneurClients.getEntrepreneurDetailData(
        mEntrepreneurID: id);
    comingProductsList = detailsResponse.data!.entrepreneurInfo!.products!;
    notifyListeners();

    if (detailsResponse.data?.imagePath?.path != null) {
      XFile newXFile = XFile(detailsResponse.data!.imagePath!.path!);
      var newWebImage = await newXFile.readAsBytes();
      mUserImagePath = newWebImage;
      mLogoID = detailsResponse.data!.imagePath!.id.toString();
      notifyListeners();
    } else {
      mLogoID = "";
      isFIlePicked = false;
      notifyListeners();
    }

    for (var i = 0; i < comingProductsList.length; i++) {
      print("Index : i");
      mSelectedEntrepreneurProductsList.add(comingProductsList[i].name!);
    }
    print("Complete response : ${detailsResponse.toJson()}");
    notifyListeners();

    mEnterpriseNameController.text =
        detailsResponse.data!.entrepreneurName ?? "";
    mPostAddressController.text = detailsResponse.data!.postalAddress ?? "";
    mPostAddressLatitude = detailsResponse.data!.latitude.toString() == 'null'
        ? '0.0'
        : detailsResponse.data!.latitude.toString();
    mPostAddressLongitude = detailsResponse.data!.longitude.toString() == 'null'
        ? '0.0'
        : detailsResponse.data!.longitude.toString();
    mSelectedRelationToWijLandList = detailsResponse.data!.relationToWijLand!;
    mSelectedRelationToWijLandType =
        detailsResponse.data!.relationToWijLand![0];

    mVisitingAddressController.text =
        detailsResponse.data!.visitingAddress ?? "";

    mSelectedFocusAreaType =
        focusAreaDropDownModel.data!.contains(detailsResponse.data!.focusArea)
            ? detailsResponse.data!.focusArea!
            : focusAreaDropDownModel.data![0];

    mSelectedEntrepreneurRelationToWijLandList =
        detailsResponse.data!.entrepreneurInfo!.relationToWijLand!;

    mSelectedLegalStructureType = legalStructureDropDownModel.data!
            .contains(detailsResponse.data!.legalStructure)
        ? detailsResponse.data!.legalStructure!
        : legalStructureDropDownModel.data![0];

    print(
        "Relation To Wij Land Type : ${detailsResponse.data!.relationToWijLand}");
    print("Focus Area Type : ${detailsResponse.data!.focusArea!}");
    print(
        "Entrepreneur Relation To Wij Land Type : ${detailsResponse.data!.entrepreneurInfo!.relationToWijLand}");
    print("Legal Structure Type : ${detailsResponse.data!.legalStructure!}");

    mYearController.text =
        detailsResponse.data!.year == "null" ? "" : detailsResponse.data!.year!;
    mAmountController.text = (detailsResponse.data!.amount == null ||
            detailsResponse.data!.amount == 'null')
        ? ""
        : detailsResponse.data!.amount!;
    String date = detailsResponse.data!.connectedToWijlandSince!;
    String newdate =
        '${date.split('-')[2]}-${date.split('-')[1]}-${date.split('-')[0]}';
    mDateTimeTextController.text = newdate;
    mEnterpriseNameController.text =
        detailsResponse.data!.entrepreneurName ?? "";
    mVisitingAddressController.text =
        detailsResponse.data!.visitingAddress ?? "";
    mProductsController.text = detailsResponse.data!.project == null
        ? ""
        : detailsResponse.data!.project!.name!;
    mPostAddressController.text = detailsResponse.data!.postalAddress ?? "";

    showLoadingWidget.value = false;
    notifyListeners();
//    print("Close Dialog $context ");
    if (comingFromInitState!) {
    } else {
      print("CONTEXT");
      //  Navigator.pop(Get.context!);
    }
  }

  //*  Entrepreneur Detail Get Request Work Ends *//

  //* Add New Person Post Request Work Start *//
  late PostEntrepreneurPersonResponse postEntrepreneurPersonResponse;

  addNewPerson(
    int mEntrepreneurID,
    PostEntrepreneurPersonRequest postEntrepreneurPersonRequest,
    String mImageID,
  ) async {
    postEntrepreneurPersonResponse =
        await EntrepreneurClients.createNewPersonInEntrepreneur(
            postEntrepreneurPersonRequest, mEntrepreneurID, mLogoID);
    await getOverviewData(mEntrepreneurID, false);
  }

  //* Add New Person Post Request Work Ends *//

  //* Update Person Post Request Work Start *//
  late PutEntrepreneurPersonResponse updatePersonOfEntrepreneurResponse;

  Future updatePerson(
    int id,
    PutEntrepreneurPersonRequest updatePersonOfEntrepreneur,
    int personIDs,
  ) async {
    updatePersonOfEntrepreneurResponse =
        await EntrepreneurClients.updatePersonOfEntrepreneur(
      updatePersonOfEntrepreneur,
      id,
      personIDs,
    );
  }

  //* Update Person Post Request Work Ends *//

  //* Add Existing Person Post Request Work Start *//

  late UpdatePersonOfEntrepreneur addExistingPersonResponse;

  addExistingPerson(
    int id,
    UpdatePersonOfEntrepreneur postEntrepreneurPersonRequest,
  ) async {
    addExistingPersonResponse =
        await EntrepreneurClients.createExistingPersonInEntrepreneur(
      postEntrepreneurPersonRequest,
      id,
    );
    await getOverviewData(id, false);
  }

  //* Add Existing Person Post Request Work Ends *//

  //* Delete An Entrepreneur Post Request Work Start *//

  late DeleteEntrepreneurResponse deleteEntrepreneurResponse;

  Future deleteAnEntrepreneur(
      dynamic entrepreneurID, BuildContext context) async {
    deleteEntrepreneurResponse = await EntrepreneurClients.deleteEntrepreneur(
      [entrepreneurID],
    );
  }

  //* Delete An Entrepreneur Post Request Work Ends *//

  //* Delete person Post Request Work Start *//
  late DeleteEntrepreneurResponse deletePersonResponse;

  deletePerson({
    required int entrepreneurID,
    required List<String> mPersonIds,
  }) async {
    deletePersonResponse = await EntrepreneurClients.deletePersonOfEntrepreneur(
      entrepreneurID,
      mPersonIds,
    );
    getOverviewData(entrepreneurID, false);
  }

  //* Delete person Post Request Work Ends *//

  //* Delete All persons Post Request Work Start *//

  deleteAllEntrepreneurPersons({
    required int entrepreneurID,
    required List<String> mPersonIds,
  }) async {
    for (var i = 0; i < mPersonIds.length; i++) {
      deletePerson(entrepreneurID: entrepreneurID, mPersonIds: [mPersonIds[i]]);
    }
  }

  //* Delete All persons Post Request Work Ends *//

  //* Update Entrepreneur Post Request Work Start *//

  late PostEntrepreneurResponse updateEntrepreneurResponse;

  bool isUpdateEntrepreneur = false;

  updateEntrepreneur(
    PostEntrepreneurRequest postEntrepreneurRequest,
    int mEntrepreneurID,
    String logoID,
    BuildContext context,
  ) async {
    updateEntrepreneurResponse = await EntrepreneurClients.updateEntrepreneur(
      postEntrepreneurRequest,
      mEntrepreneurID,
      logoID,
    );

    isUpdateEntrepreneur = true;
    notifyListeners();
    await getOverviewData(mEntrepreneurID, true, context: context);
  }

  //* Update Entrepreneur Post Request Work Ends *//

  //* File Upload And Update Entrepreneur Post Request Work Start *//
  bool isFIlePicked = false;
  late FileUploadResponse fileUploadResponse;
  late String mLogoID;

  uploadFile(
    bool isPersonRequest, {
    required PostEntrepreneurRequest? postEntrepreneurRequest,
    required bool isUpdate,
    required int mEntrepreneurID,
    required PostEntrepreneurPersonRequest? postEntrepreneurPersonRequest,
    required BuildContext dialogContext,
  }) async {
    if (isFIlePicked == false) {
      if (isPersonRequest) {
        addNewPerson(
          mEntrepreneurID,
          postEntrepreneurPersonRequest!,
          mLogoID,
        );
      } else {
        updateEntrepreneur(
            postEntrepreneurRequest!, mEntrepreneurID, mLogoID, dialogContext);
      }
    } else {
      AppLoadingDialog.progressDialog(context: Get.context!);
      fileUploadResponse = await EntrepreneurClients.uploadFile(
          mPickedFile); // First it was only file
      log("Image ID : ${fileUploadResponse.data!.id}");
      mLogoID = fileUploadResponse.data!.id.toString();
      notifyListeners();
      if (isPersonRequest) {
        await addNewPerson(
          mEntrepreneurID,
          postEntrepreneurPersonRequest!,
          mLogoID,
        );
      } else {
        await updateEntrepreneur(
            postEntrepreneurRequest!, mEntrepreneurID, mLogoID, dialogContext);
      }
    }
  }

  //* File Upload And Update Entrepreneur Post Request Work Ends *//

  //* Projects Search And Post Request Work Starts *//

  bool mShowProjectListWidget = false;
  late ProjectDropdown projectDropdown;
  late List<ProjectsData> mProjectSearchedList = [];
  late int mSearchedProjectId = 0;

  updateProjectID({required int id}) {
    mSearchedProjectId = id;
    notifyListeners();
  }

  getProjectsList() async {
    projectDropdown = await DropDownClients.getProjectsDropDownData();
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

  //* Projects Search And Post Request Work Ends *//

  //* Products Get Request work Start *//
  List<String> mSelectedEntrepreneurProductsList = [];
  late ProductsDropDownModel productsDropDownModel;
  String mSelectedProductsType = "";

  getProductsList() async {
    productsDropDownModel = await DropDownClients.getProductsDropDownData();
    mSelectedProductsType = productsDropDownModel.data![0];
  }

  //* Products Get Request work Start *//

  //* Legal Structure Get Request work Start *//

  late LegalStructureDropDownModel legalStructureDropDownModel;
  String mSelectedLegalStructureType = "";

  getLegalStructureDropDownData() async {
    legalStructureDropDownModel =
        await DropDownClients.getLegalStructureDropDownData();
    mSelectedLegalStructureType = legalStructureDropDownModel.data![0];
    notifyListeners();
  }

  //* Legal Structure Get Request work Ends *//

  //* Relation to WijLand Get Request work Start *//

  getRelationToWijLandDropDownData() async {
    relationToWijLandDropDownModel =
        await DropDownClients.getRelationToWijLandDropDownData();
    mSelectedRelationToWijLandType = relationToWijLandDropDownModel.data![0];
    notifyListeners();
  }

  //* Relation to WijLand Get Request work Ends *//

  //* Entrepreneur Relation to WijLand Get Request work Start *//

  late EntrepreneurRelationToWijLandDropDownModel
      entrepreneurRelationToWijLandDropDownModel;

  getEntrepreneurRelationToWijLandDropDownData() async {
    entrepreneurRelationToWijLandDropDownModel =
        await DropDownClients.getEntrepreneurRelationToWijLandDropDownData();
    mSelectedEntrepreneurRelationToWijLandType =
        entrepreneurRelationToWijLandDropDownModel.data![0];
    notifyListeners();
  }

  //* Entrepreneur Relation to WijLand Get Request work Ends *//

  //* Focus Area to WijLand Get Request work Start *//

  late FocusAreaDropDownModel focusAreaDropDownModel;
  String mSelectedFocusAreaType = "";

  getFocusAreaDropDownData() async {
    focusAreaDropDownModel = await DropDownClients.getFocusAreaDropDownData();
    mSelectedFocusAreaType = focusAreaDropDownModel.data![0];
    notifyListeners();
  }

  //* Focus Area to WijLand Get Request work Ends *//

  // * Other Variables Declaration Start *//
  int mSelectedIndex = 0;
  bool mShowPersonsListWidget = false;
  bool isClicked = false, mapOpened = false;
  bool isSatelliteView = true;

  List<bool> socialList = [false, false, true, true, true, true];

  late String mVisitingAddressLatitude;
  late String mVisitingAddressLongitude;
  String mOrganizationType = "Farm";
  List<String> mRolesList = ["", "Founder", "Owner", "Employee", "Other"];
  List<String> mOrganizationTypeDropDownList = [
    "Farm",
    "Governmental Institution",
    "Company",
    "Knowledge Institute",
    "Lab",
    "Foundation",
    "Site Management",
    "Association/collective",
    "Other"
  ];

  var titleListForAdd = ['Add Entrepreneurs', 'Entrepreneurs Details'];
  var titleListForUpdate = ['Update Entrepreneurs', 'Entrepreneurs Details'];
  var titleClick = [true, false];

  String mSelectedRole = "";
  List<String> mSelectedRoleTypesList = [];

  var icon = [
        FontAwesomeIcons.truck,
        Icons.shopping_cart_outlined,
        FontAwesomeIcons.linkedin,
        FontAwesomeIcons.instagram,
        FontAwesomeIcons.facebookF,
        FontAwesomeIcons.twitter
      ],
      description = [
        'Total Suppliers',
        'Total Retailers',
        'LinkedIn Followers',
        'Instagram Followers',
        'Facebook Followers',
        'Twitter Followers'
      ],
      titleList = ['Overview', 'Contacts', 'Suppliers', 'Retailers'],
      titleClicked = [true, false, false, false],
      sideColor = [
        Color(0xff48883E),
        Color(0xffA71832),
        Color(0xff82C454),
        Color(0xffA71832),
        Color(0xff82C454),
        Color(0xff6BCADB),
      ],
      addressList = [
        'Postal Address',
        'Visiting Address',
        'Connect to WL Since',
        'Focus Area',
        'Legal Structure',
        'Relation to Wij-Land',
        'Amount €',
        'Year',
        'Project'
      ];

// * Other Variables Declaration Start *//

}
