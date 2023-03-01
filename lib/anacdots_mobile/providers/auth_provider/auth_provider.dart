import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wij_land/anacdots_mobile/api_client/base_class.dart';
import 'package:http/http.dart' as http;
import 'package:wij_land/anacdots_mobile/models/authentication_model/forgot_password_request_model.dart';
import 'package:wij_land/anacdots_mobile/utils/controller.dart';
import '../../api_client/anecdotes_directory_clients.dart';
import '../../models/authentication_model/anacdots_user_model.dart';
import '../../models/authentication_model/reset_password_first_time.dart';
import '../../models/forgot_password_request_model.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider? authProvider;
  static AuthProvider instance = Get.find();
  var myUser = AnacdotsUserModel().obs;
  bool isSignendIn = false;
  late SharedPreferences preferences;
  String dummyImage =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";
  AnacdotsUserModel? user;
  Future login(String email, String password, bool remember) async {
    var url = '$baseURL/login';
    var uri = Uri.parse(url);

    final response = await http.post(uri,
        body: jsonEncode({"email": email, "password": password}),
        headers: {"Content-type": "application/json"});
    var data = jsonDecode(response.body);
    debugPrint("Response : ${response.body}");
    if (data["status"] == 200) {
      AnacdotsUserModel user =
          AnacdotsUserModel.fromJson(jsonDecode(response.body));

      debugPrint("Data : ${user.data!.token}");
      debugPrint("Data : ${user.data!.passwordSkip}");
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(AnacdotsUser, json.encode(user.toJson()));
      box.write('token', '${user.data!.token}');
      box.read('token');
      if (remember) {
        await prefs.setString(AnacdotsEmail, email);
        await prefs.setString(AnactdotsPassword, password);
        await prefs.setBool(AnacdotsRemember, remember);

        debugPrint("$email , $password , $remember");
      } else {
        prefs.clear();
      }

      myUser.value = user;

      isSignendIn = true;

      return user;
    } else {
      return null;
    }
  }

  ForgotPasswordRequest forgotPasswordResponse = ForgotPasswordRequest();

  Future forgotPassword(String email) async {
    forgotPasswordResponse =
        await AnecdotesDirectoryClients.forgotPasswordRequest(email);
    notifyListeners();
  }

  ResetPasswordFirstTime? resetPasswordFirstTimeResponse;
  // Future ResetFirstTime(ResetPasswordFirstTime request) async {
  //   resetPasswordFirstTimeResponse = await resetPasswordFirstTime(request);
  //   notifyListeners();
  // }

  Future resetPasswordFirstTime(Map map) async {
    print("Reset pass Map : ${map}");
    var url = "$baseURL/password/reset";
    var uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(map),
      headers: {"Content-type": "application/json"},
    );

    //var data = jsonDecode(response.body);
    print("Response : ${response.body}");
    if (response.statusCode == 200) {
      print("Response in 200 : ${response.body}");
      resetPasswordFirstTimeResponse =
          ResetPasswordFirstTime.fromJson(jsonDecode(response.body));

      notifyListeners();
    } else {
      resetPasswordFirstTimeResponse = ResetPasswordFirstTime();
      notifyListeners();
    }
  }

// Future resetPassword(
//     String password, String confirmPassword, String userID) async {
//   var url = "$baseURL/password/reset";
//   var uri = Uri.parse(url);
//   final response = await http.post(
//     uri,
//     body: jsonEncode({
//       "password": password,
//       "password_confirmation": confirmPassword,
//       "user_id": userID
//     }),
//     headers: {"Content-type": "application/json"},
//   );

//   var data = jsonDecode(response.body);
//   print("Response : ${response.body}");
//   if (data['status'] == 200) {}
// }

  updateUserProfile(Map map, int personId) async {
    myUser.value = await AnecdotesDirectoryClients.updateProfile(map, personId);

    notifyListeners();
  }
}
