import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'package:wij_land/non_admin/models/farm_computer_dropdown/municipality_drop_down.dart';
import 'package:wij_land/non_admin/models/farm_computer_dropdown/parcel_land_function_drop_down.dart';
import 'package:wij_land/non_admin/models/farm_computer_dropdown/parcel_ownership_drop_down.dart';
import 'package:wij_land/non_admin/models/farm_computer_dropdown/parcel_project_drop_down.dart';
import 'package:wij_land/non_admin/models/farm_computer_parcels/response/parcels_dropdown_reponse.dart';
import 'package:wij_land/utils/functions.dart';
import '../../api_clients/BaseClass.dart';
import '../models/farm_computer_dropdown/business_type_dropdown.dart';
import '../models/farm_computer_dropdown/farm_files_dropdown.dart';
import '../models/farm_computer_dropdown/parcel_land_management_drop_down.dart';
import '../models/farm_computer_dropdown/parcel_organizations_drop_down.dart';
import '../models/farm_computer_dropdown/parcel_purpose_drop_down.dart';
import '../models/farm_computer_dropdown/water_board_drop_down.dart';
import '../models/farm_computer_files/get_farm_computer_action_dropdown.dart';

class FarmComputerParcelsDropDownClient {
  ///Get Parcel Purpose Dropdown Data ///
  static Future<ParcelPurposesDropDown> getParcelPurposeDetailData() async {
    var url = "$baseURL/dropdowns/parcel_purposes";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print("Farm Computer parcels dropDown response    ${response.body} ");

    if (response.statusCode == 200) {
      ParcelPurposesDropDown model =
          ParcelPurposesDropDown.fromJson(jsonDecode(response.body));
      return model;
    } else {
      ParcelPurposesDropDown model = ParcelPurposesDropDown();
      return model..message = 'data not found'.tr();
    }
  }

  ///Get Parcel Ownership Dropdown Data ///
  static Future<ParcelOwnershipDropDown> getParcelOwnershipDetailData() async {
    var url = "$baseURL/dropdowns/parcel_ownership";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print("Farm Computer parcels dropDown response    ${response.body} ");

    if (response.statusCode == 200) {
      ParcelOwnershipDropDown model =
          ParcelOwnershipDropDown.fromJson(jsonDecode(response.body));
      return model;
    } else {
      ParcelOwnershipDropDown model = ParcelOwnershipDropDown();
      return model..message = 'data not found'.tr();
    }
  }

  ///Get Parcel Land Function Dropdown Data ///
  static Future<ParcelLandFunctionDropDown>
      getParcelLandFunctionDetailData() async {
    var url = "$baseURL/dropdowns/parcel_land_function";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print("Farm Computer parcels dropDown response    ${response.body} ");

    if (response.statusCode == 200) {
      ParcelLandFunctionDropDown model =
          ParcelLandFunctionDropDown.fromJson(jsonDecode(response.body));
      return model;
    } else {
      ParcelLandFunctionDropDown model = ParcelLandFunctionDropDown();
      return model..message = 'data not found'.tr();
    }
  }

  ///Get Parcel Land Management Dropdown Data ///
  static Future<ParcelLandManagementDropDown>
      getParcelLandManagementDetailData() async {
    var url = "$baseURL/dropdowns/parcel_land_management";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print("Farm Computer parcels dropDown response    ${response.body} ");

    if (response.statusCode == 200) {
      ParcelLandManagementDropDown model =
          ParcelLandManagementDropDown.fromJson(jsonDecode(response.body));
      return model;
    } else {
      ParcelLandManagementDropDown model = ParcelLandManagementDropDown();
      return model..message = 'data not found'.tr();
    }
  }

  ///Get Parcel Organizations Dropdown Data ///
  static Future<ParcelOrganizationsDropDown>
      getParcelOrganizationsDetailData() async {
    var url = "$baseURL/dropdowns/organizations";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print("Farm Computer parcels dropDown response    ${response.body} ");

    if (response.statusCode == 200) {
      ParcelOrganizationsDropDown model =
          ParcelOrganizationsDropDown.fromJson(jsonDecode(response.body));
      return model;
    } else {
      ParcelOrganizationsDropDown model = ParcelOrganizationsDropDown();
      return model..message = 'data not found'.tr();
    }
  }

  /// Get Parcels project dropdown
  static Future<ParcelProjectsDropDown> getParcelsProjectsDropDown() async {
    var url = "$baseURL/dropdowns/active_farm_projects";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print("Farm Computer project dropDown Url    ${url} ");
    print("Farm Computer project dropDown response body    ${response.body} ");

    if (response.statusCode == 200) {
      ParcelProjectsDropDown model =
          ParcelProjectsDropDown.fromJson(jsonDecode(response.body));
      return model;
    } else {
      ParcelProjectsDropDown model = ParcelProjectsDropDown();
      return model..message = 'data not found'.tr();
    }
  }

  ///Get Parcel Dropdown Data ///
  static Future<ParcelDropDownResponse> getParcelDropdown() async {
    var url = "$baseURL/dropdowns/parcels";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print("Parcels dropDown response    ${jsonDecode(response.body)['data']} ");
    if (response.statusCode == 200) {
      ParcelDropDownResponse model =
          ParcelDropDownResponse.fromJson(jsonDecode(response.body));
      return model;
    } else {
      ParcelDropDownResponse model =
          ParcelDropDownResponse.fromJson(jsonDecode(response.body));
      return model..message = 'Data not found'.tr();
    }
  }

  /// Farm Computer Action Dropdown
  static Future<GetFarmComputerActionsDropdown> getFarmActionDropDown() async {
    var url = "$baseURL/dropdowns/farm_computer_actions";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print("Action dropDown response    ${jsonDecode(response.body)['data']} ");
    if (response.statusCode == 200) {
      GetFarmComputerActionsDropdown model =
          GetFarmComputerActionsDropdown.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerActionsDropdown model =
          GetFarmComputerActionsDropdown.fromJson(jsonDecode(response.body));
      return model..message = 'Data not found'.tr();
    }
  }

  /// Get Event type dropdown
  static Future<List<String>> getEventTypeDropDown() async {
    var url = "$baseURL/dropdowns/event_type";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print(
        "Event type dropDown response    ${jsonDecode(response.body)['data']} ");
    if (response.statusCode == 200) {
      List<String> list = jsonDecode(response.body)['data'].cast<String>();
      return list;
    } else {
      return [];
    }
  }

  // Get Action type dropdown

  static Future<List<String>> getActionTypeDropdown() async {
    var url = "$baseURL/dropdowns/action_type";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print(
        "Action type dropDown response    ${jsonDecode(response.body)['data']} ");
    if (response.statusCode == 200) {
      List<String> list = jsonDecode(response.body)['data'].cast<String>();
      return list;
    } else {
      return [];
    }
  }

  // Get ContactMoment type dropdown
  static Future<List<String>> getContactMomentTypeDropDown() async {
    var url = "$baseURL/dropdowns/contact_type";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print(
        "contact type dropDown response    ${jsonDecode(response.body)['data']} ");
    if (response.statusCode == 200) {
      List<String> list = jsonDecode(response.body)['data'].cast<String>();
      return list;
    } else {
      return [];
    }
  }

  // Get Farm Computer File Type DropDown

  static Future<List<String>> getFarmFileTypeDropdown() async {
    var url = "$baseURL/dropdowns/file_filter";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print(
        "File type dropDown response    ${jsonDecode(response.body)['data']} ");
    if (response.statusCode == 200) {
      List<String> list = jsonDecode(response.body)['data'].cast<String>();
      return list;
    } else {
      return [];
    }
  }

  // FARM COMPUTER BUSINESS TYPE DROPDOWN
  static Future getBusinessTypeDropDown() async {
    var url = '$baseURL/dropdowns/business_type';
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    print('FARM COMPUTER business dropdown response   ${response.body}');

    if (response.statusCode == 200) {
      BusinessTypeDropDown model =
          BusinessTypeDropDown.fromJson(jsonDecode(response.body));
      return model;
    } else {
      var res =jsonDecode(response.body);
      // showSnack('error ${res['error']}');

      BusinessTypeDropDown model = BusinessTypeDropDown.fromJson(res);
      return model;

    }
  }

  // FARM COMPUTER MUNICIPALITY DROPDOWN
  static Future getMunicipalityDropDown({required String province}) async {
    var url = '$baseURL/dropdowns/mu_$province';
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);


    if (response.statusCode == 200) {
      GetFCMunicipalityDropDown model =
          GetFCMunicipalityDropDown.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetFCMunicipalityDropDown model =
          GetFCMunicipalityDropDown.fromJson(jsonDecode(response.body));

      return model;
    }
  }

  // FARM COMPUTER MUNICIPALITY DROPDOWN
  static Future<GetFCWaterBoardDropDown> getWaterBoardDropDown(
      {required String province}) async {
    var url = '$baseURL/dropdowns/wb_$province';
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    print('FARM COMPUTER waterboard response   ${response.body}');

    if (response.statusCode == 200) {
      GetFCWaterBoardDropDown model =
          GetFCWaterBoardDropDown.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetFCWaterBoardDropDown model =
          GetFCWaterBoardDropDown.fromJson(jsonDecode(response.body));

      return model;
    }
  }

  /// Get farm computer files dropdown
  static Future<FarmComputerFilesDropdown> getComputerFilesDropDown() async {
    var url = "$baseURL/dropdowns/projects";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print("Farm Computer Files response    ${response.body} ");

    if (response.statusCode == 200) {
      FarmComputerFilesDropdown model =
          FarmComputerFilesDropdown.fromJson(jsonDecode(response.body));
      return model;
    } else {
      FarmComputerFilesDropdown model = FarmComputerFilesDropdown();
      return model..message = 'data not found'.tr();
    }
  }
}
