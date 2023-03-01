import 'dart:convert';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/non_admin/models/farm_computer_dropdown/parcel_land_function_drop_down.dart';
import 'package:wij_land/non_admin/models/farm_computer_dropdown/parcel_land_management_drop_down.dart';
import 'package:wij_land/non_admin/models/farm_computer_dropdown/parcel_organizations_drop_down.dart';
import 'package:wij_land/non_admin/models/farm_computer_dropdown/parcel_ownership_drop_down.dart';
import 'package:wij_land/non_admin/models/farm_computer_dropdown/parcel_purpose_drop_down.dart'
    as purp;
import 'package:wij_land/non_admin/models/farm_computer_parcels/request/put_farm_computer_parcel_request.dart';
import 'package:wij_land/non_admin/providers/farm_computer_parcels_provider/farm_computer_parcels_provider.dart';
import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../app_common_widgets/text_widget.dart';
import '../../../../screens/office/widgets/add_text_button_widget.dart';
import '../../../../utils/controller.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../../app_common_widgets/MapWithPolygon.dart';
import '../../../models/farm_computer_parcels/request/UploadParcelModel.dart';
import '../../../models/farm_computer_parcels/response/get_farm_computer_parcels_response.dart';
import '../../../models/farm_computer_parcels/response/localfile.dart';

FarmComputerParcelsProvider? model;

class EditFarmerParcelDialog extends StatefulWidget {
  int? parcelID;
  String locationDescription;
  String area;
  String ownership;
  String purpose;
  String landFunction;
  String landManagement;
  ParcelData parcelData;
  // final args;
  EditFarmerParcelDialog(
      {

      // this.args,
      required this.parcelID,
      required this.locationDescription,
      required this.area,
      required this.ownership,
      required this.purpose,
      required this.landFunction,
      required this.landManagement,
      required this.parcelData});

  @override
  State<EditFarmerParcelDialog> createState() => _EditFarmerParcelDialogState();
}

class _EditFarmerParcelDialogState extends State<EditFarmerParcelDialog> {
  TextEditingController parcelName = TextEditingController();
  TextEditingController parcelDescription = TextEditingController();
  TextEditingController parcelHectares = TextEditingController();
  bool loadData = false;
  ParcelData? parcelData;
  Parseddata? parseMapFileData;
  List<latLng.LatLng> listOfLatLng = [];
  bool reLoadMap = false;

  @override
  void initState() {
    loadData = true;
    getData();

    loadData = false;
    super.initState();
  }

  getData() {
    parcelData = widget.parcelData;
    listOfLatLng = parcelData!.parcelMapInformation!.listOfLatLng;
    parcelName.text = parcelData!.parcelName ?? '';
    parcelDescription.text = parcelData!.locationDescription ?? '';
    parcelHectares.text =
        parcelData!.area == null ? '' : parcelData!.area!.split(',')[0];
    var data = Provider.of<FarmComputerParcelsProvider>(context, listen: false);
    data.parcelPurposeDropdownName = '${data.parcelPurposesDropDown.data![0].name}';

    data.parcelPurposeDropdownID =
        data.parcelPurposesDropDown.data![0].id ?? "";

    data.parcelLandFunction =
        data.parcelLandFunctionDropDown.data![0].name ?? "";
    data.parcelLandFunctionID =
        data.parcelLandFunctionDropDown.data![0].id ?? "";

    data.parcelOwnership = data.parcelOwnershipDropDown.data![0].name ?? "";
    data.parcelOwnershipID = data.parcelOwnershipDropDown.data![0].id ?? "";
    data.parcelLandManagement =
        data.parcelLandManagementDropDown.data![0].name ?? "";
    data.parcelLandManagementID =
        data.parcelLandManagementDropDown.data![0].id ?? "";

    data.parcelOrganization =
        data.parcelOrganizationsDropDown.data![0].name ?? "";
    data.parcelOrganizationID =
        '${data.parcelOrganizationsDropDown.data![0].id ?? ""}';
    ////For editing parcels values//////

    widget.locationDescription =
        data.farmComputerParcelsResponseModel.data![0].locationDescription!;
    widget.area =
        data.farmComputerParcelsResponseModel.data![0].area!.toString();
    widget.landFunction =
        data.farmComputerParcelsResponseModel.data![0].landFunction!;
    widget.landManagement =
        data.farmComputerParcelsResponseModel.data![0].landManagement!;
    widget.ownership =
        data.farmComputerParcelsResponseModel.data![0].ownership!;
    widget.purpose = data.farmComputerParcelsResponseModel.data![0].purpose!;
  }

  @override
  void dispose() {
    Provider.of<FarmComputerParcelsProvider>(context, listen: false)
        .jsonFileID = '';
    Provider.of<FarmComputerParcelsProvider>(context, listen: false)
        .parcelPictureID = '';
    super.dispose();
  }

  FilePickerResult? fileresult;
  bool scrolable = true;
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<FarmComputerParcelsProvider>(context);
    return SingleChildScrollView(
      physics:
          scrolable ? BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
      child: SizedBox(
        child: loadData
            ? Center(child: CircularProgressIndicator())
            : AlertDialog(
                title: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Edit Parcel".tr(),
                        size: 30,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                content: loadData
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: 150,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : SizedBox(
                        width: getWidth(context) * 0.6,
                        child: Column(
                          children: [
                            Wrap(
                              spacing: 20,
                              runSpacing: 5,
                              children: [
                                SizedBox(
                                  width: !Responsive.isDesktop(context)
                                      ? getWidth(context)
                                      : getWidth(context) * 0.28,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Wrap(
                                        children: [
                                          CustomText(
                                            text: "Farm Name:".tr(),
                                            size: 18,
                                            weight: FontWeight.bold,
                                          ),
                                          CustomText(
                                            textAligns: TextAlign.start,
                                            text: authController
                                                .myUser.value.name!,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      CustomText(text: "Parcel Name".tr()),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextWidgetField(
                                        controller: parcelName,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      CustomText(
                                          text: "Parcel Description".tr()),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextWidgetField(
                                        controller: parcelDescription,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      CustomText(text: "Hecteres".tr()),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextWidgetField(
                                        controller: parcelHectares,
                                        textInputType: TextInputType.number,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      CustomText(text: "Purpose".tr()),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      SizedBox(
                                        child: RealDropDownWidget(
                                          value: data.parcelPurposeDropdownName,
                                          onChanged: (newValue) {
                                            setState(() {
                                              data.parcelPurposeDropdownName =
                                                  newValue;
                                            });
                                            int index = data
                                                .parcelPurposesDropDown.data!
                                                .indexWhere((element) =>
                                                    element.name == newValue);
                                            data.parcelPurposeDropdownID = data
                                                .parcelPurposesDropDown
                                                .data![index]
                                                .id!
                                                .toString();
                                            print(
                                                "valueeeee is=== ${data.parcelPurposeDropdownName}");
                                            print(
                                                "ID is=== ${data.parcelPurposeDropdownID}");
                                          },
                                          items: data
                                              .parcelPurposesDropDown.data!
                                              .map<DropdownMenuItem<String>>(
                                                  (purp.PurposeData value) {
                                            return DropdownMenuItem<String>(
                                                value: value.name.toString(),
                                                child: Text(
                                                    value.name.toString(),style: TextStyle(fontFamily: Montserrat_Medium),));
                                          }).toList(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      CustomText(text: "Ownership".tr()),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      RealDropDownWidget(
                                        value: data.parcelOwnership,
                                        onChanged: (newValue) {
                                          setState(() {
                                            data.parcelOwnership = newValue;
                                            print(
                                                "valueeeee is=== ${data.parcelOwnership}");
                                          });
                                          int index = data
                                              .parcelOwnershipDropDown.data!
                                              .indexWhere((element) =>
                                                  element.name == newValue);
                                          data.parcelOwnershipID = data
                                              .parcelOwnershipDropDown
                                              .data![index]
                                              .id!
                                              .toString();
                                        },
                                        items: data
                                            .parcelOwnershipDropDown.data!
                                            .map<DropdownMenuItem<String>>(
                                                (OwnerShipData value) {
                                          return DropdownMenuItem<String>(
                                              value: value.name.toString(),
                                              child:
                                                  Text(value.name.toString(),style: TextStyle(fontFamily: Montserrat_Medium),));
                                        }).toList(),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      CustomText(text: "Land Function".tr()),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      RealDropDownWidget(
                                        value: data.parcelLandFunction,
                                        onChanged: (newValue) {
                                          setState(() {
                                            data.parcelLandFunction = newValue;
                                            print(
                                                "valueeeee is=== ${data.parcelLandFunction}");
                                          });
                                          int index = data
                                              .parcelLandFunctionDropDown.data!
                                              .indexWhere((element) =>
                                                  element.name == newValue);
                                          data.parcelLandFunctionID = data
                                              .parcelLandFunctionDropDown
                                              .data![index]
                                              .id!
                                              .toString();
                                        },
                                        items: data
                                            .parcelLandFunctionDropDown.data!
                                            .map<DropdownMenuItem<String>>(
                                                (LandFunctionData value) {
                                          return DropdownMenuItem<String>(
                                              value: value.name.toString(),
                                              child:
                                                  Text(value.name.toString(),style: TextStyle(fontFamily: Montserrat_Medium),));
                                        }).toList(),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      CustomText(text: "Land Management".tr()),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      RealDropDownWidget(
                                        value: data.parcelLandManagement,
                                        onChanged: (newValue) {
                                          setState(() {
                                            data.parcelLandManagement =
                                                newValue;
                                            print(
                                                "valueeeee is=== ${data.parcelLandManagement}");
                                          });
                                          int index = data
                                              .parcelLandManagementDropDown
                                              .data!
                                              .indexWhere((element) =>
                                                  element.name == newValue);
                                          data.parcelLandManagementID = data
                                              .parcelLandManagementDropDown
                                              .data![index]
                                              .id!
                                              .toString();
                                        },
                                        items: data
                                            .parcelLandManagementDropDown.data!
                                            .map<DropdownMenuItem<String>>(
                                                (LandMangementData value) {
                                          return DropdownMenuItem<String>(
                                              value: value.name.toString(),
                                              child:
                                                  Text(value.name.toString(),style: TextStyle(fontFamily: Montserrat_Medium),));
                                        }).toList(),
                                      ),
                                      CustomText(
                                          text: "Organization Name".tr()),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      RealDropDownWidget(
                                        value: data.parcelOrganization,
                                        onChanged: (newValue) {
                                          setState(() {
                                            data.parcelOrganization = newValue;
                                            print(
                                                "valueeeee is=== ${data.parcelOrganizationID}");
                                          });
                                          int index = data
                                              .parcelOrganizationsDropDown.data!
                                              .indexWhere((element) =>
                                                  element.name == newValue);
                                          data.parcelOrganizationID = data
                                              .parcelOrganizationsDropDown
                                              .data![index]
                                              .id!
                                              .toString();
                                        },
                                        items: data
                                            .parcelOrganizationsDropDown.data!
                                            .map<DropdownMenuItem<String>>(
                                                (LandOrganizationData value) {
                                          return DropdownMenuItem<String>(
                                              value: value.name.toString(),
                                              child:
                                                  Text(value.name.toString(),style: TextStyle(fontFamily: Montserrat_Medium),));
                                        }).toList(),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      CustomText(
                                          text: "Upload Parcel Image".tr()),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Wrap(
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              data.pickUserImage();

                                              //Here we have to post image (by upload image method ) then we will get this image and
                                              //image id . Then we will pass on update button.

                                              //setState(() {});
                                            },
                                            child: DottedBorder(
                                                padding: EdgeInsets.all(30),
                                                child: Icon(Icons.add)),
                                          ),
                                          Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 20),
                                              alignment: Alignment.center,
                                              height: getHeight(context) * 0.2,
                                              width: getWidth(context) * 0.2,
                                              child: data.mPickedImage == null
                                                  ? Text("Select Image".tr(),style: TextStyle(fontFamily: Montserrat_Medium),)
                                                  : Image.memory(
                                                      data.mUserImagePath,
                                                      fit: BoxFit.cover,
                                                    ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),

                                ////////////////////////second////////////////////////
                                SizedBox(
                                    width: !Responsive.isDesktop(context)
                                        ? getWidth(context) * 0.32
                                        : getWidth(context) * 0.28,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            text: "Add Parcel Location".tr()),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          height: 350,
                                          child: reLoadMap
                                              ? Center(
                                                  child:
                                                      CircularProgressIndicator())
                                              : Builder(builder: (context) {
                                                  List<List<latLng.LatLng>>?
                                                      listOfPolygon = [];
                                                  List<String> labelList = [];
                                                  if (listOfLatLng.isNotEmpty) {
                                                    labelList.add(
                                                        '${parcelData!.parcelName}');
                                                    listOfPolygon
                                                        .add(listOfLatLng);
                                                  }
                                                  return MouseRegion(
                                                    onEnter: (v) {
                                                      setState(() {
                                                        scrolable = false;
                                                      });
                                                    },
                                                    onExit: (v) {
                                                      setState(() {
                                                        scrolable = true;
                                                      });
                                                    },
                                                    child: MapWithPolygon(
                                                      listOfPolygon:
                                                          listOfPolygon,
                                                      indexList: [],
                                                      labelList: labelList,
                                                      hasSingleItem: true,
                                                      selectedParcel: '',
                                                    ),
                                                  );
                                                }),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          width: getWidth(context) * 0.26,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                          ),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black26),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Wrap(
                                            children: [
                                              TextButton(
                                                  onPressed: () async {
                                                    fileresult =
                                                        await FilePicker
                                                            .platform
                                                            .pickFiles(
                                                      type: FileType.custom,
                                                      allowMultiple: false,
                                                      allowedExtensions: [
                                                        'geojson'
                                                      ],
                                                    );
                                                    if (fileresult != null) {
                                                      setState(() {
                                                        reLoadMap = true;
                                                      });
                                                      String fileContent = utf8
                                                          .decode(fileresult!
                                                              .files
                                                              .first
                                                              .bytes!);
                                                      parseMapFileData =
                                                          Parseddata.fromJson(
                                                              json.decode(
                                                                  fileContent));
                                                      print(
                                                          "Read Data ========${parseMapFileData!.features![0].geometry!.coordinates}");
                                                      List<List<double>>
                                                          listoflongLat =
                                                          parseMapFileData!
                                                                  .features![0]
                                                                  .geometry!
                                                                  .coordinates![
                                                              0][0];
                                                      listOfLatLng = [];
                                                      for (var i
                                                          in listoflongLat) {
                                                        listOfLatLng.add(
                                                            latLng.LatLng(
                                                                i[1], i[0]));
                                                      }
                                                      Future.delayed(
                                                          Duration(
                                                              milliseconds:
                                                                  300), () {
                                                        setState(() {
                                                          reLoadMap = false;
                                                        });
                                                      });
                                                    }
                                                  },
                                                  child: CustomText(
                                                    text: "Select File".tr(),
                                                  )),
                                              Responsive.isDesktop(context)
                                                  ? Container(
                                                      width: 1,
                                                      color: Colors.black26,
                                                      height: 40,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 20),
                                                    )
                                                  : SizedBox.shrink(),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: CustomText(
                                                  text:
                                                      "Upload Shape File".tr(),
                                                  color: Colors.black38,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                actions: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AddTextButtonWidget(
                          text: "Cancel".tr(),
                          colors: Colors.white60,
                          onPress: () {
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        AddTextButtonWidget(
                          text: "Update Parcel".tr(),
                          colors: Colors.yellow,
                          onPress: () async {
                            print("Check step 1");
                            setState(() {
                              loadData = true;
                            });
                            print(
                                "Check step 2 ${data.isImagePicked.toString()}");
                            if (data.isImagePicked == true) {
                              print("Api call check with Image");
                              await data.uploadFarmerImage(
                                file: data.mPickedImage!,
                                parcelID: widget.parcelID!,
                              );
                              print("Check step 3");
                            }
                            UploadParcelModel? parcelmodel;
                            if (parseMapFileData != null) {
                              print('update pharse map file');
                              parcelmodel = UploadParcelModel.fromJson(
                                  parseMapFileData!.toJson());
                            }
                            print('step1');

                            if (data.parcelPictureID != null) {
                              print(
                                  "parcel id is check ${data.parcelPictureID}");
                              print("parcel id is not null");
                              Parcel parcelsData = Parcel(
                                  agricultureOrNature: data.parcelLandFunction,
                                  hectares: parcelHectares.text.toString(),
                                  homeOrFieldParcel:
                                      data.parcelPurposeDropdownName,
                                  ownedOrLeased: data.parcelOwnership,
                                  locationDescription: parcelDescription.text,
                                  managementType: data.parcelLandManagement,
                                  nameLocation: parcelName.text,
                                  ifLeasedFromWho: data.parcelOwnership,
                                  organizationId: data.parcelOrganizationID,
                                  parcelPictureId: data.parcelPictureID ?? "",
                                  parcelModel: parseMapFileData != null
                                      ? parcelmodel!.toJson()
                                      : null);
                              PutFarmComputerParcelsRequest request =
                                  PutFarmComputerParcelsRequest(
                                      parcel: parcelsData);
                              await data.updateFarmComputerParcels(
                                  parcelID: widget.parcelID!,
                                  requestBody: request);
                            } else {
                              print("parcel id is null");
                              Parcel parcelsData = Parcel(
                                  agricultureOrNature: data.parcelLandFunction,
                                  hectares: parcelHectares.text.toString(),
                                  homeOrFieldParcel:
                                      data.parcelPurposeDropdownName,
                                  ownedOrLeased: data.parcelOwnership,
                                  locationDescription: parcelDescription.text,
                                  managementType: data.parcelLandManagement,
                                  nameLocation: parcelName.text,
                                  ifLeasedFromWho: data.parcelOwnership,
                                  organizationId: data.parcelOrganizationID,
                                  parcelPictureId: "",
                                  parcelModel: parseMapFileData != null
                                      ? parcelmodel!.toJson()
                                      : null);
                              PutFarmComputerParcelsRequest request =
                                  PutFarmComputerParcelsRequest(
                                      parcel: parcelsData);
                              await data.updateFarmComputerParcels(
                                  parcelID: widget.parcelID!,
                                  requestBody: request);
                            }

                            //             print('step2');

                            // print('step3 ${request.toJson()}');
                            // print('step4');
                            setState(() {
                              loadData = false;
                            });
                            Navigator.of(context).pop('reload');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
