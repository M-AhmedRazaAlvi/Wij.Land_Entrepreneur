import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'package:wij_land/models/entrepreneur_dropDown/focus_area_drop_down_model.dart';
import 'package:wij_land/models/entrepreneur_dropDown/organize_person_dropDown.dart';
import 'package:wij_land/models/entrepreneur_dropDown/retailer_dropdown.dart';

import '../models/entrepreneur_dropDown/assigned_by_dropDown.dart';
import '../models/entrepreneur_dropDown/assigned_to_dropDown.dart';
import '../models/entrepreneur_dropDown/attendees_dropDown.dart';
import '../models/entrepreneur_dropDown/entrepreneur_relation_to_wijland_drop_down_model.dart';
import '../models/entrepreneur_dropDown/farm_dropDown.dart';
import '../models/entrepreneur_dropDown/farmers_dropDown.dart';
import '../models/entrepreneur_dropDown/legal_structure_drop_down_model.dart';
import '../models/entrepreneur_dropDown/organization_dropDown.dart';
import '../models/entrepreneur_dropDown/persons_dropDown.dart';
import '../models/entrepreneur_dropDown/products_drop_down_model.dart';
import '../models/entrepreneur_dropDown/programme_coordinator_dropDown.dart';
import '../models/entrepreneur_dropDown/project_dropDown.dart';
import '../models/entrepreneur_dropDown/relation_to_wijland_drop_down_model.dart';
import '../models/entrepreneur_dropDown/wij_land_team_dropDown.dart';
import 'BaseClass.dart';

class DropDownClients {
  static String projects = 'projects';
  static String organizations = 'organizations';
  static String wij_land_team = 'wij_land_team';
  static String attendees = 'attendees';
  static String persons = 'persons';
  static String assigned_by = 'assigned_by';
  static String programme_coordinator = 'programme_coordinator';
  static String assigned_to = 'assigned_to';
  static String farmers = 'farmers';
  static String farms = 'farms';

  ///Get Entrepreneur dropdown Data ///
  static Future<ProjectDropdown> getProjectsDetailData() async {
    var url = "$baseURL/dropdowns/projects";
    //Hi
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      ProjectDropdown model =
          ProjectDropdown.fromJson(jsonDecode(response.body));
      return model;
    } else {
      ProjectDropdown model = ProjectDropdown();
      return model..message = 'data not found';
    }
  }

  /// Get Organizations dropdown data //
  static Future<OrganizationDropdown> getOrganizationDetailData() async {
    var url = "$baseURL/dropdowns/organization_not_entrepreneur";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      OrganizationDropdown model =
          OrganizationDropdown.fromJson(jsonDecode(response.body));
      return model;
    } else {
      OrganizationDropdown model = OrganizationDropdown();
      return model..message = 'data not found'.tr();
    }
  }

  /// Get WijLandTeam dropdown data //

  static Future<WijLandTeamDropdown> getWijLandTeamDetailData() async {
    var url = "$baseURL/dropdowns/$wij_land_team";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      WijLandTeamDropdown model =
          WijLandTeamDropdown.fromJson(jsonDecode(response.body));
      return model;
    } else {
      WijLandTeamDropdown model = WijLandTeamDropdown();
      return model..message = 'data not found'.tr();
    }
  }

  /// Get Attendees dropdown data //

  static Future<AttendeesDropdown> getAttendeesDetailData() async {
    var url = "$baseURL/dropdowns/attendees";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      AttendeesDropdown model =
          AttendeesDropdown.fromJson(jsonDecode(response.body));
      return model;
    } else {
      AttendeesDropdown model = AttendeesDropdown();
      return model..message = 'data not found'.tr();
    }
  }

  /// Get Person dropdown data //

  static Future<PersonsDropdown> getPersonDetailData() async {
    var url = "$baseURL/dropdowns/persons";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      PersonsDropdown model =
          PersonsDropdown.fromJson(jsonDecode(response.body));
      return model;
    } else {
      PersonsDropdown model = PersonsDropdown();
      return model..message = 'data not found'.tr();
    }
  }

  /// Get Person dropdown data //

  static Future<OrganizePersonDropDown> getOrganizePersonDetailData({required int id}) async {
    var url = "$baseURL/dropdowns/existing_persons/$id";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      OrganizePersonDropDown model =
      OrganizePersonDropDown.fromJson(jsonDecode(response.body));
      return model;
    } else {
      OrganizePersonDropDown model = OrganizePersonDropDown();
      return model..message = 'data not found'.tr();
    }
  }

  /// Get Retailer dropdown data
  static Future<RetailerDropDown> getRetailerDetailData({required int id}) async {
    var url = "$baseURL/dropdowns/existing_retailers/$id";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      RetailerDropDown model =
      RetailerDropDown.fromJson(jsonDecode(response.body));
      return model;
    } else {
      RetailerDropDown model = RetailerDropDown();
      return model..message = 'data not found'.tr();
    }
  }
  /// Get AssignedBy dropdown data //

  static Future<AssignedByDropdown> getAssignedByDetailData() async {
    var url = "$baseURL/dropdowns/$assigned_by";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      AssignedByDropdown model =
          AssignedByDropdown.fromJson(jsonDecode(response.body));
      return model;
    } else {
      AssignedByDropdown model = AssignedByDropdown();
      return model..message = 'data not found'.tr();
    }
  }

  /// Get ProgramCoordinator dropdown data //

  static Future<ProgrammeCoordinatorDropdown>
      getProgramCoordinatorDetailData() async {
    var url = "$baseURL/dropdowns/$programme_coordinator";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      ProgrammeCoordinatorDropdown model =
          ProgrammeCoordinatorDropdown.fromJson(jsonDecode(response.body));
      return model;
    } else {
      ProgrammeCoordinatorDropdown model = ProgrammeCoordinatorDropdown();
      return model..message = 'data not found'.tr();
    }
  }

  /// Get AssignedTo dropdown data //

  static Future<AssignedToDropdown> getAssignedToDetailData() async {
    var url = "$baseURL/dropdowns/$assigned_to";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      AssignedToDropdown model =
          AssignedToDropdown.fromJson(jsonDecode(response.body));
      return model;
    } else {
      AssignedToDropdown model = AssignedToDropdown();
      return model..message = 'data not found'.tr();
    }
  }

  /// Get Farmers dropdown data //

  static Future<FarmersDropdown> getFarmersDetailData() async {
    var url = "$baseURL/dropdowns/$farmers";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      FarmersDropdown model =
          FarmersDropdown.fromJson(jsonDecode(response.body));
      return model;
    } else {
      FarmersDropdown model = FarmersDropdown();
      return model..message = 'data not found'.tr();
    }
  }

  static Future<FarmDropDown> getFarmDetailData() async {
    var url = "$baseURL/dropdowns/farms";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      FarmDropDown model = FarmDropDown.fromJson(jsonDecode(response.body));
      return model;
    } else {
      FarmDropDown model = FarmDropDown();
      return model..message = 'data not found'.tr();
    }
  }

  static Future<ProjectDropdown> getProjectsDropDownData() async {
    var url = "$baseURL/dropdowns/projects";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      ProjectDropdown model =
          ProjectDropdown.fromJson(jsonDecode(response.body));
      return model;
    } else {
      ProjectDropdown model = ProjectDropdown();
      return model..message = 'data not found'.tr();
    }
  }

  static Future<ProductsDropDownModel> getProductsDropDownData() async {
    var url = "$baseURL/dropdowns/products";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      ProductsDropDownModel model =
          ProductsDropDownModel.fromJson(jsonDecode(response.body));
      return model;
    } else {
      ProductsDropDownModel model = ProductsDropDownModel();
      return model..message = 'data not found'.tr();
    }
  }

  static Future<LegalStructureDropDownModel>
      getLegalStructureDropDownData() async {
    var url = "$baseURL/dropdowns/legal_structure";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      LegalStructureDropDownModel model =
          LegalStructureDropDownModel.fromJson(jsonDecode(response.body));
      return model;
    } else {
      LegalStructureDropDownModel model = LegalStructureDropDownModel();
      return model..message = 'data not found'.tr();
    }
  }

  static Future<RelationToWijLandDropDownModel>
      getRelationToWijLandDropDownData() async {
    var url = "$baseURL/dropdowns/relation_to_wijland";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      RelationToWijLandDropDownModel model =
          RelationToWijLandDropDownModel.fromJson(jsonDecode(response.body));
      return model;
    } else {
      RelationToWijLandDropDownModel model = RelationToWijLandDropDownModel();
      return model..message = 'data not found'.tr();
    }
  }

  static Future<EntrepreneurRelationToWijLandDropDownModel>
  getEntrepreneurRelationToWijLandDropDownData() async {
    var url = "$baseURL/dropdowns/entrepreneur_relation_to_wij_land";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      EntrepreneurRelationToWijLandDropDownModel model =
      EntrepreneurRelationToWijLandDropDownModel.fromJson(jsonDecode(response.body));
      return model;
    } else {
      EntrepreneurRelationToWijLandDropDownModel model = EntrepreneurRelationToWijLandDropDownModel();
      return model..message = 'data not found'.tr();
    }
  }

  static Future<FocusAreaDropDownModel>
  getFocusAreaDropDownData() async {
    var url = "$baseURL/dropdowns/focus_area";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      FocusAreaDropDownModel model =
      FocusAreaDropDownModel.fromJson(jsonDecode(response.body));
      return model;
    } else {
      FocusAreaDropDownModel model = FocusAreaDropDownModel();
      return model..message = 'data not found'.tr();
    }
  }

}
