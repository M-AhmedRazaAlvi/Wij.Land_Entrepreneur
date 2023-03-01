import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/non_admin/models/farm_computer_project/farm_computer_project_actions/response/get_farm_computer_proj_action_response.dart';
import 'package:wij_land/non_admin/providers/farm_computer_projects_provider/farm_computer_project_actions_provider.dart';
import 'package:wij_land/non_admin/screens/project_dashboard/project_actions/widget/add_project_action_dialog.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/icon_text_container.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../app_common_widgets/text_widget.dart';
import '../../../../screens/office/widgets/add_text_button_widget.dart';
import '../../../../screens/office/widgets/search_widget.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../../models/farm_computer_dropdown/parcel_project_drop_down.dart';
import '../../../models/farm_computer_parcels/response/parcels_dropdown_reponse.dart';

class ProjectActionsScreen extends StatefulWidget {
  const ProjectActionsScreen({Key? key, this.model, this.projectID}) : super(key: key);
  final GetFarmComputerProjectActionResponse? model;
  final dynamic projectID;

  @override
  State<ProjectActionsScreen> createState() => _ProjectActionsScreenState();
}

class _ProjectActionsScreenState extends State<ProjectActionsScreen> {
  bool isLoading = false;

  @override
  void initState() {
    isLoading = true;
    getData();
    super.initState();
  }

  getData() {
    Future.delayed(Duration(seconds: 2), () async {
      await Provider.of<FarmComputerProjectActionProvider>(context, listen: false)
          .getFarmComputerProjectActionData(projectID: widget.projectID["id"]);
      await Provider.of<FarmComputerProjectActionProvider>(context, listen: false).projDropDown();

      isLoading = false;
    });
  }

  bool filterActive = false, isLoadFilterData = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FarmComputerProjectActionProvider>(context);
    return SingleChildScrollView(
      child: isLoading
          ? SizedBox(
              height: getHeight(context),
              width: getWidth(context),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SizedBox(
              //  height: getHeight(context),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: "Actions".tr(),
                              size: 18,
                              weight: FontWeight.bold,
                              color: darkGreen,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            ClickIconButton(
                              clickcolors: filterActive ? hoverColor : Colors.white,
                              icon: Icons.filter_alt,
                              iconColor: filterActive ? Colors.white : dark,
                              onPressed: () {
                                filterActive = !filterActive;
                                setState(() {});
                              },
                            ),
                            IconAndTextContainer(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AddProjectActionDialog();
                                    });
                              },
                              addText: "Action".tr(),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Visibility(
                      visible: filterActive ? true : false,
                      child: Column(
                        children: [
                          SizedBox(
                            width: getWidth(context),
                            child: Card(
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Wrap(
                                  alignment: WrapAlignment.spaceBetween,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  runSpacing: 15,
                                  spacing: 15,
                                  runAlignment: WrapAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(text: "Project(multi-select)".tr(), size: Responsive.isMobile(context) ? 10 : 12),
                                        SizedBox(
                                          width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.14,
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
                                            items: provider.parcelProjectsDropDownModel.map<DropdownMenuItem<ProjectData>>((ProjectData value) {
                                              return DropdownMenuItem<ProjectData>(
                                                  value: value,
                                                  child: Text(
                                                    value.name!,
                                                    style: TextStyle(
                                                      fontFamily: Montserrat_Medium,
                                                    ),
                                                  ));
                                            }).toList(),
                                          ),
                                        ),
                                        SizedBox(
                                          width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.14,
                                          child: Wrap(
                                              children: provider.listofSelectedProject.map((e) {
                                            return Container(
                                              padding: EdgeInsets.all(3),
                                              child: Chip(
                                                label: Text('${e.name}',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: Montserrat_Medium,
                                                    )),
                                                onDeleted: () {
                                                  provider.listofSelectedProject.remove(e);
                                                  setState(() {});
                                                },
                                              ),
                                            );
                                          }).toList()),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(text: "Parcel (multi-select)".tr(), size: Responsive.isMobile(context) ? 10 : 12),
                                        SizedBox(
                                          width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.14,
                                          height: 47,
                                          child: RealDropDownWidget(
                                            value: provider.listOfSelectedParcelsDropdown,
                                            color: normalGrey,
                                            onChanged: (newValue) {
                                              ParcelDropDownData data = newValue;
                                              print('newValue = $newValue');
                                              setState(() {
                                                provider.listOfSelectedParcelsDropdown = data;

                                                if (!provider.parcelDropDownList.contains(provider.listOfSelectedParcelsDropdown)) {
                                                  provider.parcelDropDownList.add(provider.listOfSelectedParcelsDropdown!);
                                                }
                                              });
                                            },
                                            items: provider.parcelDropdownModel.map<DropdownMenuItem<ParcelDropDownData>>((ParcelDropDownData value) {
                                              return DropdownMenuItem<ParcelDropDownData>(
                                                  value: value,
                                                  child: Text(
                                                    value.name!,
                                                    style: TextStyle(
                                                      fontFamily: Montserrat_Medium,
                                                    ),
                                                  ));
                                            }).toList(),
                                          ),
                                        ),
                                        SizedBox(
                                          width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.14,
                                          child: Wrap(
                                              children: provider.parcelDropDownList.map((e) {
                                            return Container(
                                              padding: EdgeInsets.all(3),
                                              child: Chip(
                                                label: Text('${e.name}',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: Montserrat_Medium,
                                                    )),
                                                onDeleted: () {
                                                  provider.parcelDropDownList.remove(e);
                                                  setState(() {});
                                                },
                                              ),
                                            );
                                          }).toList()),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(text: "Action Type".tr(), size: Responsive.isMobile(context) ? 10 : 12),
                                        SizedBox(height: 5),
                                        SizedBox(
                                          width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.14,
                                          height: 47,
                                          child: RealDropDownWidget(
                                            value: provider.actionTypeSelectedDropDown,
                                            color: normalGrey,
                                            onChanged: (newValue) {
                                              setState(() {
                                                provider.actionTypeSelectedDropDown = newValue;
                                                if (!provider.listOfSelectedActionDropdown.contains(provider.actionTypeSelectedDropDown)) {
                                                  provider.listOfSelectedActionDropdown.add(provider.actionTypeSelectedDropDown);
                                                }
                                              });
                                            },
                                            items: provider.actionTypeDropDownList.map<DropdownMenuItem<String>>((String value) {
                                              return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(
                                                      fontFamily: Montserrat_Medium,
                                                    ),
                                                  ));
                                            }).toList(),
                                          ),
                                        ),
                                        SizedBox(
                                          width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.14,
                                          child: Wrap(
                                              children: provider.listOfSelectedActionDropdown.map((e) {
                                            return Container(
                                              padding: EdgeInsets.all(3),
                                              child: Chip(
                                                label: Text('$e', style: TextStyle(color: Colors.black, fontFamily: Montserrat_Medium, fontSize: 11)),
                                                onDeleted: () {
                                                  provider.listOfSelectedActionDropdown.remove(e);
                                                  setState(() {});
                                                },
                                              ),
                                            );
                                          }).toList()),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(text: "Start Date".tr(), size: Responsive.isMobile(context) ? 10 : 12),
                                        SizedBox(height: 5),
                                        InkWell(
                                          onTap: () {
                                            showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(2001),
                                                    lastDate: DateTime(2023))
                                                .then((d) {
                                              if (d != null) {
                                                setState(() {
                                                  provider.mStartDateController.text = d.toString().split(" ")[0];
                                                });
                                              }
                                            });
                                          },
                                          child: SizedBox(
                                            width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.14,
                                            height: 45,
                                            child: TextWidgetField(
                                              controller: provider.mStartDateController,
                                              hintText: "",
                                              enabled: false,
                                              fillColor: normalGrey,
                                              suffixIcon: Padding(
                                                padding: const EdgeInsets.only(right: 10),
                                                child: Icon(Icons.calendar_today, size: Responsive.isMobile(context) ? 15 : 20),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(text: "End Date".tr(), size: Responsive.isMobile(context) ? 10 : 12),
                                        SizedBox(height: 5),
                                        InkWell(
                                          onTap: () {
                                            showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(2001),
                                                    lastDate: DateTime(2023))
                                                .then((d) {
                                              if (d != null) {
                                                setState(() {
                                                  provider.mEndDateController.text = d.toString().split(" ")[0];
                                                });
                                              }
                                            });
                                          },
                                          child: SizedBox(
                                            width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.14,
                                            height: 45,
                                            child: TextWidgetField(
                                              controller: provider.mEndDateController,
                                              fillColor: normalGrey,
                                              hintText: "",
                                              enabled: false,
                                              suffixIcon: Padding(
                                                padding: EdgeInsets.only(right: 10),
                                                child: Icon(Icons.calendar_today, size: Responsive.isMobile(context) ? 15 : 20),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                AddTextButtonWidget(
                                  text: "Apply".tr(),
                                  colors: darkyellow,
                                  onPress: () async {
                                    isLoadFilterData = true;
                                    setState(() {});
                                    await provider.getFarmComputerProjectActionData(projectID: widget.projectID["id"]);
                                    isLoadFilterData = false;
                                    setState(() {});
                                  },
                                ),
                                SizedBox(width: getWidth(context) * 0.010),
                                AddTextButtonWidget(
                                  text: "Clear".tr(),
                                  colors: darkyellow,
                                  onPress: () async {
                                    isLoadFilterData = true;
                                    setState(() {});
                                    provider.clearFieldsAndHideActionButtons();
                                    await provider.getFarmComputerProjectActionData(projectID: widget.projectID["id"]);
                                    isLoadFilterData = false;
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    isLoadFilterData
                        ? Container(
                            alignment: Alignment.topCenter,
                            height: getHeight(context) / 2,
                            child: Center(child: CircularProgressIndicator()),
                          )
                        : provider.farmComputerProjectActionResponseModel.data!.isEmpty
                            ? Container(
                                height: getHeight(context),
                                alignment: Alignment.topCenter,
                                padding: EdgeInsets.all(20),
                                child: CustomText(
                                  text: "No data found".tr(),
                                  color: Colors.red,
                                  weight: FontWeight.w700,
                                  size: 20,
                                ),
                              )
                            : Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: SizedBox(
                                    height: getHeight(context),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: DataTable(
                                            dataRowHeight: 40,
                                            horizontalMargin: 0,
                                            columnSpacing: Responsive.isDesktop(context)
                                                ? 90
                                                : Responsive.isTablet(context)
                                                    ? 45
                                                    : 40,
                                            columns: [
                                              DataColumn(
                                                label: CustomText(
                                                  text: 'Action'.tr(),
                                                  color: Colors.black,
                                                  size: 12,
                                                  weight: FontWeight.bold,
                                                ),
                                              ),
                                              DataColumn(
                                                label: CustomText(
                                                  text: 'Date'.tr(),
                                                  color: Colors.black,
                                                  size: 12,
                                                  weight: FontWeight.bold,
                                                ),
                                              ),
                                              DataColumn(
                                                label: CustomText(
                                                  text: 'Done by'.tr(),
                                                  color: Colors.black,
                                                  size: 12,
                                                  weight: FontWeight.bold,
                                                ),
                                              ),
                                              DataColumn(
                                                label: CustomText(
                                                  text: 'Parcel'.tr(),
                                                  color: Colors.black,
                                                  size: 12,
                                                  weight: FontWeight.bold,
                                                ),
                                              ),
                                              DataColumn(
                                                label: CustomText(
                                                  text: 'Sub parcel'.tr(),
                                                  color: Colors.black,
                                                  size: 12,
                                                  weight: FontWeight.bold,
                                                ),
                                              ),
                                              DataColumn(
                                                  label: CustomText(
                                                text: 'Row Total:'.tr() + provider.farmComputerProjectActionResponseModel.data!.length.toString(),
                                                color: Colors.black,
                                                size: 12,
                                                weight: FontWeight.bold,
                                              )),
                                            ],
                                            rows: <DataRow>[
                                              for (int i = 0; i < provider.farmComputerProjectActionResponseModel.data!.length; i++)
                                                DataRow(
                                                  cells: [
                                                    DataCell(
                                                      Text(
                                                        provider.farmComputerProjectActionResponseModel.data![i].actionType!.isEmpty
                                                            ? ""
                                                            : provider.farmComputerProjectActionResponseModel.data![i].actionType!.join(''),
                                                        style: TextStyle(fontFamily: Montserrat_Medium),
                                                      ),
                                                      onTap: () {
                                                        provider.getFarmComputerActionDetailData(
                                                            id: provider.farmComputerProjectActionResponseModel.data![i].id!, context: this.context);
                                                      },
                                                    ),
                                                    DataCell(
                                                      Text(
                                                        provider.farmComputerProjectActionResponseModel.data?[i].doneOnDate ?? "",
                                                        style: TextStyle(fontFamily: Montserrat_Medium),
                                                      ),
                                                      onTap: () {
                                                        provider.getFarmComputerActionDetailData(
                                                            id: provider.farmComputerProjectActionResponseModel.data![i].id!, context: this.context);
                                                      },
                                                    ),
                                                    DataCell(
                                                      Row(
                                                        children: provider.farmComputerProjectActionResponseModel.data![i].actionDoneBy!.map(
                                                          (e) {
                                                            return Text(
                                                              ' ${e.name ?? ""}',
                                                              style: TextStyle(fontFamily: Montserrat_Medium),
                                                            );
                                                          },
                                                        ).toList(),
                                                      ),
                                                      onTap: () {
                                                        provider.getFarmComputerActionDetailData(
                                                            id: provider.farmComputerProjectActionResponseModel.data![i].id!, context: this.context);
                                                      },
                                                    ),
                                                    DataCell(
                                                      Wrap(
                                                        spacing: 5,
                                                        runSpacing: 5,
                                                        children: provider.farmComputerProjectActionResponseModel.data![i].parcels!.map(
                                                          (e) {
                                                            return Text(
                                                              ' ${e.parcelName ?? ""}',
                                                              style: TextStyle(fontFamily: Montserrat_Medium),
                                                            );
                                                          },
                                                        ).toList(),
                                                      ),
                                                      onTap: () {
                                                        provider.getFarmComputerActionDetailData(
                                                            id: provider.farmComputerProjectActionResponseModel.data![i].id!, context: this.context);
                                                      },
                                                    ),
                                                    DataCell(
                                                      Row(
                                                        children: provider.farmComputerProjectActionResponseModel.data![i].subParcels!.map(
                                                          (e) {
                                                            return Text(
                                                              ' $e',
                                                              style: TextStyle(fontFamily: Montserrat_Medium),
                                                            );
                                                          },
                                                        ).toList(),
                                                      ),
                                                      onTap: () {
                                                        provider.getFarmComputerActionDetailData(
                                                            id: provider.farmComputerProjectActionResponseModel.data![i].id!, context: this.context);
                                                      },
                                                    ),
                                                    DataCell(
                                                      Row(children: const [Text('')]),
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                  ],
                ),
              ),
            ),
    );
  }
}
