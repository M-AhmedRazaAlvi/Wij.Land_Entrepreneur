import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:wij_land/anacdots_mobile/api_client/anacdots_dropdown.dart';
import 'package:wij_land/anacdots_mobile/api_client/anecdotes_directory_clients.dart';
import 'package:wij_land/anacdots_mobile/models/anacdots_dropdown_reponse_models/anacdots_project_dropdown_reponse.dart';
import 'package:wij_land/anacdots_mobile/models/mediacrudModel.dart';
import '../../models/anacdots_dropdown_reponse_models/anacdots_organizations_dropdown_reponse.dart';
import '../../models/anacdots_dropdown_reponse_models/anacdots_persons_dropdown_reponse.dart';
import '../../models/anecdotPostModel.dart';
import '../../models/createdAnacdotModel.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

class AnacdotsDropDownsProvider extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateCtl = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String titleName = '';
  String description = '';
  CreatedAnacdotRequest? anecdotesFileResponseModels = CreatedAnacdotRequest();
  MediaRequestModel mediaRequestModel = MediaRequestModel();

  /// Get List of all projects dropdown///
  List<String> itemsListTags = [
    "Inspiration",
    "Natural Capital",
    "Financial Capital",
    "Social Capital"
  ];
  List<String> selectedItemsTagList = [];
  List<int> updatedAndecdotsFiles = [];
  String selectedItem = "Inspiration";
  PickResult? selectedPlace;
  String anacdotsProjectDropdownID = "";
  String anacdotsProjectDropDownName = "";
  List<String> selectedAnacdotsProjectDropDownList = [];
  List<int> selectedAnacdotsProjectDropDownIds = [];
  AnacdotsProjectsDropdownReponse? anacdotsProjectDropDownsResponse =
      AnacdotsProjectsDropdownReponse();
  final bool isLoading = false;
  Future uploadMediaRequest(BuildContext context, List<XFile> images) async {
    mediaRequestModel =
        await AnecdotesDirectoryClients.uploadMediaRequest(context, images);

    notifyListeners();
  }

  Future getAnacdotsProjectDropdownData() async {
    // selectedAnacdotsProjectDropDownList.clear();
// selectedAnacdotsProjectDropDownList.clear();
    anacdotsProjectDropDownsResponse =
        await AnacdotsDropDowns.getAnacdotsProjectsDropdownResponse();
    anacdotsProjectDropDownName =
        anacdotsProjectDropDownsResponse!.data?[0].name ?? "";
    anacdotsProjectDropdownID =
        anacdotsProjectDropDownsResponse!.data?[0].id.toString() ?? "";
    getListOfProjectsItems();
    notifyListeners();
  }

////////here to start get list of project itmsss
//purpose of projectsItemList is because dropdown accept List of string but our model is List of data so we got name List here
  List<String> projectsItemList = [];
  List<int> projectsItemListIds = [];
  getListOfProjectsItems() async {
    projectsItemList.clear();
    projectsItemListIds.clear();
    for (int i = 0; i < anacdotsProjectDropDownsResponse!.data!.length; i++) {
      projectsItemList
          .add("${anacdotsProjectDropDownsResponse!.data![i].name}");
      projectsItemListIds.add(anacdotsProjectDropDownsResponse!.data![i].id!);
      debugPrint("ItemList == $i"
          "${anacdotsProjectDropDownsResponse!.data?[i].name} ");
    }
  }

  Future addNewAnecdotes(AnecdotPostModel anecdotPostModel) async {
    anecdotesFileResponseModels =
        await AnecdotesDirectoryClients.creatAnacdotApiReq(anecdotPostModel);
    notifyListeners();
  }

////////here to start get list of project itmsss
//purpose of projectsItemList is because dropdown accept List of string but our model is List of data so we got name List here

  // Get List of all organizations dropdown//
  String anacdotsOrganizationsDropdownID = "";
  String anacdotsOrganizationsDropDownName = "";
  List<String> selectedAnacdotsOrganizationstDropDownList = [];
  List<int> selectedAnacdotsOrganizationstDropDownIds = [];
  AnacdotsOrganizationsDropdownReponse? anacdotsOrganizationsDropDownsResponse =
      AnacdotsOrganizationsDropdownReponse();
  getAnacdotsOrganizationsDropdownData() async {
    anacdotsOrganizationsDropDownsResponse =
        await AnacdotsDropDowns.getAnacdotsOrganizationssDropdownResponse();
    anacdotsOrganizationsDropDownName =
        anacdotsOrganizationsDropDownsResponse!.data?[0].name ?? "";
    anacdotsOrganizationsDropdownID =
        anacdotsOrganizationsDropDownsResponse!.data?[0].id.toString() ?? "";
    getListOfOrganizationsItems();
    notifyListeners();
  }

  List<String> organizationsItemList = [];
  List<int> organizationsItemListIds = [];
  getListOfOrganizationsItems() async {
    organizationsItemList.clear();
    organizationsItemListIds.clear();
    for (int i = 0;
        i < anacdotsOrganizationsDropDownsResponse!.data!.length;
        i++) {
      organizationsItemList
          .add("${anacdotsOrganizationsDropDownsResponse!.data?[i].name}");
      organizationsItemListIds
          .add(anacdotsOrganizationsDropDownsResponse!.data![i].id!);
      debugPrint("ItemList == $i"
          "  ${anacdotsOrganizationsDropDownsResponse!.data?[i].name} ");
    }
  }

  // Get List of all persons dropdown//
  String anacdotsPersonsDropdownID = "";
  String anacdotsPersonsDropDownName = "";
  List<String> selectedAnacdotsPersonsDropDownList = [];
  List<int> selectedAnacdotsPersonsDropDownIds = [];
  AnacdotsPersonsDropdownReponse? anacdotsPersonsDropDownsResponse =
      AnacdotsPersonsDropdownReponse();
  getAnacdotsPersonsDropdownData() async {
    //  selectedAnacdotsPersonsDropDownList.clear();
    anacdotsPersonsDropDownsResponse =
        await AnacdotsDropDowns.getAnacdotsPersonsDropdownResponse();
    anacdotsPersonsDropDownName =
        anacdotsPersonsDropDownsResponse!.data?[0].name ?? "";
    anacdotsOrganizationsDropdownID =
        anacdotsPersonsDropDownsResponse!.data?[0].id.toString() ?? "";
    getListOfPersonsItems();

    notifyListeners();
  }

  List<String> personsItemList = [];
  List<int> personsItemListIds = [];
  getListOfPersonsItems() async {
    personsItemList.clear();
    personsItemListIds.clear();
    for (int i = 0; i < anacdotsPersonsDropDownsResponse!.data!.length; i++) {
      personsItemList.add("${anacdotsPersonsDropDownsResponse!.data?[i].name}");
      personsItemListIds.add(anacdotsPersonsDropDownsResponse!.data![i].id!);
    }
    notifyListeners();
    //  debugPrint("ItemList ==" "${personsItemList} ");
    debugPrint("ItemListID ==" "${personsItemListIds.toSet()} ");
  }

  clearAllSelectedDropdownList() {
    selectedAnacdotsProjectDropDownList.clear();
    projectsItemListIds.clear();
    selectedAnacdotsOrganizationstDropDownList.clear();
    selectedAnacdotsOrganizationstDropDownIds.clear();
    selectedAnacdotsPersonsDropDownList.clear();
    selectedAnacdotsPersonsDropDownIds.clear();
    selectedItemsTagList.clear();
  }

  calDropDownData() async {
    await getAnacdotsProjectDropdownData();
    await getAnacdotsOrganizationsDropdownData();
    await getAnacdotsPersonsDropdownData();
  }
}
