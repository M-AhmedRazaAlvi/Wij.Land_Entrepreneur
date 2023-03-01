import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/anacdots_mobile/app_common_widgets/styles.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/non_admin/providers/permissions_providers/permission_screen_provider.dart';
import 'package:wij_land/non_admin/screens/permissions/widgets/selectable_dropdown_widget_for_permissions.dart';
import 'package:wij_land/utils/functions.dart';

import '../../../app_common_widgets/on_hover.dart';
import '../../../utils/controller.dart';
import '../../../utils/hex_color.dart';
import '../../../utils/responsive.dart';
import '../../models/permissions/permissions_requests_model.dart';
import '../../routes/routes.dart';

class PermissionsScreen extends StatefulWidget {
  const PermissionsScreen({super.key});

  @override
  State<PermissionsScreen> createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  @override
  void initState() {
    var provider =
        Provider.of<PermissionScreenProvider>(context, listen: false);
    provider.fetchAllPermissionsRequest();
    provider.getOrganizationsDropDown();
    provider.getProjectsDropDown();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PermissionScreenProvider>(
      builder: (context, _provider, widget) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomText(
                            text: "Permission Requests".tr(),
                            color: Color(0xffA71832),
                            size: Responsive.isDesktop(context) ? 20 : 16,
                            weight: FontWeight.bold,
                          ),
                        ),
                        OnHover(
                          builder: (hover) {
                            return AnimatedContainer(
                              alignment: Alignment.center,
                              duration: const Duration(milliseconds: 400),
                              height: 45,
                              width: _provider.searchTapped ? 400 : 45,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: _provider.searchTapped
                                    ? HexColor('#FFFFFF')
                                    : hover
                                        ? lightGreen
                                        : HexColor('#FFFFFF'),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.04),
                                    offset: Offset(0, 15),
                                    blurRadius: 25,
                                  )
                                ],
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    if (_provider.searchTapped)
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                                left: 10, bottom: 5),
                                          ),
                                          onSubmitted: (v) async {
                                            _provider
                                                .fetchAllPermissionsRequest();
                                          },
                                          controller:
                                              _provider.mSearchController,
                                          autofocus: true,
                                        ),
                                      ),
                                    SizedBox(
                                      height: 45,
                                      width: 45,
                                      child: OnHover(
                                        builder: (hover) => InkWell(
                                          onTap: () async {
                                            if (_provider.searchTapped) {
                                              _provider.mSearchController
                                                  .clear();
                                              _provider
                                                  .fetchAllPermissionsRequest();
                                            }
                                            setState(() {
                                              _provider.searchTapped =
                                                  !_provider.searchTapped;
                                            });
                                          },
                                          hoverColor: Colors.transparent,
                                          child: Icon(
                                            _provider.searchTapped
                                                ? Icons.close
                                                : Icons.search,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(width: 10),
                        OnHover(
                          builder: (hover) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  _provider.showFilters =
                                      !_provider.showFilters;
                                });
                              },
                              child: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color:
                                      hover ? lightGreen : HexColor('#FFFFFF'),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.04),
                                      offset: Offset(0, 15),
                                      blurRadius: 25,
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.filter_alt_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    _provider.showFilters
                        ? Container(
                            height: 110,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: HexColor('#FFFFFF'),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  offset: Offset(0, 15),
                                  blurRadius: 25,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(width: 20),
                                  Expanded(
                                    child:
                                        SelectableDropdownWidgetForPermissions(
                                      items: _provider.organizationsList,
                                      title: "Organizations".tr(),
                                      mSelectedValue:
                                          _provider.mSelectedOrganizationType,
                                      mSelectedItemsList: _provider
                                          .mDropdownSelectedOrganizationsList,
                                      mSelectedOrganizationsList: _provider
                                          .mSelectedListOfOrganizations,
                                      mOnDropDownChange: (value) {
                                        setState(
                                          () {
                                            _provider
                                                    .mSelectedOrganizationType =
                                                value as String;
                                            if (!_provider
                                                .mDropdownSelectedOrganizationsList
                                                .contains(_provider
                                                    .mSelectedOrganizationType)) {
                                              _provider
                                                  .mDropdownSelectedOrganizationsList
                                                  .add(_provider
                                                      .mSelectedOrganizationType);

                                              /// This will get the index from dropdown list and then will be able to add that object into our selected list
                                              var index = _provider
                                                  .organizationsList
                                                  .indexOf(_provider
                                                      .mSelectedOrganizationType);
                                              _provider
                                                  .mSelectedListOfOrganizations
                                                  .add(_provider
                                                          .mListOfOrganizations[
                                                      index]);
                                            }
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child:
                                        SelectableDropdownWidgetForPermissions(
                                      items: _provider.projectsList,
                                      title: "Projects".tr(),
                                      mSelectedValue:
                                          _provider.mSelectedProjectType,
                                      mSelectedItemsList: _provider
                                          .mDropdownSelectedProjectsList,
                                      mSelectedProjectsList:
                                          _provider.mSelectedListOfProjects,
                                      mOnDropDownChange: (value) {
                                        setState(
                                          () {
                                            _provider.mSelectedProjectType =
                                                value as String;
                                            if (!_provider
                                                .mDropdownSelectedProjectsList
                                                .contains(_provider
                                                    .mSelectedProjectType)) {
                                              _provider
                                                  .mDropdownSelectedProjectsList
                                                  .add(_provider
                                                      .mSelectedProjectType);

                                              /// This will get the index from dropdown list and then will be able to add that object into our selected list
                                              var index = _provider.projectsList
                                                  .indexOf(_provider
                                                      .mSelectedProjectType);
                                              _provider.mSelectedListOfProjects
                                                  .add(_provider
                                                      .mListOfProjects[index]);
                                            }
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: SizedBox(
                                      height: 95,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            "Status".tr(),
                                          ),
                                          Container(
                                            height: 50,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xFFA4A6B3),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              color: Colors.white,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 6),
                                              child: DropdownButton<String>(
                                                items: _provider
                                                    .statusDropDownList
                                                    .map((String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                                value: _provider
                                                    .mSelectedStatusValue,
                                                isExpanded: true,
                                                underline: SizedBox.shrink(),
                                                onChanged: (value) {
                                                  setState(() {
                                                    _provider
                                                            .mSelectedStatusValue =
                                                        value!;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            _provider
                                                .fetchAllPermissionsRequest();
                                          },
                                          child: CustomText(
                                            text: "Apply Filters".tr(),
                                            color: Color(0xffA71832),
                                            size: 12,
                                            weight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              _provider.showFilters = false;
                                              _provider
                                                  .mSelectedListOfOrganizations
                                                  .clear();
                                              _provider.mSelectedListOfProjects
                                                  .clear();
                                              _provider
                                                  .mDropdownSelectedProjectsList
                                                  .clear();
                                              _provider
                                                  .mDropdownSelectedOrganizationsList
                                                  .clear();
                                              _provider.mSelectedStatusValue =
                                                  "Select";
                                            });
                                            _provider
                                                .fetchAllPermissionsRequest();
                                          },
                                          child: CustomText(
                                            text: "Clear Filters".tr(),
                                            color: Colors.black,
                                            size: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TabBar(
                                padding: EdgeInsets.zero,
                                isScrollable: true,
                                indicatorPadding: EdgeInsets.only(right: 20),
                                labelPadding:
                                    EdgeInsets.only(bottom: 10, right: 20),
                                indicatorColor: darkGreen,
                                onTap: (value) {
                                  _provider.mTabPosition = value;
                                  setState(() {});
                                  if (value == 0) {
                                    setState(() {
                                      _provider.filterStatus = "all";
                                    });
                                    _provider.fetchAllPermissionsRequest();
                                  } else if (value == 1) {
                                    setState(() {
                                      _provider.filterStatus =
                                          "active_requests";
                                    });
                                    _provider.fetchAllPermissionsRequest();
                                  } else {
                                    setState(() {
                                      _provider.filterStatus =
                                          "completed_requests";
                                    });
                                    _provider.fetchAllPermissionsRequest();
                                  }
                                },
                                tabs: [
                                  CustomText(
                                    text: "All Requests".tr(),
                                    color: _provider.mTabPosition == 0
                                        ? darkGreen
                                        : Colors.black,
                                    size: 12,
                                  ),
                                  CustomText(
                                    size: 12,
                                    text: "Active Requests".tr(),
                                    color: _provider.mTabPosition == 1
                                        ? darkGreen
                                        : Colors.black,
                                  ),
                                  CustomText(
                                    size: 12,
                                    text: "Completed Requests".tr(),
                                    color: _provider.mTabPosition == 2
                                        ? darkGreen
                                        : Colors.black,
                                  ),
                                ]),
                            Container(
                              height: 1,
                              color: Colors.grey,
                              width: 342,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            _provider.showLoading
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : allRequests(
                                    permissions:
                                        _provider.mPermissionsRequestsResponse,
                                    permissionsList: _provider.permissionsList,
                                    provider: _provider,
                                  )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget allRequests(
      {required PermissionsRequestsModel permissions,
      required List<PermissionRequestData> permissionsList,
      required PermissionScreenProvider provider}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: getWidth(context) / 1.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DataTable(
                    showCheckboxColumn: false,
                    dataRowHeight: 40,
                    showBottomBorder: false,
                    horizontalMargin: 0,
                    columnSpacing: 30,
                    columns: [
                      DataColumn(
                        label: CustomText(
                          text: 'Status'.tr(),
                          color: Colors.black,
                          size: 12,
                          weight: FontWeight.bold,
                        ),
                      ),
                      DataColumn(
                        label: CustomText(
                          text: 'Title'.tr(),
                          color: Colors.black,
                          size: 12,
                          weight: FontWeight.bold,
                        ),
                      ),
                      DataColumn(
                          label: CustomText(
                        text: '',
                        color: Colors.black,
                        size: 12,
                        weight: FontWeight.bold,
                      )),
                      DataColumn(
                          label: CustomText(
                        text: '',
                        color: Colors.black,
                        size: 12,
                        weight: FontWeight.bold,
                      )),
                      DataColumn(
                        label: CustomText(
                          text: 'Organization'.tr(),
                          color: Colors.black,
                          size: 12,
                          weight: FontWeight.bold,
                        ),
                      ),
                      DataColumn(
                        label: CustomText(
                          text: 'Project'.tr(),
                          color: Colors.black,
                          size: 12,
                          weight: FontWeight.bold,
                        ),
                      ),
                      DataColumn(
                          label: CustomText(
                        text: '',
                        color: Colors.black,
                        size: 12,
                        weight: FontWeight.bold,
                      )),
                      DataColumn(
                        label: CustomText(
                          text: 'Date Received'.tr(),
                          color: Colors.black,
                          size: 12,
                          weight: FontWeight.bold,
                        ),
                      ),
                      DataColumn(
                          label: CustomText(
                        text: 'Start Date'.tr(),
                        color: Colors.black,
                        size: 12,
                        weight: FontWeight.bold,
                      )),
                    ],
                    rows: permissions.status != 200
                        ? []
                        : permissionsList
                            .map(
                              (permissionData) => DataRow(
                                // onSelectChanged: (value) => {
                                //   navigationController
                                //       .navigateToWithArguments(arguments: {"title": "Active"}, routeName: farmerComputerPermissionsPendingRoute)
                                // },
                                // onLongPress: () {
                                //   navigationController
                                //       .navigateToWithArguments(arguments: {"title": "Active"}, routeName: farmerComputerPermissionsPendingRoute);
                                // },
                                cells: [
                                  DataCell(
                                    Container(
                                      height: 22,
                                      width: 100,
                                      padding:
                                          EdgeInsets.fromLTRB(10, 3, 10, 3),
                                      decoration: BoxDecoration(
                                        color: HexColor(
                                          permissionData.status?[0].color ??
                                              "#000000",
                                        ),
                                        border: Border.all(
                                          color: HexColor(
                                            permissionData.status?[0].color ??
                                                "#000000",
                                          ),
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Center(
                                        child: CustomText(
                                          text: permissionData.status?[0].status
                                                  ?.capitalize() ??
                                              "",
                                          color: permissionData
                                                      .status?[0].status ==
                                                  "rejected"
                                              ? Colors.white
                                              : Colors.black,
                                          size: 10,
                                          weight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    onTap: () async {
                                      var value = await navigationController
                                          .navigateToWithArguments(
                                              arguments: {
                                            "title": permissionData
                                                .status![0].status!
                                                .capitalize(),
                                            "id": permissionData.id,
                                          },
                                              routeName:
                                                  farmerComputerPermissionsPendingRoute);
                                      print(
                                          "Value From Detail Screen : $value");
                                      if (value) {
                                        setState(() {
                                          provider.showFilters = false;
                                          provider.mSelectedListOfOrganizations
                                              .clear();
                                          provider.mSelectedListOfProjects
                                              .clear();
                                          provider.mDropdownSelectedProjectsList
                                              .clear();
                                          provider
                                              .mDropdownSelectedOrganizationsList
                                              .clear();
                                          provider.mSelectedStatusValue =
                                              "Select";
                                        });
                                        provider.fetchAllPermissionsRequest();
                                      }
                                    },
                                  ),
                                  DataCell(
                                    CustomText(
                                      text: permissionData.title ?? "",
                                      color: Colors.black,
                                      size: 10,
                                      weight: FontWeight.normal,
                                    ),
                                    onTap: () async {
                                      var value = await navigationController
                                          .navigateToWithArguments(
                                              arguments: {
                                            "title": permissionData
                                                .status![0].status!
                                                .capitalize(),
                                            "id": permissionData.id,
                                          },
                                              routeName:
                                                  farmerComputerPermissionsPendingRoute);
                                      print(
                                          "Value From Detail Screen : $value");
                                      if (value) {
                                        setState(() {
                                          provider.showFilters = false;
                                          provider.mSelectedListOfOrganizations
                                              .clear();
                                          provider.mSelectedListOfProjects
                                              .clear();
                                          provider.mDropdownSelectedProjectsList
                                              .clear();
                                          provider
                                              .mDropdownSelectedOrganizationsList
                                              .clear();
                                          provider.mSelectedStatusValue =
                                              "Select";
                                        });
                                        provider.fetchAllPermissionsRequest();
                                      }
                                    },
                                  ),
                                  DataCell(
                                    Text(''),
                                    onTap: () async {
                                      var value = await navigationController
                                          .navigateToWithArguments(
                                              arguments: {
                                            "title": permissionData
                                                .status![0].status!
                                                .capitalize(),
                                            "id": permissionData.id,
                                          },
                                              routeName:
                                                  farmerComputerPermissionsPendingRoute);
                                      print(
                                          "Value From Detail Screen : $value");
                                      if (value) {
                                        setState(() {
                                          provider.showFilters = false;
                                          provider.mSelectedListOfOrganizations
                                              .clear();
                                          provider.mSelectedListOfProjects
                                              .clear();
                                          provider.mDropdownSelectedProjectsList
                                              .clear();
                                          provider
                                              .mDropdownSelectedOrganizationsList
                                              .clear();
                                          provider.mSelectedStatusValue =
                                              "Select";
                                        });
                                        provider.fetchAllPermissionsRequest();
                                      }
                                    },
                                  ),
                                  DataCell(
                                    Text(''),
                                    onTap: () async {
                                      var value = await navigationController
                                          .navigateToWithArguments(
                                              arguments: {
                                            "title": permissionData
                                                .status![0].status!
                                                .capitalize(),
                                            "id": permissionData.id,
                                          },
                                              routeName:
                                                  farmerComputerPermissionsPendingRoute);
                                      print(
                                          "Value From Detail Screen : $value");
                                      if (value) {
                                        setState(() {
                                          provider.showFilters = false;
                                          provider.mSelectedListOfOrganizations
                                              .clear();
                                          provider.mSelectedListOfProjects
                                              .clear();
                                          provider.mDropdownSelectedProjectsList
                                              .clear();
                                          provider
                                              .mDropdownSelectedOrganizationsList
                                              .clear();
                                          provider.mSelectedStatusValue =
                                              "Select";
                                        });
                                        provider.fetchAllPermissionsRequest();
                                      }
                                    },
                                  ),
                                  DataCell(
                                    CustomText(
                                        text:
                                            permissionData.organization == null
                                                ? ""
                                                : permissionData.organization
                                                        ?.organizationName ??
                                                    "",
                                        color: Colors.black,
                                        size: 10,
                                        weight: FontWeight.normal),
                                    onTap: () async {
                                      var value = await navigationController
                                          .navigateToWithArguments(
                                              arguments: {
                                            "title": permissionData
                                                .status![0].status!
                                                .capitalize(),
                                            "id": permissionData.id,
                                          },
                                              routeName:
                                                  farmerComputerPermissionsPendingRoute);
                                      print(
                                          "Value From Detail Screen : $value");
                                      if (value) {
                                        setState(() {
                                          provider.showFilters = false;
                                          provider.mSelectedListOfOrganizations
                                              .clear();
                                          provider.mSelectedListOfProjects
                                              .clear();
                                          provider.mDropdownSelectedProjectsList
                                              .clear();
                                          provider
                                              .mDropdownSelectedOrganizationsList
                                              .clear();
                                          provider.mSelectedStatusValue =
                                              "Select";
                                        });
                                        provider.fetchAllPermissionsRequest();
                                      }
                                    },
                                  ),
                                  DataCell(
                                    CustomText(
                                      text: permissionData.project == null
                                          ? ""
                                          : permissionData
                                                  .project?.projectName ??
                                              "",
                                      color: Colors.black,
                                      size: 10,
                                      weight: FontWeight.normal,
                                    ),
                                    onTap: () async {
                                      var value = await navigationController
                                          .navigateToWithArguments(
                                              arguments: {
                                            "title": permissionData
                                                .status![0].status!
                                                .capitalize(),
                                            "id": permissionData.id,
                                          },
                                              routeName:
                                                  farmerComputerPermissionsPendingRoute);
                                      print(
                                          "Value From Detail Screen : $value");
                                      if (value) {
                                        setState(() {
                                          provider.showFilters = false;
                                          provider.mSelectedListOfOrganizations
                                              .clear();
                                          provider.mSelectedListOfProjects
                                              .clear();
                                          provider.mDropdownSelectedProjectsList
                                              .clear();
                                          provider
                                              .mDropdownSelectedOrganizationsList
                                              .clear();
                                          provider.mSelectedStatusValue =
                                              "Select";
                                        });
                                        provider.fetchAllPermissionsRequest();
                                      }
                                    },
                                  ),
                                  DataCell(
                                    Text(''),
                                    onTap: () async {
                                      var value = await navigationController
                                          .navigateToWithArguments(
                                              arguments: {
                                            "title": permissionData
                                                .status![0].status!
                                                .capitalize(),
                                            "id": permissionData.id,
                                          },
                                              routeName:
                                                  farmerComputerPermissionsPendingRoute);
                                      print(
                                          "Value From Detail Screen : $value");
                                      if (value) {
                                        setState(() {
                                          provider.showFilters = false;
                                          provider.mSelectedListOfOrganizations
                                              .clear();
                                          provider.mSelectedListOfProjects
                                              .clear();
                                          provider.mDropdownSelectedProjectsList
                                              .clear();
                                          provider
                                              .mDropdownSelectedOrganizationsList
                                              .clear();
                                          provider.mSelectedStatusValue =
                                              "Select";
                                        });
                                        provider.fetchAllPermissionsRequest();
                                      }
                                    },
                                  ),
                                  DataCell(
                                    CustomText(
                                      text: permissionData.requestEndDate ?? "",
                                      color: Colors.black,
                                      size: 10,
                                      weight: FontWeight.normal,
                                    ),
                                    onTap: () async {
                                      var value = await navigationController
                                          .navigateToWithArguments(
                                              arguments: {
                                            "title": permissionData
                                                .status![0].status!
                                                .capitalize(),
                                            "id": permissionData.id,
                                          },
                                              routeName:
                                                  farmerComputerPermissionsPendingRoute);
                                      print(
                                          "Value From Detail Screen : $value");
                                      if (value) {
                                        setState(() {
                                          provider.showFilters = false;
                                          provider.mSelectedListOfOrganizations
                                              .clear();
                                          provider.mSelectedListOfProjects
                                              .clear();
                                          provider.mDropdownSelectedProjectsList
                                              .clear();
                                          provider
                                              .mDropdownSelectedOrganizationsList
                                              .clear();
                                          provider.mSelectedStatusValue =
                                              "Select";
                                        });
                                        provider.fetchAllPermissionsRequest();
                                      }
                                    },
                                  ),
                                  DataCell(
                                    CustomText(
                                      text:
                                          permissionData.requestStartDate ?? "",
                                      color: Colors.black,
                                      size: 10,
                                      weight: FontWeight.normal,
                                    ),
                                    onTap: () async {
                                      var value = await navigationController
                                          .navigateToWithArguments(
                                              arguments: {
                                            "title": permissionData
                                                .status![0].status!
                                                .capitalize(),
                                            "id": permissionData.id,
                                          },
                                              routeName:
                                                  farmerComputerPermissionsPendingRoute);
                                      print(
                                          "Value From Detail Screen : $value");
                                      if (value) {
                                        setState(() {
                                          provider.showFilters = false;
                                          provider.mSelectedListOfOrganizations
                                              .clear();
                                          provider.mSelectedListOfProjects
                                              .clear();
                                          provider.mDropdownSelectedProjectsList
                                              .clear();
                                          provider
                                              .mDropdownSelectedOrganizationsList
                                              .clear();
                                          provider.mSelectedStatusValue =
                                              "Select";
                                        });
                                        provider.fetchAllPermissionsRequest();
                                      }
                                    },
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 20, 5, 0),
          child: CustomText(
            text: '#',
            color: Colors.black,
            size: 12,
            weight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
