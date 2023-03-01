import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_geocoding/google_geocoding.dart';
import 'package:wij_land/non_admin/api_clients/farm_computer_project_clients.dart';
import 'package:wij_land/non_admin/models/farm_computer_actions/response/get_farm_computer_action_response.dart';
import 'package:wij_land/non_admin/models/farm_computer_parcels/response/parcels_dropdown_reponse.dart';

import '../../../utils/hex_color.dart';
import '../../api_clients/farm_computer_parcels_drop_down_client.dart';
import '../../models/farm_computer_actions/response/get_farm_computer_action_detail_response.dart';
import '../../models/farm_computer_dropdown/parcel_project_drop_down.dart';
import '../../screens/project_dashboard/project_actions/widget/action_detail_dialog.dart';

class FarmComputerActionProvider extends ChangeNotifier {
  //* VARIABLES *//

  TextEditingController mSearchController = TextEditingController();
  TextEditingController mStartDateController = TextEditingController();
  TextEditingController mEndDateController = TextEditingController();

  bool searchTapped = false;
  bool mShowFiltersActionButtons = false;
  bool byActionName = false, byDoneBy = false, byParcel = false, byDate = false;

  //* VARIABLES *//

  //* SHOW FILTER ACTIONS *//
  showOrHideActionButtons() {
    if (mStartDateController.text.isNotEmpty && mEndDateController.text.isNotEmpty) {
      mShowFiltersActionButtons = true;
      notifyListeners();
    }
  }

  //* SHOW FILTER ACTIONS *//

  //* CLEAR FIELDS & HIDE FILTER ACTIONS *//

  clearFieldsAndHideActionButtons() {
    parcelProjectSelectedDropDownName = ProjectData(id: -1, name: '');
    listOfSelectedParcelsDropdown = ParcelDropDownData(id: -1, name: '');
    listOfSelectedParcelsDropdown = parcelDropdownModel[0];
    actionTypeSelectedDropDown = '';
    parcelProjectSelectedDropDownName = parcelProjectsDropDownModel[0];
    mStartDateController.clear();
    mEndDateController.clear();
    mShowFiltersActionButtons = false;
    searchTapped = false;
    // mSearchController.clear();
    listOfSelectedActionDropdown = [];
    parcelDropDownList = [];
    listofSelectedProject = [];
    notifyListeners();
    getFarmComputerActionData();
  }

  //* CLEAR FIELDS & HIDE FILTER ACTIONS *//

  //* GET REQUEST FOR ACTIONS DATA START *//
  GetFarmComputerActionResponse _farmComputerActionResponse = GetFarmComputerActionResponse();

  GetFarmComputerActionResponse get farmComputerActionResponseModel => _farmComputerActionResponse;

  bool isLoading = false;

  List doneOnList = [];

  Future getFarmComputerActionData() async {
    isLoading = true;
    _farmComputerActionResponse = await FarmComputerProjectClients.getFarmComputerActionsDetails(
        // mSearchString: mSearchController.text,
        listofActions: listOfSelectedActionDropdown,
        fromDate: mStartDateController.text.trim(),
        toDate: mEndDateController.text.trim(),
        listofproject: listofSelectedProject,
        listofParcels: parcelDropDownList);
    // for (int i = 0; i < _farmComputerActionResponse.data!.length; i++) {
    //   if (_farmComputerActionResponse.data![i].doneOnDate != null) {
    //     doneOnList.insert(i, _farmComputerActionResponse.data![i].doneOnDate);
    //   } else {
    //     // _farmComputerActionResponse.data![i].doneOnDate = "00-00-0000";
    //   }
    // }
    print("done on list-----------------${doneOnList}");
    print("Farm Computer actions response length ${_farmComputerActionResponse.data!.length} ");
    isLoading = false;
    notifyListeners();
  }

//Get action by Parcel ID
  Future getFarmComputerActionDataByParcelID({final int? parcelID}) async {
    isLoading = true;
    _farmComputerActionResponse = await FarmComputerProjectClients.getFarmComputerActionsDetailsByParcelID(parcelID: parcelID);
    print("Farm Computer actions by ParcelID length ${_farmComputerActionResponse.data!.length} ");
    isLoading = false;
    notifyListeners();
  }

  // Get multi-select project dropdown//

  //action type variables
  var actionTypeDropDownList = <String>[''];
  var listOfSelectedActionDropdown = [];
  String actionTypeSelectedDropDown = '';

  //parcel dropdown
  var parcelDropDownList = <ParcelDropDownData>[];
  ParcelDropDownData? listOfSelectedParcelsDropdown;
  List<ParcelDropDownData> parcelDropdownModel = [ParcelDropDownData(id: -1, name: '')];

  //project variables
  var listofSelectedProject = <ProjectData>[];
  ProjectData? parcelProjectSelectedDropDownName;
  List<ProjectData> parcelProjectsDropDownModel = [ProjectData(id: -1, name: '')];

  projDropDown() async {
    parcelProjectSelectedDropDownName = parcelProjectsDropDownModel[0];
    ParcelProjectsDropDown model = await FarmComputerParcelsDropDownClient.getParcelsProjectsDropDown();
    parcelProjectsDropDownModel.addAll(model.data!);
    //For Action dropdown without model
    List<String> list = await FarmComputerParcelsDropDownClient.getActionTypeDropdown();
    actionTypeDropDownList.addAll(list.toSet().toList());
// For parcel dropdown
    listOfSelectedParcelsDropdown = parcelDropdownModel[0];
    ParcelDropDownResponse parcelModel = await FarmComputerParcelsDropDownClient.getParcelDropdown();
    parcelDropdownModel.addAll(parcelModel.data!);

    notifyListeners();
  }

  //* GET REQUEST FOR ACTIONS DATA ENDS *//

  //* GET REQUEST FOR ACTION DETAIL DATA STARTS *//

  late GetFarmComputerActionDetailResponse getFarmComputerActionDetailResponse;

  Future getFarmComputerActionDetailData({
    required int id,
    required BuildContext context,
  }) async {
    getFarmComputerActionDetailResponse = await FarmComputerProjectClients.getFarmComputerActionsDetailData(
      id: id,
    );


    if (getFarmComputerActionDetailResponse.data != null) {
      String? latlngAddress = "";
      double latitude = 0, longitude = 0;
      var googleGeocoding = GoogleGeocoding("AIzaSyAoN99rcOjix3G0CJlEepPbR4VOwtgAH4E");
      if (getFarmComputerActionDetailResponse.data?.bokashiHeap != null) {
         await googleGeocoding.geocoding.getReverse(LatLon(
            double.parse(getFarmComputerActionDetailResponse.data!.bokashiHeap!.location!.latitude!),
            double.parse(getFarmComputerActionDetailResponse.data!.bokashiHeap!.location!.longitude!)));
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
                _TextWidget(
                  mText: getFarmComputerActionDetailResponse.data?.actionName ?? "",
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

//* GET REQUEST FOR ACTION DETAIL DATA ENDS *//

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
