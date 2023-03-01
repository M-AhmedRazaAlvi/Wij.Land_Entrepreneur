import 'package:flutter/cupertino.dart';

import '../../../api_clients/entrepreneur_client.dart';
import '../../../models/user/forgot_password_response.dart';

class ForGotProvider extends ChangeNotifier {
  ForgotPasswordResponse? forgotPasswordResponse;

  bool emailNotFound = false;

  Future ForgotPassword(String email) async {
    print("-====================$email");
    forgotPasswordResponse = await EntrepreneurClients.forgotPassword(email);
    notifyListeners();
  }
}
