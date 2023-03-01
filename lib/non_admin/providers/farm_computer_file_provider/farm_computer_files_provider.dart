import 'package:flutter/cupertino.dart';
import 'package:wij_land/non_admin/api_clients/farm_computer_project_clients.dart';
import 'package:wij_land/non_admin/models/farm_computer_files/get_computer_file/response/get_computer_files_response.dart';

import '../../api_clients/farm_computer_parcels_drop_down_client.dart';
import '../../models/farm_computer_dropdown/farm_files_dropdown.dart';

class CreateFarmComputerFilesProvider extends ChangeNotifier {
  GetFarmComputerFilesResponse? _farmComputerFilesResponsceModels;

  GetFarmComputerFilesResponse get farmComputerFilesResponseModel =>
      _farmComputerFilesResponsceModels!;
  final bool _isLoading = false;
  get isLoading => _isLoading;

  List<int> position = [];
  List<bool> expandedListOfBool = [];
  Future getFarmComputerFile({String? value}) async {
    _farmComputerFilesResponsceModels =
        await FarmComputerProjectClients.getFarmComputerFiles(value: value);
    print(
        "Farm Computer files response   length ${_farmComputerFilesResponsceModels!.data!.length} ");
    notifyListeners();
  }

  String computerFiles = "";
  late List<String> filesList = [];
  List<int>? filesListID = [];
  late FarmComputerFilesDropdown computerFilesDropDownModel;

  getFarmComputerFilesDropDown() async {
    computerFilesDropDownModel =
        await FarmComputerParcelsDropDownClient.getComputerFilesDropDown();
    // for (int i = 0; i < computerFilesDropDownModel.data!.length; i++) {
    //   filesList.add(computerFilesDropDownModel.data![i].name!);
    //   log(filesList[i]);
    //   notifyListeners();
    // }

    computerFiles = computerFilesDropDownModel.data![0].name!;

    notifyListeners();
  }
}
