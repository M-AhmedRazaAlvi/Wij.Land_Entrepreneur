import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:wij_land/models/entrepreneur/request/post_entrepreneur_contact_moment_request.dart';
import 'package:wij_land/models/entrepreneur/request/post_entrepreneur_contact_subject_request.dart';
import 'package:wij_land/models/entrepreneur/request/post_entrepreneur_person_request.dart';
import 'package:wij_land/models/entrepreneur/request/post_entrepreneur_request.dart';
import 'package:wij_land/models/entrepreneur/request/post_entrepreneur_supplier_request.dart';
import 'package:wij_land/models/entrepreneur/request/post_entrepreneur_task_request.dart';
import 'package:wij_land/models/entrepreneur/request/put_enterpreneur_person_request.dart';
import 'package:wij_land/models/entrepreneur/request/put_entrepreneur_supplier_request.dart';
import 'package:wij_land/models/entrepreneur/request/update_person_of_entrepreneur_request.dart';
import 'package:wij_land/models/entrepreneur/response/delete_entrepreneur_response.dart';
import 'package:wij_land/models/entrepreneur/response/delete_entrepreneur_supplier_resoponce.dart';
import 'package:wij_land/models/entrepreneur/response/farm_supplier_response.dart';
import 'package:wij_land/models/entrepreneur/response/get_entrepreneur_contact_moment_response.dart';
import 'package:wij_land/models/entrepreneur/response/get_entrepreneur_detail_response.dart';
import 'package:wij_land/models/entrepreneur/response/get_entrepreneur_overview.dart';
import 'package:wij_land/models/entrepreneur/response/get_entrepreneur_response.dart';
import 'package:wij_land/models/entrepreneur/response/get_entrepreneur_supplier_response.dart';
import 'package:wij_land/models/entrepreneur/response/post_entrepreneur_contact_moment_response.dart';
import 'package:wij_land/models/entrepreneur/response/post_entrepreneur_person_response.dart';
import 'package:wij_land/models/entrepreneur/response/post_entrepreneur_response.dart';
import 'package:wij_land/models/entrepreneur/response/post_entrepreneur_suppliers_response.dart';
import 'package:wij_land/models/entrepreneur/response/post_entrepreneur_task_reponse.dart';
import 'package:wij_land/models/entrepreneur/response/put_entrepreneur_person_response.dart';
import 'package:wij_land/models/entrepreneur/response/put_entrepreneure_supplier_response.dart';
import 'package:wij_land/models/entrepreneur/response/update_contact_moment_of_entrepreneur_response.dart';

import '../anacdots_mobile/app_common_widgets/ancadots_toast_widget.dart';
import '../models/entrepreneur/request/put_entrepreneur_supplier_bulk_request.dart';
import '../models/entrepreneur/response/contact_moment_subject_update_response.dart';
import '../models/entrepreneur/response/delete_entrepreneur_retailer_reponse.dart';
import '../models/entrepreneur/response/get_entrepreneur_retailer_response.dart';
import '../models/file_upload/response/file_upload_response.dart';
import '../models/user/forgot_password_response.dart';
import 'BaseClass.dart';

class EntrepreneurClients {
  static String entrepreneurs = 'entrepreneurs';

  // static var header = {"Authorization": "Bearer ${authController.myUser.value.token!}", "Content-type": "application/json"};
  static String retailers = 'retailers';

  /// * GET METHODS *///
  static Future<GetEntrepreneurResponse> getEntrepreneur({
    String? mSearchString = '',
    List<String>? mConnectionType,
    List<String>? mFocusType,
    String? mSuppliers = '',
    String? mSellingLocations = '',
  }) async {
    String queryParams = "";
    if (mSearchString != '') {
      queryParams = "search_string=$mSearchString";
    }
    if (mConnectionType!.isNotEmpty) {
      String vvv = '';
      mConnectionType.forEach((element) {
        vvv = vvv + '$element,';
      });
      queryParams = queryParams + "&connection_type=$vvv";
    }
    if (mFocusType!.isNotEmpty) {
      String vvv = '';
      mFocusType.forEach((element) {
        vvv = vvv + '$element,';
      });
      queryParams = queryParams + "&focus_type=$vvv";
    }
    if (mSuppliers != '') {
      queryParams = queryParams + "&suppliers=$mSuppliers";
    }
    if (mSellingLocations != '') {
      queryParams = queryParams + "&selling_locations=$mSellingLocations";
    }

    var url = "$baseURL/entrepreneurs?$queryParams";

    print("URL : $url");
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print('Entrepreneur Response = ${response.body}');
    if (response.statusCode == 200) {
      GetEntrepreneurResponse model =
          GetEntrepreneurResponse.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetEntrepreneurResponse model = GetEntrepreneurResponse(
          status: 404, data: [], message: 'No data found'.tr());
      return model..message = 'data not found'.tr();
    }
  }

  static Future<ForgotPasswordResponse> forgotPassword(String email) async {
    print(
        "Forgot password Response : ${Uri.parse('$baseURL/forgot-password?email=$email')}");

    final response =
        await http.post(Uri.parse('$baseURL/forgot-password?email=$email'));
    print("Forgot password Response : ${response.body}");

    if (response.statusCode == 200) {
      ForgotPasswordResponse model =
          ForgotPasswordResponse.fromJson(jsonDecode(response.body));

      showAnacdotsToast(
          "Confirmation Email has been sent on your email address, Kindly check your inbox");

      return model;
    } else {
      ForgotPasswordResponse model =
          ForgotPasswordResponse.fromJson(jsonDecode(response.body));
      showAnacdotsToast(" ${model.error!.status} ${model.error!.message}");

      return model;
    }
  }

  static Future<GetFarmSupplierResponse> getFarmSupplierData(
      {String? searchQuote, String? from, String? to}) async {
    var url = '';
    var uri = Uri();
    if (from == null && to == null && searchQuote == null) {
      url = "$baseURL/$entrepreneurs/suppliers/organizations";
    } else if (searchQuote == null) {
      url =
          "$baseURL/$entrepreneurs/suppliers/organizations?start_range=$from&end_range=$to";
    } else {
      url =
          "$baseURL/$entrepreneurs/suppliers/organizations?search_string=$searchQuote";
    }
    uri = Uri.parse(url);

    var response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      GetFarmSupplierResponse model =
          GetFarmSupplierResponse.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetFarmSupplierResponse model =
          GetFarmSupplierResponse.fromJson(jsonDecode(response.body));
      return model;
    }
  }

  static Future<GetEntrepreneurDetailsResponse> getEntrepreneurDetailData(
      {required int mEntrepreneurID}) async {
    var url = "$baseURL/$entrepreneurs/$mEntrepreneurID";

    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print(' Entrepreneur Details Data = ${response.body}');
    print('response = ${url}');
    if (response.statusCode == 200) {
      GetEntrepreneurDetailsResponse model =
          GetEntrepreneurDetailsResponse.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetEntrepreneurDetailsResponse model = GetEntrepreneurDetailsResponse();
      return model..message = 'data not found'.tr();
    }
  }

  static Future<GetEntrepreneurContactMomentResponse>
      getEntrepreneurContactMomentsData(
    int mEntrepreneurID, {
    required String mSearchString,
    required String mFromDate,
    required String mToDate,
    required String mContactMomentType,
  }) async {
    var url =
        "$baseURL/entrepreneurs/$mEntrepreneurID/contact_moments?search_string=$mSearchString&from=$mFromDate&to=$mToDate&contact_moment_type=$mContactMomentType";

    var uri = Uri.parse(url);
    print("URL : $url");
    var response = await http.get(uri, headers: header);
    print('Contact moment data = ${response.statusCode}');
    if (response.statusCode == 200) {
      GetEntrepreneurContactMomentResponse model =
          GetEntrepreneurContactMomentResponse.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      GetEntrepreneurContactMomentResponse model =
          GetEntrepreneurContactMomentResponse();
      return model..message = 'data not found'.tr();
    }
  }

  static Future<GetEntrepreneurOverviewResponse> getOverviewData(
      {required int mEntrepreneurID}) async {
    var url = "$baseURL/$entrepreneurs/$mEntrepreneurID/overview";

    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    print('overview person ${response.body}');
    print('overview person ${url}');
    if (response.statusCode == 200) {
      GetEntrepreneurOverviewResponse model =
          GetEntrepreneurOverviewResponse.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetEntrepreneurOverviewResponse model = GetEntrepreneurOverviewResponse();
      return model..message = 'data not found'.tr();
    }
  }

  static Future<GetEntrepreneurSupplierResponse> getEntrepreneurSupplierData(
      {required int mEntrepreneurId,
      String searchData = '',
      String fromDate = '',
      String toDate = ''}) async {
    var url = '';
    if (searchData == '') {
      if (fromDate != '' && toDate != '') {
        url =
            "$baseURL/$entrepreneurs/$mEntrepreneurId/suppliers?to=$toDate&from=$fromDate";
      } else {
        url = "$baseURL/$entrepreneurs/$mEntrepreneurId/suppliers";
      }
    } else {
      url =
          "$baseURL/$entrepreneurs/$mEntrepreneurId/suppliers?search_string=$searchData";
    }
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    print('url is of supplier reponse ${response.body}');

    if (response.statusCode == 200) {
      GetEntrepreneurSupplierResponse model =
          GetEntrepreneurSupplierResponse.fromJson(jsonDecode(response.body));

      return model;
    } else {
      GetEntrepreneurSupplierResponse model =
          GetEntrepreneurSupplierResponse.fromJson(jsonDecode(response.body));
      return model;
    }
  }

  ///* POST METHODS *///
  ///Create New Entrepreneur
  static Future<PostEntrepreneurResponse> createNewEntrepreneur(
      PostEntrepreneurRequest entrepreneurRequest, String mImageID) async {
    var url = "$baseURL/entrepreneurs";

    var uri = Uri.parse(url);
    entrepreneurRequest.logoId = mImageID.toString();
    print("Entrepreneur body Request +>${entrepreneurRequest.toJson()}");

    var response = await http.post(
      uri,
      headers: header,
      body: jsonEncode(
        entrepreneurRequest,
      ),
    );
    print('Create New Entrepreneur Response => ${response.body}');
    print('Create New Entrepreneur Status Code => ${response.statusCode}');
    if (response.statusCode == 200) {
      print('Success Status => ${response.statusCode}');
      // PostEntrepreneurResponse model =
      // PostEntrepreneurResponse.fromJson(jsonDecode(response.body));

      return PostEntrepreneurResponse();
    } else {
      PostEntrepreneurResponse model = PostEntrepreneurResponse();
      return model..message = 'data not found'.tr();
    }
  }

  ///Upload File
  static Future<FileUploadResponse> uploadFile(PlatformFile file) async {
    var url = "$baseURL/file-upload";

    http.MultipartRequest request = http.MultipartRequest(
      "POST",
      Uri.parse(url),
    );
    request.headers['Authorization'] = '${header["Authorization"]}';

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
    print("File Uploading Response : ${response}");

    if (response["status"] == 200) {
      log('Success Status => ${response["status"]}');
      FileUploadResponse model = FileUploadResponse.fromJson(
        jsonDecode(result),
      );
      return model;
    } else {
      FileUploadResponse model = FileUploadResponse();
      return model..message = 'data not found'.tr();
    }
  }

  ///Create New Contact Moment
  // TODO : Will update THis Method
  static Future<PostEntrepreneurContactMomentResponse> createNewContactMoment(
    PostEntrepreneurContactMomentRequest postEntrepreneurContactMomentRequest,
    int entrepreneurID,
  ) async {
    var url = "$baseURL/entrepreneurs/$entrepreneurID/contact_moments";

    var uri = Uri.parse(url);
    print("Request Object : ${postEntrepreneurContactMomentRequest.toJson()}");

    var response = await http.post(
      uri,
      headers: header,
      body: jsonEncode(postEntrepreneurContactMomentRequest),
    );
    print('Create New Contact Moment Response => ${response.body}');
    if (response.statusCode == 200) {
      PostEntrepreneurContactMomentResponse model =
          PostEntrepreneurContactMomentResponse();
      // PostEntrepreneurContactMomentResponse.fromJson(
      // jsonDecode(response.body));
      return model;
    } else {
      PostEntrepreneurContactMomentResponse model =
          PostEntrepreneurContactMomentResponse();
      return model..message = 'data not found'.tr();
    }
  }

  ///Create New Subject In Contact Moment
  static Future<ContactMomentSubjectUpdateResponse>
      createNewSubjectInContactMoment(
    PostEntrepreneurContactSubjectRequest postEntrepreneurContactSubjectRequest,
    int entrepreneurID,
    int contactMomentID,
  ) async {
    var url =
        "$baseURL/entrepreneurs/$entrepreneurID/contact_moments/$contactMomentID/contact_subjects";

    var uri = Uri.parse(url);
    var response = await http.post(
      uri,
      headers: header,
      body: jsonEncode(postEntrepreneurContactSubjectRequest),
    );
    print('Create New Subject in Contact Moment Response => ${response.body}');
    if (response.statusCode == 200) {
      ContactMomentSubjectUpdateResponse model =
          ContactMomentSubjectUpdateResponse.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      ContactMomentSubjectUpdateResponse model =
          ContactMomentSubjectUpdateResponse();
      return model..message = 'data not found'.tr();
    }
  }

  ///Create New Task In Contact Moment
  static Future<PostEntrepreneurTaskResponse> createNewTaskInContactMoment(
    PostEntrepreneurTaskRequest postEntrepreneurTaskRequest,
    int entrepreneurID,
    int contactMomentID,
  ) async {
    var url =
        "$baseURL/entrepreneurs/$entrepreneurID/contact_moments/$contactMomentID/tasks";

    var uri = Uri.parse(url);
    var response = await http.post(
      uri,
      headers: header,
      body: jsonEncode(postEntrepreneurTaskRequest),
    );
    print('Create New Task in Contact Moment Response => ${response.body}');
    if (response.statusCode == 200) {
      PostEntrepreneurTaskResponse model =
          PostEntrepreneurTaskResponse.fromJson(jsonDecode(response.body));
      return model;
    } else {
      PostEntrepreneurTaskResponse model = PostEntrepreneurTaskResponse();
      return model..message = 'data not found'.tr();
    }
  }

  ///Create New Person In Entrepreneur
  static Future createNewPersonInEntrepreneur(
    PostEntrepreneurPersonRequest postEntrepreneurPersonRequest,
    int entrepreneurID,
    String mImageID,
  ) async {
    var url = "$baseURL/entrepreneurs/$entrepreneurID/persons";
    print("URL : $url");
    postEntrepreneurPersonRequest.person?.personImageId = mImageID;
    print("Body Request Data : ${postEntrepreneurPersonRequest.toJson()}");
    var uri = Uri.parse(url);
    var response = await http.post(
      uri,
      headers: header,
      body: jsonEncode(postEntrepreneurPersonRequest),
    );
    print('Create New Person In Entrepreneur Response => ${response.body}');
    if (response.statusCode == 200) {
// PostEntrepreneurPersonResponse model = PostEntrepreneurPersonResponse.fromJson(jsonDecode(response.body));
      return PostEntrepreneurPersonResponse();
    } else {
      PostEntrepreneurPersonResponse model = PostEntrepreneurPersonResponse();
      return model..message = 'data not found'.tr();
    }
  }

  static Future<UpdatePersonOfEntrepreneur> createExistingPersonInEntrepreneur(
    UpdatePersonOfEntrepreneur postEntrepreneurPersonRequest,
    int entrepreneurID,
  ) async {
    var url = "$baseURL/entrepreneurs/$entrepreneurID/persons";
    print("URL : $url");

    var uri = Uri.parse(url);
    var response = await http.post(
      uri,
      headers: header,
      body: jsonEncode(postEntrepreneurPersonRequest.toJson()),
    );
    print(
        'Create Existing Person In Entrepreneur Response => ${response.statusCode}');
    print(
        'Create Existing Person In Entrepreneur Response => ${postEntrepreneurPersonRequest.toJson()}');
    if (response.statusCode == 200) {
      // PostEntrepreneurPersonResponse model = PostEntrepreneurPersonResponse.fromJson(jsonDecode(response.body));
      return UpdatePersonOfEntrepreneur();
    } else {
      return UpdatePersonOfEntrepreneur();
    }
  }

  ///Post Entrepreneur Suppliers Method

  static Future<PostEntrepreneurSupplierResponse>
      postEntreprenuerSupplierResponseData(
          PostEntrepreneurSupplierRequest request, int id) async {
    var url = "$baseURL/$entrepreneurs/$id/suppliers";

    var uri = Uri.parse(url);
    print('data => ${jsonEncode(request.toJson())}');

    var response = await http.post(uri,
        headers: header, body: jsonEncode(request.toJson()));

    print('Entrepreneur Supplier => ${response.body}');

    if (response.statusCode == 200) {
      PostEntrepreneurSupplierResponse modal =
          PostEntrepreneurSupplierResponse();
      return modal;
    } else {
      PostEntrepreneurSupplierResponse model =
          PostEntrepreneurSupplierResponse();

      return model..message = '${response.statusCode}Data not found ';
    }
  }

  ///* PUT METHODS *///
  ///Update Entrepreneur Data
  static Future<PostEntrepreneurResponse> updateEntrepreneur(
    PostEntrepreneurRequest entrepreneurRequest,
    int mEntrepreneurID,
    String mImageID,
  ) async {
    var url = "$baseURL/entrepreneurs/$mEntrepreneurID";

    var uri = Uri.parse(url);
    entrepreneurRequest.logoId = mImageID;
    print('Update Entrepreneur Request => ${entrepreneurRequest.toJson()}');

    var response = await http.put(
      uri,
      body: jsonEncode(entrepreneurRequest),
      headers: header,
    );
    print('Update Entrepreneur Response => ${response.statusCode}');

    print('Update Entrepreneur Response => ${response.body}');
    if (response.statusCode == 200) {
      // PostEntrepreneurResponse model =
      // PostEntrepreneurResponse.fromJson(jsonDecode(response.body));
      return PostEntrepreneurResponse();
    } else {
      PostEntrepreneurResponse model = PostEntrepreneurResponse();
      return model..message = 'data not found'.tr();
    }
  }

  /// Update Person Of Entrepreneur Data
  static Future<PutEntrepreneurPersonResponse> updatePersonOfEntrepreneur(
    PutEntrepreneurPersonRequest updatePersonOfEntrepreneur,
    int mEntrepreneurID,
    int mPersonIds,
  ) async {
    var url =
        "$baseURL/entrepreneurs/$mEntrepreneurID/persons?person_id=$mPersonIds";
    var uri = Uri.parse(url);

    var response = await http.put(
      uri,
      body: jsonEncode(updatePersonOfEntrepreneur),
      headers: header,
    );
    print('Update Person OF Entrepreneur Response => ${response.body}');
    print('Update Person OF Entrepreneur Response => ${url}');
    if (response.statusCode == 200) {
      return PutEntrepreneurPersonResponse.fromJson(jsonDecode(response.body));
    } else {
      return PutEntrepreneurPersonResponse.fromJson(jsonDecode(response.body));
    }
  }

  /// Update Contact Moments In Entrepreneur Data
  static Future<UpdateContactMomentOfEntrepreneurResponse>
      updateContactMomentsOfEntrepreneur(
    PostEntrepreneurContactMomentRequest updateContactMomentOfEntrepreneur,
    int mEntrepreneurID,
    int mContactMomentID,
  ) async {
    var url =
        "$baseURL/entrepreneurs/$mEntrepreneurID/contact_moments/$mContactMomentID";

    var uri = Uri.parse(url);
    var response = await http.put(
      uri,
      body: jsonEncode(updateContactMomentOfEntrepreneur),
      headers: header,
    );
    print('Update Contact Moment OF Entrepreneur Response => ${response.body}');
    if (response.statusCode == 200) {
      UpdateContactMomentOfEntrepreneurResponse model =
          UpdateContactMomentOfEntrepreneurResponse.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      UpdateContactMomentOfEntrepreneurResponse model =
          UpdateContactMomentOfEntrepreneurResponse();
      return model..message = 'data not found'.tr();
    }
  }

  /// Update Contact Moments SUbject In Entrepreneur Data
  static Future<ContactMomentSubjectUpdateResponse> updateContactMomentSubject(
    ContactSubjectsPost contactSubjectsPost,
    int mEntrepreneurID,
    int contactMomentId,
    int contactMomentSubjectId,
  ) async {
    var url =
        "$baseURL/entrepreneurs/$mEntrepreneurID/contact_moments/$contactMomentId/contact_subjects/$contactMomentSubjectId";

    var uri = Uri.parse(url);
    var response = await http.put(
      uri,
      body: jsonEncode(contactSubjectsPost),
      headers: header,
    );
    print('Update Contact Moment Subject Response => ${response.body}');
    if (response.statusCode == 200) {
      ContactMomentSubjectUpdateResponse model =
          ContactMomentSubjectUpdateResponse.fromJson(
              jsonDecode(response.body));
      return model;
    } else {
      ContactMomentSubjectUpdateResponse model =
          ContactMomentSubjectUpdateResponse();
      return model..message = 'data not found'.tr();
    }
  }

  /// Update Contact Moments SUbject In Entrepreneur Data
  static Future<PostEntrepreneurTaskResponse> updateContactMomentTask(
    PostEntrepreneurTaskRequest contactTaskPost,
    int mEntrepreneurID,
    int contactMomentId,
    int taskID,
  ) async {
    var url =
        "$baseURL/entrepreneurs/$mEntrepreneurID/contact_moments/$contactMomentId/tasks/$taskID";

    var uri = Uri.parse(url);
    var response = await http.put(
      uri,
      body: jsonEncode(contactTaskPost),
      headers: header,
    );
    print('Update Contact Moment TASK Response => ${response.body}');
    if (response.statusCode == 200) {
      PostEntrepreneurTaskResponse model =
          PostEntrepreneurTaskResponse.fromJson(jsonDecode(response.body));
      return model;
    } else {
      PostEntrepreneurTaskResponse model = PostEntrepreneurTaskResponse();
      return model..message = 'data not found'.tr();
    }
  }

  ///update Entrepreneur Suppliers Method

  static Future updateEntreprenuerSupplierResponseData(
      PutEntrepreneurSupplierRequest request, int id, int supplierid) async {
    var url = "$baseURL/$entrepreneurs/$id/suppliers/$supplierid";

    var uri = Uri.parse(url);
    print(url);

    print('data ======= => ${jsonEncode(request.toJson())}');

    var response = await http.put(uri,
        headers: header, body: jsonEncode(request.toJson()));

    print('Entrepreneur Supplier => ${response.body}');

    if (response.statusCode == 200) {
      PutEntrepreneurSupplierResponse modal =
          PutEntrepreneurSupplierResponse.fromJson(jsonDecode(response.body));
      return modal;
    } else {
      PutEntrepreneurSupplierResponse model = PutEntrepreneurSupplierResponse();

      return model..message = '${response.statusCode}Data not found ';
    }
  }

  static Future updateEntreprenuerSupplierBulkResponseData(
      PutEntrepreneurSupplierBulkRequest bulkRequest,
      int id,
      int supplierid) async {
    var url = "$baseURL/$entrepreneurs/$id/suppliers/bulk_update";
    var uri = Uri.parse(url);
    print('data ======= => ${jsonEncode(bulkRequest.toJson())}');

    var response = await http.put(uri,
        headers: header, body: jsonEncode(bulkRequest.toJson()));

    print('Entrepreneur Supplier bulk => ${response.body}');

    if (response.statusCode == 200) {
      PutEntrepreneurSupplierResponse modal =
          PutEntrepreneurSupplierResponse.fromJson(jsonDecode(response.body));
      return modal;
    } else {
      PutEntrepreneurSupplierResponse model = PutEntrepreneurSupplierResponse();

      return model..message = '${response.statusCode}Data not found ';
    }
  }

// static Future<UpdateEntrepreneurRetailerResponse>
// updateEntrepreneurRetailerRequest(
// UpdateEntrepreneurRetailerResponse updateEntrepreneurRetailerResponse,
// int mEntrepreneurID,
// int mEntrepreneurRetailerID,
// ) async {
// var url =
// "$baseURL/$entrepreneurs/$mEntrepreneurID/$mEntrepreneurRetailerID";

// var uri = Uri.parse(url);
// var response = await http.put(
// uri,
// body: UpdateEntrepreneurRetailerResponse(),
// headers: header,
// );

// if (response.statusCode == 200) {
// UpdateEntrepreneurRetailerResponse model =
// UpdateEntrepreneurRetailerResponse.fromJson(
// jsonDecode(response.body));
// return model;
// } else {
// UpdateEntrepreneurRetailerResponse model =
// UpdateEntrepreneurRetailerResponse();
// return model..message = 'data not found'.tr();
// }
// }

  /// Get Entrepreneur Retailer Data ////

  static Future<GetentrepreneurRetailerResponse> getEntrepreneurRetailerData(
      {required int mEntrepreneurID, String? value = ''}) async {
    if (value == null) {
      var url = "$baseURL/$entrepreneurs/$mEntrepreneurID/$retailers";
      var uri = Uri.parse(url);
      var response = await http.get(uri, headers: header);
      if (response.statusCode == 200) {
        print('Entrepreneur Retailer == ${response.body}');
        GetentrepreneurRetailerResponse model =
            GetentrepreneurRetailerResponse.fromJson(jsonDecode(response.body));
        return model;
      } else {
        GetentrepreneurRetailerResponse model =
            GetentrepreneurRetailerResponse.fromJson(jsonDecode(response.body));
        return model;
      }
    } else {
      var url = '';
      value == 'Physical location'
          ? url =
              "$baseURL/$entrepreneurs/$mEntrepreneurID/$retailers?type=Physical location"
          : value == 'Online location'
              ? url =
                  "$baseURL/$entrepreneurs/$mEntrepreneurID/$retailers?type=Online location"
              : value == 'Hybrid location'
                  ? url =
                      "$baseURL/$entrepreneurs/$mEntrepreneurID/$retailers?type=Hybrid location"
                  : url =
                      "$baseURL/$entrepreneurs/$mEntrepreneurID/$retailers?search_string=$value";
      var uri = Uri.parse(url);
      var response = await http.get(uri, headers: header);
      print('Entrepreneur Retailer ==== $value');
      print('Entrepreneur Retailer url ==== $url');
      print('Entrepreneur Retailer ==== ${response.body}');

      if (response.statusCode == 200) {
        GetentrepreneurRetailerResponse model =
            GetentrepreneurRetailerResponse.fromJson(jsonDecode(response.body));
        return model;
      } else {
        GetentrepreneurRetailerResponse model =
            GetentrepreneurRetailerResponse.fromJson(jsonDecode(response.body));
        return model;
      }
    }
  }

  // Post/ Add Entrepreneur Retailer //
  static Future postEntrepreneurRetailerData(
      {required int mEntrepreneurID, Map<String, dynamic>? requestBody}) async {
    var url = "$baseURL/$entrepreneurs/$mEntrepreneurID/$retailers";
    var uri = Uri.parse(url);
    var response =
        await http.post(uri, headers: header, body: jsonEncode(requestBody));
    print('Entrepreneur Retailer post ==== ${response.body}');
    // if (response.statusCode == 200) {
    // GetentrepreneurRetailerResponse model = GetentrepreneurRetailerResponse.fromJson(jsonDecode(response.body));
    // return model;
    // } else {
    // GetentrepreneurRetailerResponse model = GetentrepreneurRetailerResponse.fromJson(jsonDecode(response.body));
    // return model;
    // }
  }

  /// update Entrepreneur Retailer Data //

  static Future updateEntrepreneurRetailerData(
      {required int mEntrepreneurID,
      Map<String, dynamic>? requestBody,
      int? retailerEntrepreneurID}) async {
    print('retailerEntrepreneurID =$retailerEntrepreneurID');
    var url =
        "$baseURL/$entrepreneurs/$mEntrepreneurID/$retailers/$retailerEntrepreneurID";
    var uri = Uri.parse(url);
    var response =
        await http.put(uri, headers: header, body: jsonEncode(requestBody));
    print('Entrepreneur update Retailer Response ==== ${response.body}');
    // if (response.statusCode == 201) {
    // GetentrepreneurRetailerResponse model = GetentrepreneurRetailerResponse.fromJson(jsonDecode(response.body));
    // return model;
    // } else {
    // GetentrepreneurRetailerResponse model = GetentrepreneurRetailerResponse.fromJson(jsonDecode(response.body));
    // return model;
    // }
  }

// /// Update Task In Contact Moments In Entrepreneur Data
// static Future<UpdateContactMomentOfEntrepreneurResponse>
// updateTaskContactMomentsOfEntrepreneur(
// UpdateTaskContactMomentOfEntrepreneur updateTaskContactMomentOfEntrepreneur,
// int mEntrepreneurID,
// int mContactMomentID,
// int mTaskID,
// ) async {
// var url =
// "$baseURL/$entrepreneurs/$mEntrepreneurID/contact_moments/$mContactMomentID/tasks/$mTaskID";
//
// var uri = Uri.parse(url);
// var response = await http.put(
// uri,
// body: updateTaskContactMomentOfEntrepreneur,
// headers: header,
// );
// print('Update Contact Moment OF Entrepreneur Response => ${response.body}');
// if (response.statusCode == 200) {
// UpdateContactMomentOfEntrepreneurResponse model =
// UpdateContactMomentOfEntrepreneurResponse.fromJson(
// jsonDecode(response.body));
// return model;
// } else {
// UpdateContactMomentOfEntrepreneurResponse model =
// UpdateContactMomentOfEntrepreneurResponse();
// return model..message = 'data not found'.tr();
// }
// }

  ///* DELETE METHODS *///
  ///Delete Entrepreneur Data
  static Future deleteEntrepreneur(dynamic mEntrepreneurID) async {
    var url = "$baseURL/entrepreneurs";

    var uri = Uri.parse(url);
    var requestBody = {"entrepreneur_ids": mEntrepreneurID};

    print("Request body : $requestBody");
    var response = await http.delete(
      uri,
      body: jsonEncode(requestBody),
      headers: header,
    );
    print('Delete Entrepreneur Response => ${response.body}');
    print('Delete Entrepreneur status => ${response.statusCode}');
    if (response.statusCode == 200) {
      DeleteEntrepreneurResponse model = DeleteEntrepreneurResponse();
      return model;
    } else {
      DeleteEntrepreneurResponse model = DeleteEntrepreneurResponse();
      return model..message = 'data not found'.tr();
    }
  }

  //delete entrepreneur retailer

  static Future deleteEntrepreneurRetailer({
    int? mEntrepreneurID,
    dynamic retailerId,
    bool? isBulkDelete,
  }) async {
    if (isBulkDelete!) {
      var url =
          "$baseURL/$entrepreneurs/$mEntrepreneurID/$retailers/bulk_delete";
      var uri = Uri.parse(url);
      var response = await http.delete(uri,
          headers: header, body: jsonEncode({"retailers_ids": retailerId}));

      print('bulk delete response ${response.body}');
      print('bulk delete url ${url}');
      print('bulk delete status ${response.statusCode}');
      print('bulk delete id ${jsonEncode({"retailers_ids": retailerId})}');
      if (response.statusCode == 200) {
        DeleteEntrepreneurRetailerResponse modal =
            DeleteEntrepreneurRetailerResponse.fromJson(
                jsonDecode(response.body));
        return modal;
      } else {
        DeleteEntrepreneurRetailerResponse model =
            DeleteEntrepreneurRetailerResponse();
        return model;
      }
    } else {
      var url =
          "$baseURL/$entrepreneurs/$mEntrepreneurID/$retailers/$retailerId";
      print('id $url');

      var uri = Uri.parse(url);
      var response = await http.delete(
        uri,
        headers: header,
      );

      print('Delete Entrepreneur Response => ${response.body}');
      /*if (response.statusCode == 200) {
 DeleteEntrepreneurRetailerResponse model = DeleteEntrepreneurRetailerResponse.fromJson(jsonDecode(response.body));
 return model;
 } else {
 DeleteEntrepreneurRetailerResponse model = DeleteEntrepreneurRetailerResponse.fromJson(jsonDecode(response.body));
 return model;
 }*/
    }
  }

  ///Delete Person OF Entrepreneur Data
  static Future<DeleteEntrepreneurResponse> deletePersonOfEntrepreneur(
      int mEntrepreneurID, List<String> mPersonIds) async {
    var url = "$baseURL/entrepreneurs/$mEntrepreneurID/persons";

    var uri = Uri.parse(url);
    print("Delete Person URL : $uri");

    Map map = {"person_ids": mPersonIds};

    var response = await http.delete(
      uri,
      headers: header,
      body: jsonEncode(map),
    );
    print('Delete Persons OF Entrepreneur Response => ${response.body}');
    if (response.statusCode == 200) {
      DeleteEntrepreneurResponse model =
          DeleteEntrepreneurResponse.fromJson(jsonDecode(response.body));
      return model;
    } else {
      DeleteEntrepreneurResponse model = DeleteEntrepreneurResponse();
      return model..message = 'data not found'.tr();
    }
  }

  ///Delete Contact Moment OF Entrepreneur Data
  static Future<DeleteEntrepreneurResponse> deleteContactMomentOfEntrepreneur(
      int mEntrepreneurID, int mContactMomentID) async {
    var url =
        "$baseURL/$entrepreneurs/$mEntrepreneurID/contact_moments/$mContactMomentID";

    var uri = Uri.parse(url);
    var response = await http.delete(
      uri,
      headers: header,
    );
    print('Delete Persons OF Entrepreneur Response => ${response.body}');
    if (response.statusCode == 200) {
      DeleteEntrepreneurResponse model =
          DeleteEntrepreneurResponse.fromJson(jsonDecode(response.body));
      return model;
    } else {
      DeleteEntrepreneurResponse model = DeleteEntrepreneurResponse();
      return model..message = 'data not found'.tr();
    }
  }

  ///Delete Task In Contact Moment OF Entrepreneur Data
  static Future<DeleteEntrepreneurResponse>
      deleteTaskInContactMomentOfEntrepreneur(
    int mEntrepreneurID,
    int mContactMomentID,
    int mTaskID,
  ) async {
    var url =
        "$baseURL/entrepreneurs/$mEntrepreneurID/contact_moments/$mContactMomentID/tasks/$mTaskID";

    var uri = Uri.parse(url);
    var response = await http.delete(
      uri,
      headers: header,
    );
    print('Delete Persons OF Entrepreneur Response => ${response.body}');
    if (response.statusCode == 200) {
// DeleteEntrepreneurResponse model = DeleteEntrepreneurResponse.fromJson(jsonDecode(response.body));
      return DeleteEntrepreneurResponse();
    } else {
      DeleteEntrepreneurResponse model = DeleteEntrepreneurResponse();
      return model..message = 'data not found'.tr();
    }
  }

  ///Delete Contact Subject In Contact Moment OF Entrepreneur Data
  static Future<DeleteEntrepreneurResponse>
      deleteContactSubjectInContactMomentOfEntrepreneur(
    int mEntrepreneurID,
    int mContactMomentID,
    int mContactSubjectID,
  ) async {
    var url =
        "$baseURL/entrepreneurs/$mEntrepreneurID/contact_moments/$mContactMomentID/contact_subjects/$mContactSubjectID";
    print("Delete Contact URL : $url");
    var uri = Uri.parse(url);
    var response = await http.delete(
      uri,
      headers: header,
    );
    print('Delete Subject OF Contact Moment Response => ${response.body}');
    if (response.statusCode == 200) {
// DeleteEntrepreneurResponse model = DeleteEntrepreneurResponse.fromJson(jsonDecode(response.body));
      return DeleteEntrepreneurResponse();
    } else {
      DeleteEntrepreneurResponse model = DeleteEntrepreneurResponse();
      return model..message = 'data not found'.tr();
    }
  }

  ///delete Entrepreneur Suppliers Method
  static Future<DeleteEntrepreneurSupplierResponse>
      deleteEntreprenuerSupplierResponseData({
    int? id,
    dynamic supplierid,
    bool? isBulkDelete,
  }) async {
    if (isBulkDelete!) {
      print('id $supplierid');
      var url = "$baseURL/$entrepreneurs/$id/suppliers/bulk_delete";
      var uri = Uri.parse(url);
      var response = await http.delete(uri,
          headers: header, body: jsonEncode({"suppliers_ids": supplierid}));
      if (response.statusCode == 200) {
        DeleteEntrepreneurSupplierResponse modal =
            DeleteEntrepreneurSupplierResponse.fromJson(
                jsonDecode(response.body));
        return modal;
      } else {
        DeleteEntrepreneurSupplierResponse model =
            DeleteEntrepreneurSupplierResponse();
        return model..message = '${response.statusCode}Data not found ';
      }
    } else {
      var url = "$baseURL/$entrepreneurs/$id/suppliers/$supplierid";
      var uri = Uri.parse(url);
      print(url);
      var response = await http.delete(uri, headers: header);
      print('Entrepreneur Supplier => ${response.body}');
      if (response.statusCode == 200) {
        DeleteEntrepreneurSupplierResponse modal =
            DeleteEntrepreneurSupplierResponse.fromJson(
                jsonDecode(response.body));
        return modal;
      } else {
        DeleteEntrepreneurSupplierResponse model =
            DeleteEntrepreneurSupplierResponse();
        return model..message = '${response.statusCode}Data not found ';
      }
    }
  }
}
