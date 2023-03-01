import 'package:flutter/cupertino.dart';

import '../../api_client/anacdots_dropdown.dart';
import '../../api_client/anecdotes_directory_clients.dart';
import '../../models/anacdots_dropdown_reponse_models/anacdots_locations_dropdown_response.dart';
import '../../models/anacdots_dropdown_reponse_models/anacdots_organizations_dropdown_reponse.dart';
import '../../models/anacdots_dropdown_reponse_models/anacdots_persons_dropdown_reponse.dart';
import '../../models/anacdots_dropdown_reponse_models/anacdots_project_dropdown_reponse.dart';
import '../../models/anecdotes_model/delete_file_response.dart';
import '../../models/anecdotes_model/get_my_anecdotes_response.dart';
import '../../models/anecdotes_model/put_anecdots_request.dart';

class CreateMyAnecdotesFileProvider extends ChangeNotifier {
  GetMyAnecdotesResponse? anecdotesFileResponseModels =
      GetMyAnecdotesResponse();

  TextEditingController mSearchController = TextEditingController();

  String selectedDateTime = "";

  // GetMyAnecdotesResponse? get anecdotesFileResponseModel =>
  //     anecdotesFileResponseModels;
  bool isLoading = false;
  bool showLoading = false;
  bool searchTapped = false;

  String mPersonsIdsString = "";
  String mProjectsIdsString = "";
  String mOrganizationsIdsString = "";
  String mSelectedLocationsString = "";

  Future getAnecdotesFiles() async {
    showLoading = true;
    mSelectedLocationsString = "";
    notifyListeners();
    debugPrint("Controller Value : ${mSearchController.text}");
    if (mSelectedPersonsIdsList.isNotEmpty) {
      for (var i = 0; i < mSelectedPersonsIdsList.length; i++) {
        if (mPersonsIdsString.contains(mSelectedPersonsIdsList[i].toString())) {
        } else {
          if (i == 0) {
            mPersonsIdsString =
                mPersonsIdsString + mSelectedPersonsIdsList[i].toString();
          } else {
            mPersonsIdsString =
                mPersonsIdsString + ",${mSelectedPersonsIdsList[i].toString()}";
          }
        }
      }
    }
    debugPrint("Selcted person ids List : $mPersonsIdsString");

    if (mSelectedProjectsIdsList.isNotEmpty) {
      for (var i = 0; i < mSelectedProjectsIdsList.length; i++) {
        if (mProjectsIdsString
            .contains(mSelectedProjectsIdsList[i].toString())) {
        } else {
          if (i == 0) {
            mProjectsIdsString =
                mProjectsIdsString + mSelectedProjectsIdsList[i].toString();
          } else {
            mProjectsIdsString = mProjectsIdsString +
                ",${mSelectedProjectsIdsList[i].toString()}";
          }
        }
      }
    }
    debugPrint("Selcted projects ids List : $mProjectsIdsString");

    if (mSelectedOrganizationsIdsList.isNotEmpty) {
      for (var i = 0; i < mSelectedOrganizationsIdsList.length; i++) {
        if (mOrganizationsIdsString
            .contains(mSelectedOrganizationsIdsList[i].toString())) {
        } else {
          if (i == 0) {
            mOrganizationsIdsString = mOrganizationsIdsString +
                mSelectedOrganizationsIdsList[i].toString();
          } else {
            mOrganizationsIdsString = mOrganizationsIdsString +
                ",${mSelectedOrganizationsIdsList[i].toString()}";
          }
        }
      }
    }

    if (selectedAnacdotsLocationsDropDownList.isNotEmpty) {
      for (var i = 0; i < selectedAnacdotsLocationsDropDownList.length; i++) {
        if (mSelectedLocationsString.isEmpty) {
          mSelectedLocationsString = mSelectedLocationsString +
              selectedAnacdotsLocationsDropDownList[i].toString();
        } else {
          mSelectedLocationsString = mSelectedLocationsString +
              ",${selectedAnacdotsLocationsDropDownList[i].toString()}";
        }
      }
    }
    debugPrint("Selcted organization ids List : $mOrganizationsIdsString");

    anecdotesFileResponseModels =
        await AnecdotesDirectoryClients.getAnecdotesFile(
      searchString: mSearchController.text,
      organizationID: mOrganizationsIdsString,
      personID: mPersonsIdsString,
      projectID: mProjectsIdsString,
      locations: mSelectedLocationsString,
      date: selectedDateTime,
    );
    showLoading = false;
    notifyListeners();
  }

  bool showFilters = false;

  /// Get List of all projects dropdown///

  String anacdotsProjectDropdownID = "";
  String anacdotsProjectDropDownName = "";
  List<String> selectedAnacdotsProjectDropDownList = [];
  AnacdotsProjectsDropdownReponse? anacdotsProjectDropDownsResponse =
      AnacdotsProjectsDropdownReponse();
  List<int> mSelectedProjectsIdsList = [];

  getAnacdotsProjectDropdownData() async {
    anacdotsProjectDropDownsResponse =
        await AnacdotsDropDowns.getAnacdotsProjectsDropdownResponse();

    debugPrint(
        "Projects Dropdown Response : : ${anacdotsProjectDropDownsResponse!.toJson()}");

    anacdotsProjectDropDownName =
        anacdotsProjectDropDownsResponse!.data?[0].name ?? "";
    anacdotsProjectDropdownID =
        anacdotsProjectDropDownsResponse!.data?[0].id.toString() ?? "";
    getListOfProjectsItems();
    notifyListeners();
  }

  /// Get List of all Locations dropdown///

  String anacdotsLoctionsDropDownName = "";
  List<String> selectedAnacdotsLocationsDropDownList = [];
  List<String> locationsItemList = [];
  AnacdotsLocationsDropdownReponse? anacdotsLocationsDropDownsResponse =
      AnacdotsLocationsDropdownReponse();

  getAnacdotsLocationsDropdownData() async {
    anacdotsLocationsDropDownsResponse =
        await AnacdotsDropDowns.getAnacdotsLocationsDropdownResponse();
    if (anacdotsLocationsDropDownsResponse!.data![0].city != null) {
      anacdotsLoctionsDropDownName =
          anacdotsLocationsDropDownsResponse!.data![0].city!;
    } else {
      anacdotsLoctionsDropDownName = "city";
    }

    debugPrint(
        "Locations Dropdown Response : : ${anacdotsLocationsDropDownsResponse!.toJson()}");

    anacdotsLoctionsDropDownName =
        anacdotsLocationsDropDownsResponse!.data?[0].city ?? "";
    getListOfLocationsItems();
    notifyListeners();
  }

  getListOfLocationsItems() async {
    locationsItemList.clear();
    notifyListeners();
    for (int i = 0; i < anacdotsLocationsDropDownsResponse!.data!.length; i++) {
      locationsItemList
          .add("${anacdotsLocationsDropDownsResponse!.data?[i].city}");
      debugPrint("ItemList == $i"
          "  ${anacdotsLocationsDropDownsResponse!.data?[i].city} ");
      notifyListeners();
    }
  }

//purpose of projectsItemList is because dropdown accept List of string but our model is List of data so we got name List here
  List<String> projectsItemList = [];

  getListOfProjectsItems() async {
    projectsItemList.clear();
    notifyListeners();
    for (int i = 0; i < anacdotsProjectDropDownsResponse!.data!.length; i++) {
      projectsItemList
          .add("${anacdotsProjectDropDownsResponse!.data?[i].name}");
      debugPrint("ItemList == $i"
          "  ${anacdotsProjectDropDownsResponse!.data?[i].name} ");
    }
  }

  // Get List of all organizations dropdown//
  String anacdotsOrganizationsDropdownID = "";
  String anacdotsOrganizationsDropDownName = "";
  List<String> selectedAnacdotsOrganizationstDropDownList = [];
  AnacdotsOrganizationsDropdownReponse? anacdotsOrganizationsDropDownsResponse =
      AnacdotsOrganizationsDropdownReponse();
  List<int> mSelectedOrganizationsIdsList = [];

  getAnacdotsOrganizationsDropdownData() async {
    anacdotsOrganizationsDropDownsResponse =
        await AnacdotsDropDowns.getAnacdotsOrganizationssDropdownResponse();
    debugPrint(
        "Organizations Dropdown Response : : ${anacdotsOrganizationsDropDownsResponse!.toJson()}");
    anacdotsOrganizationsDropDownName =
        anacdotsOrganizationsDropDownsResponse!.data?[0].name ?? "";
    anacdotsOrganizationsDropdownID =
        anacdotsOrganizationsDropDownsResponse!.data?[0].id.toString() ?? "";
    getListOfOrganizationsItems();
    notifyListeners();
  }

  List<String> organizationsItemList = [];

  getListOfOrganizationsItems() async {
    organizationsItemList.clear();
    notifyListeners();
    for (int i = 0;
        i < anacdotsOrganizationsDropDownsResponse!.data!.length;
        i++) {
      organizationsItemList
          .add("${anacdotsOrganizationsDropDownsResponse!.data?[i].name}");
      debugPrint("ItemList == $i"
          "  ${anacdotsOrganizationsDropDownsResponse!.data?[i].name} ");
      notifyListeners();
    }
  }

  // Get List of all organizations dropdown//

  String anacdotsPersonsDropdownID = "";
  String anacdotsPersonsDropDownName = "";
  List<String> selectedAnacdotsPersonsDropDownList = [];
  AnacdotsPersonsDropdownReponse? anacdotsPersonsDropDownsResponse =
      AnacdotsPersonsDropdownReponse();
  List<int> mSelectedPersonsIdsList = [];

  getAnacdotsPersonsDropdownData() async {
    anacdotsPersonsDropDownsResponse =
        await AnacdotsDropDowns.getAnacdotsPersonsDropdownResponse();
    debugPrint(
        "Persons Dropdown Response : ${anacdotsPersonsDropDownsResponse!.toJson()}");
    anacdotsPersonsDropDownName =
        anacdotsPersonsDropDownsResponse!.data?[0].name ?? "";
    anacdotsOrganizationsDropdownID =
        anacdotsPersonsDropDownsResponse!.data?[0].id.toString() ?? "";
    getListOfPersonsItems();
    notifyListeners();
  }

  List<String> personsItemList = [];

  getListOfPersonsItems() async {
    personsItemList.clear();
    notifyListeners();
    for (int i = 0; i < anacdotsPersonsDropDownsResponse!.data!.length; i++) {
      personsItemList.add(anacdotsPersonsDropDownsResponse!.data![i].name!);
      debugPrint("ItemList == $i"
          "  ${anacdotsPersonsDropDownsResponse!.data?[i].name} ");
      notifyListeners();
    }
  }

  ///----------------------Delete File -----------------------///
  late DeleteFileResponse deleteFile;
  Future deleteFileData(int anecdotID) async {
    deleteFile = await AnecdotesDirectoryClients.deleteFile(anecdotID);
    notifyListeners();
  }

  PutAnecdotsRequest? putAnecdotsRequest;
  Future updateAnecdots(
      {required int anecdotId,
      required PutAnecdotsRequest? requestBody}) async {
    putAnecdotsRequest = await AnecdotesDirectoryClients.updateAnecdots(
        anecdotID: anecdotId, request: requestBody);
    getAnecdotesFiles();
    notifyListeners();
  }
}
