import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_geocoding/google_geocoding.dart';
import 'package:wij_land/non_admin/api_clients/farm_computer_project_clients.dart';
import 'package:wij_land/non_admin/models/farm_computer_project/farm_computer_project_actions/response/get_farm_computer_proj_action_response.dart';

import '../../../app_common_widgets/custom_text.dart';
import '../../../utils/functions.dart';
import '../../../utils/responsive.dart';
import '../../api_clients/farm_computer_parcels_drop_down_client.dart';
import '../../models/farm_computer_actions/response/get_farm_computer_action_detail_response.dart';
import '../../models/farm_computer_dropdown/parcel_project_drop_down.dart';
import '../../models/farm_computer_parcels/response/parcels_dropdown_reponse.dart';
import '../../models/farm_computer_project/farm_computer_project_actions/request/post_farm_computer_project_action_request.dart';
import '../../screens/project_dashboard/project_actions/widget/action_detail_dialog.dart';

class FarmComputerProjectActionProvider extends ChangeNotifier {
  TextEditingController mSearchController = TextEditingController();
  TextEditingController mStartDateController = TextEditingController();
  TextEditingController mEndDateController = TextEditingController();

  bool searchTapped = false;
  bool mShowFiltersActionButtons = false;
  bool byActionName = false, byDoneBy = false, byParcel = false, byDate = false;

  showOrHideActionButtons() {
    if (mStartDateController.text.isNotEmpty && mEndDateController.text.isNotEmpty) {
      mShowFiltersActionButtons = true;
      notifyListeners();
    }
  }

  clearFieldsAndHideActionButtons() {
    listOfSelectedActionDropdown = [];
    mStartDateController.clear();
    mEndDateController.clear();
    listofSelectedProject = [];
    parcelDropDownList = [];
    parcelProjectSelectedDropDownName = ProjectData(id: -1, name: '');
    listOfSelectedParcelsDropdown = ParcelDropDownData(id: -1, name: '');
    listOfSelectedParcelsDropdown = parcelDropdownModel[0];
    actionTypeSelectedDropDown = '';
    parcelProjectSelectedDropDownName = parcelProjectsDropDownModel[0];
    mShowFiltersActionButtons = false;
    notifyListeners();
  }

  GetFarmComputerProjectActionResponse _projectActionResponseModel = GetFarmComputerProjectActionResponse();

  GetFarmComputerProjectActionResponse get farmComputerProjectActionResponseModel => _projectActionResponseModel;
  bool isLoading = false;
  List doneOnList = [];

  Future getFarmComputerProjectActionData({int? projectID}) async {
    isLoading = true;
    _projectActionResponseModel = await FarmComputerProjectClients.getFarmComputerProjectActions(
      projectID: projectID!,
      listofproject: listofSelectedProject,
      listofParcels: parcelDropDownList,
      listOfActions: listOfSelectedActionDropdown,
      fromDate: mStartDateController.text.trim(),
      toDate: mEndDateController.text.trim(),
    );
    isLoading = false;
    notifyListeners();
  }

  /// * GET REQUEST FOR ACTIONS DATA ENDS *//
  ///action type variables
  var actionTypeDropDownList = <String>[''];
  var listOfSelectedActionDropdown = [];
  String actionTypeSelectedDropDown = '';

  ///parcel dropdown
  var parcelDropDownList = <ParcelDropDownData>[];
  ParcelDropDownData? listOfSelectedParcelsDropdown;
  List<ParcelDropDownData> parcelDropdownModel = [ParcelDropDownData(id: -1, name: '')];

  ///project variables
  var listofSelectedProject = <ProjectData>[];
  ProjectData? parcelProjectSelectedDropDownName;
  List<ProjectData> parcelProjectsDropDownModel = [ProjectData(id: -1, name: '')];

  projDropDown() async {
    parcelProjectSelectedDropDownName = parcelProjectsDropDownModel[0];
    ParcelProjectsDropDown model = await FarmComputerParcelsDropDownClient.getParcelsProjectsDropDown();
    parcelProjectsDropDownModel.addAll(model.data!);
    List<String> list = await FarmComputerParcelsDropDownClient.getActionTypeDropdown();
    actionTypeDropDownList.addAll(list.toSet().toList());
    listOfSelectedParcelsDropdown = parcelDropdownModel[0];
    ParcelDropDownResponse parcelModel = await FarmComputerParcelsDropDownClient.getParcelDropdown();
    parcelDropdownModel.addAll(parcelModel.data!);
    notifyListeners();
  }

  ///* GET REQUEST FOR ACTION DETAIL DATA STARTS *//
  late GetFarmComputerActionDetailResponse getFarmComputerActionDetailResponse;

  Future getFarmComputerActionDetailData({
    required int id,
    required BuildContext context,
  }) async {
    getFarmComputerActionDetailResponse = await FarmComputerProjectClients.getFarmComputerActionsDetailData(
      id: id,
    );

    print("Responsessss : ${getFarmComputerActionDetailResponse.data!.toJson()}");

    if (getFarmComputerActionDetailResponse.data != null) {
      String? latlngAddress = "";
      double latitude = 0, longitude = 0;
      var googleGeocoding = GoogleGeocoding("AIzaSyAoN99rcOjix3G0CJlEepPbR4VOwtgAH4E");
      if (getFarmComputerActionDetailResponse.data?.bokashiHeap != null) {
        var result = await googleGeocoding.geocoding.getReverse(LatLon(
            double.parse(getFarmComputerActionDetailResponse.data!.bokashiHeap!.location!.latitude!),
            double.parse(getFarmComputerActionDetailResponse.data!.bokashiHeap!.location!.longitude!)));
        print("Address from Lat Lng : ${result!.results![0].formattedAddress}");
        latlngAddress = result.results![0].formattedAddress;
        latitude = double.parse(getFarmComputerActionDetailResponse.data!.bokashiHeap!.location!.latitude!);
        longitude = double.parse(getFarmComputerActionDetailResponse.data!.bokashiHeap!.location!.longitude!);
      }
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: getWidth(context) * 0.5,
                  child: CustomText(
                      text: getFarmComputerActionDetailResponse.data?.actionName ?? "",
                      size: Responsive.isMobile(context) ? 16 : 20,
                      weight: FontWeight.w800,
                      lines: 2,
                      overflows: TextOverflow.ellipsis),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            content: ActionDetailDialog(
              farmComputerActionDetailResponse: getFarmComputerActionDetailResponse.data!,
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

  Future postFarmComputerProjectAction(
      {required int farmID, required int projectID, required String actionName, PostFarmComputerProjectActionsRequest? request}) async {
    await FarmComputerProjectClients.addFarmComputerProjectActions(
      farmID: farmID,
      projectID: projectID,
      actionName: actionName,
      request: request,
    );
    getFarmComputerProjectActionData();
  }
}
