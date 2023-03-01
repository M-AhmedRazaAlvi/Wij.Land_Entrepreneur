import 'package:flutter/cupertino.dart';
import 'package:wij_land/non_admin/models/farm_computer_project/farm_computer_project_contact_moments/responce/get_farm_project_contact_moments_response.dart';

import '../../api_clients/farm_computer_parcels_drop_down_client.dart';
import '../../api_clients/farm_computer_project_clients.dart';
import '../../models/farm_computer_dropdown/parcel_project_drop_down.dart';

class CreateFarmComputerProjectContactMomentsProvider extends ChangeNotifier {
  GetFarmProjectContactMomentsResponse?
      _farmComputerProjectContactResponsceModels;

  GetFarmProjectContactMomentsResponse
      get farmComputerProjectContactResponseModel =>
          _farmComputerProjectContactResponsceModels!;
  bool _isLoading = false;

  get isLoading => _isLoading;
  List contactMomentDateList = [];
  Future getFarmComputerProjectContact({required int projectId}) async {
    _farmComputerProjectContactResponsceModels =
        await FarmComputerProjectClients.getFarmProjectContactMomentprojectId(
            projectId: projectId);
    if (_farmComputerProjectContactResponsceModels!.error?.status != 404) {
      for (int i = 0;
          i < _farmComputerProjectContactResponsceModels!.data!.length;
          i++) {
        if (_farmComputerProjectContactResponsceModels!
                .data![i].contactMomentDate !=
            null) {
          contactMomentDateList.insert(
              i,
              _farmComputerProjectContactResponsceModels!
                  .data![i].contactMomentDate);
        } else {
          contactMomentDateList.insert(i, "0000-00-00");
        }
      }
    }
    notifyListeners();
  }

//////////////////////////////
  Future getFarmProjectContactMomentsSearchResponse(
      {required int projectId}) async {
    _farmComputerProjectContactResponsceModels =
        await FarmComputerProjectClients.getFarmProjectContactMomentprojectId(
            searchContactName: contactSummy.trim(),
            fromDate: startdate.text.trim(),
            toDate: endDate.text.trim(),
            listofContactType: listofSelectedContact,
            listofProject: listofProjectInContact,
            month: '',
            sort: sortSelected,
            year: '',
            projectId: projectId);

    notifyListeners();
  }

  String contactSummy = '';
  List<ProjectData> parcelProjectsDropDownModel = [
    ProjectData(id: -1, name: '')
  ];
  var contactTypeDropDownList = <String>[''];
  String? contactType_selected_dopDown = '';

  ProjectData? parcelProjectSelectedDropDownName;
  allDropDown() async {
    contactTypeDropDownList = [""];
    parcelProjectsDropDownModel = [ProjectData(id: -1, name: '')];
    parcelProjectSelectedDropDownName = parcelProjectsDropDownModel[0];
    ParcelProjectsDropDown model =
        await FarmComputerParcelsDropDownClient.getParcelsProjectsDropDown();
    parcelProjectsDropDownModel.addAll(model.data!);
    List<String> list =
        await FarmComputerParcelsDropDownClient.getContactMomentTypeDropDown();

    contactTypeDropDownList.addAll(list);
    print("list of String values  ======${list}");
    print("list of contact type  ======${contactTypeDropDownList}");
  }

  final TextEditingController startdate = TextEditingController(),
      endDate = TextEditingController();
  List<String> selectList = <String>['', 'A-Z', 'Z-A'];
  String? sortSelected = '';

  var listofProjectInContact = <ProjectData>[];
  var listofSelectedContact = [];
}
