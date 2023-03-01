import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as data;
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:wij_land/anacdots_mobile/api_client/base_class.dart';
import 'package:wij_land/anacdots_mobile/models/authentication_model/anacdots_user_model.dart';
import 'package:wij_land/anacdots_mobile/models/authentication_model/forgot_password_request_model.dart';
import 'package:wij_land/anacdots_mobile/models/createdAnacdotModel.dart';
import '../models/anecdotes_model/delete_anacdots_by_id_request.dart';

import '../models/anecdotPostModel.dart';
import '../models/anecdotes_model/delete_file_response.dart';
import '../models/anecdotes_model/get_anacdots_by_id_reponse.dart';
import '../models/anecdotes_model/get_my_anecdotes_response.dart';
import '../models/anecdotes_model/put_anecdots_request.dart';
import '../models/mediacrudModel.dart';
import '../models/authentication_model/anacdots_user_model.dart';
import '../models/mediacrudModel.dart';
import '../models/search_model/anecdots_search_response.dart';
import 'dart:async';
import 'package:http_parser/http_parser.dart';

void myfunction() {
  return debugPrint("object");
}

class AnecdotesDirectoryClients {
  static String anecdotes = 'anecdotes';

  // GET anecdotes file

  static Future<GetMyAnecdotesResponse> getAnecdotesFile({
    String? searchString,
    String? personID,
    String? organizationID,
    String? projectID,
    String? locations,
    String? date,
  }) async {
    var url =
        '$baseURL/anecdotes?search=$searchString&person_id=$personID&organization_id=$organizationID&project_id=$projectID&date=$date&locations'
        ':$locations';
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    print("anecdotes url is $url");
    print("anecdotes response is ${response.body}");
    print(" response.statusCode response is ${response.statusCode}");

    if (response.statusCode == 200) {
      GetMyAnecdotesResponse model =
          GetMyAnecdotesResponse.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetMyAnecdotesResponse model =
          GetMyAnecdotesResponse.fromJson(jsonDecode(response.body));

      return model;
    }
  }

  static Future<AnecdotsSearchResponse> getAnecdotSearch(
      {required String searchKey}) async {
    var url = '$baseURL/persons-orgs?search=$searchKey';
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);

    debugPrint('response anecdots is ${response.body}');
    AnecdotsSearchResponse searchResponse =
        AnecdotsSearchResponse.fromJson(jsonDecode(response.body));
    return searchResponse;
  }

  // GET anecdotes By ID
  static Future<GetAnacdotsByIDResponse> getAnecdotesByID(int anacdotID) async {
    var url = '$baseURL/anecdotes/$anacdotID';
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: header);
    debugPrint("anecdotes by id url is $url");
    debugPrint("anecdotes response by id is ${response.body}");

    if (response.statusCode == 200) {
      GetAnacdotsByIDResponse model =
          GetAnacdotsByIDResponse.fromJson(jsonDecode(response.body));
      return model;
    } else {
      GetAnacdotsByIDResponse model =
          GetAnacdotsByIDResponse.fromJson(jsonDecode(response.body));
      return model;
    }
  }

  static Future<ForgotPasswordRequest> forgotPasswordRequest(
      String email) async {
    var url = '$baseURL/password/forget_password';
    var uri = Uri.parse(url);
    var response = await http.post(uri,
        body: jsonEncode({"email": email}), headers: header);
    print("anecdotes by id url is $url");
    print("anecdotes response by id is ${response.body}");
    if (response.statusCode == 200) {
      ForgotPasswordRequest model =
          ForgotPasswordRequest.fromJson(jsonDecode(response.body));
      return model..message;
    } else {
      ForgotPasswordRequest model = ForgotPasswordRequest();

      return model;
    }
  }
  //------------ post Anacdots-------------//

  static Future<CreatedAnacdotRequest> creatAnacdotApiReq(
      AnecdotPostModel request) async {
    var url = '$baseURL/anecdotes';
    var uri = Uri.parse(url);
    var response = await http.post(uri,
        headers: header, body: jsonEncode(request.toJson()));
    log('Request andecdots  => ${request.toJson().values}');
    log('Create anecdots => ${response.body}');
    //need to set model here
    if (response.statusCode == 200) {
      CreatedAnacdotRequest model = CreatedAnacdotRequest();
      debugPrint("object");
      return model;
    } else {
      CreatedAnacdotRequest model = CreatedAnacdotRequest();
      return model;
    }
  }

  static Future uploadMediaRequest(BuildContext context, List image) async {
    var url = "$baseURL/file";
    var dio = Dio();

    // formData.files.addAll(image
    //     .map((item) => MultipartFile.fromFileSync(item.path,
    //         filename: item.path.split('/').last))
    //     .toList());
    // List abc = [];

    // for (int i = 0; i < image.length; i++) {
    //   // print("helooooooooo$i");
    //   XFile imageFile = XFile(image[i].toString());
    //   abc.add({
    //     "path": imageFile.path,
    //     "filename": imageFile.path.split('/').last,
    //     "content_type": "image/jpg",
    //   });
    //   //  });
    // }
    // formData.files.addAll(
    //   FormData.fromMap({
    //   "file": {abc}
    // )});
    // var formDatax = FormData.fromMap({
    //   "file": {abc}
    // });
    // var formData = FormData.fromMap({
    //   'file': {
    //     // for (var item in image)
    //     {
    //       await MultipartFile.fromFile(image.first.path,
    //           filename: basename(image.first.path))
    //     }
    //     // .toList()
    //   }
    // });

    // print("=============${abc}");

    List<MultipartFile> files = [];
    for (var item in image) {
      MultipartFile file = await MultipartFile.fromFile(
        item.path,
        filename: item.toString(),
      );
      files.add(file);
    }

    var formData = FormData.fromMap({
      'file[]': files,
    });
    var response = await dio.post(url,
        data: formData,
        options: Options(
            headers: header,
            contentType: 'multipart/form-data',
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
    var jsonBody = jsonDecode(response.toString());
    debugPrint("khadija:::::::$jsonBody");

    MediaRequestModel model =
        MediaRequestModel.fromJson(jsonDecode(response.toString()));
    debugPrint("khadijaauploadedImges::::::${model.data!.first.id}");
    return model;
  }
  //------------ update Profile-------------//

  static Future<AnacdotsUserModel> updateProfile(
      var request, int personId) async {
    print('person is $personId');
    var url = '$baseURL/persons/$personId';
    var uri = Uri.parse(url);
    var response =
        await http.put(uri, headers: header, body: jsonEncode(request));
    //need to set model here
    print('person update model ${response.body}');
    print('person update model ${response.statusCode}');
    if (response.statusCode == 200) {
      AnacdotsUserModel user =
          AnacdotsUserModel.fromJson(jsonDecode(response.body));
      return user;
    } else {
      AnacdotsUserModel user =
          AnacdotsUserModel.fromJson(jsonDecode(response.body));
      return user;
    }
  }

  //---------- upload image ------------//
  static Future uploadImage(BuildContext context, var image) async {
    var url = '$baseURL/file';
    Uri uri = Uri.parse(url);
    try {
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var length = await image.length();
      var request = http.MultipartRequest('POST', uri);
      request.headers['authorization'] = 'Bearer ${box.read('token')}';
      request.files.add(http.MultipartFile(
        'file',
        stream,
        length,
        filename: image.path,
        contentType: MediaType('Content-Type', "multipart/form-data"),
      ));
      // request.fields.addAll(bodyMap);
      var response = await request.send();
      if (response.statusCode == 200) {
        return jsonDecode(await response.stream.bytesToString());
      } else {
        return response.statusCode;
      }
    } catch (e) {
      debugPrint('error is $e');
    }
  }

  static Future<DeleteAnacdotsByID> deletAnacdotsByID(int id) async {
    var url = '$baseURL/anecdotes/$id';
    var uri = Uri.parse(url);
    var response =
        await http.delete(uri, body: jsonEncode({"id": id}), headers: header);
    debugPrint("anecdote deleted url $url");
    debugPrint("anecdotes deleted url response ${response.body}");
    if (response.statusCode == 200) {
      DeleteAnacdotsByID model =
          DeleteAnacdotsByID.fromJson(jsonDecode(response.body));
      return model..message;
    } else {
      DeleteAnacdotsByID model = DeleteAnacdotsByID();

      throw Exception('Failed to delete');
    }
  }

  ////////////////-----Delete file-------////////////////
  static Future deleteFile(int id) async {
    var url = '$baseURL/file/$id';
    var uri = Uri.parse(url);
    var response = await http.delete(uri, headers: header);
    debugPrint("anecdote deleted url $url");
    debugPrint("anecdotes deleted url response ${response.body}");
    if (response.statusCode == 200) {
      DeleteFileResponse model =
          DeleteFileResponse.fromJson(jsonDecode(response.body));
      return model..message;
    } else {
      DeleteFileResponse model = DeleteFileResponse();
      return model;
    }
  }

  /// -------------------Put anecdots request---------------///
  static Future<PutAnecdotsRequest> updateAnecdots(
      {PutAnecdotsRequest? request, int? anecdotID}) async {
    print('anecdotID is $anecdotID');
    var url = '$baseURL/anecdotes/$anecdotID';
    var uri = Uri.parse(url);
    var response =
        await http.put(uri, headers: header, body: jsonEncode(request));

    //need to set model here
    print('anecdot update model ${response.body.toString()}');
    if (response.statusCode == 200) {
      PutAnecdotsRequest model =
          PutAnecdotsRequest.fromJson(jsonDecode(response.body));
      return model;
    } else {
      PutAnecdotsRequest model = PutAnecdotsRequest();
      return model;
    }
  }

  ///First time login

}
