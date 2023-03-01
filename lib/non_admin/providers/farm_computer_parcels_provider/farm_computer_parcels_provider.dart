import 'dart:convert';
import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_geocoding/google_geocoding.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:file_picker/file_picker.dart';
import 'package:wij_land/non_admin/api_clients/farm_computer_project_clients.dart';
import 'package:wij_land/non_admin/models/farm_computer_dropdown/parcel_land_function_drop_down.dart';
import 'package:wij_land/non_admin/models/farm_computer_dropdown/parcel_land_management_drop_down.dart';
import 'package:wij_land/non_admin/models/farm_computer_dropdown/parcel_project_drop_down.dart';
import 'package:wij_land/non_admin/models/farm_computer_dropdown/parcel_purpose_drop_down.dart';
import 'package:wij_land/non_admin/models/farm_computer_parcels/request/post_farm_computer_parcel_request.dart';
import 'package:wij_land/non_admin/models/farm_computer_parcels/request/put_farm_computer_parcel_request.dart';
import 'package:wij_land/non_admin/models/farm_computer_parcels/response/file_upload_response.dart';
import 'package:wij_land/non_admin/models/farm_computer_parcels/response/get_farm_computer_farm_name.dart';
import 'package:wij_land/non_admin/models/farm_computer_parcels/response/get_farm_computer_parcels_response.dart';

import '../../../utils/hex_color.dart';
import '../../api_clients/farm_computer_parcels_drop_down_client.dart';
import '../../models/farm_computer_actions/response/get_farm_computer_action_detail_response.dart';
import '../../models/farm_computer_dropdown/parcel_organizations_drop_down.dart';
import '../../models/farm_computer_dropdown/parcel_ownership_drop_down.dart';
import '../../models/farm_computer_parcels/response/localfile.dart';
import '../../screens/project_dashboard/project_actions/widget/action_detail_dialog.dart';

class FarmComputerParcelsProvider extends ChangeNotifier {
  GetFarmComputerParcelsResponse _farmComputerParcelsResponseModel =
      GetFarmComputerParcelsResponse();

  GetFarmComputerParcelsResponse get farmComputerParcelsResponseModel =>
      _farmComputerParcelsResponseModel;
  List<int> position = [];
  List<bool> expandedListOfBool = [];

  Future getFarmComputerParcelData() async {
    _farmComputerParcelsResponseModel =
        await FarmComputerProjectClients.getFarmComputerParcelsData(
      listofproject: listofSelectedProject,
    );
    notifyListeners();
    print(
        "Farm Computer parcels response   length ${_farmComputerParcelsResponseModel.data!.length} ");
    for (var i = 0; i < farmComputerParcelsResponseModel.data!.length; i++) {
      expandedListOfBool.add(false);
    }
    for (var i = 0; i <= farmComputerParcelsResponseModel.data!.length; i++) {
      position.add(i);
    }
  }

  late GetFarmComputerActionDetailResponse getFarmComputerActionDetailResponse;

  Future getFarmComputerActionDetailData({
    required int id,
    required BuildContext context,
  }) async {
    getFarmComputerActionDetailResponse =
        await FarmComputerProjectClients.getFarmComputerActionsDetailData(
      id: id,
    );

    print("Responsessss : ${getFarmComputerActionDetailResponse.data}");

    if (getFarmComputerActionDetailResponse.data != null) {
      String? latlngAddress = "";
      double latitude = 0, longitude = 0;
      var googleGeocoding =
          GoogleGeocoding("AIzaSyAoN99rcOjix3G0CJlEepPbR4VOwtgAH4E");
      print(
          "Bakhshi heap : ${getFarmComputerActionDetailResponse.data?.bokashiHeap}");
      if (getFarmComputerActionDetailResponse.data?.bokashiHeap != null) {
        var result = await googleGeocoding.geocoding.getReverse(LatLon(
            double.parse(getFarmComputerActionDetailResponse
                .data!.bokashiHeap!.location!.latitude!),
            double.parse(getFarmComputerActionDetailResponse
                .data!.bokashiHeap!.location!.longitude!)));
        print("Result : ${result!.results![0].formattedAddress}");
        latlngAddress = result.results![0].formattedAddress;
        latitude = double.parse(getFarmComputerActionDetailResponse
            .data!.bokashiHeap!.location!.latitude!);
        longitude = double.parse(getFarmComputerActionDetailResponse
            .data!.bokashiHeap!.location!.longitude!);
      }
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _TextWidget(
                  mText: getFarmComputerActionDetailResponse.data?.actionName ??
                      "",
                  mColor: HexColor("#892913"),
                  mFontSize: 24.0,
                  mFontWeight: FontWeight.w800,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            content: ActionDetailDialog(
              farmComputerActionDetailResponse:
                  getFarmComputerActionDetailResponse.data!,
              mLatLngAddress: latlngAddress!,
              mShowLatLngAddress: latlngAddress.isEmpty ? false : true,
              longitude: latitude,
              latitude: longitude,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          );
        },
      );
    }
  }

  //Get Farm computer parcel Farm Name////

  GetFarmComputerFarmNameResponse _farmComputerFarmNameResponse =
      GetFarmComputerFarmNameResponse();
  GetFarmComputerFarmNameResponse get farmComputerFarmNameResponse =>
      _farmComputerFarmNameResponse;
  Future getFarmComputerParcelsFarmName({required int farmID}) async {
    _farmComputerFarmNameResponse =
        await FarmComputerProjectClients.getFarmComputerFarmNameData(
            farmID: farmID);
  }

  ///////////Post farmcomputer parcels///////////////

  PostFarmComputerParcelsRequest? parcelsRequest;

  Future createFarmComputerParcels(
      PostFarmComputerParcelsRequest request) async {
    parcelsRequest =
        await FarmComputerProjectClients.creatFarmComputerParcel(request);
    notifyListeners();
  }

  /// update farm computer parcels //////

  Future updateFarmComputerParcels(
      {required int parcelID,
      String? parcelPictureID,
      PutFarmComputerParcelsRequest? requestBody}) async {
    await FarmComputerProjectClients.updateFarmComputerParcelData(
        parcelID: parcelID, requestBody: requestBody!);
    getFarmComputerParcelData();
    notifyListeners();
  }

/////////////////////upload image method/////////////////
  ///
  var mUserImagePath;
  bool isImagePicked = false;
  bool isFirstTabRequirments = false;
  PlatformFile? mPickedImage;
  FilePickerResult? imagePickerResult;

  pickUserImage() async {
    imagePickerResult = await FilePicker.platform.pickFiles();

    if (imagePickerResult != null) {
      mPickedImage = imagePickerResult!.files.first;
      var f = mPickedImage!.bytes;
      isImagePicked = true;
      mUserImagePath = f;
      notifyListeners();
    } else {}
  }

  FileUploadResponse? fileUploadResponse;
  String? parcelPictureID = '';
  String? parcelMapFileId = '';
  Future uploadFarmerImage(
      {PlatformFile? file,
      required int parcelID,
      PutFarmComputerParcelsRequest? putFarmComputerParcelsRequest}) async {
    print("Image picker ${isImagePicked}");
    //  FilePickerResult file = FilePickerResult([mWebImagePath]);
    if (isImagePicked == false) {
      updateFarmComputerParcels(
          parcelID: parcelID, requestBody: putFarmComputerParcelsRequest);
    } else {
      fileUploadResponse = await FarmComputerProjectClients.uploadFarmerFile(
          mPickedImage!); // First it was only file
      log("Image ID : ${fileUploadResponse!.data!.id}");
      parcelPictureID = fileUploadResponse!.data!.id.toString();
      log("parcelPicture ID : ${parcelPictureID}");

      notifyListeners();
    }
  }

  ///Upload farmer json file //////////

  PlatformFile? mPickedFile;
  bool isFIlePicked = false;
  var userFilePath;
  FilePickerResult? mFilePickerResult;

  FileUploadResponse? jsonfileUploadResponse;
  String? jsonFileID = '';

  List<latLng.LatLng> listOfLatLng = [];
  Parseddata? parcelData;
  pickUserMap() async {
    mFilePickerResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['geojson'.tr()],
    );
    if (mFilePickerResult != null) {
      mPickedFile = mFilePickerResult!.files.first;
      isFIlePicked = true;
      userFilePath = mPickedFile;
      String fileContent = utf8.decode(mPickedFile!.bytes!);
      parcelData = Parseddata.fromJson(json.decode(fileContent));
      notifyListeners();
      List<List<double>> listoflongLat =
          parcelData!.features![0].geometry!.coordinates![0][0];
      listOfLatLng = [];
      for (var i in listoflongLat) {
        listOfLatLng.add(latLng.LatLng(i[1], i[0]));
      }
      isFirstTabRequirments = false;
    } else {}
  }

  Future uploadFarmerJsonFile({
    PlatformFile? file,
  }) async {
    jsonfileUploadResponse = await FarmComputerProjectClients.uploadFarmerFile(
        mPickedFile!); // First it was only file
    log("File ID : ${jsonfileUploadResponse!.data!.id}");
    jsonFileID = jsonfileUploadResponse!.data!.id.toString();
    notifyListeners();
  }

////////////////////////////////////////////////////////
//////////////  GET DROP DOWN's DATA ////////////

  late String parcelPurposeDropdownName = "";
  late String parcelPurposeDropdownID = "";
  //List<PurposeData> purposeList = [];

// get parcel purpose drop down data
  ParcelPurposesDropDown parcelPurposesDropDown = ParcelPurposesDropDown();
  getParcelPurposeDropDown() async {
    parcelPurposesDropDown =
        await FarmComputerParcelsDropDownClient.getParcelPurposeDetailData();
    parcelPurposeDropdownName = parcelPurposesDropDown.data![0].name!;
    parcelPurposeDropdownID = parcelPurposesDropDown.data![0].id!;
    notifyListeners();
  }

// get parcel Ownership drop down data
  ParcelOwnershipDropDown parcelOwnershipDropDown = ParcelOwnershipDropDown();
  String parcelOwnership = "";
  String parcelOwnershipID = "";
  //List<OwnerShipData> parcelOwnershipList = [];
  getParcelOwnershipDropDown() async {
    parcelOwnershipDropDown =
        await FarmComputerParcelsDropDownClient.getParcelOwnershipDetailData();
    parcelOwnership = parcelOwnershipDropDown.data![0].name!;
    parcelOwnershipID = parcelOwnershipDropDown.data![0].id!;
    notifyListeners();
  }

// get parcel Organizations drop down data
  String parcelOrganization = "";
  String parcelOrganizationID = "";
  //List<LandOrganizationData> parcelOrganizationList = [];
  ParcelOrganizationsDropDown parcelOrganizationsDropDown =
      ParcelOrganizationsDropDown();

  getParcelOrganizationsDropDown() async {
    parcelOrganizationsDropDown = await FarmComputerParcelsDropDownClient
        .getParcelOrganizationsDetailData();
    parcelOrganization = parcelOrganizationsDropDown.data![0].name!;
    parcelOrganizationID = parcelOrganizationsDropDown.data![0].id!.toString();
    notifyListeners();
  }

  // get parcel Land Management drop down data
  String parcelLandManagement = "";
  String parcelLandManagementID = "";
  // List<LandMangementData> parcelLandManagementList = [];
  ParcelLandManagementDropDown parcelLandManagementDropDown =
      ParcelLandManagementDropDown();
  getParcelLandManagementDropDown() async {
    parcelLandManagementDropDown = await FarmComputerParcelsDropDownClient
        .getParcelLandManagementDetailData();
    parcelLandManagement = parcelLandManagementDropDown.data![0].name!;
    parcelLandManagementID = parcelLandManagementDropDown.data![0].id!;
    notifyListeners();
  }

  // get parcel Land Function drop down data
  String parcelLandFunction = "";
  String parcelLandFunctionID = "";
  // List<LandFunctionData> parcelLandFunctionList = [];
  ParcelLandFunctionDropDown parcelLandFunctionDropDown =
      ParcelLandFunctionDropDown();

  getParcelLandFunctionDropDown() async {
    parcelLandFunctionDropDown = await FarmComputerParcelsDropDownClient
        .getParcelLandFunctionDetailData();
    parcelLandFunction = parcelLandFunctionDropDown.data![0].name!;
    parcelLandFunctionID = parcelLandFunctionDropDown.data![0].id!;
    notifyListeners();
  }

  /// Farm computer parcels project dropdown list////////////

  ///// project dropdown new method////

  var listofSelectedProject = <ProjectData>[];
  ProjectData? parcelProjectSelectedDropDownName;
  List<ProjectData> parcelProjectsDropDownModelAgain = [
    ProjectData(id: -1, name: '')
  ];

  projDropDown() async {
    parcelProjectSelectedDropDownName = parcelProjectsDropDownModelAgain[0];
    ParcelProjectsDropDown model =
        await FarmComputerParcelsDropDownClient.getParcelsProjectsDropDown();
    parcelProjectsDropDownModelAgain.addAll(model.data!);
    notifyListeners();
  }

  Future getAllFarmersParcelsDropDown() async {
    getParcelPurposeDropDown();
    getParcelLandFunctionDropDown();
    getParcelLandManagementDropDown();
    getParcelOrganizationsDropDown();
    getParcelOwnershipDropDown();
    //new dropdown for testing
    projDropDown();
    notifyListeners();
  }
}

class _TextWidget extends StatelessWidget {
  final String mText;
  final Color mColor;
  final double mFontSize;
  final FontWeight mFontWeight;
  final FontStyle? mFontStyle;

  const _TextWidget({
    Key? key,
    required this.mText,
    required this.mColor,
    required this.mFontSize,
    required this.mFontWeight,
    this.mFontStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      mText,
      style: TextStyle(
        color: mColor,
        fontSize: mFontSize,
        fontWeight: mFontWeight,
        fontStyle: mFontStyle,
      ),
    );
  }
}
