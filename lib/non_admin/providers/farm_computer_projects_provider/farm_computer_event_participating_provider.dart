import 'package:flutter/cupertino.dart';
import 'package:wij_land/non_admin/api_clients/farm_computer_project_clients.dart';
import 'package:wij_land/non_admin/models/farm_computer_events/computer_event_participating/response/get_computer_event_participating_response.dart';

class CreateFarmComputerEventsParicipatingProvider extends ChangeNotifier {
  GetFarmComputerEventParticipatingResponse? _farmComputerEventParticipatingResponsceModels;

  GetFarmComputerEventParticipatingResponse get farmComputerEventParticipatingResponseModel => _farmComputerEventParticipatingResponsceModels!;
  bool _isLoading = false;

  get isLoading => _isLoading;

  Future getFarmComputerEventPaticipating({int? particicpatngId}) async {
    _farmComputerEventParticipatingResponsceModels =
        await FarmComputerProjectClients.getFarmComputerEventParticipating(participatingId: particicpatngId!);
    notifyListeners();
  }
}
