import 'package:flutter/material.dart';

import '../../api_clients/farm_computer_project_clients.dart';
import '../../models/permissions/permission_detail_model.dart';
import '../../models/permissions/request_status_update_model.dart';

class PermissionDetailScreenProvider extends ChangeNotifier {
  //* VARIABLES INITIALIZATION STARTS *//

  int mTabPosition = 0;
  int hTabPosition = 0;
  int activeStep = 0;
  bool searchTapped = false;
  bool showFilters = false;
  TextEditingController mSearchController = TextEditingController();
  TextEditingController mFeedbackController = TextEditingController();
  String filterStatus = "all";

  /// Fetching all permissions request data

  PermissionDetailModel mPermissionsDetailResponse = PermissionDetailModel();

  bool showLoading = true;

  fetchPermissionDetail({required String id}) async {
    // showLoading = true;
    // notifyListeners();
    mPermissionsDetailResponse =
        await FarmComputerProjectClients.fetchPermissionDetail(mRequestId: id);
    print(
        "Permissions Requests Response = ${mPermissionsDetailResponse.data!.toJson()}");
    showLoading = false;
    notifyListeners();
  }

  RequestStatusUpdateModel requestStatusUpdateModel =
      RequestStatusUpdateModel();

// update Permission Request Status
  updatePermissionRequestStatus({
    required String id,
    required String status,
  }) async {
    requestStatusUpdateModel =
        await FarmComputerProjectClients.updatePermissionStatus(
      mRequestId: id,
      status: status,
    );
    print("Update Requests Response = ${requestStatusUpdateModel.toJson()}");
  }
// update Permission Request Properties
  updatePermissionRequestProperties({
    required String id,
    required dynamic status,
    required String feedback,
    required String property,
  }) async {
    requestStatusUpdateModel =
        await FarmComputerProjectClients.updatePermissionProperties(
            mRequestId: id,
            status: status,
            feedback: feedback,
            property: property);
    print("Update Requests Response = ${requestStatusUpdateModel.toJson()}");
  }
}
