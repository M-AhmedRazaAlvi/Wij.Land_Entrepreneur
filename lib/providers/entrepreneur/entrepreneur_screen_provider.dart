import 'dart:convert';
import 'dart:developer';
import 'package:universal_html/html.dart' as html;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:wij_land/app_common_widgets/loading_dialog.dart';
import 'package:wij_land/models/entrepreneur/response/get_entrepreneur_response.dart';
import 'package:wij_land/models/entrepreneur_dropDown/focus_area_drop_down_model.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../api_clients/entrepreneur_client.dart';
import '../../../models/entrepreneur/request/post_entrepreneur_request.dart';
import '../../../models/entrepreneur/response/delete_entrepreneur_response.dart';
import '../../../models/entrepreneur/response/post_entrepreneur_response.dart';
import '../../api_clients/BaseClass.dart';
import '../../api_clients/dropDown_client.dart';
import '../../models/entrepreneur/request/csv_download_request_model.dart';
import '../../models/entrepreneur_dropDown/entrepreneur_relation_to_wijland_drop_down_model.dart';
import '../../models/entrepreneur_dropDown/legal_structure_drop_down_model.dart';
import '../../models/entrepreneur_dropDown/organization_dropDown.dart';
import '../../models/entrepreneur_dropDown/products_drop_down_model.dart';
import '../../models/entrepreneur_dropDown/project_dropDown.dart';
import '../../models/entrepreneur_dropDown/relation_to_wijland_drop_down_model.dart';
import '../../models/file_upload/response/file_upload_response.dart';

var showLoadingWidget = false.obs;

class EntrepreneurScreenProvider extends ChangeNotifier {
  var titleListForAdd = ['Add Entrepreneurs', 'Entrepreneurs Details'];
  var titleListForUpdate = ['Update Entrepreneurs', 'Entrepreneurs Details'];
  var titleClick = [true, false];

  updateTitleClick(
      {required bool firstTitleClicked, required bool secondTitleClicked}) {
    if (firstTitleClicked) {
      titleClick[0] = true;
      titleClick[1] = false;
      notifyListeners();
    } else {
      titleClick[0] = false;
      titleClick[1] = true;
      notifyListeners();
    }
  }

  final ImagePicker _picker = ImagePicker();

  late String mPostAddressLatitude,
      mPostAddressLongitude,
      mVisitingAddressLatitude,
      mVisitingAddressLongitude;
  List<bool>? selected;
  bool isMapDisplay = false;
  bool mShowFilterActions = false;

  updateDisplayWidget({required bool mIsShowMapWidget}) {
    isMapDisplay = mIsShowMapWidget;
    notifyListeners();
  }

  updateFilterActions({required bool value}) {
    mShowFilterActions = value;
    notifyListeners();
  }

  List<Marker> mMarkersList = [];

  // Pick an image
  var mWebImagePath;

  late PlatformFile file;
  late FilePickerResult? result;

  bool isFIlePicked = false;

  Future pickImage() async {
    log("Coming here");
    result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = result!.files.first;
      var f = file.bytes;
      mWebImagePath = f;
      isFIlePicked = true;
      log("FIle : ${file.name}");
      notifyListeners();
    } else {}
  }

  ///* CSV DOWNLOAD WORK STARTS *///

  List<int> mSelectedRowsList = [];

  downloadCSV() async {
    var baseUrl = "$baseURL/farm_computer/download/entrepreneurs";

    mSelectedRowsList.clear();
    notifyListeners();

    for (var i = 0; i < selected!.length; i++) {
      print("URL : ${selected}");
      if (selected![i] == true) {
        mSelectedRowsList
            .add(mEntrepreneurData.data![i].entrepreneurInfo!.entrepreneurID!);
      }
    }

    if (mSelectedRowsList.isNotEmpty) {
      var uri = Uri.parse(baseUrl);
      EntrepreneurDownloadCSVRequestModel csvRequestModel =
          EntrepreneurDownloadCSVRequestModel(
        prefixEntity: "",
        property: Property(
          entrepreneurFarms: "on",
          entrepreneurFocusArea: "on",
          entrepreneurLegalStructure: "on",
          entrepreneurName: "on",
          entrepreneurSellingLocations: "on",
        ),
        selectedIds: mSelectedRowsList,
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
          ..download = "entrepreneur.csv";
        html.document.body!.children.add(anchor);

        anchor.click();

        html.document.body!.children.remove(anchor);
        html.Url.revokeObjectUrl(url);
      }
      // else {
      //   PostEntrepreneurResponse model = PostEntrepreneurResponse();
      //   return model..message = 'data not found';
      // }

    }
  }

  ///* CSV DOWNLOAD WORK ENDS *///

  ///* Get Request Variables *///
  bool isFilter = false;
  bool searchTapped = false;

  TextEditingController mSuppliersController = TextEditingController();
  TextEditingController mSellingLocationsController = TextEditingController();
  TextEditingController mSearchController = TextEditingController();

  late GetEntrepreneurResponse mEntrepreneurData;
  var listofLatLng = LatLngBounds();

  Future getEntrepreneur(bool stopDialog) async {
    mEntrepreneurData = GetEntrepreneurResponse();
    mMarkersList.clear();
    // notifyListeners();
    print('mSelectedFocusAreaList = $mSelectedFocusAreaList');
    mEntrepreneurData = await EntrepreneurClients.getEntrepreneur(
      mSearchString: mSearchController.text,
      mSuppliers: mSuppliersController.text,
      mSellingLocations: mSellingLocationsController.text,
      mFocusType: mSelectedFocusAreaList == [] ? null : mSelectedFocusAreaList,
      mConnectionType: mSelectedConnectionTypesList == []
          ? null
          : mSelectedConnectionTypesList,
    );
    if (mEntrepreneurData.data != null && mEntrepreneurData.data!.isNotEmpty) {
      for (var i = 0; i < mEntrepreneurData.data!.length; i++) {
        listofLatLng.extend(latLng.LatLng(
          mEntrepreneurData.data![i].latitude == null
              ? 62.0
              : mEntrepreneurData.data![i].latitude!,
          mEntrepreneurData.data![i].longitude == null
              ? 32.0
              : mEntrepreneurData.data![i].longitude!,
        ));
        mMarkersList.add(
          Marker(
            point: latLng.LatLng(
              mEntrepreneurData.data![i].latitude == null
                  ? 62.0
                  : mEntrepreneurData.data![i].latitude!,
              mEntrepreneurData.data![i].longitude == null
                  ? 32.0
                  : mEntrepreneurData.data![i].longitude!,
            ),
            height: 80,
            width: 80,
            anchorPos: AnchorPos.align(AnchorAlign.top),
            builder: (context) {
              return Tooltip(
                message: '${mEntrepreneurData.data![i].name}',
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(3)),
                child: Icon(
                  Icons.location_on_rounded,
                  color: darkGreen,
                  size: 40,
                ),
                textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              );
            },
          ),
        );
      }
    }

    selected = List<bool>.generate(
        mEntrepreneurData.data!.length, (int index) => false);

    print("Markers List : ${mMarkersList.length}");
    showLoadingWidget.value = false;
    mEnterpriseNameController.clear();
    mPostAddressController.clear();
    mVisitingAddressController.clear();
    mProductsController.clear();
    mHelpRequestController.clear();
    mWebsiteLinkController.clear();
    mInstagramLinkController.clear();
    mInstagramFollowersController.clear();
    mLinkedInLinkController.clear();
    mLinkedInFollowersController.clear();
    mFacebookLinkController.clear();
    mFacebookFollowersController.clear();
    mTwitterLinkController.clear();
    mTwitterFollowersController.clear();
    mDateTimeTextController.clear();

    notifyListeners();
    if (stopDialog) {
      Navigator.pop(Get.context!);
    }
  }

  ///* Variables *///
  TextEditingController mEnterpriseNameController = TextEditingController();
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

  TextEditingController mYearController = TextEditingController();
  TextEditingController mAmountController = TextEditingController();
  TextEditingController mProjectController = TextEditingController();
  TextEditingController mOrganizationController = TextEditingController();

  TextEditingController mDateTimeTextController = TextEditingController();

  late DateTime? mSelectedDateTime;

  List<String> mSelectedConnectionTypesList = [];
  List<String> mSelectedFocusAreaList = [];

  bool isName = false,
      isPostAddress = false,
      isRelationWijland = false,
      isOrgType = false,
      isFocusArea = false,
      isEnterpreneurRelation = false,
      isVisitingAddress = false,
      isLegal = false,
      isProduct = false,
      isHelp = false,
      isDate = false;

  updateUI(
      bool name,
      bool postAddress,
      bool relationWijland,
      bool orgType,
      bool visitAddress,
      bool focusArea,
      bool enterPreneurRelation,
      bool legal,
      bool products,
      bool helps,
      bool date) {
    isName = name;
    isPostAddress = postAddress;
    isRelationWijland = relationWijland;
    isOrgType = orgType;
    isVisitingAddress = visitAddress;
    isFocusArea = focusArea;
    isEnterpreneurRelation = enterPreneurRelation;
    isLegal = legal;
    isProduct = products;
    isHelp = helps;
    isDate = date;
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

    //mDateTimeTextController.text = DateFormat('dd-MM-yyyy').format(mSelectedDateTime!);
    // notifyListeners();
  }

  pickYear({required BuildContext context}) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Year"),
          content: SizedBox(
            // Need to use container to add size constraint.
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(DateTime.now().year - 100, 1),
              lastDate: DateTime(DateTime.now().year + 100, 1),
              initialDate: DateTime.now(),
              // save the selected date to _selectedDate DateTime variable.
              // It's used to set the previous selected date when
              // re-showing the dialog.
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

  late PostEntrepreneurResponse postEntrepreneurResponse;
  late PostEntrepreneurResponse updateEntrepreneurResponse;

  List<String> mSelectedRelationToWijLandList = [];
  List<String> mSelectedEntrepreneurRelationToWijLandList = [];

  createNewEntrepreneur(
      PostEntrepreneurRequest postEntrepreneurRequest, String mImageID) async {
    postEntrepreneurResponse = await EntrepreneurClients.createNewEntrepreneur(
        postEntrepreneurRequest, mImageID);
    await getEntrepreneur(true);
  }

  late FileUploadResponse fileUploadResponse;

  uploadFile(
      {required PostEntrepreneurRequest postEntrepreneurRequest,
      required bool isUpdate,
      required int mEntrepreneurID}) async {
    //  FilePickerResult file = FilePickerResult([mWebImagePath]);
    AppLoadingDialog.progressDialog(context: Get.context!);
    if (isFIlePicked == false) {
      if (isUpdate) {
        updateEntrepreneur(postEntrepreneurRequest, mEntrepreneurID, mLogoID);
      } else {
        createNewEntrepreneur(postEntrepreneurRequest, mLogoID);
      }
    } else {
      fileUploadResponse =
          await EntrepreneurClients.uploadFile(file); // First it was only file
      log("Image ID : ${fileUploadResponse.data!.id}");
      mLogoID = fileUploadResponse.data!.id.toString();
      notifyListeners();
      if (isUpdate) {
        updateEntrepreneur(postEntrepreneurRequest, mEntrepreneurID, mLogoID);
      } else {
        createNewEntrepreneur(postEntrepreneurRequest, mLogoID);
      }
    }
  }

  updateEntrepreneur(PostEntrepreneurRequest postEntrepreneurRequest,
      int mEntrepreneurID, String logoID) async {
    await EntrepreneurClients.updateEntrepreneur(
        postEntrepreneurRequest, mEntrepreneurID, logoID);
    await getEntrepreneur(true);
  }

  late DeleteEntrepreneurResponse deleteEntrepreneurResponse;

  deleteAnEntrepreneur(dynamic entrepreneurID,
      {required bool getEntrepreneurData}) async {
    deleteEntrepreneurResponse =
        await EntrepreneurClients.deleteEntrepreneur(entrepreneurID);
    await getEntrepreneur(false);
  }

  deleteAllEntrepreneur(List<int> mEntrepreneurIDsList) async {
    log("IDs List : $mEntrepreneurIDsList");
    deleteAnEntrepreneur(mEntrepreneurIDsList, getEntrepreneurData: false);
  }

  String mSelectedRelationToWijLandType = "";
  String mSelectedFocusAreaType = "";
  String mSelectedEntrepreneurRelationToWijLandType = "";
  String mSelectedLegalStructureType = "";
  String mOrganizationType = "";

  List<String> mOrganizationTypeDropDownList = [
    "",
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

  /// Projects Search Work Starts ////

  bool mShowProjectListWidget = false;
  late ProjectDropdown projectDropdown;

  late List<ProjectsData> mProjectSearchedList = [];

  late int mSearchedProjectId = 0;

  updateProjectID({required int id}) {
    mSearchedProjectId = id;
    notifyListeners();
  }

  getProjectsDropDownData() async {
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

  /// Projects Search work Ends///

  /// Products Drop Down Data ///
  List<String> mSelectedProductsList = [];
  late ProductsDropDownModel productsDropDownModel;
  String mSelectedProductsType = "";

  getProductsDropDownData() async {
    productsDropDownModel = await DropDownClients.getProductsDropDownData();
    mSelectedProductsType = productsDropDownModel.data![0];
    print("Products Drop Down Data : ${productsDropDownModel.data}");
  }

  /// Products Drop Down Data ///

  /// Legal Structure Drop Down Data ///

  late LegalStructureDropDownModel legalStructureDropDownModel;

  getLegalStructureDropDownData() async {
    legalStructureDropDownModel =
        await DropDownClients.getLegalStructureDropDownData();
    legalStructureDropDownModel.data!.insert(0, '');

    mSelectedLegalStructureType = legalStructureDropDownModel.data![0];
    notifyListeners();
  }

  /// Legal Structure Drop Down Data ///

  /// Relation to WijLand Drop Down Data///

  late RelationToWijLandDropDownModel relationToWijLandDropDownModel;

  getRelationToWijLandDropDownData() async {
    relationToWijLandDropDownModel =
        await DropDownClients.getRelationToWijLandDropDownData();
    relationToWijLandDropDownModel.data!.insert(0, '');
    mSelectedRelationToWijLandType = relationToWijLandDropDownModel.data![0];
    notifyListeners();
  }

  /// Relation to WijLand Drop Down Data///

  /// Entrepreneur Relation to WijLand Drop Down Data///

  late EntrepreneurRelationToWijLandDropDownModel
      entrepreneurRelationToWijLandDropDownModel;

  getEntrepreneurRelationToWijLandDropDownData() async {
    entrepreneurRelationToWijLandDropDownModel =
        await DropDownClients.getEntrepreneurRelationToWijLandDropDownData();
    entrepreneurRelationToWijLandDropDownModel.data!.insert(0, '');
    mSelectedEntrepreneurRelationToWijLandType =
        entrepreneurRelationToWijLandDropDownModel.data![0];
    notifyListeners();
  }

  /// Entrepreneur Relation to WijLand Drop Down Data///

  /// Focus Area Relation to WijLand Drop Down Data///

  late FocusAreaDropDownModel focusAreaDropDownModel;

  getFocusAreaDropDownData() async {
    focusAreaDropDownModel = await DropDownClients.getFocusAreaDropDownData();
    focusAreaDropDownModel.data!.insert(0, '');

    mSelectedFocusAreaType = focusAreaDropDownModel.data![0];
    notifyListeners();
  }

  /// Entrepreneur Relation to WijLand Drop Down Data///

  /// Focus Area Relation to WijLand Drop Down Data///

  bool mShowOrganizationSearchWidget = false;
  late OrganizationDropdown organizationDropdown;

  late List<OrganizationData> mOrganizationsSearchedList = [];
  late OrganizationData mSelectedOrganizationDataModel =
      OrganizationData(id: 0);

  updateOrganizationModel({required OrganizationData model}) async {
    print("Selected Model : ${model.toJson()}");
    mSelectedOrganizationDataModel = model;
    mEnterpriseNameController.text = mSelectedOrganizationDataModel.name ?? "";
    mPostAddressController.text = mSelectedOrganizationDataModel.address ?? "";
    mSelectedRelationToWijLandType =
        mSelectedOrganizationDataModel.relationToWijland![0];
    mOrganizationType = mSelectedOrganizationDataModel.organizationType![0];
    mPostAddressLatitude = mSelectedOrganizationDataModel.latitude.toString();
    mPostAddressLongitude = mSelectedOrganizationDataModel.longitude.toString();
    if (mSelectedOrganizationDataModel.logo != null) {
      XFile newXFile = XFile(mSelectedOrganizationDataModel.logo!);
      var newWebImage = await newXFile.readAsBytes();
      mWebImagePath = newWebImage;
      mLogoID = mSelectedOrganizationDataModel.logoId.toString();
    }
    notifyListeners();
  }

  String mLogoID = "";

  getOrganizationsDropDownData() async {
    organizationDropdown = await DropDownClients.getOrganizationDetailData();

    notifyListeners();
  }

  searchOrganization({required String value}) {
    if (organizationDropdown.data!.isEmpty) {
    } else {
      mOrganizationsSearchedList.clear();
      notifyListeners();

      for (var i = 0; i < organizationDropdown.data!.length; i++) {
        if (organizationDropdown.data![i].name!
            .toLowerCase()
            .contains(value.toLowerCase())) {
          mOrganizationsSearchedList.add(organizationDropdown.data![i]);
          notifyListeners();
        }
      }
    }
  }

  /// Entrepreneur Relation to WijLand Drop Down Data///

  clearAllFields() {
    mSelectedOrganizationDataModel = OrganizationData(id: 0);
    mSelectedRelationToWijLandType = "";
    mOrganizationType = "";
    mPostAddressLatitude = '';
    mSelectedLegalStructureType = "";
    mWebImagePath = null;
    titleClick[0] = true;
    titleClick[1] = false;
    mPostAddressLongitude = '';
    mYearController.clear();
    mAmountController.clear();
    mOrganizationController.clear();
    mProjectController.clear();
    mDateTimeTextController.clear();
    mEnterpriseNameController.clear();
    mFacebookFollowersController.clear();
    mFacebookLinkController.clear();
    mHelpRequestController.clear();
    mInstagramFollowersController.clear();
    mInstagramLinkController.clear();
    mLinkedInFollowersController.clear();
    mLinkedInLinkController.clear();
    mPostAddressController.clear();
    mProductsController.clear();
    mSearchController.clear();
    mSellingLocationsController.clear();
    mSuppliersController.clear();
    mTwitterFollowersController.clear();
    mTwitterLinkController.clear();
    mVisitingAddressController.clear();
    mWebsiteLinkController.clear();
    mSearchedProjectId = 0;
    mSelectedProductsList.clear();
    mSelectedFocusAreaType = focusAreaDropDownModel.data![0];
    mSelectedEntrepreneurRelationToWijLandType =
        entrepreneurRelationToWijLandDropDownModel.data![0];
    mSelectedRelationToWijLandList.clear();
    notifyListeners();
  }
}
