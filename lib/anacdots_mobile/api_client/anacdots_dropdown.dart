import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wij_land/anacdots_mobile/api_client/base_class.dart';
import 'package:wij_land/anacdots_mobile/models/anacdots_dropdown_reponse_models/anacdots_project_dropdown_reponse.dart';

import '../models/anacdots_dropdown_reponse_models/anacdots_locations_dropdown_response.dart';
import '../models/anacdots_dropdown_reponse_models/anacdots_organizations_dropdown_reponse.dart';
import '../models/anacdots_dropdown_reponse_models/anacdots_persons_dropdown_reponse.dart';

class AnacdotsDropDowns {
  /// Get list of all Projects in dropdown response ////

  static Future<AnacdotsProjectsDropdownReponse>
      getAnacdotsProjectsDropdownResponse() async {
    var url = "$baseURL/dropdown/projects";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: {
      "Authorization": "Bearer ${box.read('token')}",
      "Content-type": "application/json",
    });
    debugPrint("Data ${box.read('token')}");
    debugPrint("Data ${response.body}");

    if (response.statusCode == 200) {
      AnacdotsProjectsDropdownReponse model =
          AnacdotsProjectsDropdownReponse.fromJson(jsonDecode(response.body));
      return model;
    } else {
      AnacdotsProjectsDropdownReponse model = AnacdotsProjectsDropdownReponse();
      return model..message = 'Data not found';
    }
  }

  /// Get list of all Projects in dropdown response ////
  static Future<AnacdotsOrganizationsDropdownReponse>
      getAnacdotsOrganizationssDropdownResponse() async {
    var url = "$baseURL/dropdown/organizations";
    var uri = Uri.parse(url);
    debugPrint("Organizations Dropdown Url :$url");

    var response = await http.get(uri, headers: {
      "Authorization": "Bearer ${box.read('token')}",
      "Content-type": "application/json",
    });
    //   debugPrint("Data ${box.read('token')}");
    debugPrint("Data Organizations${response.body}");

    if (response.statusCode == 200) {
      AnacdotsOrganizationsDropdownReponse model =
          AnacdotsOrganizationsDropdownReponse.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      AnacdotsOrganizationsDropdownReponse model =
          AnacdotsOrganizationsDropdownReponse();
      return model..message = 'Data not found';
    }
  }

  // Get list of all Persons in dropdown response ////
  static Future<AnacdotsPersonsDropdownReponse>
      getAnacdotsPersonsDropdownResponse() async {
    var url = "$baseURL/dropdown/persons";
    var uri = Uri.parse(url);
    debugPrint("Persons Dropdown Url :$url");
    var response = await http.get(uri, headers: {
      "Authorization": "Bearer ${box.read('token')}",
      "Content-type": "application/json",
    });
    //   debugPrint("Data ${box.read('token')}");
    debugPrint("Data Persons${response.body}");

    if (response.statusCode == 200) {
      AnacdotsPersonsDropdownReponse model =
          AnacdotsPersonsDropdownReponse.fromJson(jsonDecode(response.body));
      return model;
    } else {
      AnacdotsPersonsDropdownReponse model = AnacdotsPersonsDropdownReponse();
      return model..message = 'Data not found';
    }
  }

  // Get list of all Locations in dropdown response ////
  static Future<AnacdotsLocationsDropdownReponse>
      getAnacdotsLocationsDropdownResponse() async {
    var url = "$baseURL/anecdotes/locations";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: {
      "Authorization": "Bearer ${box.read('token')}",
      "Content-type": "application/json",
    });
    //   debugPrint("Data ${box.read('token')}");
    debugPrint("Data Locations${response.body}");

    if (response.statusCode == 200) {
      AnacdotsLocationsDropdownReponse model =
          AnacdotsLocationsDropdownReponse.fromJson(jsonDecode(response.body));
      return model;
    } else {
      AnacdotsLocationsDropdownReponse model =
          AnacdotsLocationsDropdownReponse();
      return model..message = 'Data not found';
    }
  }
}
