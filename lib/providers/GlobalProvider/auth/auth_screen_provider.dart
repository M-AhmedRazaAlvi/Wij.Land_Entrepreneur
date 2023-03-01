import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wij_land/api_clients/BaseClass.dart';
import 'package:wij_land/api_clients/entrepreneur_client.dart';

import '../../../models/user/forgot_password_response.dart';
import '../../../models/user/user_model.dart';
import '../../../models/user/user_model_info_via_token.dart';
import '../../../screens/auth/authentication_page.dart';
import '../../../utils/controller.dart';

class AuthScreenProvider extends GetxController {
  // TODO : Will check commented code later
  static AuthScreenProvider instance = Get.find();
  var myUser = MyUser().obs;
  var mynewUser = UserInfoModelInfoViaToken().obs;
  var loggedIn = false.obs;
  late SharedPreferences preferences;

  @override
  void onInit() {
    super.onInit();
    checkLoggedInUser();
  }

  void checkLoggedInUser() async {
    try {
      preferences = await SharedPreferences.getInstance();
      MyUser u = MyUser.fromJson(json.decode(preferences.getString(USER) ?? ""));
      if (u.email != null) {
        myUser.value = u;
        loggedIn.value = true;
      }
    } catch (e, st) {
      debugPrint(st.toString());
      // setInitialScreen();
    }
    // setInitialScreen();
  }

  setInitialScreen() {
    debugPrint("SET INITAL SCREEN ${loggedIn}");
    if (!loggedIn.value) {
      //  Get.offAllNamed(authPageRoute);
    } else {
      // Get.offAllNamed(rootRoute);
    }
  }

  void register(String email, password) async {
    try {
      // await auth.createUserWithEmailAndPassword(
      //     email: email, password: password);
    } catch (e, st) {
      debugPrintStack(stackTrace: st);
    }
  }

  Future login(String email, String password, bool remember) async {
    try {
      print('base url ios $baseURL');
      final response = await http.post(Uri.parse('$baseURL/login?email=$email&password=$password'));
      var data = jsonDecode(response.body);
      print("URL : ${'$baseURL/login?email=$email&password=$password'}");
      if (data["status"] == 200) {

        MyUser user = MyUser.fromJson(data["data"]);
        print("Data : ${data}");
        print("Login Response : ${response.body}");


        await preferences.setString(USER, json.encode(user.toJson()));
        if (remember) {
          await preferences.setString(EMAIL, email);
          await preferences.setString(PASSWORD, password);
          await preferences.setBool(REMEMBER, remember);
          debugPrint("$email , $password , $remember");
        }
        myUser.value = user;
        header = {
          "Authorization": "Bearer ${myUser.value.token!}",
          "Content-type": "application/json"
        };
        loggedIn.value = true;
        await preferences.setBool(FARM_COMPUTER, user.farmComputer!);

        return user.farmComputer;
      } else {
        return null;
      }
    } catch (e, st) {
//      debugPrintStack(stackTrace: st, label: e.toString());
      return null;
    }
  }

  Future forgotPassword(String email) async {
    try {
      final response = await http.post(Uri.parse('$baseURL/forgot-password?email=$email'));
      print("Forgot password Response : ${response.body}");
      if (response.statusCode == 200) {
        ForgotPasswordResponse model = ForgotPasswordResponse.fromJson(jsonDecode(response.body));
        // PostEntrepreneurContactMomentResponse.fromJson(
        //     jsonDecode(response.body));
        return model;
      } else {
        ForgotPasswordResponse model = ForgotPasswordResponse();
        return model..message = 'Invalid Email';
      }
    } catch (e, st) {
//      debugPrintStack(stackTrace: st, label: e.toString());
      return null;
    }
  }

  Future<MyUser> loginViaToken() async {
    // try {
    print('login token is ${authController.myUser.value.token!}');
    print('headr  is ${header}');
    final response = await http.get(Uri.parse('$baseURL/current_user_info'), headers: header);
    print("Login Response via token: ${response.body}");
    var body = json.decode(response.body);
    MyUser user = MyUser.fromJson(body);

    return user;

    /*if (MyUser.fromJson(json.decode(response.body)).email != null) {
        var body = json.decode(response.body);
        MyUser user = MyUser.fromJson(body);
        await preferences.setString(USER, json.encode(user.toJson()));
        myUser.value = user;
        loggedIn.value = true;
        await preferences.setBool(FARM_COMPUTER, body['farm_computer']);
        if (body['farm_computer'] == true) {
          return true;
        } else {
          return false;
        }
      } else {
        // Get.snackbar('Error Loading data!',
        //     'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
        return false;
      }*/
    // } catch (e, st) {
    //   debugPrintStack(stackTrace: st, label: e.toString());
    // }
  }

  void signOut() async {
    //  menuController.changeActiveItemTo(homePageDisplayName, homePageRoute);
    loggedIn.value = false;
    myUser.value = MyUser();
    await preferences.setString(USER, "");
    Get.offAll(AuthenticationPage());
    //   Get.offAllNamed(nRootRoute);
    //   navigateFarmerController.navigatorFarmerKey.currentState!.dispose();
    //   navigationController.navigatorKey.currentState!.dispose();
  }

  final TextEditingController mEmailController = TextEditingController();
  final TextEditingController mPasswordController = TextEditingController();

  checkRemember() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool rem = prefs.getBool(REMEMBER) ?? false;
    if (rem) {
      String emailStr = prefs.getString(EMAIL) ?? "";
      String passStr = prefs.getString(PASSWORD) ?? "";
      mEmailController.text = emailStr;
      mPasswordController.text = passStr;
      mRememberMe = rem;
    }
  }

//   Future forgotPassword(String email) async {
//     try {
//       final response = await http.post(Uri.parse('$baseURL/forgot-password?email=$email'));
//       print("Forgot password Response : ${response.body}");
//       if (response.statusCode == 200) {
//         ForgotPasswordResponse model = ForgotPasswordResponse.fromJson(jsonDecode(response.body));
//         // PostEntrepreneurContactMomentResponse.fromJson(
//         //     jsonDecode(response.body));
//         return model;
//       } else {
//         ForgotPasswordResponse model = ForgotPasswordResponse();
//         return model..message = 'Invalid Email';
//       }
//     } catch (e, st) {
// //      debugPrintStack(stackTrace: st, label: e.toString());
//       return null;
//     }
//   }



  bool mRememberMe = false;
}
