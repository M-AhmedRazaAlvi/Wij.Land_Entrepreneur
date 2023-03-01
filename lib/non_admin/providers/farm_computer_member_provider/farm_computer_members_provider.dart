import 'package:flutter/cupertino.dart';
import 'package:wij_land/non_admin/api_clients/farm_computer_project_clients.dart';
import 'package:wij_land/non_admin/models/farm_computer_members/farm_computer_members_response_model.dart';
import 'package:wij_land/non_admin/models/farm_computer_members/farm_computer_members_response_model.dart';

import '../../api_clients/farm_computer_parcels_drop_down_client.dart';
import '../../models/farm_computer_dropdown/parcel_project_drop_down.dart';
import '../../models/farm_computer_contact_moments/responce/get_contact_moment_details_responce.dart';
import '../../models/farm_computer_contact_moments/responce/get_contact_moments_responce.dart';

class FarmComputerMembersProvider extends ChangeNotifier {
  GetFarmComputerMembersResponseModel? _farmComputerMembersResponseModels;

  GetFarmComputerMembersResponseModel get farmComputerMembersModel => _farmComputerMembersResponseModels!;

  bool _isLoading = false;

  get isLoading => _isLoading;
  Future getFarmComputerMembers() async {
    _farmComputerMembersResponseModels = await FarmComputerProjectClients.getFarmComputerMemberData();
    notifyListeners();
  }

}
