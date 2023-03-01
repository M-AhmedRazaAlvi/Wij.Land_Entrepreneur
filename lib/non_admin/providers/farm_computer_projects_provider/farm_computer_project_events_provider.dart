import 'package:flutter/cupertino.dart';
import 'package:wij_land/non_admin/api_clients/farm_computer_project_clients.dart';

import '../../models/farm_computer_project/farm_computer_project_events/response/farm_computer_project_events_response.dart';

class CreateFarmComputerProjectEventsProvider extends ChangeNotifier {
  GetFarmComputerProjectEventsResponse? _farmComputerProjectEventsResponsceModels;

  GetFarmComputerProjectEventsResponse get farmComputerProjectEventsResponseModel => _farmComputerProjectEventsResponsceModels!;
  bool _isLoading = false;

  get isLoading => _isLoading;
  List pastDateList = [];
  List upcomingDateList = [];

  Future getFarmComputerProjectEvent({int? projectId}) async {
    _farmComputerProjectEventsResponsceModels = await FarmComputerProjectClients.getFarmComputerProjectEvents(projectID: projectId!);

    if (_farmComputerProjectEventsResponsceModels!.status != 404) {
      if (_farmComputerProjectEventsResponsceModels!.data!.pastEvents!.isNotEmpty ) {
        for (int i = 0; i < _farmComputerProjectEventsResponsceModels!.data!.pastEvents!.length; i++) {
          if (_farmComputerProjectEventsResponsceModels!.data!.pastEvents![i].date != null) {
            pastDateList.insert(i, _farmComputerProjectEventsResponsceModels!.data!.pastEvents![i].date);
          } else {
            pastDateList.insert(i, "0000-00-00");
          }
        }
      }
    }
    if (_farmComputerProjectEventsResponsceModels!.status != 404) {
      if (_farmComputerProjectEventsResponsceModels!.data!.upcomingEvents!.isNotEmpty) {
        for (int i = 0; i < _farmComputerProjectEventsResponsceModels!.data!.upcomingEvents!.length; i++) {
          if (_farmComputerProjectEventsResponsceModels!.data!.upcomingEvents![i].date != null) {
            upcomingDateList.insert(i, _farmComputerProjectEventsResponsceModels!.data!.upcomingEvents![i].date);
          } else {
            upcomingDateList.insert(i, "0000-00-00");
          }
        }
      }
    }
    notifyListeners();
  }
}
