// import 'package:flutter/cupertino.dart';
// import 'package:wij_land/non_admin/api_clients/farm_computer_parcels_drop_down_client.dart';

// import '../../models/farm_computer_dropdown/parcel_land_function_drop_down.dart';
// import '../../models/farm_computer_dropdown/parcel_land_management_drop_down.dart';
// import '../../models/farm_computer_dropdown/parcel_organizations_drop_down.dart';
// import '../../models/farm_computer_dropdown/parcel_ownership_drop_down.dart';
// import '../../models/farm_computer_dropdown/parcel_purpose_drop_down.dart';

// class FarmComputerDropDownProvider extends ChangeNotifier {
//   // String parcelPurposeDropdownName = "";
//   // String parcelPurposeDropdownID = "";

// // get parcel purpose drop down data
//   ParcelPurposesDropDown _parcelPurposesDropDown = ParcelPurposesDropDown();
//   ParcelPurposesDropDown get parcelPurposesDropDown => _parcelPurposesDropDown;
//   bool _isLoading = false;
//   get isLoading => _isLoading;

//   // getParcelPurposeDropDown() async {
//   //   _parcelPurposesDropDown =
//   //       await FarmComputerParcelsDropDownClient.getParcelPurposeDetailData();
//   //   parcelPurposeDropdownName = _parcelPurposesDropDown.data![0].name!;
//   //   _isLoading = true;

//   //   notifyListeners();
//   // }

// // get parcel Ownership drop down data
// //   ParcelOwnershipDropDown _parcelOwnershipDropDown = ParcelOwnershipDropDown();
// //   ParcelOwnershipDropDown get parcelOwnershipDropDown =>
// //       _parcelOwnershipDropDown;

// //   getParcelOwnershipDropDown() async {
// //     _parcelOwnershipDropDown =
// //         await FarmComputerParcelsDropDownClient.getParcelOwnershipDetailData();
// //     _isLoading = true;
// //     notifyListeners();
// //   }

// // // get parcel Organizations drop down data
// //   ParcelOrganizationsDropDown _parcelOrganizationsDropDown =
// //       ParcelOrganizationsDropDown();
// //   ParcelOrganizationsDropDown get parcelorganizationsDropDown =>
// //       _parcelOrganizationsDropDown;

// //   getParcelOrganizationsDropDown() async {
// //     _parcelOrganizationsDropDown = await FarmComputerParcelsDropDownClient
// //         .getParcelOrganizationsDetailData();
// //     _isLoading = true;
// //     notifyListeners();
// //   }

// //   // get parcel Land Management drop down data
// //   ParcelLandManagementDropDown _parcelLandManagementDropDown =
// //       ParcelLandManagementDropDown();
// //   ParcelLandManagementDropDown get parcelLandManagementDropDown =>
// //       _parcelLandManagementDropDown;

// //   getParcelLandManagementDropDown() async {
// //     _parcelLandManagementDropDown = await FarmComputerParcelsDropDownClient
// //         .getParcelLandManagementDetailData();
// //     _isLoading = true;
// //     notifyListeners();
// //   }

// //   // get parcel Land Function drop down data
// //   ParcelLandFunctionDropDown _parcelLandFunctionDropDown =
// //       ParcelLandFunctionDropDown();
// //   ParcelLandFunctionDropDown get parcelLandFunctionDropDown =>
// //       _parcelLandFunctionDropDown;

// //   getParcelLandFunctionDropDown() async {
// //     _parcelLandFunctionDropDown = await FarmComputerParcelsDropDownClient
// //         .getParcelLandFunctionDetailData();
// //     _isLoading = true;
// //     notifyListeners();
// //   }

// //   Future getAllDropDown() async {
// //     // getParcelPurposeDropDown();
// //     getParcelLandFunctionDropDown();
// //     getParcelLandManagementDropDown();
// //     getParcelOrganizationsDropDown();
// //     getParcelOwnershipDropDown();
// //     notifyListeners();
// //   }
// }
