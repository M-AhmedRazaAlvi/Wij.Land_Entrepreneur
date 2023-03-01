import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:wij_land/non_admin/api_clients/farm_computer_parcels_drop_down_client.dart';
import 'package:wij_land/non_admin/api_clients/farm_computer_project_clients.dart';
import 'package:wij_land/non_admin/models/farm_computer_dropdown/business_type_dropdown.dart';
import 'package:wij_land/non_admin/models/farm_computer_dropdown/municipality_drop_down.dart';
import 'package:wij_land/non_admin/models/farm_computer_dropdown/water_board_drop_down.dart';
import 'package:wij_land/non_admin/models/farm_computer_parcels/response/file_upload_response.dart' as farmerDashboard;
import 'package:wij_land/non_admin/models/main_dashboard/get_fc_action.dart';
import 'package:wij_land/non_admin/models/main_dashboard/get_fc_basic_info.dart';
import 'package:wij_land/non_admin/models/main_dashboard/get_fc_contact_moments.dart';
import 'package:wij_land/non_admin/models/main_dashboard/get_fc_events.dart';
import 'package:wij_land/non_admin/models/main_dashboard/get_fc_files.dart';
import 'package:wij_land/non_admin/models/main_dashboard/get_fc_project.dart';
import 'package:wij_land/non_admin/models/main_dashboard/put_fc_basic_info.dart';

import '../../models/farm_computer_parcels/response/get_farm_computer_parcels_response.dart';
import '../../models/farm_computer_project/farm_computer_project_parcels_response_model.dart';
import '../../models/main_dashboard/get_fc_boerenwijzer.dart';

class MainFCDashboardProvider extends ChangeNotifier {
  bool isAddressClick = false;
  String mBusinessType = "Select Business Type";

  // get isShowLoading => _isLoading;
  var listLatLng = LatLngBounds();
  List<Marker> mMarkerList = [];

  TextEditingController mFarmName = TextEditingController();
  TextEditingController mFarmAddress = TextEditingController();
  TextEditingController mFarmLat = TextEditingController();
  TextEditingController mFarmLng = TextEditingController();
  TextEditingController mFarmProvince = TextEditingController();
  TextEditingController mDateController = TextEditingController();
  TextEditingController mMunicipalityController = TextEditingController();
  TextEditingController mWaterBoardController = TextEditingController();

  GetFCBasicInfo? info;

  Future getBasicInfo() async {
    info = await FarmComputerProjectClients.getFCBasicInfo();
  }

  GetFCFiles? files;

  Future getFarmFiles() async {
    files = await FarmComputerProjectClients.getFCFiles();
  }

  GetFCProjects? projects;

  Future getFarmProjects() async {
    projects = await FarmComputerProjectClients.getFCProjects();
  }

  GetFCEvents? events;

  Future getFarmEvents() async {
    events = await FarmComputerProjectClients.getFCEvents();
  }

  GetFCContactMoments? contactMoments;

  Future getFarmContactMoments() async {
    contactMoments = await FarmComputerProjectClients.getFCContactMoments();
  }

  PutFCBoerenwijzer? boerenwijzer;
  List bData = [];

  Future getFarmBoerenwijzer() async {
    bData = [];
    boerenwijzer = await FarmComputerProjectClients.getFCBoerenwijzer();
    if (bData.isEmpty) {
      for (int i = 0; i < boerenwijzer!.data!.length; i++) {
        bData.add("{'name':'${boerenwijzer!.data![i].name}','value':${boerenwijzer!.data![i].value},'color':${boerenwijzer!.data![i].color}}");
      }
    }

    print('bdata is $bData');
    print('bdata is ${bData.length}');
  }

  GetFCAction? fcAction;

  Future getFarmAction() async {
    fcAction = await FarmComputerProjectClients.getFCAction();
    // _isLoading = false;
    notifyListeners();
  }

  List<MainParcelMapInformation>? listOfPacelData = [];

  List isFeature = [];
  List listOfallParcelIDs = [];
  List<bool> activeAndInActiveParcels = [];
  GetFarmComputerProjectParcelsResponse? farmComputerProjectParcelsResponse;

  Future<bool> getParcelData() async {
    listOfallParcelIDs = [];
    listOfPacelData = [];
    isFeature.clear();
    dynamic data = await FarmComputerProjectClients.getFCparcelData();
    if (data != null) {
      List list = data['data'];
      isFeature = data['data'];
      print('list of data $list');

      /* for(int i=0;i<list.length;i++){
        if(list[i]['polygon_coordinates']['features'].toString().isNotEmpty){
          isFeature.insert(i, true);
        }else{
          isFeature.insert(i, false);
        }
      }*/
      for (var i in list) {
        listOfPacelData!.add(MainParcelMapInformation.fromJson(i));
        listOfallParcelIDs.add(i["id"].toString());
      }
    }
    return true;
  }

  BusinessTypeDropDown? businessTypeDropDown;

  getBusinessTyDropDown() async {
    businessTypeDropDown=BusinessTypeDropDown();
    businessTypeDropDown = await FarmComputerParcelsDropDownClient.getBusinessTypeDropDown();
    notifyListeners();
  }

  late List<String> mMunicipalityList = [];
  GetFCMunicipalityDropDown? municipalityDropDown;
  bool mMunicipalityWidget = false;

  getMunicipalityDropDown({required String province}) async {
    municipalityDropDown = await FarmComputerParcelsDropDownClient.getMunicipalityDropDown(province: province.toString().toLowerCase());
    notifyListeners();
  }

  searchMunicipality({required String value}) {
    mMunicipalityList.clear();
    notifyListeners();

    for (var i = 0; i < municipalityDropDown!.data!.length; i++) {
      if (!municipalityDropDown!.data![i].toLowerCase().contains(value.toLowerCase())) {
        mMunicipalityList.add(municipalityDropDown!.data![i]);
        notifyListeners();
      }
    }
  }

  late List<String> mWaterBoardList = [];
  bool mWaterBoardWidget = false;
  GetFCWaterBoardDropDown? waterBoardDropDown;

  getWaterBoardDropDown({required String province}) async {
    waterBoardDropDown = await FarmComputerParcelsDropDownClient.getWaterBoardDropDown(province: province.toString().toLowerCase());
    notifyListeners();
  }

  searchWaterBoard({required String value}) {
    mWaterBoardList.clear();
    notifyListeners();

    for (int i = 0; i < waterBoardDropDown!.data!.length; i++) {
      if (waterBoardDropDown!.data![i].toLowerCase().contains(value.toLowerCase())) {
        mWaterBoardList.add(waterBoardDropDown!.data![i]);
        notifyListeners();
      }
    }
  }

  PlatformFile? mPickFile;
  FilePickerResult? mFilePickResult;
  farmerDashboard.FileUploadResponse? fileRes;

  pickUserImage() async {
    mFilePickResult = await FilePicker.platform.pickFiles();
    if (mFilePickResult != null) {
      mPickFile = mFilePickResult!.files.first;
      var f = mPickFile!.bytes;
      fileRes = await FarmComputerProjectClients.uploadFarmerFile(mPickFile!);
      notifyListeners();
    }
  }

  late var responseValue;

  Future putBasicInfo({required PutFCBasicInfo info}) async {
    responseValue = await FarmComputerProjectClients.updateFCBasicInfo(requestBody: info);
    /*if(responseValue==true){
       await FarmComputerProjectClients.getFCBasicInfo();
       notifyListeners();
     }*/
    notifyListeners();
  }
}
