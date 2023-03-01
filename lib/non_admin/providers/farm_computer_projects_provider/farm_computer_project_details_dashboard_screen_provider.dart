import 'package:flutter/cupertino.dart';
import 'package:wij_land/non_admin/api_clients/farm_computer_project_clients.dart';
import 'package:wij_land/non_admin/models/farm_computer_project/farm_computer_project_parcels_response_model.dart';

import '../../models/farm_computer_project/farm_computer_project_actions/response/get_farm_computer_proj_action_response.dart';
import '../../models/farm_computer_project/farm_computer_project_contact_moments/responce/get_farm_project_contact_moments_response.dart';
import '../../models/farm_computer_project/farm_computer_project_events/response/farm_computer_project_events_response.dart';
import '../../models/farm_computer_project/farm_computers_project_details_response_model.dart';
import '../../models/farm_computer_contact_moments/responce/get_contact_moments_responce.dart';
import '../dashobard_provider/main_dashboard_provider.dart';

class FarmComputerProjectDetailsDashboardScreenProvider extends ChangeNotifier {
  //* VARIABLES INITIALIZATION STARTS *//

  bool mShowLoading = false;
  bool mapOpened = false;
  int position = 0;
  bool isData = false;

  //* VARIABLES INITIALIZATION ENDS *//

  //* GET PROJECT DETAILS DATA API WORK STARTS *//
  FarmComputersProjectDetailResponseModel?
      farmComputersProjectDetailResponseModel;

  getProjectDetailsData({required int id}) async {
    mShowLoading = true;
    notifyListeners();
    farmComputersProjectDetailResponseModel =
        await FarmComputerProjectClients.getFarmComputerProjectDetails(
      id: id,
    );
    isData = true;
    mShowLoading = false;
    notifyListeners();
  }

  //* GET PROJECT DETAILS DATA API WORK ENDS *//

  //* GET PROJECT PARCELS DATA API WORK STARTS *//
  GetFarmComputerProjectParcelsResponse? farmComputerProjectParcelsResponse;

  bool mShowLoadingForParcels = true;

  getProjectParcelsData({required int id}) async {
    farmComputerProjectParcelsResponse =
        await FarmComputerProjectClients.getFarmComputerProjectParcelsData(
      id: id,
    );
    // getPacelInfo();
    mShowLoadingForParcels = false;
    notifyListeners();
  }

/////////////////////for participating and not participating parcels /////////////////////
  MainFCDashboardProvider? dbProvider;
  List<bool> activeAndInActiveParcels = [];

  // getPacelInfo() {
  //   print(dbProvider!.listOfallParcelIDs.length);
  //   for (var i = 0; i < dbProvider!.listOfallParcelIDs.length; i++) {
  //     print("over all ID ${i}");
  //     if (farmComputerProjectParcelsResponse!.data!.parcels![i].id == i) {
  //       activeAndInActiveParcels.add(true);
  //     } else {
  //       activeAndInActiveParcels.add(false);
  //     }
  //   }
  //   print(activeAndInActiveParcels);
  // }

  //* GET PROJECT PARCELS DATA API WORK ENDS *//

  //* GET EVENTS DATA API WORK START *//

  late GetFarmComputerProjectEventsResponse?
      farmComputerProjectEventsResponseModels;

  bool mShowLoadingForEvents = true;

  Future getFarmComputerProjectEvents({required int projectId}) async {
    farmComputerProjectEventsResponseModels =
        await FarmComputerProjectClients.getFarmComputerProjectEvents(
      projectID: projectId,
    );
    print("Events Data : ${farmComputerProjectEventsResponseModels!.toJson()}");

    mShowLoadingForEvents = false;
    notifyListeners();
  }

  //* GET EVENTS DATA API WORK START *//

  //* GET ACTIONS DATA API WORK START *//
  late GetFarmComputerProjectActionResponse
      farmComputerProjectActionResponseModel;
  bool mShowLoadingForActions = true;

  Future getFarmComputerProjectActions({required int projectID}) async {
    print("Project ID : $projectID");
    farmComputerProjectActionResponseModel =
        await FarmComputerProjectClients.getFarmComputerProjectActions(
      projectID: projectID,
    );
    mShowLoadingForActions = false;
    notifyListeners();
  }

//* GET ACTIONS DATA API WORK ENDS *//

  //* GET CONTACTS DATA API WORK START *//
  late GetFarmProjectContactMomentsResponse farmComputerContactMomentsResponse;
  bool mShowLoadingForContacts = true;

  Future getFarmComputerProjectContactMoments({required int projectID}) async {
    print("Project ID : $projectID");
    farmComputerContactMomentsResponse =
        await FarmComputerProjectClients.getFarmComputerProjectContactMoments(
      projectID: projectID,
    );
    mShowLoadingForContacts = false;
    notifyListeners();
  }
//* GET ACTIONS DATA API WORK ENDS *//

}
