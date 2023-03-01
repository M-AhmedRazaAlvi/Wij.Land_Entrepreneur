import 'package:flutter/cupertino.dart';
import 'package:wij_land/non_admin/api_clients/farm_computer_project_clients.dart';
import 'package:wij_land/non_admin/models/farm_computer_events/computer_events/request/put_farm_computer_event_attendance_request.dart';
import '../../api_clients/farm_computer_parcels_drop_down_client.dart';
import '../../models/farm_computer_dropdown/parcel_project_drop_down.dart';
import '../../models/farm_computer_events/computer_events_list/get_computer_events_list_response.dart';
import 'farm_computer_events_file_provider.dart';
import 'farm_computer_events_id_response_provider.dart';

class CreateFarmComputerEventsListProvider extends ChangeNotifier {
  GetFarmComputerEventsListResponse? _farmComputerEventsResponsceModels;

  GetFarmComputerEventsListResponse get farmComputerEventsResponseModel => _farmComputerEventsResponsceModels!;
  bool _isLoading = false;

  get isLoading => _isLoading;
  List eventDateList = [];

  Future getFarmComputerEvent() async {
    _farmComputerEventsResponsceModels = await FarmComputerProjectClients.getFarmComputerEvents();

    if (_farmComputerEventsResponsceModels!.error?.status != 404) {
      for (int i = 0; i < _farmComputerEventsResponsceModels!.data!.length; i++) {
        if (_farmComputerEventsResponsceModels!.data![i].date != null && _farmComputerEventsResponsceModels!.data![i].date!.isNotEmpty) {
          eventDateList.insert(i, _farmComputerEventsResponsceModels!.data![i].date);
        } else {
          eventDateList.insert(i, "0000-00-00");
        }
      }
    }
    notifyListeners();
  }

  /// update farm computer event attendance update for all events
  CreateFarmComputerEventsFileProvider fmProvider = CreateFarmComputerEventsFileProvider();
  CreateFarmComputerEventsIdProvider    eventIdProvider =CreateFarmComputerEventsIdProvider();

  Future putfarmComputerEventAttendanceUpdateForAllEvents(
      {required int eventID, required PutFarmComputerEventAttendanceUpdateRequest requestBody}) async {
    await FarmComputerProjectClients.updateFarmComputerEventAttendanceUpdateRequest(eventID: eventID, requestBody: requestBody);
    notifyListeners();
  }

  /// update farm computer event attendance update for specifice event Details

  Future putfarmComputerEventAttendanceUpdateForSpecificEvent(
      {required int eventID, required PutFarmComputerEventAttendanceUpdateRequest requestBody}) async {
    //  _isLoading=true;
    await FarmComputerProjectClients.updateFarmComputerEventAttendanceUpdateRequest(eventID: eventID, requestBody: requestBody);
   // fmProvider.getFarmComputerEventFile(eventId: eventID);
    notifyListeners();
  }

  Future getFarmComputerEventSearchResponse() async {
    _farmComputerEventsResponsceModels = await FarmComputerProjectClients.getFarmComputerEvents(
        searchEventName: contactSummy.trim(),
        fromDate: startdate.text.trim(),
        toDate: endDate.text.trim(),
        listofEvents: listofSelectedEvents,
        listofproject: listofSelectedProject,
        month: '',
        sort: sortSelected,
        year: '');

    notifyListeners();
  }

  String contactSummy = '';
  List<ProjectData> parcelProjectsDropDownModel = [ProjectData(id: -1, name: '')];
  var eventTypeDropDownList = <String>[''];
  String? eventType_selected_dopDown = '';
  ProjectData? parcelProjectSelectedDropDownName;

  allDropDown() async {
    parcelProjectsDropDownModel = [ProjectData(id: -1, name: '')];
    eventTypeDropDownList = [''];
    parcelProjectSelectedDropDownName = parcelProjectsDropDownModel[0];
    ParcelProjectsDropDown model = await FarmComputerParcelsDropDownClient.getParcelsProjectsDropDown();
    parcelProjectsDropDownModel.addAll(model.data!);
    List<String> list = await FarmComputerParcelsDropDownClient.getEventTypeDropDown();
    eventTypeDropDownList.addAll(list);
  }

  final TextEditingController startdate = TextEditingController(), endDate = TextEditingController();
  List<String> selectList = <String>['', 'A-Z', 'Z-A'];
  String? sortSelected = '';

  var listofSelectedProject = <ProjectData>[];
  var listofSelectedEvents = [];
}
