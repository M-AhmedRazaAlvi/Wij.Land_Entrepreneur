import 'package:flutter/cupertino.dart';

import '../../api_clients/farm_computer_project_clients.dart';
import '../../models/farm_computer_project/farm_computer_project_files/get_computer_project_file_response.dart';

class CreateFarmComputerProjectFilesProvider extends ChangeNotifier {
  GetFarmComputerProjectFilesResponse? _farmComputerProjectFileResponsceModels;

  GetFarmComputerProjectFilesResponse get farmComputerProjectFileResponseModel => _farmComputerProjectFileResponsceModels!;
  final bool _isLoading = false;

  get isLoading => _isLoading;
  bool hasData = false;
  final List<bool> _checkedBool = <bool>[];
  List<bool> mediaBool = <bool>[];
  List<bool> documentBool = <bool>[];

  List<bool> get getcheckedBool => _checkedBool;
  List<int> docxLength = [];

  Future getFarmComputerProjectFile({required int projectId}) async {
    mediaBool = <bool>[];
    documentBool = <bool>[];
    docxLength = <int>[];

    _farmComputerProjectFileResponsceModels = await FarmComputerProjectClients.getFarmComputerProjectFileId(projectId: projectId);
    if (_farmComputerProjectFileResponsceModels!.error?.status != 404) {
      for (int i = 0; i < farmComputerProjectFileResponseModel.data!.length; i++) {
       // docxLength.add(i);
        if (farmComputerProjectFileResponseModel.data![i].type == "Media") {
          mediaBool.add(true);
        } else {
          documentBool.add(true);
        }
        if (farmComputerProjectFileResponseModel.data![i].isFavourite != null) {
          print("favorite in project file ===============${farmComputerProjectFileResponseModel.data![i].isFavourite}");

          if (farmComputerProjectFileResponseModel.data![i].isFavourite == "true") {
            _checkedBool.insert(i, true);
          } else {
            _checkedBool.insert(i, false);
          }
        } else {
          _checkedBool.insert(i, false);
        }
      }
    }
    if (_farmComputerProjectFileResponsceModels!.status != 400) {
      hasData = true;
      notifyListeners();
    }
    notifyListeners();
  }
  Future getFCProjectFileWijLandBookmarks({required int projectId}) async {
    mediaBool = <bool>[];
    documentBool = <bool>[];
    _farmComputerProjectFileResponsceModels = await FarmComputerProjectClients.getFCProjectFileWijLandBookmarksId(projectId: projectId);
    if (farmComputerProjectFileResponseModel.error?.status != 404) {
      for (int i = 0; i < farmComputerProjectFileResponseModel.data!.length; i++) {
        if (farmComputerProjectFileResponseModel.data![i].type == "Media") {
          mediaBool.add(true);
        } else {
          documentBool.add(true);
        }
        if (farmComputerProjectFileResponseModel.data![i].isFavourite != null) {
          if (farmComputerProjectFileResponseModel.data![i].isFavourite == "true") {
            _checkedBool.insert(i, true);
          } else {
            _checkedBool.insert(i, false);
          }
        } else {
          _checkedBool.insert(i, false);
        }
      }
    }
    if (farmComputerProjectFileResponseModel.status != 400) {
      hasData = true;
      notifyListeners();
    }

    notifyListeners();
  }
  Future getFCProjectFileBookmarks({required int projectId}) async {
    mediaBool = <bool>[];
    documentBool = <bool>[];
    _farmComputerProjectFileResponsceModels = await FarmComputerProjectClients.getFCProjectFileBookmarksId(projectId: projectId);
    if (farmComputerProjectFileResponseModel.error?.status != 404) {
      for (int i = 0; i < farmComputerProjectFileResponseModel.data!.length; i++) {
        if (farmComputerProjectFileResponseModel.data![i].type == "Media") {
          mediaBool.add(true);
        } else {
          documentBool.add(true);
        }
        if (farmComputerProjectFileResponseModel.data![i].isFavourite != null) {
          if (farmComputerProjectFileResponseModel.data![i].isFavourite == "true") {
            _checkedBool.insert(i, true);
          } else {
            _checkedBool.insert(i, false);
          }
        } else {
          _checkedBool.insert(i, false);
        }
      }
    }
    if (farmComputerProjectFileResponseModel.status != 400) {
      hasData = true;
      notifyListeners();
    }

    notifyListeners();
  }

  Future getFCProjectContractFiles({required int projectId}) async {
    mediaBool = <bool>[];
    documentBool = <bool>[];
    _farmComputerProjectFileResponsceModels = await FarmComputerProjectClients.getFCProjectContractsFile(projectId: projectId);

    if (farmComputerProjectFileResponseModel.error?.status != 404) {
      for (int i = 0; i < farmComputerProjectFileResponseModel.data!.length; i++) {
        if (farmComputerProjectFileResponseModel.data![i].type == "Media") {
          mediaBool.add(true);
        } else {
          documentBool.add(true);
        }
        if (farmComputerProjectFileResponseModel.data![i].isFavourite != null) {
          if (farmComputerProjectFileResponseModel.data![i].isFavourite == "true") {
            _checkedBool.insert(i, true);
          } else {
            _checkedBool.insert(i, false);
          }
        } else {
          _checkedBool.insert(i, false);
        }
      }
    }

    if (farmComputerProjectFileResponseModel.status != 400) {
      hasData = true;
      notifyListeners();
    }

    notifyListeners();
  }

  String? response;

  updateProjectFileFavouriteInterest({required int fileID, required bool favourites}) async {
    response = await FarmComputerProjectClients.updateMyProjectFavouriteId(fileId: fileID, favourites: favourites);

    notifyListeners();
  }
}
