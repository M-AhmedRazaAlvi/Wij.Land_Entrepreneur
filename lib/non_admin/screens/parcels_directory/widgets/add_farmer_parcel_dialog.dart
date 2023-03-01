import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/non_admin/models/farm_computer_parcels/request/post_farm_computer_parcel_request.dart';
import 'package:wij_land/non_admin/providers/farm_computer_parcels_provider/farm_computer_parcels_provider.dart';
import 'package:wij_land/screens/office/widgets/comment_text.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:wij_land/utils/styles.dart';
import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../app_common_widgets/text_widget.dart';
import '../../../../screens/farm_networks/farms/farm_screens/Parcels/Widget/map_info.dart';
import '../../../../screens/office/widgets/add_text_button_widget.dart';
import '../../../../utils/controller.dart';
import '../../../../utils/functions.dart';
import '../../../app_common_widgets/MapWithPolygon.dart';
import '../../../models/farm_computer_dropdown/parcel_land_management_drop_down.dart';
import '../../../models/farm_computer_parcels/request/UploadParcelModel.dart';
import '../../../models/farm_computer_parcels/response/get_farm_computer_parcels_response.dart';

class AddFarmerParcelDialog extends StatefulWidget {
  final List<ParcelData>? parceldata;

  const AddFarmerParcelDialog({
    Key? key,
    this.parceldata,
  }) : super(key: key);

  @override
  State<AddFarmerParcelDialog> createState() => _AddFarmerParcelDialogState();
}

class _AddFarmerParcelDialogState extends State<AddFarmerParcelDialog> {
  int steps = 1;
  bool isloading = false;
  bool mapSelect = false;
  bool finalNext = false;
  TextEditingController parcelName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController wijlandName = TextEditingController();
  List<ParcelData>? parceldata;
  bool isdropDownEmpty = true;
  String newdropdownValue = "";

  @override
  void initState() {
    firstAttempt = false;
    parceldata = widget.parceldata;
    // Provider.of<FarmComputerParcelsProvider>(context, listen: false)
    //     .parcelLandManagement = "";
    print(
        "data========${Provider.of<FarmComputerParcelsProvider>(context, listen: false).parcelLandManagement}");
    Provider.of<FarmComputerParcelsProvider>(context, listen: false)
        .isFIlePicked = false;
    super.initState();
  }

  bool selectFromMap = false;

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<FarmComputerParcelsProvider>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: AlertDialog(
              title: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomText(
                            textAligns: TextAlign.start,
                            text: "Add Parcel to Farm of ".tr() +
                                "${authController.myUser.value.name}",
                            size: 18,
                            weight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              content: Container(
                width: MediaQuery.of(context).size.width * 0.33,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: getWidth(context),
                        child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            MapInfoButton(
                              text: "Step 1: Map".tr(),
                              allClicked: steps == 1 ? true : false,
                            ),
                            InkWell(
                              onTap: () {
                                if (data.isFirstTabRequirments == true) {
                                  setState(() {
                                    steps = 2;
                                  });
                                }
                              },
                              child: MapInfoButton(
                                text: "Step 2: Basics".tr(),
                                allClicked: steps == 2 ? true : false,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (data.isFirstTabRequirments == true) {
                                  setState(() {
                                    steps = 3;
                                  });
                                }
                              },
                              child: MapInfoButton(
                                text: "Step 3: Confirm".tr(),
                                allClicked: steps == 3 ? true : false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      steps == 1
                          ? selectFromMap
                              ? Container(
                                  height: 400,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 15),
                                      Expanded(
                                        child: Builder(
                                          builder: (context) {
                                            List<List<latLng.LatLng>>?
                                                listOfPolygon = [];
                                            List<String> labelList = [];
                                            List<int> indexList = [];
                                            for (var i in parceldata!) {
                                              if (i.parcelMapInformation!
                                                  .listOfLatLng.isNotEmpty) {
                                                int index =
                                                    parceldata!.indexOf(i);
                                                indexList.add(index);
                                                labelList
                                                    .add('${i.parcelName}');
                                                listOfPolygon.add(i
                                                    .parcelMapInformation!
                                                    .listOfLatLng);
                                              }
                                            }
                                            return MapWithPolygon(
                                              listOfPolygon: listOfPolygon,
                                              indexList: indexList,
                                              labelList: labelList,
                                              selectedParcel: '',
                                              outerPadding: 20,
                                              showgreen: true,
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                color: dimGreen,
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text('Farm Parcels'.tr(),
                                              style: TextStyle(fontSize: 12,fontFamily: Montserrat_Medium)),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            height: 30,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                color: newRed,
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text('Selected'.tr(),
                                              style: TextStyle(fontSize: 12,fontFamily: Montserrat_Medium)),
                                        ],
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  ))
                              : Container(
                                  padding: EdgeInsets.all(30),
                                  width: getWidth(context),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectFromMap = true;
                                          });
                                        },
                                        child: SizedBox(
                                          height: 120,
                                          child: SizedBox(
                                              height: 100,
                                              child: Container(
                                                width: getWidth(context),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 30),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Column(
                                                  children: [
                                                    CustomText(
                                                      text: "Select From map"
                                                          .tr(),
                                                      size: 14,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Icon(Icons.map, size: 30),
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await data.pickUserMap();
                                          if (data.isFIlePicked == true) {
                                            setState(() {
                                              steps = 2;
                                            });
                                          }
                                        },
                                        child: SizedBox(
                                            height: 120,
                                            child: Container(
                                              width: getWidth(context),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 30),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: Column(
                                                children: [
                                                  CustomText(
                                                    text: "Select From Local"
                                                        .tr(),
                                                    size: 14,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Icon(Icons.upload, size: 30),
                                                ],
                                              ),
                                            )),
                                      )
                                    ],
                                  ),
                                )
                          : steps == 2
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        height: 420,
                                        alignment: Alignment.center,
                                        width: getWidth(context),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: "Parcel Name".tr(),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Builder(
                                                builder: (context) => SizedBox(
                                                      height: 40,
                                                      child: TextWidgetField(
                                                        controller: parcelName,
                                                      ),
                                                    )),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            CustomText(
                                              text: "Wij.land Name".tr(),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Builder(
                                                builder: (context) => SizedBox(
                                                      height: 40,
                                                      child: TextWidgetField(
                                                        hintText: data
                                                            .farmComputerFarmNameResponse
                                                            .data!
                                                            .nameAuto,
                                                        enabled: false,
                                                      ),
                                                    )),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            CustomText(
                                                text: "Management Type".tr()),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            SizedBox(
                                              height: 40,
                                              child: RealDropDownWidget(
                                                value:
                                                    data.parcelLandManagement,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    data.parcelLandManagement =
                                                        newValue;
                                                    print(
                                                        "new valueeeee is=== ${data.parcelLandManagement}");
                                                    print(
                                                        "Valuee is=== ${newdropdownValue}");
                                                  });
                                                  int index = data
                                                      .parcelLandManagementDropDown
                                                      .data!
                                                      .indexWhere((element) =>
                                                          element.name ==
                                                          newValue);
                                                  data.parcelLandManagementID = data
                                                      .parcelLandManagementDropDown
                                                      .data![index]
                                                      .id!
                                                      .toString();
                                                },
                                                items: data
                                                    .parcelLandManagementDropDown
                                                    .data!
                                                    .map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                        (LandMangementData
                                                            value) {
                                                  return DropdownMenuItem<
                                                          String>(
                                                      value:
                                                          value.name.toString(),
                                                      child: Text(value.name
                                                          .toString(),style: TextStyle(fontFamily: Montserrat_Medium),));
                                                }).toList(),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            CustomText(
                                                text: "Description".tr()),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            CommentTextField(
                                              controller: description,
                                            )
                                          ],
                                        )),
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        height: 650,
                                        alignment: Alignment.center,
                                        width: getWidth(context),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: "Parcel Name".tr(),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Builder(
                                                builder: (context) => SizedBox(
                                                      height: 40,
                                                      child: TextWidgetField(
                                                        controller: parcelName,
                                                      ),
                                                    )),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            CustomText(
                                              text: "Wij.land Name".tr(),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Builder(
                                                builder: (context) => SizedBox(
                                                      height: 40,
                                                      child: TextWidgetField(
                                                        hintText: data
                                                            .farmComputerFarmNameResponse
                                                            .data!
                                                            .nameAuto,
                                                        enabled: false,
                                                      ),
                                                    )),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            CustomText(
                                                text: "Management Type".tr()),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            SizedBox(
                                              height: 40,
                                              child: RealDropDownWidget(
                                                value:
                                                    data.parcelLandManagement,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    data.parcelLandManagement =
                                                        newValue;
                                                    newdropdownValue = newValue;

                                                    print(
                                                        "newValuee is=== ${newdropdownValue.toString()}");
                                                    print(
                                                        "valueeeee is=== ${data.parcelLandManagement}");
                                                  });
                                                  int index = data
                                                      .parcelLandManagementDropDown
                                                      .data!
                                                      .indexWhere((element) =>
                                                          element.name ==
                                                          newValue);
                                                  data.parcelLandManagementID = data
                                                      .parcelLandManagementDropDown
                                                      .data![index]
                                                      .id!
                                                      .toString();
                                                },
                                                items: data
                                                    .parcelLandManagementDropDown
                                                    .data!
                                                    .map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                        (LandMangementData
                                                            value) {
                                                  return DropdownMenuItem<
                                                          String>(
                                                      value:
                                                          value.name.toString(),
                                                      child: Text(value.name
                                                          .toString(),style: TextStyle(fontFamily: Montserrat_Medium),));
                                                }).toList(),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            steps == 3 &&
                                                    isdropDownEmpty &&
                                                    newdropdownValue.isEmpty
                                                ? CustomText(
                                                    text:
                                                        "DropDown can't be empty"
                                                            .tr(),
                                                    size: 11,
                                                    color: Colors.red,
                                                  )
                                                : SizedBox.shrink(),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            CustomText(
                                                text: "Description".tr()),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            CommentTextField(
                                              controller: description,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Expanded(child:
                                                Builder(builder: (context) {
                                              List<List<latLng.LatLng>>?
                                                  listOfPolygon = [];
                                              List<String> labelList = [];
                                              if (data
                                                  .listOfLatLng.isNotEmpty) {
                                                labelList.add('');
                                                listOfPolygon
                                                    .add(data.listOfLatLng);
                                              }
                                              return MapWithPolygon(
                                                listOfPolygon: listOfPolygon,
                                                indexList: [],
                                                labelList: labelList,
                                                hasSingleItem: true,
                                                selectedParcel: '',
                                              );
                                            })),
                                            SizedBox(
                                              height: 5,
                                            )
                                          ],
                                        )),
                                  ],
                                )
                    ],
                  ),
                ),
              ),
              actions: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: AddTextButtonWidget(
                            text: steps == 1 || steps == 2
                                ? "Cancel".tr()
                                : "Back".tr(),
                            colors: Colors.yellow,
                            onPress: () {
                              if (steps == 3) {
                                setState(() {
                                  steps = 2;
                                });
                              } else {
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        if (steps == 3)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SizedBox(
                              width: 100,
                              child: Row(
                                children: [
                                  CustomText(text: " Next parcel".tr())
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(
                          width: 10,
                        ),
                        Visibility(
                          visible: steps == 3 ? false : true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: AddTextButtonWidget(
                              text: "Next".tr(),
                              colors: data.isFIlePicked
                                  ? Colors.yellow
                                  : Colors.yellow.withOpacity(0.5),
                              onPress: () async {
                                setState(() {
                                  steps = 3;
                                });
                              },
                            ),
                          ),
                        ),
                        steps == 3
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: AddTextButtonWidget(
                                  text: "Add".tr(),
                                  colors: Colors.yellow,
                                  onPress: (steps == 3 &&
                                          newdropdownValue.isEmpty)
                                      ? () {
                                          isdropDownEmpty == true;
                                          setState(() {});
                                        }
                                      : () async {
                                          ParcelPlant pp = ParcelPlant(
                                              managementType: data
                                                  .parcelLandManagement
                                                  .split(""));
                                          SelectParcel selectParcel = SelectParcel(
                                              locationDescription:
                                                  description.text,
                                              nameLocation: parcelName.text,
                                              nameAuto: data
                                                  .farmComputerFarmNameResponse
                                                  .data!
                                                  .nameAuto,
                                              parcelPictureId: "",
                                              parcelPlant: pp);
                                          UploadParcelModel parcelModel =
                                              UploadParcelModel.fromJson(
                                                  data.parcelData!.toJson());
                                          PostFarmComputerParcelsRequest
                                              postData =
                                              PostFarmComputerParcelsRequest(
                                                  selectParcel: selectParcel,
                                                  selectedParcel: parcelModel);
                                          await data.createFarmComputerParcels(
                                              postData);
                                          Navigator.of(context).pop('reload');
                                        },
                                ),
                              )
                            : SizedBox.shrink()
                      ]),
                ),
              ],
            ),
          ),
          Visibility(
            child: Container(
              height: getHeight(context),
              width: getWidth(context),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
              child: Center(child: CircularProgressIndicator()),
            ),
            visible: isloading,
          )
        ],
      ),
    );
  }
}
