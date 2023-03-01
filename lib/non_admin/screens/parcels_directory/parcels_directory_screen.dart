import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/app_common_widgets/icon_text_container.dart';
import 'package:wij_land/non_admin/providers/farm_computer_parcels_provider/farm_computer_parcels_provider.dart';
import 'package:wij_land/non_admin/screens/parcels_directory/widgets/add_farmer_parcel_dialog.dart';
import 'package:wij_land/non_admin/screens/parcels_directory/widgets/edit_farmer_parcel_dialog.dart';
import 'package:wij_land/non_admin/screens/parcels_directory/widgets/multiple_dropdown_widget.dart';
import 'package:wij_land/non_admin/screens/parcels_directory/widgets/parcel_directory_action_widget.dart';
import 'package:wij_land/non_admin/screens/parcels_directory/widgets/parcel_directory_details_widget.dart';
import 'package:wij_land/non_admin/screens/parcels_directory/widgets/parcel_directory_files_widget.dart';
import 'package:wij_land/non_admin/screens/parcels_directory/widgets/parcel_directory_project_widget.dart';
import 'package:wij_land/screens/communications/media/widgets/media_constants.dart';
import 'package:wij_land/screens/office/widgets/add_text_button_widget.dart';
import 'package:wij_land/utils/ShimmerEffect.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/responsive.dart';
import 'package:wij_land/utils/styles.dart';
import 'package:latlong2/latlong.dart' as latLng;
import '../../../../utils/images.dart';
import '../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../screens/office/office_programes/Widgets/on_hover_button_widget.dart';
import '../../app_common_widgets/MapWithPolygon.dart';
import '../../app_common_widgets/large_screen.dart';
import '../../models/farm_computer_dropdown/parcel_project_drop_down.dart';

FarmComputerParcelsProvider? allDropDown;

class ParcelsDirectoryScreen extends StatefulWidget {
  // final GetFarmComputerParcelsResponse model;
  final arguments;

  const ParcelsDirectoryScreen({
    Key? key,
    this.arguments,
  }) : super(key: key);

  @override
  State<ParcelsDirectoryScreen> createState() => _ParcelsDirectoryScreenState();
}

class _ParcelsDirectoryScreenState extends State<ParcelsDirectoryScreen> {
  bool isLoading = true;
  bool isFilter = false;
  String selectedParcel = '';

  @override
  void initState() {
    firstAttempt = false;
    getPrefs();
    getData();

    super.initState();
  }

  getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? farmID = prefs.getString("farmID");
    var data = Provider.of<FarmComputerParcelsProvider>(context, listen: false);
    await data.getFarmComputerParcelsFarmName(farmID: int.parse(farmID!));
    print("farmID----------------${farmID}");
    data.listofSelectedProject.clear();
    // await getData();
  }

  getData() async {
    await Provider.of<FarmComputerParcelsProvider>(context, listen: false).getFarmComputerParcelData();
    setState(() {
      isLoading = false;
    });
    await Provider.of<FarmComputerParcelsProvider>(context, listen: false).getAllFarmersParcelsDropDown();
  }

  // bool isExpandable = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key:  Key('ParcelScreen-key'),
      onVisibilityChanged: (visibilityInfo) {
        var visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 50) {
          if(widget.arguments!=null) {
            global_farmer_entitiy.value = [
              HoverWidget(
                child: Text(
                  'Home / '.tr(),

                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: shineGrey,
                    fontFamily: Montserrat_Medium,
                  ),
                ),
                hoverChild: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Home / '.tr(),
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: Montserrat_Medium,
                      fontWeight: FontWeight.bold,
                      color: shineGrey,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                    ),
                  ),
                ),
                onHover: (event) {},
              ),
              Text(
                'Parcels'.tr(),
                style: TextStyle(
                  fontFamily: Montserrat_Medium,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: darkRed,
                ),
              ),
            ];
          }else{
            global_farmer_entitiy.value = [
              Text(
                'Parcels'.tr(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: darkRed),
              ),
            ];
          }
        }
      },
      child: Consumer<FarmComputerParcelsProvider>(builder: (context, provider, child) {
        return Container(
          height: getHeight(context),
          width: getWidth(context),
          padding: EdgeInsets.only(top: 5),
          child: Row(
            children: [
              Expanded(
                  child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Parcels".tr(),
                        weight: FontWeight.bold,
                        size: Responsive.isMobile(context) ? 16 : 20,
                        color: darkred,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                            child: OnHoverButtonWidget(
                              isFilterColor: isFilter,
                              // color: isFilter ? Colors.green : Colors.transparent,
                              icons: Icons.filter_alt_outlined,
                              height: 45,
                              onTap: () async {
                                isFilter = !isFilter;
                                if (!isFilter) {
                                  provider.parcelProjectSelectedDropDownName =
                                      provider
                                          .parcelProjectsDropDownModelAgain[0];
                                  setState(() {});
                                  provider.listofSelectedProject = [];
                                  await Provider.of<FarmComputerParcelsProvider>(context, listen: false).getFarmComputerParcelData();
                                  setState(() {});
                                  // provider.parcelsProject.isEmpty;
                                  // provider.projectsListID!.clear();
                                  // provider.projectsList.clear();
                                  // await Provider.of<FarmComputerParcelsProvider>(
                                  //         context,
                                  //         listen: false)
                                  //     .getFarmComputerParcelData();
                                  // setState(() {});
                                }
                                setState(() {});
                              },
                            ),
                          ),
                          SizedBox(
                            width: getWidth(context) * 0.09,
                            height: 45,
                            child: IconAndTextContainer(
                              onTap: () {
                                if (!isLoading) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AddFarmerParcelDialog(
                                          parceldata: provider.farmComputerParcelsResponseModel.data!,
                                        );
                                      }).then((value) async {
                                    if (value == 'reload') {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      await Provider.of<FarmComputerParcelsProvider>(context, listen: false).getFarmComputerParcelData();
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  });
                                }
                              },
                              addText: "Parcel".tr(),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                isFilter
                    ? Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Card(
                            elevation: 3,
                            child: Wrap(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: SizedBox(
                                    width: 230,
                                    height: 47,
                                    child: RealDropDownWidget(
                                      value: provider.parcelProjectSelectedDropDownName,
                                      color: normalGrey,
                                      onChanged: (newValue) {
                                        ProjectData data = newValue;
                                        print('newValue = $newValue');
                                        setState(() {
                                          provider.parcelProjectSelectedDropDownName = data;
                                          if (!provider.listofSelectedProject.contains(provider.parcelProjectSelectedDropDownName!)) {
                                            provider.listofSelectedProject.add(provider.parcelProjectSelectedDropDownName!);
                                          }
                                        });
                                      },
                                      items: provider.parcelProjectsDropDownModelAgain.map<DropdownMenuItem<ProjectData>>((ProjectData value) {
                                        return DropdownMenuItem<ProjectData>(
                                            value: value,
                                            child: Text(
                                              value.name!,
                                              style: TextStyle(
                                                  fontFamily: Montserrat_Medium),
                                            ));
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 230,
                                  child: Wrap(
                                      children: provider.listofSelectedProject.map((e) {
                                    return Container(
                                      padding: EdgeInsets.all(3),
                                      child: Chip(
                                        label: Text('${e.name}', style: TextStyle(color: Colors.black, fontFamily: Montserrat_Medium)),
                                        onDeleted: () {
                                          provider.listofSelectedProject
                                              .remove(e);
                                          setState(() {});
                                        },
                                      ),
                                    );
                                  }).toList()),
                                ),
                                Padding(
                                  padding: (Responsive.isDesktop(context) || Responsive.isTablet(context))
                                      ? EdgeInsets.only(top: 30)
                                      : EdgeInsets.only(bottom: 20, left: 20),
                                  child: Wrap(
                                    children: [
                                      Padding(
                                        padding: Responsive.isMobile(context) ? EdgeInsets.only(bottom: 10) : EdgeInsets.only(left: 20, bottom: 20),
                                        child: AddTextButtonWidget(
                                          text: "Apply Filter".tr(),
                                          colors: yellow,
                                          onPress: () async {
                                            isLoading = true;
                                            setState(() {});
                                            await provider.getFarmComputerParcelData();
                                            isLoading = false;

                                            setState(() {});
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      AddTextButtonWidget(
                                        text: "Clear Filter".tr(),
                                        colors: dimMetalic3,
                                        onPress: () async {
                                          isLoading = true;
                                          provider.parcelProjectSelectedDropDownName = ProjectData(id: -1, name: '');
                                          provider.parcelProjectSelectedDropDownName = provider.parcelProjectsDropDownModelAgain[0];
                                          //  controller.clear();
                                          setState(() {});
                                          provider.listofSelectedProject = [];
                                          await provider.getFarmComputerParcelData();
                                          isLoading = false;
                                          setState(() {});
                                        },
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                      )
                    : SizedBox.shrink(),
                Padding(
                    padding: const EdgeInsets.all(8),
                    child: isLoading
                        ? SizedBox(
                            height: getHeight(context),
                            //    width: getWidth(context),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : provider.farmComputerParcelsResponseModel.status == 404
                            ? SizedBox(
                                height: getHeight(context),
                                // width: getWidth(context),
                                child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: CustomText(
                                        text: provider.farmComputerParcelsResponseModel.message ?? "No data found".tr(),
                                        color: Colors.red,
                                        weight: FontWeight.w700,
                                        size: 20,
                                      ),
                                    )),
                              )
                            : Column(children: [
                                for (int i = 0; i < provider.farmComputerParcelsResponseModel.data!.length; i++)
                                  Card(
                                    child: ExpansionTile(
                                      title: Wrap(
                                        alignment: WrapAlignment.spaceBetween,
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(top: 10),
                                                child: CustomText(
                                                  text: '${provider.farmComputerParcelsResponseModel.data![i].parcelName}',
                                                  size: Responsive.isMobile(context) ? 10 : 20,
                                                  weight: FontWeight.bold,
                                                  color: darkGreen,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              CustomText(
                                                text: provider.farmComputerParcelsResponseModel.data![i].area.toString(),
                                                size: Responsive.isMobile(context) ? 10 : 13,
                                                color: Colors.black,
                                                weight: FontWeight.bold,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              )
                                            ],
                                          ),
                                          provider.expandedListOfBool[i]
                                              ? provider.position[i] == 0
                                                  ? Padding(
                                                      padding: const EdgeInsets.only(top: 12),
                                                      child: SizedBox(
                                                        width: Responsive.isMobile(context) ? 15 : 20,
                                                        height: Responsive.isMobile(context) ? 15 : 20,
                                                        child: InkWell(
                                                          onTap: () {
                                                            showDialog(
                                                                context: context,
                                                                builder: (BuildContext context) {
                                                                  return EditFarmerParcelDialog(
                                                                    parcelID: int.parse(provider.farmComputerParcelsResponseModel.data![i].id!),
                                                                    area: provider.farmComputerParcelsResponseModel.data![i].area ?? "",
                                                                    landFunction: provider.farmComputerParcelsResponseModel.data![i].landFunction ?? "",
                                                                    landManagement:
                                                                        provider.farmComputerParcelsResponseModel.data![i].landManagement ?? "",
                                                                    locationDescription:
                                                                        provider.farmComputerParcelsResponseModel.data![i].locationDescription ?? "",
                                                                    ownership: provider.farmComputerParcelsResponseModel.data![i].ownership ?? "",
                                                                    purpose: provider.farmComputerParcelsResponseModel.data![i].purpose ?? "",
                                                                    parcelData: provider.farmComputerParcelsResponseModel.data![i],
                                                                  );
                                                                }).then((value) async {
                                                              if (value == 'reload') {
                                                                setState(() {
                                                                  isLoading = true;
                                                                });
                                                                await Provider.of<FarmComputerParcelsProvider>(context, listen: false)
                                                                    .getFarmComputerParcelData();
                                                                setState(() {
                                                                  isLoading = false;
                                                                });
                                                              }
                                                            });
                                                          },
                                                          child: Image(
                                                            // width: Responsive
                                                            //         .isMobile(
                                                            //             context)
                                                            //     ? 10
                                                            //     : 15,
                                                            // height: Responsive
                                                            //         .isMobile(
                                                            //             context)
                                                            //     ? 10
                                                            //     : 15,
                                                            image: AssetImage(
                                                              IconImages.editIcon,
                                                            ),
                                                            // fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : SizedBox.shrink()
                                              : SizedBox.shrink(),
                                          // setState(() => ,)
                                        ],
                                      ),
                                      trailing: Icon(
                                        provider.expandedListOfBool[i] ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                DefaultTabController(
                                                  length: 4,
                                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                    TabBar(
                                                        padding: EdgeInsets.zero,
                                                        isScrollable: true,
                                                        automaticIndicatorColorAdjustment: true,
                                                        indicatorPadding: EdgeInsets.only(left: 8, right: 20),
                                                        labelPadding: EdgeInsets.only(left: 8, right: 20),
                                                        indicatorColor: darkGreen,
                                                        unselectedLabelColor: Colors.black,
                                                        onTap: (value) {
                                                          setState(() {
                                                            provider.position[i] = value;
                                                          });
                                                          print('value is $value');
                                                          print('position is ${provider.position}');
                                                        },
                                                        tabs: [
                                                          CustomText(
                                                            text: "Details".tr(),
                                                            size: Responsive.isMobile(context) ? 10 : 13,
                                                            weight: FontWeight.bold,
                                                            color: provider.position[i] == 0 ? darkGreen : Colors.black,
                                                          ),
                                                          CustomText(
                                                            text: "Projects".tr(),
                                                            size: Responsive.isMobile(context) ? 10 : 13,
                                                            weight: FontWeight.bold,
                                                            color: provider.position[i] == 1 ? darkGreen : Colors.black,
                                                          ),
                                                          CustomText(
                                                            text: "Actions".tr(),
                                                            size: Responsive.isMobile(context) ? 10 : 13,
                                                            weight: FontWeight.bold,
                                                            color: provider.position[i] == 2 ? darkGreen : Colors.black,
                                                          ),
                                                          CustomText(
                                                            text: "files".tr(),
                                                            size: Responsive.isMobile(context) ? 10 : 13,
                                                            weight: FontWeight.bold,
                                                            color: provider.position[i] == 3 ? darkGreen : Colors.black,
                                                          ),
                                                        ]),
                                                    provider.position[i] == 0
                                                        ? ParcelDirectoryDetailsWidget(model: provider.farmComputerParcelsResponseModel.data![i])
                                                        : provider.position[i] == 1
                                                            ? ParcelDirectoryProjectWidget(
                                                                model: provider.farmComputerParcelsResponseModel.data![i],
                                                              )
                                                            : provider.position[i] == 2
                                                                ? provider.farmComputerParcelsResponseModel.data![i].parcelActions!.isNotEmpty
                                                                    ? ParcelDirectoryActionWidget(
                                                                        model: provider.farmComputerParcelsResponseModel.data![i])
                                                                    : SizedBox.shrink()
                                                                : provider.position[i] == 3
                                                                    ? ParcelDirectoryFilesWidget(
                                                                        model: provider.farmComputerParcelsResponseModel.data![i])
                                                                    : SizedBox.shrink()
                                                  ]),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                      maintainState: provider.expandedListOfBool[i],
                                      onExpansionChanged: (bool exapndedValue) {
                                        setState(() {
                                          selectedParcel = provider.farmComputerParcelsResponseModel.data![i].parcelName.toString();
                                          provider.expandedListOfBool[i] = exapndedValue;
                                          if (provider.expandedListOfBool[i] == true) {
                                            provider.position[i] = 0;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                              ])),
              ])),
              Container(
                width: getWidth(context) * 0.60,
                height: getHeight(context),
                child: isLoading
                    ? ShimmerEffect(
                        child: Container(
                          // width: getWidth(context) * 0.4,
                          // height: getHeight(context),
                          color: Colors.blue,
                        ),
                      )
                    : Builder(builder: (context) {
                        List<List<latLng.LatLng>>? listOfPolygon = [];
                        List<String> labelList = [];
                        List<int> indexList = [];
                        for (var i in provider.farmComputerParcelsResponseModel.data!) {
                          if (i.parcelMapInformation!.listOfLatLng.isNotEmpty) {
                            int index = provider.farmComputerParcelsResponseModel.data!.indexOf(i);
                            indexList.add(index);
                            labelList.add('${i.parcelName}');
                            listOfPolygon.add(i.parcelMapInformation!.listOfLatLng);
                          }
                        }
                        return MapWithPolygon(
                          listOfPolygon: listOfPolygon,
                          indexList: indexList,
                          labelList: labelList,
                          showCenter: true,
                          showgreen: true,
                          selectedParcel: selectedParcel,
                          selectedIndex: (int i) {
                            setState(() {
                              provider.expandedListOfBool[i] = !provider.expandedListOfBool[i];
                              if (provider.expandedListOfBool[i] == true) {
                                provider.position[i] = 0;
                              }
                            });
                          },
                        );
                      }),
              ),
            ],
          ),
        );
      }),
    );
  }
}
