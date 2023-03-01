import 'package:flutter/cupertino.dart';
import 'package:wij_land/non_admin/api_clients/farm_computer_project_clients.dart';

import '../../api_clients/farm_computer_parcels_drop_down_client.dart';
import '../../models/farm_computer_dropdown/parcel_project_drop_down.dart';
import '../../models/farm_computer_contact_moments/responce/get_contact_moment_details_responce.dart';
import '../../models/farm_computer_contact_moments/responce/get_contact_moments_responce.dart';

class CreateFarmComputerContactMomentsProvider extends ChangeNotifier {
  GetFarmComputerContactMomentsResponse? _farmComputerContactMomentsResponsceModels;

  GetFarmComputerContactMomentsResponse get farmComputerContactMomentsResponseModel => _farmComputerContactMomentsResponsceModels!;
  List contactMomentDateList = [];

  Future getFarmComputerContactMoment() async {
    _farmComputerContactMomentsResponsceModels = await FarmComputerProjectClients.getFarmComputerContactMoments();

    if (_farmComputerContactMomentsResponsceModels!.status != 404) {
      for (int i = 0; i < _farmComputerContactMomentsResponsceModels!.data!.length; i++) {
        if (_farmComputerContactMomentsResponsceModels!.data![i].contactMomentDate != null) {
          contactMomentDateList.insert(i, _farmComputerContactMomentsResponsceModels!.data![i].contactMomentDate);
        } else {
          contactMomentDateList.insert(i, "0000-00-00");
        }
      }
    }

    bool _isLoading = false;

    print('data length is ${_farmComputerContactMomentsResponsceModels!.data!.length}');

    notifyListeners();
  }

/////////

  GetFarmComputerContactMomentDetailsResponce? _farmComputerContactMomentDetailsResponsceModels;

  GetFarmComputerContactMomentDetailsResponce get farmComputerContactMomentDetailsResponseModel => _farmComputerContactMomentDetailsResponsceModels!;

  bool _isLoading = false;

  get isLoading => _isLoading;

  Future getFarmComputerContactMomentDetails({int? contactMomentId}) async {
    _farmComputerContactMomentDetailsResponsceModels =
        await FarmComputerProjectClients.getFarmComputerContactMomentDetail(contactMomentId: contactMomentId!);

    print('data length is ${_farmComputerContactMomentDetailsResponsceModels!.data!.id}');

    notifyListeners();
  }

  Future getFarmComputerContactMomentsSearchResponse() async {
    _farmComputerContactMomentsResponsceModels = await FarmComputerProjectClients.getFarmComputerContactMoments(
        searchContactName: contactSummary.trim(),
        fromDate: startdate.text.trim(),
        toDate: endDate.text.trim(),
        listofContactType: listofSelectedContact,
        listofProject: listofProjectInContact,
        month: '',
        sort: sortSelected,
        year: '');

    notifyListeners();
  }

  allDropDown() async {
    parcelProjectsDropDownModel = [ProjectData(id: -1, name: '')];
    contactTypeDropDownList = [''];
    parcelProjectSelectedDropDownName = parcelProjectsDropDownModel[0];
    ParcelProjectsDropDown model = await FarmComputerParcelsDropDownClient.getParcelsProjectsDropDown();
    parcelProjectsDropDownModel.addAll(model.data!);
    List<String> list = await FarmComputerParcelsDropDownClient.getContactMomentTypeDropDown();
    contactTypeDropDownList.addAll(list);
  }
  ///   search name
  String contactSummary = '';

  /// project search
  var listofProjectInContact = <ProjectData>[];
  List<ProjectData> parcelProjectsDropDownModel = [ProjectData(id: -1, name: '')];
  ProjectData? parcelProjectSelectedDropDownName;
  /// Contact type search
  var listofSelectedContact = [];
  var contactTypeDropDownList = <String>[''];
  String? contactType_selected_dopDown = '';
  ///     date search
  final TextEditingController startdate = TextEditingController(), endDate = TextEditingController();

  /// sorting
  List<String> selectList = <String>['', 'A-Z', 'Z-A'];
  String? sortSelected = '';




}
