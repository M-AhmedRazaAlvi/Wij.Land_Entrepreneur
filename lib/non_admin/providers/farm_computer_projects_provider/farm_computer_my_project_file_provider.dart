import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../api_clients/farm_computer_project_clients.dart';
import '../../models/farm_computer_project/farm_computer_project_files/get_farm_computer_my_project_file_response.dart';

class CreateFarmComputerMyProjectFileProvider extends ChangeNotifier {
  GetFarmComputerMyProjectFileResponse? _farmComputerMyProjectFileResponseModels;

  GetFarmComputerMyProjectFileResponse get farmComputerMyProjectFileResponseModel => _farmComputerMyProjectFileResponseModels!;
  bool _isLoading = false;

  get isLoading => _isLoading;
  bool hasData = false;
  List<bool> _checkedBool = <bool>[];

  List<bool> get getcheckedBool => _checkedBool;
  List<bool> mediaBool = <bool>[];
  List<bool> documentBool = <bool>[];
  List<int> docxLength = [];

  Future getFarmComputerMyProjectFile({required int projectId}) async {
    mediaBool = <bool>[];
    documentBool = <bool>[];
    docxLength = <int>[];
    _farmComputerMyProjectFileResponseModels = await FarmComputerProjectClients.getFarmComputerMyProjectFileId(projectId: projectId);
    if (farmComputerMyProjectFileResponseModel.error?.status != 404) {
      for (int i = 0; i < farmComputerMyProjectFileResponseModel.data!.length; i++) {
        // docxLength.add(i);
        if (farmComputerMyProjectFileResponseModel.data![i].type == "Media") {
          mediaBool.add(true);
        } else {
          documentBool.add(true);
        }

        if (farmComputerMyProjectFileResponseModel.data![i].isFavourite != null) {
          if (farmComputerMyProjectFileResponseModel.data![i].isFavourite == "true") {
            _checkedBool.insert(i, true);
          } else {
            _checkedBool.insert(i, false);
          }
        } else {
          _checkedBool.insert(i, false);
        }
      }
    }
    if (_farmComputerMyProjectFileResponseModels!.error?.status != 400) {
      hasData = true;
      notifyListeners();
    }
    notifyListeners();
  }
  Future getFCProjectMyWijLandBookmarksFiles({required int projectId}) async {
    mediaBool = <bool>[];
    documentBool = <bool>[];
   _farmComputerMyProjectFileResponseModels = await FarmComputerProjectClients.getMyProjectFileWijLandBookMark(projectId: projectId);
    if (farmComputerMyProjectFileResponseModel.error?.status != 404) {
      for (int i = 0; i < farmComputerMyProjectFileResponseModel.data!.length; i++) {
        if (farmComputerMyProjectFileResponseModel.data![i].type == "Media") {
          mediaBool.add(true);
        } else {
          documentBool.add(true);
        }

        if (farmComputerMyProjectFileResponseModel.data![i].isFavourite != null) {
          if (farmComputerMyProjectFileResponseModel.data![i].isFavourite == "true") {
            _checkedBool.insert(i, true);
          } else {
            _checkedBool.insert(i, false);
          }
        } else {
          _checkedBool.insert(i, false);
        }
      }
    }
    if (_farmComputerMyProjectFileResponseModels!.error?.status != 400) {
      hasData = true;
      notifyListeners();
    }
    notifyListeners();
  }

  Future getFCProjectMyBookmarksFiles({required int projectId}) async {
    mediaBool = <bool>[];
    documentBool = <bool>[];
    _farmComputerMyProjectFileResponseModels = await FarmComputerProjectClients.getFCProjectMyBookmarksFileId(projectId: projectId);
    if (farmComputerMyProjectFileResponseModel.error?.status != 404) {
      for (int i = 0; i < farmComputerMyProjectFileResponseModel.data!.length; i++) {
        if (farmComputerMyProjectFileResponseModel.data![i].type == "Media") {
          mediaBool.add(true);
        } else {
          documentBool.add(true);
        }

        if (farmComputerMyProjectFileResponseModel.data![i].isFavourite != null) {
          if (farmComputerMyProjectFileResponseModel.data![i].isFavourite == "true") {
            _checkedBool.insert(i, true);
          } else {
            _checkedBool.insert(i, false);
          }
        } else {
          _checkedBool.insert(i, false);
        }
      }
    }
    if (_farmComputerMyProjectFileResponseModels!.error?.status != 400) {
      hasData = true;
      notifyListeners();
    }
    notifyListeners();
  }

  Future getFCProjectMyContractFiles({required int projectId}) async {
    mediaBool = <bool>[];
    documentBool = <bool>[];
    _farmComputerMyProjectFileResponseModels = await FarmComputerProjectClients.getFCProjectMyContractsFileId(projectId: projectId);
    if (farmComputerMyProjectFileResponseModel.error?.status != 404) {
      for (int i = 0; i < farmComputerMyProjectFileResponseModel.data!.length; i++) {
        if (farmComputerMyProjectFileResponseModel.data![i].type == "Media") {
          mediaBool.add(true);
        } else {
          documentBool.add(true);
        }
        if (farmComputerMyProjectFileResponseModel.data![i].isFavourite != null) {
          if (farmComputerMyProjectFileResponseModel.data![i].isFavourite == "true") {
            _checkedBool.insert(i, true);
          } else {
            _checkedBool.insert(i, false);
          }
        } else {
          _checkedBool.insert(i, false);
        }
      }
    }
    if (_farmComputerMyProjectFileResponseModels!.error?.status != 400) {
      hasData = true;
      notifyListeners();
    }
    notifyListeners();
  }

  String? response;

  updateMyProjectFileFavouritesInterest({required int fileID, required bool favourites}) async {
    response = await FarmComputerProjectClients.updateMyProjectFavouriteId(fileId: fileID, favourites: favourites);
    notifyListeners();
  }
}
