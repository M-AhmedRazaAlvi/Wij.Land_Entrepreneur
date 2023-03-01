import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/non_admin/api_clients/farm_computer_project_clients.dart';

import '../../api_clients/farm_computer_parcels_drop_down_client.dart';
import '../../models/farm_computer_dropdown/parcel_project_drop_down.dart';
import '../../models/farm_computer_files/get_farm_computer_action_dropdown.dart';
import '../../models/main_files/response/get_fc_files.dart';

class MainFilesProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  GetFarmComputerFiles? fcFiles;
  List<bool> isBookMark = [];
  String? status;
  bool name = false, project = false, parcel = false, addBy = false, dateBy = false;

  var dialogData;

  Future getFCFiles({String? parcelId}) async {
    fcFiles = await FarmComputerProjectClients.getFarmCompFiles(
        parcelsId: parcelId,
        searchString: searchController.text,
        fromDate: startdate.text.trim(),
        toDate: endDate.text.trim(),
        listofFiles: listOfSelectedFileDropdown,
        listofproject: listofSelectedProject,
        listofActions: listOfSelectedAction);

    for (int i = 0; i < fcFiles!.data!.length; i++) {
      if (fcFiles!.data![i].favourite != null) {
        if (fcFiles!.data![i].favourite!.isFavourite == true || fcFiles!.data![i].favourite!.isFavourite == "true") {
          isBookMark.insert(i, true);
        } else {
          isBookMark.insert(i, false);
        }
      } else {
        isBookMark.insert(i, false);
      }
    }
    notifyListeners();
  }

  Future getWijLandBookmarks({String? parcelId}) async {
    fcFiles = await FarmComputerProjectClients.getWijLandBookMarkFiles();

    for (int i = 0; i < fcFiles!.data!.length; i++) {
      if (fcFiles!.data![i].favourite != null) {
        if (fcFiles!.data![i].favourite!.isFavourite == true || fcFiles!.data![i].favourite!.isFavourite == "true") {
          isBookMark.insert(i, true);
        } else {
          isBookMark.insert(i, false);
        }
      } else {
        isBookMark.insert(i, false);
      }
    }
    notifyListeners();
  }

  Future getFCBookMarkFiles() async {
    fcFiles = await FarmComputerProjectClients.getFarmCompBookMarkFiles();
    for (int i = 0; i < fcFiles!.data!.length; i++) {
      if (fcFiles!.data![i].favourite != null) {
        if (fcFiles!.data![i].favourite!.isFavourite == true || fcFiles!.data![i].favourite!.isFavourite == "true") {
          isBookMark.insert(i, true);
        } else {
          isBookMark.insert(i, false);
        }
      } else {
        isBookMark.insert(i, false);
      }
    }
    notifyListeners();
  }

  Future getFCContractFiles() async {
    fcFiles = await FarmComputerProjectClients.getFarmCompContractFiles();
    for (int i = 0; i < fcFiles!.data!.length; i++) {
      if (fcFiles!.data![i].favourite != null) {
        if (fcFiles!.data![i].favourite!.isFavourite == true || fcFiles!.data![i].favourite!.isFavourite == "true") {
          isBookMark.insert(i, true);
        } else {
          isBookMark.insert(i, false);
        }
      } else {
        isBookMark.insert(i, false);
      }
    }
    notifyListeners();
  }

  Future putFCFilesBookMark({required int id, required bool isFavourite}) async {
    status = await FarmComputerProjectClients.updateFarmCompFavourite(fileID: id, isLike: isFavourite);
    notifyListeners();
  }

  Future getDialogData(int id) async {
    dialogData = await FarmComputerProjectClients.getFCDialogData(fileId: id);
    notifyListeners();
  }

  /// Farm Files Dropdown Work ///

  var listofSelectedProject = <ProjectData>[];
  var fileTypeDropDownList = <String>[''];

  var listOfSelectedFileDropdown = [];
  String fileTypeDropDownSelectedValue = '';

  ProjectData? projectSelectedDropDownName;
  List<ProjectData> projectsDropDownModel = [ProjectData(id: -1, name: '')];

  //Action Dropdown
  var listOfSelectedAction = <ActionData>[];
  ActionData? farmActionDropdownName;
  List<ActionData> actionsDropDownModel = [ActionData(id: -1, name: '')];

  projDropDown() async {
    fileTypeDropDownList = [''];

    projectSelectedDropDownName = projectsDropDownModel[0];
    ParcelProjectsDropDown model = await FarmComputerParcelsDropDownClient.getParcelsProjectsDropDown();
    if (model.status != null) {
      projectsDropDownModel.addAll(model.data!);
    }
    List<String> list = await FarmComputerParcelsDropDownClient.getFarmFileTypeDropdown();
    if (list.isNotEmpty) {
      fileTypeDropDownList.addAll(list.toSet().toList());
    }
    //Action dropdown
    farmActionDropdownName = actionsDropDownModel[0];
    GetFarmComputerActionsDropdown actionModel = await FarmComputerParcelsDropDownClient.getFarmActionDropDown();
    if (actionModel.status != null) {
      actionsDropDownModel.addAll(actionModel.data!);
    }
    notifyListeners();
  }

  TextEditingController startdate = TextEditingController();
  TextEditingController endDate = TextEditingController();

  clearFields() {
    projectSelectedDropDownName = ProjectData(id: -1, name: '');
    projectSelectedDropDownName = projectsDropDownModel[0];
    listofSelectedProject = [];

    farmActionDropdownName = ActionData(id: -1, name: '');
    farmActionDropdownName = actionsDropDownModel[0];
    listOfSelectedAction = [];

    fileTypeDropDownSelectedValue = '';
    listOfSelectedFileDropdown.clear();

    searchController.clear();
    startdate.clear();
    endDate.clear();
    // mEndDateController.clear();
    // mShowFiltersActionButtons = false;
    // searchTapped = false;
    // listOfSelectedActionDropdown = [];
    notifyListeners();
  }
}
