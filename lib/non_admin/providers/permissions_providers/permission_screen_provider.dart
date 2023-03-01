import 'dart:developer';

import 'package:flutter/material.dart';

import '../../api_clients/farm_computer_parcels_drop_down_client.dart';
import '../../api_clients/farm_computer_project_clients.dart';
import '../../models/farm_computer_dropdown/farm_files_dropdown.dart';
import '../../models/farm_computer_dropdown/parcel_organizations_drop_down.dart';
import '../../models/permissions/permissions_requests_model.dart';

class PermissionScreenProvider extends ChangeNotifier {
  //* VARIABLES INITIALIZATION STARTS *//

  int mTabPosition = 0;
  int hTabPosition = 0;
  int activeStep = 0;
  bool searchTapped = false;
  bool showFilters = false;
  TextEditingController mSearchController = TextEditingController();
  String filterStatus = "all";

  String mSelectedStatusValue = "Select";
  List<String> statusDropDownList = [
    "Select",
    "accepted",
    "rejected",
    "re-invite",
    "revoke",
    "removed",
    "pending",
  ];

  /// Fetching all permissions request data

  PermissionsRequestsModel mPermissionsRequestsResponse = PermissionsRequestsModel();
  List<PermissionRequestData> permissionsList = [];
  bool showLoading = false;

  fetchAllPermissionsRequest() async {
    String organizationIDs = "";

    for (var i = 0; i < mSelectedListOfOrganizations.length; i++) {
      if (i == 0) {
        organizationIDs = organizationIDs + "${mSelectedListOfOrganizations[i].id}";
      } else {
        organizationIDs = organizationIDs + ", ${mSelectedListOfOrganizations[i].id}";
      }
    }

    log("Selected Organization ids : $organizationIDs");

    String projectIDs = "";

    for (var i = 0; i < mSelectedListOfProjects.length; i++) {
      if (i == 0) {
        projectIDs = projectIDs + "${mSelectedListOfProjects[i].id}";
      } else {
        projectIDs = projectIDs + ", ${mSelectedListOfProjects[i].id}";
      }
    }

    log("Selected Projects ids : $projectIDs");

    showLoading = true;
    notifyListeners();
    mPermissionsRequestsResponse = await FarmComputerProjectClients.fetchAllPermissionsRequests(
      mFilters: filterStatus,
      mSearchText: mSearchController.text,
      mOrganizationsIds: organizationIDs,
      mProjectsIds: projectIDs,
      mStatus: mSelectedStatusValue,
    );
    permissionsList = mPermissionsRequestsResponse.data ?? [];

    if (permissionsList.isNotEmpty) {
      permissionsList.sort(
        (a, b) => DateTime.parse(a.insertedAt!).compareTo(
          DateTime.parse(b.insertedAt!),
        ),
      );
    }
    for (var i = 0; i < permissionsList.length; i++) {
      log("Date Parsed >>>>> ${DateTime.parse(permissionsList[i].insertedAt!)}  Status >>>>> ${permissionsList[i].status![0].status}");
    }
    showLoading = false;
    notifyListeners();
  }

  /// Organization Drop down
  String mSelectedOrganizationType = "";
  List<String> mDropdownSelectedOrganizationsList = [];
  List<String> organizationsList = [];
  ParcelOrganizationsDropDown mOrganizationsDropDown = ParcelOrganizationsDropDown();

  List<LandOrganizationData> mListOfOrganizations = [];
  List<LandOrganizationData> mSelectedListOfOrganizations = [];

  getOrganizationsDropDown() async {
    mOrganizationsDropDown = await FarmComputerParcelsDropDownClient.getParcelOrganizationsDetailData();
    mSelectedOrganizationType = mOrganizationsDropDown.data![0].name!;
    mListOfOrganizations = mOrganizationsDropDown.data!;

    for (var i = 0; i < mListOfOrganizations.length; i++) {
      organizationsList.add(mListOfOrganizations[i].name!);
    }
    notifyListeners();
  }

  /// Projects Drop down
  String mSelectedProjectType = "";
  List<String> mDropdownSelectedProjectsList = [];
  List<String> projectsList = [];

  late FarmComputerFilesDropdown computerFilesDropDownModel;
  List<FarmFilesData> mListOfProjects = [];
  List<FarmFilesData> mSelectedListOfProjects = [];

  getProjectsDropDown() async {
    computerFilesDropDownModel = await FarmComputerParcelsDropDownClient.getComputerFilesDropDown();
    mListOfProjects = computerFilesDropDownModel.data!;

    mSelectedProjectType = computerFilesDropDownModel.data![0].name!;
    for (var i = 0; i < mListOfProjects.length; i++) {
      projectsList.add(mListOfProjects[i].name!);
    }
    notifyListeners();
  }

  /// Status Dropdown
  List<String> statusList = ["all", "active_requests", "completed_requests"];
  String mSelectedStatusType = "all";
  List<String> mDropdownSelectedStatusList = ["all"];
}
