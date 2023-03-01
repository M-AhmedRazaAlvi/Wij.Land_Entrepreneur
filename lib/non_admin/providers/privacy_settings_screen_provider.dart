import 'package:flutter/material.dart';

import '../api_clients/farm_computer_project_clients.dart';
import '../models/privacy_settings_response_model.dart';
import '../models/privacy_settings_update_response.dart';

class PrivacySettingsScreenProvider extends ChangeNotifier {
  bool showLoading = true;
  late PrivacySettingsResponseModel privacySettingsResponseModel;

  Future getSettingsData() async {
    privacySettingsResponseModel =
        await FarmComputerProjectClients.getFarmComputerPrivacySettings();
    print(
        "Profile Data GET REQUEST : ${privacySettingsResponseModel.toJson()}");
    showLoading = false;
    notifyListeners();
  }

  late PrivacySettingsUpdateResponse privacySettingsUpdateResponse;

  Future updateSettingsData({required bool isPublic}) async {
    print("Bool Value : $isPublic");
    privacySettingsUpdateResponse =
        await FarmComputerProjectClients.updateFarmComputerPrivacySettings(
      isPublic: isPublic,
    );
    print(
        "Profile Data UPDATE REQUEST : ${privacySettingsUpdateResponse.toJson()}");
    if (privacySettingsUpdateResponse.status == 200) {
      showLoading = true;
      notifyListeners();
      getSettingsData();
    }
  }
}
