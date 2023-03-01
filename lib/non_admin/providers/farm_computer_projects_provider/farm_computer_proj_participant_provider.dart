import 'package:flutter/cupertino.dart';
import 'package:wij_land/non_admin/api_clients/farm_computer_project_clients.dart';
import 'package:wij_land/non_admin/models/farm_computer_project/farm_computer_project_participant/response/get_farm_computer_proj_participants_response.dart';

class FarmComputerProjectParticipantProvider extends ChangeNotifier {
  GetFarmComputerProjectParticipantResponse?
      _farmComputerProjectParticipantResponseModel;
  GetFarmComputerProjectParticipantResponse
      get farmComputerProjectParticipantResponseModel =>
          _farmComputerProjectParticipantResponseModel!;
  //GetFarmComputerProjectParticipantResponse? getparticipantResponse;
  bool _isLoading = false;
  get isLoading => _isLoading;

  Future getFarmComputerProjectParticipant({int? projectID}) async {
    _farmComputerProjectParticipantResponseModel =
        await FarmComputerProjectClients.getFarmComputerProjectParticipants(
            projectID: projectID!);
    _isLoading = true;
    notifyListeners();
  }
}
