// //import 'dart:developer';

// import 'package:flutter/material.dart';

// import '../../api_clients/farm_computer_parcels_drop_down_client.dart';
// import '../../models/farm_computer_dropdown/farm_files_dropdown.dart';

// class FarmComputerFilesDropdownProvider extends ChangeNotifier {
//   /// Farm computer parcels project dropdown list////////////

//   String computerFiles = "";
//   late List<String> filesList = [];
//   List<int>? filesListID = [];
//   late FarmComputerFilesDropdown computerFilesDropDownModel;

//   getFarmComputerFilesDropDown() async {
//     computerFilesDropDownModel =
//         await FarmComputerParcelsDropDownClient.getComputerFilesDropDown();
//     // for (int i = 0; i < computerFilesDropDownModel.data!.length; i++) {
//     //   filesList.add(computerFilesDropDownModel.data![i].name!);
//     //   log(filesList[i]);
//     //   notifyListeners();
//     // }

//     computerFiles = computerFilesDropDownModel.data![0].name!;

//     notifyListeners();
//   }
// }
