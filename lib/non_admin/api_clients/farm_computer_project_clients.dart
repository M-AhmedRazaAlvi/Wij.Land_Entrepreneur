import 'dart:convert';
import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wij_land/api_clients/BaseClass.dart';
import 'package:wij_land/non_admin/models/farm_computer_actions/response/get_farm_computer_action_response.dart';
import 'package:wij_land/non_admin/models/farm_computer_events/computer_event_file/response/computer_events_file_response.dart';
import 'package:wij_land/non_admin/models/farm_computer_events/computer_events/request/put_farm_computer_event_attendance_request.dart';
import 'package:wij_land/non_admin/models/farm_computer_events/farm_computer_event_file_media/response/get_farm_computer_events_file_media_response.dart';
import 'package:wij_land/non_admin/models/farm_computer_parcels/request/post_farm_computer_parcel_request.dart';
import 'package:wij_land/non_admin/models/farm_computer_parcels/request/put_farm_computer_parcel_request.dart';
import 'package:wij_land/non_admin/models/farm_computer_parcels/response/file_upload_response.dart';
import 'package:wij_land/non_admin/models/farm_computer_parcels/response/get_farm_computer_parcels_response.dart';
import 'package:wij_land/non_admin/models/farm_computer_project/farm_computer_project_actions/request/post_farm_computer_project_action_request.dart';
import 'package:wij_land/non_admin/models/farm_computer_project/farm_computer_project_actions/response/get_farm_computer_proj_action_response.dart';
import 'package:wij_land/non_admin/models/farm_computer_project/farm_computer_project_files/get_farm_computer_my_project_file_response.dart';
import 'package:wij_land/non_admin/models/farm_computer_project/farm_computer_project_participant/response/get_farm_computer_proj_participants_response.dart';
import 'package:wij_land/non_admin/models/main_dashboard/get_fc_action.dart';
import 'package:wij_land/non_admin/models/main_dashboard/get_fc_basic_info.dart';
import 'package:wij_land/non_admin/models/main_dashboard/get_fc_contact_moments.dart';
import 'package:wij_land/non_admin/models/main_dashboard/put_fc_basic_info.dart';
import 'package:wij_land/non_admin/models/permissions/permissions_requests_model.dart';

import '../../anacdots_mobile/app_common_widgets/ancadots_toast_widget.dart';
import '../../utils/controller.dart';
import '../models/data_overview/farm_computer_data_overview_history.dart';
import '../models/farm_computer_actions/response/get_farm_computer_action_detail_response.dart';
import '../models/farm_computer_contact_moments/responce/get_contact_moment_details_responce.dart';
import '../models/farm_computer_contact_moments/responce/get_contact_moments_responce.dart';
import '../models/farm_computer_dropdown/parcel_project_drop_down.dart';
import '../models/farm_computer_events/computer_event_participating/response/get_computer_event_participating_response.dart';
import '../models/farm_computer_events/computer_events_id/response/farm_computer_events_id_resppnse.dart';
import '../models/farm_computer_events/computer_events_list/get_computer_events_list_response.dart';
import '../models/farm_computer_files/get_computer_file/response/get_computer_files_response.dart';
import '../models/farm_computer_files/get_farm_computer_action_dropdown.dart';
import '../models/farm_computer_members/farm_computer_members_response_model.dart';
import '../models/farm_computer_parcels/response/get_farm_computer_farm_name.dart';
import '../models/farm_computer_parcels/response/parcels_dropdown_reponse.dart';
import '../models/farm_computer_project/farm_computer_project_contact_moments/responce/get_farm_project_contact_moments_response.dart';
import '../models/farm_computer_project/farm_computer_project_events/response/farm_computer_project_events_response.dart';
import '../models/farm_computer_project/farm_computer_project_files/get_computer_project_file_response.dart';
import '../models/farm_computer_project/farm_computer_project_parcels_response_model.dart';
import '../models/farm_computer_project/farm_computers_project_details_response_model.dart';
import '../models/farm_computer_project/farm_computers_projects_response_model.dart';
import '../models/main_dashboard/get_fc_boerenwijzer.dart';
import '../models/main_dashboard/get_fc_events.dart';
import '../models/main_dashboard/get_fc_files.dart';
import '../models/main_dashboard/get_fc_project.dart';
import '../models/main_files/response/get_fc_files.dart';
import '../models/permissions/permission_detail_model.dart';
import '../models/permissions/request_status_update_model.dart';
import '../models/person_profile/person_profile_detail_model.dart';
import '../models/person_profile/person_profile_update_model.dart';
import '../models/person_profile/person_profile_update_request_model.dart';
import '../models/privacy_settings_response_model.dart';
import '../models/privacy_settings_update_response.dart';

class FarmComputerProjectClients {
  static String farmComputer = 'farm_computer';
  static String farm = 'farm';
  // static var header = {"Authorization": "Bearer ${authController.myUser.value.token!}", "Content-type": "application/json"};

////////////////Get Method//////////////////////////////////
//////Get Farm computer Actions details

  static Future<GetFarmComputerActionResponse> getFarmComputerActionsDetails({
    // required String mSearchString,
    List<ProjectData>? listofproject = const [],
    List? listofActions = const [],
    List<ParcelDropDownData>? listofParcels = const [],
    String fromDate = '',
    String toDate = '',
    String? month = '',
    String? year = '',
  }) async {
    String mQueryParams = "";

    // if (mSearchString.isNotEmpty) {
    //   mQueryParams = mQueryParams + "&search_string=$mSearchString";
    // }

    if (listofproject!.isNotEmpty) {
      String vvv = '';
      listofproject.forEach((element) {
        if (listofproject.last == element) {
          vvv = vvv + '${element.id}';
        } else {
          vvv = vvv + '${element.id},';
        }
      });
      mQueryParams = mQueryParams + "&project_ids=$vvv";
    }
    if (listofParcels!.isNotEmpty) {
      String vvv = '';
      listofParcels.forEach((element) {
        if (listofParcels.last == element) {
          vvv = vvv + '${element.id}';
        } else {
          vvv = vvv + '${element.id},';
        }
      });
      mQueryParams = mQueryParams + "&parcel_ids=$vvv";
    }
    if (listofActions!.isNotEmpty) {
      String vvv = '';
      listofActions.forEach((element) {
        if (listofActions.last == element) {
          vvv = vvv + '${element}';
        } else {
          vvv = vvv + '${element},';
        }
      });
      mQueryParams = mQueryParams + "&action_types=$vvv";
    }
    if (fromDate != '') {
      mQueryParams = mQueryParams + "&start_date=$fromDate";
    }
    if (toDate != '') {
      mQueryParams = mQueryParams + "&end_date=$toDate";
    }

    // if (mParcelIds.isNotEmpty) {
    //   mQueryParams = mQueryParams + "parcel_ids=$mParcelIds&";
    // }

    var uri = Uri.parse(
        '$baseURL/$farmComputer/actions?${mQueryParams.trim().isNotEmpty ? mQueryParams.substring(1) : ''}'
            .trim());
    // var url = "$baseURL/$farmComputer/actions$mQueryParams";
    print("URL:$uri");
    print("list of actions is ${listofActions}");

    // var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    print("All actions response is ${response.body}");
    if (response.statusCode == 200) {
      GetFarmComputerActionResponse model =
          GetFarmComputerActionResponse.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerActionResponse model =
          GetFarmComputerActionResponse.fromJson(jsonDecode(response.body));
      return model;
    }
  }

/////Get Farm computer Actions details by ParcelID
  static Future<GetFarmComputerActionResponse>
      getFarmComputerActionsDetailsByParcelID({final int? parcelID}) async {
    var url = "$baseURL/$farmComputer/parcel/$parcelID/actions";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    print("All actions response by ID ${response.body}");
    if (response.statusCode == 200) {
      GetFarmComputerActionResponse model =
          GetFarmComputerActionResponse.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerActionResponse model =
          GetFarmComputerActionResponse.fromJson(jsonDecode(response.body));
      return model;
    }
  }

  // Get Detail OF AN ACTION //
  static Future<GetFarmComputerActionDetailResponse>
      getFarmComputerActionsDetailData({required int id}) async {
    var url = "$baseURL/$farmComputer/actions/$id";
    print("URL FOr Project Detail : $url");
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    print("Action Detail Response 1  ${response.body}");
    if (response.statusCode == 200) {
      GetFarmComputerActionDetailResponse model =
          GetFarmComputerActionDetailResponse.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerActionDetailResponse model =
          GetFarmComputerActionDetailResponse.fromJson(
              jsonDecode(response.body));
      return model;
    }
  }

  // Get Detail OF AN ACTION //

////////////////Get Method//////////////////////////////////
  // GET FARM COMPUTER DASHBOARD BASIC INFO

  static Future<GetFCBasicInfo> getFCBasicInfo() async {
    var url = '$baseURL/farm_computer/dashboard/basic_info';
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    print('basic  infor i ${response.body}');
    if (response.statusCode == 200) {
      GetFCBasicInfo model = GetFCBasicInfo.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetFCBasicInfo model = GetFCBasicInfo.fromJson(jsonDecode(response.body));
      return model;
    }
  }

  // GET FARM COMPUTER DASHBOARD FILES

  static Future<GetFCFiles> getFCFiles() async {
    var url = '$baseURL/farm_computer/dashboard/files';
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    print('files response is ${response.body}');
    if (response.statusCode == 200) {
      GetFCFiles model = GetFCFiles.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetFCFiles model = GetFCFiles.fromJson(jsonDecode(response.body));

      return model;
    }
  }

  static Future getFCDialogData({required int fileId}) async {
    var url = '$baseURL/farm_computer/files/$fileId';
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  // FARM COMPUTER DASHBOARD PROJECTS

  static Future<GetFCProjects> getFCProjects() async {
    var url = '$baseURL/farm_computer/dashboard/projects';
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    print('res proje ${response.body}');

    if (response.statusCode == 200) {
      GetFCProjects model = GetFCProjects.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetFCProjects model = GetFCProjects.fromJson(jsonDecode(response.body));

      return model;
    }
  }

  // FARM COMPUTER DASHBOARD EVENTS

  static Future<GetFCEvents> getFCEvents() async {
    var url = '$baseURL/farm_computer/dashboard/events';
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print('farm computer events == ${response.body}');
    if (response.statusCode == 200) {
      GetFCEvents model = GetFCEvents.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetFCEvents model = GetFCEvents.fromJson(jsonDecode(response.body));
      // showSnack('error ${model.message}');

      return model;
    }
  }

  // FARM COMPUTER DASHBOARD CONTACT MOMENTS

  static Future<GetFCContactMoments> getFCContactMoments() async {
    var url = '$baseURL/farm_computer/dashboard/contact_moments';
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    print('FARM COMPUTER contact response   ${response.body}');

    if (response.statusCode == 200) {
      GetFCContactMoments model =
          GetFCContactMoments.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetFCContactMoments model =
          GetFCContactMoments.fromJson(jsonDecode(response.body));

      return model;
    }
  }

  // FARM COMPUTER DASHBOARD BOERENWIJZER

  static Future<PutFCBoerenwijzer> getFCBoerenwijzer() async {
    var url = '$baseURL/farm_computer/dashboard/boerenwijzer';
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    print('FARM COMPUTER boerenwijzer   ${response.body}');

    if (response.statusCode == 200) {
      PutFCBoerenwijzer model =
          PutFCBoerenwijzer.fromJson(jsonDecode(response.body));
      return model;
    } else {
      PutFCBoerenwijzer model =
          PutFCBoerenwijzer.fromJson(jsonDecode(response.body));

      return model;
    }
  }

  //FARM COMPUTER DASHBOARD ACTION
  static Future<GetFCAction> getFCAction() async {
    var url = '$baseURL/farm_computer/dashboard/actions';
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    print('FARM COMPUTER contact response   ${response.body}');

    if (response.statusCode == 200) {
      GetFCAction model = GetFCAction.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetFCAction model = GetFCAction.fromJson(jsonDecode(response.body));

      return model;
    }
  }

  // GET FARM COMPUTER FILES OVERVIEW with filters

  static Future<GetFarmComputerFiles> getFarmCompFiles(
      {String? searchString,
      List<ProjectData>? listofproject = const [],
      List<ActionData>? listofActions = const [],
      List? listofFiles = const [],
      String fromDate = '',
      String toDate = '',
      String? parcelsId}) async {
    String mQueryParams = "";

    if (searchString!.isNotEmpty) {
      mQueryParams = mQueryParams + "&search_string=$searchString";
    }
    if (listofFiles!.isNotEmpty) {
      String vvv = '';
      listofFiles.forEach((element) {
        if (listofFiles.last == element) {
          vvv = vvv + '${element}';
        } else {
          vvv = vvv + '${element},';
        }
      });
      mQueryParams = mQueryParams + "&file_type=$vvv";
    }

    if (listofproject!.isNotEmpty) {
      String vvv = '';
      listofproject.forEach((element) {
        if (listofproject.last == element) {
          vvv = vvv + '${element.id}';
        } else {
          vvv = vvv + '${element.id},';
        }
      });
      mQueryParams = mQueryParams + "&project_ids=$vvv";
    }
    if (listofActions!.isNotEmpty) {
      String vvv = '';
      listofActions.forEach((element) {
        if (listofActions.last == element) {
          vvv = vvv + '${element.id}';
        } else {
          vvv = vvv + '${element.id},';
        }
      });
      mQueryParams = mQueryParams + "&action_ids=$vvv";
    }

    if (fromDate != '') {
      mQueryParams = mQueryParams + "&start_date=$fromDate";
    }
    if (toDate != '') {
      mQueryParams = mQueryParams + "&end_date=$toDate";
    }
    // String parcelID = "parcel_ids=";
    if (parcelsId != null) {
      print("parcel id is $parcelsId");
      mQueryParams = mQueryParams + "&parcel_ids=$parcelsId";
    }
    // var uri = Uri.parse(
    // '$baseURL/farm_computer/files?${mQueryParams.trim().isNotEmpty ? mQueryParams.substring(1) : ''}'
    //     .trim());
    // print("file url is $uri");
    print("Query parameter is  $mQueryParams");
    var url =
        '$baseURL/$farmComputer/files?${mQueryParams.trim().isNotEmpty ? mQueryParams.substring(1) : ''}';
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    print("file url is $uri");
    print("file response is ${response.body}");

    if (response.statusCode == 200) {
      GetFarmComputerFiles model =
          GetFarmComputerFiles.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerFiles model =
          GetFarmComputerFiles.fromJson(jsonDecode(response.body));

      return model;
    }
  }

  static Future<GetFarmComputerFiles> getFarmCompBookMarkFiles() async {
    var url = '$baseURL/farm_computer/book_mark/files';
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    print("file url is $url");
    print("file response is ${response.body}");

    if (response.statusCode == 200) {
      GetFarmComputerFiles model =
          GetFarmComputerFiles.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerFiles model =
          GetFarmComputerFiles.fromJson(jsonDecode(response.body));

      return model;
    }
  }

  static Future<GetFarmComputerFiles> getWijLandBookMarkFiles() async {
    var url = '$baseURL/farm_computer/wij_land_book_mark/files';
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    if (response.statusCode == 200) {
      GetFarmComputerFiles model =
          GetFarmComputerFiles.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerFiles model =
          GetFarmComputerFiles.fromJson(jsonDecode(response.body));

      return model;
    }
  }

  // /// Get fc project My Contract file response
  //
  // static Future<GetFCProjectMyContractFilesResponse>
  //     getFCProjectMyContractsFileId({required int projectId}) async {
  //   var url = "$baseURL/$farmComputer/project/$projectId/my_contract_files";
  //   var uri = Uri.parse(url);
  //   var response = await http.get(uri, headers: header);
  //   print('FC Project my_contract_files  response ${response.body}');
  //   print('FC Project my_contract_files Id Url $url');
  //   print('FC Project my_contract_files Id==== $projectId');
  //
  //   if (response.statusCode == 200) {
  //     GetFCProjectMyContractFilesResponse model =
  //         GetFCProjectMyContractFilesResponse.fromJson(
  //             jsonDecode(response.body));
  //     return model;
  //   } else {
  //     GetFCProjectMyContractFilesResponse model =
  //         GetFCProjectMyContractFilesResponse.fromJson(
  //             jsonDecode(response.body));
  //     return model;
  //   }
  // }

  static Future<GetFarmComputerFiles> getFarmCompContractFiles() async {
    var url = '$baseURL/farm_computer/my_contracts/files';
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    if (response.statusCode == 200) {
      GetFarmComputerFiles model =
          GetFarmComputerFiles.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerFiles model =
          GetFarmComputerFiles.fromJson(jsonDecode(response.body));

      return model;
    }
  }

  //PUT FARM COMPUTER FILE BOOKMARKS

  static Future updateFarmCompFavourite(
      {required int fileID, required bool isLike}) async {
    var url = "$baseURL/$farmComputer/files/$fileID/favourites";
    var uri = Uri.parse(url);
    var response = await http.put(uri,
        headers: header, body: jsonEncode({"is_favourite": isLike}));

    if (response.statusCode == 200) {
      return "Success";
    } else {
      return response.statusCode.toString();
    }
  }

///// Get FARM COMPUTER POROJECT ACTIONS RESPONSE
  static Future<GetFarmComputerProjectActionResponse>
      getFarmComputerProjectActions({
    required int projectID,
    List<ProjectData>? listofproject = const [],
    List? listOfActions = const [],
    List<ParcelDropDownData>? listofParcels = const [],
    String fromDate = '',
    String toDate = '',
  }) async {
    String mQueryParams = "";
    if (listofproject!.isNotEmpty) {
      String vvv = '';
      listofproject.forEach((element) {
        if (listofproject.last == element) {
          vvv = vvv + '${element.id}';
        } else {
          vvv = vvv + '${element.id},';
        }
      });
      mQueryParams = mQueryParams + "&project_ids=$vvv";
    }
    if (listofParcels!.isNotEmpty) {
      String vvv = '';
      listofParcels.forEach((element) {
        if (listofParcels.last == element) {
          vvv = vvv + '${element.id}';
        } else {
          vvv = vvv + '${element.id},';
        }
      });
      mQueryParams = mQueryParams + "&parcel_ids=$vvv";
    }
    if (listOfActions!.isNotEmpty) {
      String vvv = '';
      listOfActions.forEach((element) {
        if (listOfActions.last == element) {
          vvv = vvv + '${element}';
        } else {
          vvv = vvv + '${element},';
        }
      });
      mQueryParams = mQueryParams + "&action_types=$vvv";
    }
    if (fromDate != '') {
      mQueryParams = mQueryParams + "&start_date=$fromDate";
    }
    if (toDate != '') {
      mQueryParams = mQueryParams + "&end_date=$toDate";
    }

    var url =
        "$baseURL/$farmComputer/projects/$projectID/actions?project_ids=&${mQueryParams.trim().isNotEmpty ? mQueryParams.substring(1) : ''}";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print('FARM COMPUTER project ACTIONS ID reponse   ${projectID}');
    print('FARM COMPUTER project ACTIONS ID url   ${url}');
    print('FARM COMPUTER project ACTIONS reponse   ${response.body}');

    if (response.statusCode == 200) {
      GetFarmComputerProjectActionResponse model =
          GetFarmComputerProjectActionResponse.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerProjectActionResponse model =
          GetFarmComputerProjectActionResponse(
              data: [], status: 404, message: "No Data Found");
      return model;
    }
  }

  ///// Get FARM COMPUTER POROJECT CONTACTS RESPONSE
  static Future<GetFarmProjectContactMomentsResponse>
      getFarmComputerProjectContactMoments({required int projectID}) async {
    var url = "$baseURL/$farmComputer/projects/$projectID/contact_moments";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    print('FARM COMPUTER Contact Moment response   ${response.body}');

    if (response.statusCode == 200) {
      GetFarmProjectContactMomentsResponse model =
          GetFarmProjectContactMomentsResponse.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      GetFarmProjectContactMomentsResponse model =
          GetFarmProjectContactMomentsResponse(
              data: [], status: 404, message: "No Data Found");
      return model;
    }
  }

///// GET FARM COMPUTER PROJECT PARTICIPANTS
  static Future<GetFarmComputerProjectParticipantResponse>
      getFarmComputerProjectParticipants({required int projectID}) async {
    var url = "$baseURL/$farmComputer/projects/$projectID/participants";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print('Farm Computer project participants response ${response.body}');

    if (response.statusCode == 200) {
      GetFarmComputerProjectParticipantResponse model =
          GetFarmComputerProjectParticipantResponse.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerProjectParticipantResponse model =
          GetFarmComputerProjectParticipantResponse.fromJson(
              jsonDecode(response.body));
      return model;
    }
  }

  /// GER FARM COMPUTER PARCELS DATA
  static Future<GetFarmComputerParcelsResponse> getFarmComputerParcelsData({
    List<ProjectData>? listofproject = const [],
  }) async {
    var queryParams = '';
    if (listofproject!.isNotEmpty) {
      String vvv = '';

      listofproject.forEach((element) {
        if (listofproject.last == element) {
          vvv = vvv + '${element.id}';
        } else {
          vvv = vvv + '${element.id},';
        }
      });
      queryParams = queryParams + "&filter_params=$vvv";
    }
    // if (listofproject == null) {
    //   var url = "$baseURL/$farmComputer/parcels";
    //   var uri = Uri.parse(url);
    //   var response = await http.get(uri, headers: header);
    //   print("Farm Computer parcels response    ${response.body} ");

    //   if (response.statusCode == 200) {
    //     GetFarmComputerParcelsResponse model =
    //         GetFarmComputerParcelsResponse.fromJson(jsonDecode(response.body));
    //     return model;
    //   } else {
    //     GetFarmComputerParcelsResponse model =
    //         GetFarmComputerParcelsResponse.fromJson(jsonDecode(response.body));
    //     return model;
    //   }
    // } else {
    var uri = Uri.parse(
        '$baseURL/$farmComputer/parcels?${queryParams.trim().isNotEmpty ? queryParams.substring(1) : ''}'
            .trim());
    print("Parcels url is-----${uri}");
    var response = await http.get(uri, headers: header);
    print("Farm Computer parcels filtered value    ${uri} ");

    print("Farm Computer parcels  response    ${response.body} ");

    Map map = jsonDecode(response.body);
    if (response.statusCode == 200 && !map.containsKey('error')) {
      GetFarmComputerParcelsResponse model =
          GetFarmComputerParcelsResponse.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerParcelsResponse model = GetFarmComputerParcelsResponse(
          message: "No data found", status: 404, data: []);
      return model;
    }
  }

  // }

  ////////////// /// Get Farm computer parcels Farm Name//////
  ///
  ///
  ///
  static Future<GetFarmComputerFarmNameResponse> getFarmComputerFarmNameData(
      {required int farmID}) async {
    var url = "$baseURL/$farm/$farmID/wijland_name";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print("Farm computer parcel farm name response  ${response.body}");
    if (response.statusCode == 200) {
      GetFarmComputerFarmNameResponse model =
          GetFarmComputerFarmNameResponse.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerFarmNameResponse model =
          GetFarmComputerFarmNameResponse.fromJson(jsonDecode(response.body));
      return model..message;
    }
  }

  //  GetComputer Project Events responce

  static Future<GetFarmComputerProjectEventsResponse>
      getFarmComputerProjectEvents({required int projectID}) async {
    var url = "$baseURL/$farmComputer/projects/$projectID/events";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print('Farm Computer Project Events response ${response.body}');
    print('Farm Computer Project Events ID ${projectID}');
    print('Farm Computer Projects Events Url ${url}');
    Map map = jsonDecode(response.body);

    if (response.statusCode == 200 && !map.containsKey('error')) {
      GetFarmComputerProjectEventsResponse model =
          GetFarmComputerProjectEventsResponse.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerProjectEventsResponse model =
          GetFarmComputerProjectEventsResponse(
        message: "No data found",
        status: 404,
      );

      return model;
    }
  }

//  Farm Computer Events responce

  static Future<GetFarmComputerEventsListResponse> getFarmComputerEvents(
      {String searchEventName = '',
      String fromDate = '',
      String toDate = '',
      String? month = '',
      String? year = '',
      List<ProjectData>? listofproject = const [],
      List? listofEvents = const [],
      String? sort = ''}) async {
    // var url = "$baseURL/$farmComputer/events";

    var queryParams = '';
    if (searchEventName != '') {
      queryParams = queryParams + "&search_string=$searchEventName";
    }
    if (fromDate != '') {
      queryParams = queryParams + "&start_date=$fromDate";
    }
    if (toDate != '') {
      queryParams = queryParams + "&end_date=$toDate";
    }
    if (sort != '') {
      queryParams = queryParams + "&sort=$sort";
    }
    if (listofproject!.isNotEmpty) {
      String vvv = '';
      listofproject.forEach((element) {
        if (listofproject.last == element) {
          vvv = vvv + '${element.id}';
        } else {
          vvv = vvv + '${element.id},';
        }
      });
      queryParams = queryParams + "&project_ids=$vvv";
    }
    if (listofEvents!.isNotEmpty) {
      String vvv = '';
      listofEvents.forEach((element) {
        if (listofEvents.last == element) {
          vvv = vvv + '${element}';
        } else {
          vvv = vvv + '${element},';
        }
      });
      queryParams = queryParams + "&event_type=$vvv";
    }

    var uri = Uri.parse(
        '$baseURL/$farmComputer/events?${queryParams.trim().isNotEmpty ? queryParams.substring(1) : ''}');
    var response = await http.get(uri, headers: header);
    Map map = jsonDecode(response.body);
    if (response.statusCode == 200 && !map.containsKey('error')) {
      GetFarmComputerEventsListResponse model =
          GetFarmComputerEventsListResponse.fromJson(jsonDecode(response.body));
      for (int i = 0; i < model.data!.length; i++) {
        print("rsvpAnswer=======================${model.data![i].rsvpAnswer}");
        print(" mode=======================${model.data![i].eventMode}");
        print("event id=======================${model.data![i].id}");
        print("event name=======================${model.data![i].name}");
      }

      return model;
    } else {
      GetFarmComputerEventsListResponse model =
          GetFarmComputerEventsListResponse(
              message: "No data found", status: 400, data: []);
      return model;
    }
  }

  /// update farm computer event attendance update (going, not going, maybe)
  static Future updateFarmComputerEventAttendanceUpdateRequest(
      {required int eventID,
      required PutFarmComputerEventAttendanceUpdateRequest requestBody}) async {
    print('Farmcomputer EventID is  ==== ${eventID}');

    var url = "$baseURL/$farmComputer/events/$eventID/attendance_update";
    var uri = Uri.parse(url);
    var response =
        await http.put(uri, headers: header, body: jsonEncode(requestBody));
    log('Farmcomputer update Event Answer Response ==== ${response.body}');
    log('Farmcomputer update Event URL is ==== ${url}');
    if (response.statusCode == 201) {
      GetFarmComputerEventsListResponse model =
          GetFarmComputerEventsListResponse();
      return model;
    } else {
      GetFarmComputerEventsListResponse model =
          GetFarmComputerEventsListResponse();
      return model;
    }
  }

//  GetComputer Contact moment Details responce

  static Future<GetFarmComputerContactMomentDetailsResponce>
      getFarmComputerContactMomentDetail({required int contactMomentId}) async {
    var url = "$baseURL/$farmComputer/contact_moments/$contactMomentId";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print('Farm Computer contact Moments Details response ${response.body}');

    if (response.statusCode == 200) {
      GetFarmComputerContactMomentDetailsResponce model =
          GetFarmComputerContactMomentDetailsResponce.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerContactMomentDetailsResponce model =
          GetFarmComputerContactMomentDetailsResponce.fromJson(
              jsonDecode(response.body));
      return model;
    }
  }

  static Future getFCparcelData() async {
    var url = "$baseURL/$farmComputer/dashboard/parcels";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print('Parcel data responce response ${response.body}');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      GetFarmComputerContactMomentDetailsResponce model =
          GetFarmComputerContactMomentDetailsResponce.fromJson(
              jsonDecode(response.body));
      return null;
    }
  }

//  Farm Computer Events file responce

  static Future<GetFarmComputerEventsFileResponse> getFarmComputerEventsFile(
      {required int eventsId}) async {
    var url = "$baseURL/$farmComputer/events/$eventsId";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print('Farm Computer Events file response ${response.body}');
    print('Farm Computer Events file Url ${url}');
    print('Farm Computer Events fileId==== ${eventsId}');

    if (response.statusCode == 200) {
      GetFarmComputerEventsFileResponse model =
          GetFarmComputerEventsFileResponse.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerEventsFileResponse model =
          GetFarmComputerEventsFileResponse.fromJson(jsonDecode(response.body));
      return model;
    }
  }

//  Farm Computer Events file Media responce

  static Future<GetFarmComputerEventsFileMediaResponse>
      getFarmComputerEventsFileMedia({required int eventsId}) async {
    var url = "$baseURL/$farmComputer/events/$eventsId/files";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print(
        'Farm Computer Events file Media response  ========== ${response.body}');
    print('Farm Computer Events file Media Url  ============ ${url}');
    print('Farm Computer Events file Media    ==== ${eventsId}');
    if (response.statusCode == 200) {
      GetFarmComputerEventsFileMediaResponse model =
          GetFarmComputerEventsFileMediaResponse.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerEventsFileMediaResponse model =
          GetFarmComputerEventsFileMediaResponse.fromJson(
              jsonDecode(response.body));
      return model;
    }
  }

//  Farm Computer Events Participating responce

  static Future<GetFarmComputerEventParticipatingResponse>
      getFarmComputerEventParticipating({required int participatingId}) async {
    var url = "$baseURL/$farmComputer/events/$participatingId/guests";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print(
        'Farm Computer Events Participating response  ========== ${response.body}');
    print('Farm Computer Events Participating Url  ============ ${url}');
    print('Farm Computer Events Participating Id   ==== ${participatingId}');
    if (response.statusCode == 200) {
      GetFarmComputerEventParticipatingResponse model =
          GetFarmComputerEventParticipatingResponse.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerEventParticipatingResponse model =
          GetFarmComputerEventParticipatingResponse.fromJson(
              jsonDecode(response.body));
      return model;
    }
  }

//  Farm Computer Events Id responce

  static Future<GetFarmComputerEventsIdResponse> getFarmComputerEventsId(
      {required int eventsId}) async {
    var url = "$baseURL/$farmComputer/events/$eventsId";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print('Farm Computer Events Id response ${response.body}');
    print('Farm Computer Events Id Url ${url}');
    print('Farm Computer Events EventsID==== ${eventsId}');

    if (response.statusCode == 200) {
      GetFarmComputerEventsIdResponse model =
          GetFarmComputerEventsIdResponse.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerEventsIdResponse model =
          GetFarmComputerEventsIdResponse.fromJson(jsonDecode(response.body));
      return model;
    }
  }

// /// Get Farm Computer My project file responce

  static Future<GetFarmComputerMyProjectFileResponse>
      getFarmComputerMyProjectFileId({required int projectId}) async {
    var url = "$baseURL/$farmComputer/projects/$projectId/my_project_files";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print('Farm Computer My Project Id response ${response.body}');
    print('Farm Computer My Project file Id Url ${url}');
    print('Farm Computer My ProjectID==== ${projectId}');

    if (response.statusCode == 200) {
      GetFarmComputerMyProjectFileResponse model =
          GetFarmComputerMyProjectFileResponse.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerMyProjectFileResponse model =
          GetFarmComputerMyProjectFileResponse.fromJson(
              jsonDecode(response.body));
      return model;
    }
  }

// /// Get Farm Computer My project file WijLand Book Mark response
  static Future<GetFarmComputerMyProjectFileResponse>
      getMyProjectFileWijLandBookMark({required int projectId}) async {
    var url =
        "$baseURL/$farmComputer/projects/$projectId/my_project_files?wij_land_bookmark=yes";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print('Farm Computer Wijland book mark response ${response.body}');
    print('Farm Computer Wijland book mark Url ${url}');
    print('Farm Computer My ProjectID==== ${projectId}');

    if (response.statusCode == 200) {
      GetFarmComputerMyProjectFileResponse model =
          GetFarmComputerMyProjectFileResponse.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerMyProjectFileResponse model =
          GetFarmComputerMyProjectFileResponse.fromJson(
              jsonDecode(response.body));
      return model;
    }
  }

// /// Get Farm Computer project file response

  static Future<GetFarmComputerProjectFilesResponse>
      getFarmComputerProjectFileId({required int projectId}) async {
    var url = "$baseURL/$farmComputer/projects/$projectId/project_files";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print('Farm Computer Project file Id response ${response.body}');
    print('Farm Computer Project file Id Url ${url}');
    print('Farm Computer ProjectFileID==== ${projectId}');

    if (response.statusCode == 200) {
      GetFarmComputerProjectFilesResponse model =
          GetFarmComputerProjectFilesResponse.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerProjectFilesResponse model =
          GetFarmComputerProjectFilesResponse.fromJson(
              jsonDecode(response.body));
      return model;
    }
  }

  /// Get fc project file wijLand Book marks response

  static Future<GetFarmComputerProjectFilesResponse>
      getFCProjectFileWijLandBookmarksId({required int projectId}) async {
    var url =
        "$baseURL/$farmComputer/projects/$projectId/project_files?wij_land_bookmark=yes";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print('FC Project File WijLand Bookmarks Id response ${response.body}');
    print('FC Project File WijLand Bookmarks Id Url ${url}');
    print('FC Project File WijLand Bookmarks Id==== ${projectId}');

    if (response.statusCode == 200) {
      GetFarmComputerProjectFilesResponse model =
          GetFarmComputerProjectFilesResponse.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerProjectFilesResponse model =
          GetFarmComputerProjectFilesResponse.fromJson(
              jsonDecode(response.body));
      return model;
    }
  }

  /// Getfc project file Book marks responce

  static Future<GetFarmComputerProjectFilesResponse>
      getFCProjectFileBookmarksId({required int projectId}) async {
    var url =
        "$baseURL/$farmComputer/projects/$projectId/project_files?favourite=yes";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print('FC Project File Bookmarks Id response ${response.body}');
    print('FC Project File Bookmarks Id Url ${url}');
    print('FC Project File Bookmarks Id==== ${projectId}');

    if (response.statusCode == 200) {
      GetFarmComputerProjectFilesResponse model =
          GetFarmComputerProjectFilesResponse.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerProjectFilesResponse model =
          GetFarmComputerProjectFilesResponse.fromJson(
              jsonDecode(response.body));
      return model;
    }
  }

  /// Getfc project My Bookmarks file response

  static Future<GetFarmComputerMyProjectFileResponse>
      getFCProjectMyBookmarksFileId({required int projectId}) async {
    var url =
        "$baseURL/$farmComputer/projects/$projectId/my_project_files?favourite=yes";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print('FC Project My Bookmarks file  response ${response.body}');
    print('FC Project My Bookmarks file Id Url $url');
    print('FC Project My Bookmarks file Id==== $projectId');

    if (response.statusCode == 200) {
      GetFarmComputerMyProjectFileResponse model =
          GetFarmComputerMyProjectFileResponse.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerMyProjectFileResponse model =
          GetFarmComputerMyProjectFileResponse.fromJson(
              jsonDecode(response.body));
      return model;
    }
  }

  /// Get fc project My Contract file response

  static Future<GetFarmComputerMyProjectFileResponse>
      getFCProjectMyContractsFileId({required int projectId}) async {
    var url = "$baseURL/$farmComputer/project/$projectId/my_contract_files";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print('FC Project File Bookmarks Id response ${response.body}');
    print('FC Project File Bookmarks Id Url ${url}');
    print('FC Project File Bookmarks Id==== ${projectId}');

    if (response.statusCode == 200) {
      GetFarmComputerMyProjectFileResponse model =
          GetFarmComputerMyProjectFileResponse.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerMyProjectFileResponse model =
          GetFarmComputerMyProjectFileResponse.fromJson(
              jsonDecode(response.body));
      return model;
    }
  }

  /// Get Farm computer  project  Contract file response

  static Future<GetFarmComputerProjectFilesResponse> getFCProjectContractsFile(
      {required int projectId}) async {
    var url =
        "$baseURL/$farmComputer/project/$projectId/project_contract_files";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print('FC Project contract_files  response ${response.body}');
    print('FC Project contract_files Id Url $url');
    print('FC Project contract_files Id==== $projectId');

    if (response.statusCode == 200) {
      GetFarmComputerProjectFilesResponse model =
          GetFarmComputerProjectFilesResponse.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerProjectFilesResponse model =
          GetFarmComputerProjectFilesResponse.fromJson(
              jsonDecode(response.body));
      return model;
    }
  }

  ///Get FarmComputer ContactMoments Response

  ///GetFramComputerContactMomentsResponce
  static Future<GetFarmComputerContactMomentsResponse>
      getFarmComputerContactMoments(
          {String searchContactName = '',
          String fromDate = '',
          String toDate = '',
          String? month = '',
          String? year = '',
          List<ProjectData>? listofProject = const [],
          List listofContactType = const [],
          String? sort = ''}) async {
    var queryParams = '';
    if (searchContactName != '') {
      queryParams = queryParams + "&search_string=$searchContactName";
    }
    if (fromDate != '') {
      queryParams = queryParams + "&start_date=$fromDate";
    }
    if (toDate != '') {
      queryParams = queryParams + "&end_date=$toDate";
    }
    if (sort != '') {
      queryParams = queryParams + "&sort=$sort";
    }
    if (listofProject!.isNotEmpty) {
      String vvv = '';
      listofProject.forEach((element) {
        if (listofProject.last == element) {
          vvv = vvv + '${element.id}';
        } else {
          vvv = vvv + '${element.id},';
        }
      });
      queryParams = queryParams + "&project_ids=$vvv";
    }
    if (listofContactType.isNotEmpty) {
      String vvv = '';
      listofContactType.forEach((element) {
        if (listofContactType.last == element) {
          vvv = vvv + '${element}';
        } else {
          vvv = vvv + '${element},';
        }
      });
      queryParams = queryParams + "&type=$vvv";
    }

    var uri = Uri.parse(
        "$baseURL/$farmComputer/contact_moments?${queryParams.trim().isNotEmpty ? queryParams.substring(1) : ''}");
    var response = await http.get(uri, headers: header);
    print('Farm Computer contact Moments response ${response.body}');
    Map map = jsonDecode(response.body);
    if (response.statusCode == 200 && !map.containsKey('error')) {
      GetFarmComputerContactMomentsResponse model =
          GetFarmComputerContactMomentsResponse.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerContactMomentsResponse model =
          GetFarmComputerContactMomentsResponse(
              message: "No data found", status: 400, data: []);
      return model;
    }
  }

// /// Get Farm Computer project Contact moments responce

  static Future<GetFarmProjectContactMomentsResponse>
      getFarmProjectContactMomentprojectId({
    required int projectId,
    String searchContactName = '',
    String fromDate = '',
    String toDate = '',
    String? month = '',
    String? year = '',
    List<ProjectData>? listofProject = const [],
    List? listofContactType = const [],
    String? sort = '',
  }) async {
    var queryParams = '';
    if (searchContactName != '') {
      queryParams = queryParams + "&search_string=$searchContactName";
    }
    if (fromDate != '') {
      queryParams = queryParams + "&start_date=$fromDate";
    }
    if (toDate != '') {
      queryParams = queryParams + "&end_date=$toDate";
    }
    if (sort != '') {
      queryParams = queryParams + "&sort=$sort";
    }
    if (listofProject!.isNotEmpty) {
      String vvv = '';
      listofProject.forEach((element) {
        if (listofProject.last == element) {
          vvv = vvv + '${element.id}';
        } else {
          vvv = vvv + '${element.id},';
        }
      });
      queryParams = queryParams + "&project_ids=$vvv";
    }
    if (listofContactType!.isNotEmpty) {
      String vvv = '';
      listofContactType.forEach((element) {
        if (listofContactType.last == element) {
          vvv = vvv + '${element}';
        } else {
          vvv = vvv + '${element},';
        }
      });
      queryParams = queryParams + "&type=$vvv";
    }

    var uri = Uri.parse(
        "$baseURL/$farmComputer/projects/$projectId/contact_moments?${queryParams.trim().isNotEmpty ? queryParams.substring(1) : ''}");

    var response = await http.get(uri, headers: header);

    Map map = jsonDecode(response.body);

    if (response.statusCode == 200 && !map.containsKey('error')) {
      GetFarmProjectContactMomentsResponse model =
          GetFarmProjectContactMomentsResponse.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      GetFarmProjectContactMomentsResponse model =
          GetFarmProjectContactMomentsResponse.fromJson(
              jsonDecode(response.body));
      return model;
    }
  }

// /////////Get Farm Computer File Responce

  static Future<GetFarmComputerFilesResponse> getFarmComputerFiles({
    String? value,
    String? mSearchString,
    String fromDate = '',
    String toDate = '',
  }) async {
    if (value == null) {
      var url = "$baseURL/$farmComputer/files";
      var uri = Uri.parse(url);
      var response = await http.get(uri, headers: header);
      print('Farm Computer files response ${response.body}');
      print('Farm Computer files Url ${url}');

      if (response.statusCode == 200) {
        GetFarmComputerFilesResponse model =
            GetFarmComputerFilesResponse.fromJson(jsonDecode(response.body));
        return model;
      } else {
        GetFarmComputerFilesResponse model =
            GetFarmComputerFilesResponse.fromJson(jsonDecode(response.body));
        return model;
      }
    } else {
      var url = "$baseURL/$farmComputer/files?project_ids=$value";
      var uri = Uri.parse(url);
      var response = await http.get(uri, headers: header);
      print('Farm Computer files response by projID${response.body}');
      print('Farm Computer files Url ${url}');

      if (response.statusCode == 200) {
        GetFarmComputerFilesResponse model =
            GetFarmComputerFilesResponse.fromJson(jsonDecode(response.body));
        return model;
      } else {
        GetFarmComputerFilesResponse model =
            GetFarmComputerFilesResponse.fromJson(jsonDecode(response.body));
        return model;
      }
    }
  }

// /// Get Farm Computer bookMark file responce

  static Future getFarmComputerBookmarkFile() async {
    var url = "$baseURL/$farmComputer/book_mark/files";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print('Farm Computer bookMark  response ${response.body}');
    print('Farm Computer bookMark file  Url ${url}');

    if (response.statusCode == 200) {
      GetFarmComputerMyProjectFileResponse model =
          GetFarmComputerMyProjectFileResponse.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerMyProjectFileResponse model =
          GetFarmComputerMyProjectFileResponse.fromJson(
              jsonDecode(response.body));
      return model;
    }
  }

///////////////////// Post Method ////////////////////////////////////////////////
  static Future<FileUploadResponse> uploadFarmerFile(PlatformFile file) async {
    var url = "$baseURL/file-upload";

    http.MultipartRequest request = http.MultipartRequest(
      "POST",
      Uri.parse(url),
    );
    request.headers['Authorization'] =
        'Bearer ${authController.myUser.value.token!}';

    request.files.add(
        http.MultipartFile.fromBytes('file', file.bytes!, filename: file.name));
    log("Start uploading");
    var result;
    //-------Send request
    await request.send().then((value) async {
      //------Read response
      result = await value.stream.bytesToString();
    });
    var response = jsonDecode(result);

    if (response["status"] == 200) {
      log('Success Status  => ${response["status"]}');
      FileUploadResponse model = FileUploadResponse.fromJson(
        jsonDecode(result),
      );
      return model;
    } else {
      FileUploadResponse model = FileUploadResponse();
      return model..message = 'data not found';
    }
  }

  //////////////post Farm computer Parcels /////////////
  static Future<PostFarmComputerParcelsRequest> creatFarmComputerParcel(
      PostFarmComputerParcelsRequest request) async {
    var url = "$baseURL/$farmComputer/parcels";
    var uri = Uri.parse(url);
    var response = await http.post(uri,
        headers: header, body: jsonEncode(request.toJson()));
    log('Request parcels   => ${request.toJson().values}');
    log('Create parcels   => ${response.body}');
//need to set model here
    if (response.statusCode == 200) {
      PostFarmComputerParcelsRequest model = PostFarmComputerParcelsRequest();
      return model;
    } else {
      PostFarmComputerParcelsRequest model = PostFarmComputerParcelsRequest();
      return model;
    }
  }

  Future postFeedback(Map map) async {
    var url = "$baseURL/farm/feedbacks";
    var uri = Uri.parse(url);
    var response = await http.post(uri, headers: header, body: jsonEncode(map));
    print('Create feedback   => ${response.body}');
//need to set model here
    if (response.statusCode == 200) {
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }

//////////////////////updae farm computer parcels////////////////////
  static Future updateFarmComputerParcelData(
      {required int parcelID,
      required PutFarmComputerParcelsRequest requestBody}) async {
    print('Farmcomputer parcelID is  ==== ${parcelID}');

    var url = "$baseURL/$farmComputer/parcels/$parcelID";
    var uri = Uri.parse(url);
    var response =
        await http.put(uri, headers: header, body: jsonEncode(requestBody));
    log('Farmcomputer update  Response ==== ${response.body}');
    print('Farmcomputer update  Response body ==== ${requestBody.toJson()}');
    if (response.statusCode == 201) {
      GetFarmComputerParcelsResponse model = GetFarmComputerParcelsResponse();
      return model;
    } else {
      GetFarmComputerParcelsResponse model = GetFarmComputerParcelsResponse();
      return model;
    }
  }

  /// UPDATE BASIC INFO DASHBOARD
  static Future updateFCBasicInfo({required PutFCBasicInfo requestBody}) async {
    var url = "$baseURL/$farmComputer/dashboard/update_basic_info";
    var uri = Uri.parse(url);
    var response =
        await http.put(uri, headers: header, body: jsonEncode(requestBody));

    if (response.statusCode == 200) {
      return true;
    } else {
      return response.statusCode;
    }
  }

  ///// POST FARM COMPUTER PROJECT ACTION /////////
///////////////////// Post Method/////////////////
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
///// POST FARM COMPUTER PROJECT ACTION
  static Future<FarmComputersProjectDetailResponseModel>
      addFarmComputerProjectActions(
          {required int farmID,
          required int projectID,
          required String actionName,
          PostFarmComputerProjectActionsRequest? request}) async {
    var url = "$baseURL/$farmComputer/$farmID/projects/$projectID/$actionName";
    var uri = Uri.parse(url);
    print('data    => ${jsonEncode(request!.toJson())}');
    var response = await http.post(uri,
        headers: header, body: jsonEncode(request.toJson()));
    log(" data for response is ===== $response");

    if (response.statusCode == 200) {
      FarmComputersProjectDetailResponseModel model =
          FarmComputersProjectDetailResponseModel.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      FarmComputersProjectDetailResponseModel model =
          FarmComputersProjectDetailResponseModel.fromJson(
              jsonDecode(response.body));
      return model;
    }
  }

  static Future<FarmComputersProjectsResponseModel> getFarmComputerProjects({
    required String searchString,
    required String status,
  }) async {
    var url =
        "$baseURL/$farmComputer/projects?search_string=$searchString&status=$status";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    print('FARM COMPUTER Projects response   ${response.body}');

    if (response.statusCode == 200) {
      FarmComputersProjectsResponseModel model =
          FarmComputersProjectsResponseModel.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      FarmComputersProjectsResponseModel model =
          FarmComputersProjectsResponseModel(
              message: "No Data Found", status: 400, data: []);
      return model;
    }
  }

  static Future<FarmComputersProjectDetailResponseModel>
      getFarmComputerProjectDetails({
    required int id,
  }) async {
    var url = "$baseURL/$farmComputer/projects/$id";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    if (response.statusCode == 200) {
      FarmComputersProjectDetailResponseModel model =
          FarmComputersProjectDetailResponseModel.fromJson(
              jsonDecode(response.body));
      print("Response before : ${jsonDecode(response.body)}");
      print("Response after : ${model.toJson()}");
      return model;
    } else {
      FarmComputersProjectDetailResponseModel model =
          FarmComputersProjectDetailResponseModel.fromJson(
              jsonDecode(response.body));
      return model;
    }
  }

  //GET FARM COMPUTER PARCEl METHOD //

  static Future<GetFarmComputerProjectParcelsResponse>
      getFarmComputerProjectParcelsData({
    required int id,
  }) async {
    var url = "$baseURL/$farmComputer/projects/$id/project_parcels";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    print('FARM COMPUTER Project Parcels response  = ${response.body}');

    if (response.statusCode == 200) {
      GetFarmComputerProjectParcelsResponse model =
          GetFarmComputerProjectParcelsResponse.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerProjectParcelsResponse model =
          GetFarmComputerProjectParcelsResponse(statusCode: 404);
      return model;
    }
  }

  //GET FARM COMPUTER PARCEl METHOD //

  static Future<FarmComputersProjectDetailResponseModel> updateProjectInterest(
      {required int id, required String interestStatus}) async {
    var url = "$baseURL/$farmComputer/projects/$id";
    var uri = Uri.parse(url);
    var response = await http.put(
      uri,
      headers: header,
      body: jsonEncode(
        {
          "project_interest_status": [
            interestStatus,
          ]
        },
      ),
    );

    print('FARM COMPUTER Project Details response   ${response.body}');

    if (response.statusCode == 200) {
      FarmComputersProjectDetailResponseModel model =
          FarmComputersProjectDetailResponseModel.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      FarmComputersProjectDetailResponseModel model =
          FarmComputersProjectDetailResponseModel.fromJson(
              jsonDecode(response.body));
      return model;
    }
  }

  //* PERSON PROFILE API CALLS STARTS *//

  static Future<PersonProfileDetailResponseModel> getPersonProfileDetail(
      {required int id}) async {
    var url = "$baseURL/persons/$id";
    print('URL : $url');
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    print('Person Detail Response : ${response.body}');

    if (response.statusCode == 200) {
      PersonProfileDetailResponseModel model =
          PersonProfileDetailResponseModel.fromJson(jsonDecode(response.body));
      return model;
    } else {
      PersonProfileDetailResponseModel model =
          PersonProfileDetailResponseModel.fromJson(jsonDecode(response.body));
      return model;
    }
  }

  static Future<PersonProfileUpdateResponseModel> personProfileUpdate({
    required PersonProfileUpdateRequestModel model,
    required int id,
  }) async {
    var url = "$baseURL/persons/$id";
    print("Update URL : $url");
    var uri = Uri.parse(url);
    var response = await http.put(
      uri,
      headers: header,
      body: jsonEncode(model),
    );

    print('Person Update Response : ${response.body}');

    if (response.statusCode == 200) {
      PersonProfileUpdateResponseModel model =
          PersonProfileUpdateResponseModel.fromJson(jsonDecode(response.body));
      return model;
    } else {
      PersonProfileUpdateResponseModel model =
          PersonProfileUpdateResponseModel.fromJson(jsonDecode(response.body));
      return model;
    }
  }

  //* PERSON PROFILE API CALLS ENDS *//

  //* DATA OVERVIEW API CALLS STARTS *//

  static dynamic getDataOverViewByComponent(
      {required String mComponentName}) async {
    var url = "$baseURL/$farmComputer/data_overview/$mComponentName";
    var uri = Uri.parse(url);
    var response = await http.get(
      uri,
      headers: header,
    );

//    print('DATA OVERVIEW RESPONSE : ${response.body}');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

//// put Farm computer  Files/ Favourites
  static Future updateMyProjectFavouriteId(
      {required int fileId, required bool favourites}) async {
    var url = "$baseURL/$farmComputer/files/$fileId/favourites";
    var uri = Uri.parse(url);
    var response = await http.put(uri,
        headers: header, body: jsonEncode({"is_favourite": favourites}));
    print("favourites response ======${response.body}");
    print("favourites response url ======$url");
    if (response.statusCode == 200) {
      return "Success";
    } else {
      return response.statusCode.toString();
    }
  }

  ///Get Farm Computer Members Response Model
  ///
  ///
  ///
  static Future<GetFarmComputerMembersResponseModel>
      getFarmComputerMemberData() async {
    var uri = Uri.parse("$baseURL/$farmComputer/members");
    var response = await http.get(uri, headers: header);
    print('Farm Computer members response ${response.body}');
    Map map = jsonDecode(response.body);
    if (response.statusCode == 200 && !map.containsKey('error')) {
      GetFarmComputerMembersResponseModel model =
          GetFarmComputerMembersResponseModel.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      GetFarmComputerMembersResponseModel model =
          GetFarmComputerMembersResponseModel(
              message: "No data found", status: 400, data: []);
      return model;
    }
  }

  ///
  ///
  ///
  ///
//* DATA OVERVIEW API CALLS STARTS *//

//* Privacy Settings Get Request
  static Future<PrivacySettingsResponseModel>
      getFarmComputerPrivacySettings() async {
    var url = "$baseURL/$farmComputer/settings/privacy";
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    if (response.statusCode == 200) {
      PrivacySettingsResponseModel model =
          PrivacySettingsResponseModel.fromJson(
        jsonDecode(response.body),
      );

      return model;
    } else {
      PrivacySettingsResponseModel model =
          PrivacySettingsResponseModel.fromJson(
        jsonDecode(response.body),
      );
      return model;
    }
  }

  static Future<PrivacySettingsUpdateResponse>
      updateFarmComputerPrivacySettings({
    required bool isPublic,
  }) async {
    var url = "$baseURL/$farmComputer/settings/privacy";
    var uri = Uri.parse(url);
    var body = {"check_public": isPublic};
    var response = await http.put(
      uri,
      headers: header,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      PrivacySettingsUpdateResponse model =
          PrivacySettingsUpdateResponse.fromJson(
        jsonDecode(response.body),
      );

      return model;
    } else {
      PrivacySettingsUpdateResponse model =
          PrivacySettingsUpdateResponse.fromJson(
        jsonDecode(response.body),
      );
      return model;
    }
  }

  static Future<DataOverviewFarmHistory> getFarmComputerDataOverviewHistory({
    required String keyName,
  }) async {
    var url = "$baseURL/$farmComputer/data_overview/history/$keyName";
    var uri = Uri.parse(url);
    var response = await http.get(
      uri,
      headers: header,
    );

    if (response.statusCode == 200) {
      DataOverviewFarmHistory model = DataOverviewFarmHistory.fromJson(
        jsonDecode(response.body),
      );

      return model;
    } else {
      DataOverviewFarmHistory model = DataOverviewFarmHistory.fromJson(
        jsonDecode(response.body),
      );
      return model;
    }
  }

  static dynamic updateDataOverViewRecords(
      {required Map<String, dynamic> requestObject}) async {
    var url = "$baseURL/farm/data_overview";
    var uri = Uri.parse(url);
    var response = await http.post(
      uri,
      headers: header,
      body: jsonEncode(requestObject),
    );

//    print('DATA OVERVIEW RESPONSE : ${response.body}');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

// static Future<FarmComputersProjectsResponseModel> getFarmComputerPermissions({
//   required String searchString,
//   required String status,
// }) async {
//   var url =/api/farm_computer/permissions?status=active_requests
//       "$baseURL/$farmComputer/permissions?status=active_requests";
//   var uri = Uri.parse(url);
//   var response = await http.get(uri, headers: header);

//   print('FARM COMPUTER Projects response   ${response.body}');

//   if (response.statusCode == 200) {
//     FarmComputersProjectsResponseModel model =
//         FarmComputersProjectsResponseModel.fromJson(
//             jsonDecode(response.body));
//     return model;
//   } else {
//     FarmComputersProjectsResponseModel model =
//         FarmComputersProjectsResponseModel(
//             message: "No Data Found", status: 400, data: []);
//     return model;
//   }
// }

  /// Permissions Module Api Calls
  /// All permissions requests api call method
  static Future<PermissionsRequestsModel> fetchAllPermissionsRequests({
    String? mSearchText,
    required String mFilters,
    String? mOrganizationsIds,
    String? mProjectsIds,
    required String mStatus,
  }) async {
    var url = "$baseURL/$farmComputer/permissions?filter=$mFilters";
    if (mSearchText!.isNotEmpty) {
      url = url + "&search_string=$mSearchText";
    }

    if (mOrganizationsIds!.isNotEmpty) {
      url = url + "&organization_ids=$mOrganizationsIds";
    }

    if (mProjectsIds!.isNotEmpty) {
      url = url + "&project_ids=$mProjectsIds";
    }

    if (mStatus != "Select") {
      url = url + "&request_status=$mStatus";
    }

    print("URL = $url");

    final response = await http.get(Uri.parse(url), headers: header);
    log("Permissions Api response = ${jsonDecode(response.body)}");

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      PermissionsRequestsModel model = PermissionsRequestsModel.fromJson(
        jsonDecode(response.body),
      );
      return model;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      PermissionsRequestsModel model = PermissionsRequestsModel(
        status: 404,
        message: "Failed to load permissions requests",
      );
      return model;
    }
  }

  /// Permission Detail requests api call method
  static Future<PermissionDetailModel> fetchPermissionDetail({
    required String mRequestId,
  }) async {
    var response = await http.get(
      Uri.parse("$baseURL/$farmComputer/permissions/$mRequestId"),
      headers: header,
    );

    print("API Response : ${jsonDecode(response.body)}");
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      PermissionDetailModel model = PermissionDetailModel.fromJson(
        jsonDecode(response.body),
      );
      return model;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      PermissionDetailModel model = PermissionDetailModel(
        status: 404,
        message: "Failed to load permission detail",
      );
      return model;
    }
  }

  /// Permission request Status update api call method
  static Future<RequestStatusUpdateModel> updatePermissionStatus({
    required String mRequestId,
    required String status,
  }) async {
    var response = await http.post(
      Uri.parse(
          "$baseURL/$farmComputer/permissions/$mRequestId?status=$status"),
      headers: header,
    );

    print(
        "API URL : ${"$baseURL/$farmComputer/permissions/$mRequestId?status=$status"}");
    print("Response : ${response.body}");
    var data = jsonDecode(response.body);
    if (data["status"] == 200) {
      print("Coming here");
      RequestStatusUpdateModel model = RequestStatusUpdateModel(
          data: [], status: 200, message: "Request updated successfully.");
      return model;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      RequestStatusUpdateModel model = RequestStatusUpdateModel(
        status: 404,
        message: "Failed to load permission detail",
      );
      return model;
    }
  }

  /// Permission request Status update api call method
  static Future<RequestStatusUpdateModel> updatePermissionProperties({
    required String mRequestId,
    required dynamic status,
    required String feedback,
    required String property,
  }) async {
    var response = await http.post(
        Uri.parse(
            "$baseURL/$farmComputer/permissions/$mRequestId/manage-properties"),
        headers: header,
        body: jsonEncode({
          "approval_status": status.toString(),
          "feedback_message": feedback,
          "property": property
        }));

    if (response.statusCode == 200) {
      RequestStatusUpdateModel model = RequestStatusUpdateModel.fromJson(
        jsonDecode(response.body),
      );
      showAnacdotsToast("Successfully added your response");
      return model;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      RequestStatusUpdateModel model = RequestStatusUpdateModel(
        status: 404,
        message: "Failed to load permission detail",
      );
      return model;
    }
  }
}
