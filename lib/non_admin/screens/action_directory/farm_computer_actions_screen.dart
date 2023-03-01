import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:wij_land/non_admin/screens/project_dashboard/project_actions/widget/add_project_action_dialog.dart';
import 'package:wij_land/utils/hex_color.dart';
import 'package:wij_land/utils/responsive.dart';
import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/icon_text_container.dart';
import '../../../../app_common_widgets/text_widget.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/styles.dart';
import '../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../screens/office/widgets/add_text_button_widget.dart';
import '../../app_common_widgets/large_screen.dart';
import '../../models/farm_computer_dropdown/parcel_project_drop_down.dart';
import '../../models/farm_computer_parcels/response/parcels_dropdown_reponse.dart';
import '../../providers/farm_computer_actions_provider/farm_computer_actions_provider.dart';

class FarmComputerActionsScreen extends StatefulWidget {
  final arguments;

  const FarmComputerActionsScreen({Key? key, this.arguments}) : super(key: key);

  @override
  State<FarmComputerActionsScreen> createState() => _FarmComputerActionsScreenState();
}

class _FarmComputerActionsScreenState extends State<FarmComputerActionsScreen> {
  @override
  void initState() {
    super.initState();
    getData();
    Provider.of<FarmComputerActionProvider>(context, listen: false).projDropDown();
    Provider.of<FarmComputerActionProvider>(context, listen: false).clearFieldsAndHideActionButtons();
  }

  getData() {
    if (widget.arguments != null && widget.arguments != true) {
      Provider.of<FarmComputerActionProvider>(context, listen: false).getFarmComputerActionDataByParcelID(parcelID: widget.arguments);
    } else {
      Provider.of<FarmComputerActionProvider>(context, listen: false).getFarmComputerActionData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FarmComputerActionProvider>(
      builder: (context, provider, child) {
        return VisibilityDetector(
          key: Key('ActionScreen-key'),
          onVisibilityChanged: (visibilityInfo) {
            var visiblePercentage = visibilityInfo.visibleFraction * 100;
            if (visiblePercentage > 50) {
              if (widget.arguments != null) {
                global_farmer_entitiy.value = [
                  HoverWidget(
                    child: Text(
                      'Home / '.tr(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: shineGrey,
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
                    'Actions'.tr(),
                    style: TextStyle(
                      fontFamily: Montserrat_Medium,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: darkRed,
                    ),
                  ),
                ];
              } else {
                global_farmer_entitiy.value = [
                  Text(
                    'Actions'.tr(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: darkRed),
                  ),
                ];
              }
            }
          },
          child: Scaffold(
            body: SingleChildScrollView(
              child: provider.isLoading
                  ? SizedBox(
                      height: getHeight(context) / 2,
                      width: getWidth(context),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : SizedBox(
                      child: Padding(
                        padding: EdgeInsets.all(Responsive.isMobile(context) ? 5 : 25.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: Responsive.isMobile(context) ? 5 : 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "Actions".tr(),
                                    size: 20,
                                    color: darkGreen,
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
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: getWidth(context),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Wrap(
                                    alignment: WrapAlignment.spaceBetween,
                                    crossAxisAlignment: WrapCrossAlignment.start,
                                    spacing: 5,
                                    runSpacing: 15,
                                    runAlignment: WrapAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomText(text: "Project(multi-select)".tr(), size: Responsive.isMobile(context) ? 10 : 12),
                                          SizedBox(height: 5),
                                          SizedBox(
                                            width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.14,
                                            height: 47,
                                            child: RealDropDownWidget(
                                              value: provider.parcelProjectSelectedDropDownName,
                                              color: normalGrey,
                                              onChanged: (newValue) {
                                                ProjectData data = newValue;
                                                setState(() {
                                                  provider.parcelProjectSelectedDropDownName = data;
                                                  if (!provider.listofSelectedProject.contains(provider.parcelProjectSelectedDropDownName!)) {
                                                    provider.listofSelectedProject.add(provider.parcelProjectSelectedDropDownName!);
                                                  }
                                                });
                                              },
                                              items: provider.parcelProjectsDropDownModel.map<DropdownMenuItem<ProjectData>>(
                                                (ProjectData value) {
                                                  return DropdownMenuItem<ProjectData>(
                                                      value: value,
                                                      child: Text(
                                                        value.name!,
                                                        style: TextStyle(
                                                          fontFamily: Montserrat_Medium,
                                                        ),
                                                      ));
                                                },
                                              ).toList(),
                                            ),
                                          ),
                                          SizedBox(
                                            width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.14,
                                            child: Wrap(
                                                children: provider.listofSelectedProject.map(
                                              (e) {
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
                                              },
                                            ).toList()),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomText(text: "Parcel (multi-select)".tr(), size: Responsive.isMobile(context) ? 10 : 12),
                                          SizedBox(height: 5),
                                          SizedBox(
                                            width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.14,
                                            height: 47,
                                            child: RealDropDownWidget(
                                              value: provider.listOfSelectedParcelsDropdown,
                                              color: normalGrey,
                                              onChanged: (newValue) {
                                                ParcelDropDownData data = newValue;
                                                setState(() {
                                                  provider.listOfSelectedParcelsDropdown = data;

                                                  if (!provider.parcelDropDownList.contains(provider.listOfSelectedParcelsDropdown)) {
                                                    provider.parcelDropDownList.add(provider.listOfSelectedParcelsDropdown!);
                                                  }
                                                });
                                              },
                                              items:
                                                  provider.parcelDropdownModel.map<DropdownMenuItem<ParcelDropDownData>>((ParcelDropDownData value) {
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
                                                children: provider.parcelDropDownList.map(
                                              (e) {
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
                                              },
                                            ).toList()),
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
                                                children: provider.listOfSelectedActionDropdown.map(
                                              (e) {
                                                return Container(
                                                  padding: EdgeInsets.all(3),
                                                  child: Chip(
                                                    label: Text('$e',
                                                        style: TextStyle(color: Colors.black, fontFamily: Montserrat_Medium, fontSize: 11)),
                                                    onDeleted: () {
                                                      provider.listOfSelectedActionDropdown.remove(e);
                                                      setState(() {});
                                                    },
                                                  ),
                                                );
                                              },
                                            ).toList()),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomText(text: "Start Data".tr(), size: Responsive.isMobile(context) ? 10 : 12),
                                          SizedBox(height: 5),
                                          InkWell(
                                            onTap: () {
                                              showDatePicker(
                                                      context: context,
                                                      initialDate: DateTime.now(),
                                                      firstDate: DateTime(2001),
                                                      lastDate: DateTime(2023))
                                                  .then((d) {
                                                debugPrint("$d");
                                                if (d != null) {
                                                  setState(() {
                                                    provider.mStartDateController.text = d.toString().split(" ")[0];
                                                  });
                                                  provider.showOrHideActionButtons();
                                                }
                                              });
                                            },
                                            child: Container(
                                              width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.14,
                                              height: 47,
                                              decoration: BoxDecoration(
                                                color: HexColor("#FAFAFA"),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: TextWidgetField(
                                                controller: provider.mStartDateController,
                                                hintText: "Start Date".tr(),
                                                textPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                                                enabled: false,
                                                mFillColor: HexColor("#FAFAFA"),
                                                suffixIcon: Padding(
                                                  padding: EdgeInsets.only(right: 10),
                                                  child: Icon(
                                                    Icons.calendar_today_outlined,
                                                    size: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomText(text: "End Data".tr(), size: Responsive.isMobile(context) ? 10 : 12),
                                          SizedBox(height: 5),
                                          InkWell(
                                            onTap: () {
                                              showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2001),
                                                lastDate: DateTime(2023),
                                              ).then((d) {
                                                debugPrint("$d");
                                                if (d != null) {
                                                  setState(() {
                                                    provider.mEndDateController.text = d.toString().split(" ")[0];
                                                  });
                                                  provider.showOrHideActionButtons();
                                                }
                                              });
                                            },
                                            child: Container(
                                              width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.14,
                                              height: 47,
                                              decoration: BoxDecoration(
                                                color: HexColor("#FAFAFA"),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: TextWidgetField(
                                                controller: provider.mEndDateController,
                                                hintText: "End Date".tr(),
                                                textPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                                                enabled: false,
                                                mFillColor: HexColor("#FAFAFA"),
                                                suffixIcon: Padding(
                                                  padding: EdgeInsets.only(right: 10),
                                                  child: Icon(
                                                    Icons.calendar_today_outlined,
                                                    size: 14,
                                                  ),
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
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: Responsive.isMobile(context) ? 5 : 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  AddTextButtonWidget(
                                    text: "Apply".tr(),
                                    colors: darkyellow,
                                    onPress: () async {
                                      provider.isLoading = true;
                                      setState(() {});
                                      await provider.getFarmComputerActionData();
                                      provider.isLoading = false;
                                      setState(() {});
                                    },
                                  ),
                                  SizedBox(width: 10),
                                  AddTextButtonWidget(
                                    text: "Clear".tr(),
                                    colors: darkyellow,
                                    onPress: () async {
                                      provider.clearFieldsAndHideActionButtons();
                                      setState(() {});
                                    },
                                  ),
                                ],
                              ),
                            ),
                            provider.isLoading
                                ? SizedBox(
                                    height: getHeight(context) / 2,
                                    width: getWidth(context),
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : provider.farmComputerActionResponseModel.status == 404 || provider.farmComputerActionResponseModel.data!.isEmpty
                                    ? SizedBox(
                                        height: getHeight(context),
                                        // width: getWidth(context),
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Padding(
                                            padding: const EdgeInsets.all(25.0),
                                            child: CustomText(
                                              text: provider.farmComputerActionResponseModel.message ?? "No data found".tr(),
                                              color: Colors.red,
                                              weight: FontWeight.w700,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Card(
                                        child: Padding(
                                          padding: EdgeInsets.all(Responsive.isMobile(context) ? 5 : 25.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? 5 : 20),
                                                child: SingleChildScrollView(
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
                                                        label: InkWell(
                                                          onTap: () {
                                                            provider.byActionName = !provider.byActionName;
                                                            if (provider.byActionName) {
                                                              provider.farmComputerActionResponseModel.data!.sort(
                                                                  (a, b) => a.actionType![0].toLowerCase().compareTo(b.actionType![0].toLowerCase()));
                                                            } else {
                                                              provider.farmComputerActionResponseModel.data!.sort(
                                                                  (a, b) => b.actionType![0].toLowerCase().compareTo(a.actionType![0].toLowerCase()));
                                                            }
                                                            setState(() {});
                                                          },
                                                          child: CustomText(
                                                            text: 'Action'.tr(),
                                                            color: Colors.black,
                                                            size: 12,
                                                            weight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      DataColumn(
                                                        label: InkWell(
                                                          onTap: () {
                                                            provider.byDate = !provider.byDate;

                                                            if (provider.byDate) {
                                                              provider.farmComputerActionResponseModel.data!.sort(
                                                                (start, end) {
                                                                  if (start.doneOnDate == "0000-00-00" && end.doneOnDate == "0000-00-00") {
                                                                    var aDate = DateTime.parse(start.doneOnDate.toString());
                                                                    var bDate = DateTime.parse(end.doneOnDate.toString());
                                                                    return aDate.compareTo(bDate);
                                                                  } else if (start.doneOnDate == "0000-00-00") {
                                                                    String secondDate =
                                                                        "${end.doneOnDate.toString().split('-')[2]}-${end.doneOnDate.toString().split('-')[1]}-${end.doneOnDate.toString().split('-')[0]}";
                                                                    var aDate = DateTime.parse(start.doneOnDate.toString());
                                                                    var bDate = DateTime.parse(secondDate);
                                                                    return aDate.compareTo(bDate);
                                                                  } else if (end.doneOnDate == "0000-00-00") {
                                                                    String firstDate =
                                                                        "${start.doneOnDate.toString().split('-')[2]}-${start.doneOnDate.toString().split('-')[1]}-${start.doneOnDate.toString().split('-')[0]}";

                                                                    var aDate = DateTime.parse(firstDate);
                                                                    var bDate = DateTime.parse(end.doneOnDate.toString());
                                                                    return aDate.compareTo(bDate);
                                                                  } else if (start.doneOnDate != null && end.doneOnDate != null) {
                                                                    String firstDate =
                                                                        "${start.doneOnDate.toString().split('-')[2]}-${start.doneOnDate.toString().split('-')[1]}-${start.doneOnDate.toString().split('-')[0]}";
                                                                    String secondDate =
                                                                        "${end.doneOnDate.toString().split('-')[2]}-${end.doneOnDate.toString().split('-')[1]}-${end.doneOnDate.toString().split('-')[0]}";
                                                                    var aDate = DateTime.parse(firstDate);
                                                                    var bDate = DateTime.parse(secondDate);
                                                                    return aDate.compareTo(bDate);
                                                                  } else {
                                                                    if (start.doneOnDate == null) {
                                                                      String secondDate =
                                                                          "${end.doneOnDate.toString().split('-')[2]}-${end.doneOnDate.toString().split('-')[1]}-${end.doneOnDate.toString().split('-')[0]}";
                                                                      start.doneOnDate = DateTime.parse("0000-00-00").toString();
                                                                      var aDate = DateTime.parse(start.doneOnDate.toString());
                                                                      var bDate = DateTime.parse(secondDate);
                                                                      return aDate.compareTo(bDate);
                                                                    } else {
                                                                      String firstDate =
                                                                          "${start.doneOnDate.toString().split('-')[2]}-${start.doneOnDate.toString().split('-')[1]}-${start.doneOnDate.toString().split('-')[0]}";
                                                                      end.doneOnDate = "0000-00-00";
                                                                      var aDate = DateTime.parse(firstDate);
                                                                      var bDate = DateTime.parse(end.doneOnDate.toString());
                                                                      return aDate.compareTo(bDate);
                                                                    }
                                                                  }
                                                                },
                                                              );
                                                            }

                                                            ///yahn tak
                                                            else {
                                                              provider.farmComputerActionResponseModel.data!.sort((start, end) {
                                                                if (start.doneOnDate == "0000-00-00" && end.doneOnDate == "0000-00-00") {
                                                                  var aDate = DateTime.parse(start.doneOnDate.toString());
                                                                  var bDate = DateTime.parse(end.doneOnDate.toString());
                                                                  return bDate.compareTo(aDate);
                                                                } else if (start.doneOnDate == "0000-00-00") {
                                                                  String secondDate =
                                                                      "${end.doneOnDate.toString().split('-')[2]}-${end.doneOnDate.toString().split('-')[1]}-${end.doneOnDate.toString().split('-')[0]}";
                                                                  var aDate = DateTime.parse(start.doneOnDate.toString());
                                                                  var bDate = DateTime.parse(secondDate);
                                                                  return aDate.compareTo(bDate);
                                                                } else if (end.doneOnDate == "0000-00-00") {
                                                                  String firstDate =
                                                                      "${start.doneOnDate.toString().split('-')[2]}-${start.doneOnDate.toString().split('-')[1]}-${start.doneOnDate.toString().split('-')[0]}";

                                                                  var aDate = DateTime.parse(firstDate);
                                                                  var bDate = DateTime.parse(end.doneOnDate.toString());
                                                                  return bDate.compareTo(aDate);
                                                                } else if (start.doneOnDate != null && end.doneOnDate != null) {
                                                                  String firstDate =
                                                                      "${start.doneOnDate.toString().split('-')[2]}-${start.doneOnDate.toString().split('-')[1]}-${start.doneOnDate.toString().split('-')[0]}";
                                                                  String secondDate =
                                                                      "${end.doneOnDate.toString().split('-')[2]}-${end.doneOnDate.toString().split('-')[1]}-${end.doneOnDate.toString().split('-')[0]}";
                                                                  var aDate = DateTime.parse(firstDate);
                                                                  var bDate = DateTime.parse(secondDate);
                                                                  return bDate.compareTo(aDate);
                                                                } else {
                                                                  if (start.doneOnDate == null) {
                                                                    String secondDate =
                                                                        "${end.doneOnDate.toString().split('-')[2]}-${end.doneOnDate.toString().split('-')[1]}-${end.doneOnDate.toString().split('-')[0]}";
                                                                    start.doneOnDate = DateTime.parse("0000-00-00").toString();
                                                                    var aDate = DateTime.parse(start.doneOnDate.toString());
                                                                    var bDate = DateTime.parse(secondDate);
                                                                    return bDate.compareTo(aDate);
                                                                  } else {
                                                                    String firstDate =
                                                                        "${start.doneOnDate.toString().split('-')[2]}-${start.doneOnDate.toString().split('-')[1]}-${start.doneOnDate.toString().split('-')[0]}";
                                                                    end.doneOnDate = "0000-00-00";
                                                                    var aDate = DateTime.parse(firstDate);
                                                                    var bDate = DateTime.parse(end.doneOnDate.toString());
                                                                    return bDate.compareTo(aDate);
                                                                  }
                                                                }
                                                              });
                                                            }

                                                            setState(() {});
                                                          },
                                                          child: CustomText(
                                                            text: 'Date'.tr(),
                                                            color: Colors.black,
                                                            size: 12,
                                                            weight: FontWeight.bold,
                                                          ),
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
                                                      widget.arguments != null
                                                          ? DataColumn(
                                                              label: CustomText(
                                                              text: "",
                                                            ))
                                                          : DataColumn(
                                                              label: CustomText(
                                                              text: 'Sub parcel'.tr(),
                                                              color: Colors.black,
                                                              size: 12,
                                                              weight: FontWeight.bold,
                                                            )),
                                                      DataColumn(
                                                        label: CustomText(
                                                          text: "Total".tr() + " ${provider.farmComputerActionResponseModel.data!.length}",
                                                          color: Colors.black,
                                                          size: 12,
                                                          weight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                    rows: <DataRow>[
                                                      for (int i = 0; i < provider.farmComputerActionResponseModel.data!.length; i++)
                                                        DataRow(
                                                          cells: [
                                                            DataCell(
                                                              Text(provider.farmComputerActionResponseModel.data![i].actionType!.join('')),
                                                              onTap: () {
                                                                provider.getFarmComputerActionDetailData(
                                                                    id: provider.farmComputerActionResponseModel.data![i].id!, context: this.context);
                                                              },
                                                            ),
                                                            DataCell(
                                                              Text(provider.farmComputerActionResponseModel.data![i].doneOnDate == null
                                                                  ? ""
                                                                  : provider.farmComputerActionResponseModel.data![i].doneOnDate == "0000-00-00"
                                                                      ? ""
                                                                      : provider.farmComputerActionResponseModel.data![i].doneOnDate!),
                                                              onTap: () {
                                                                provider.getFarmComputerActionDetailData(
                                                                    id: provider.farmComputerActionResponseModel.data![i].id!, context: this.context);
                                                              },
                                                            ),
                                                            DataCell(
                                                              widget.arguments != null
                                                                  ? provider.farmComputerActionResponseModel.data![i].actionDoneBy!.isEmpty
                                                                      ? Text("")
                                                                      : Row(
                                                                          children: provider.farmComputerActionResponseModel.data![i].actionDoneBy!
                                                                              .map((e) {
                                                                          return Text(
                                                                            ' ${e.name ?? ""}',
                                                                            style: TextStyle(
                                                                              fontFamily: Montserrat_Medium,
                                                                            ),
                                                                          );
                                                                        }).toList())
                                                                  : Row(
                                                                      children:
                                                                          provider.farmComputerActionResponseModel.data![i].actionDoneBy!.map((e) {
                                                                      return Text(
                                                                        ' ${e.name ?? ""}',
                                                                        style: TextStyle(
                                                                          fontFamily: Montserrat_Medium,
                                                                        ),
                                                                      );
                                                                    }).toList()),
                                                              onTap: () {
                                                                provider.getFarmComputerActionDetailData(
                                                                    id: provider.farmComputerActionResponseModel.data![i].id!, context: this.context);
                                                              },
                                                            ),
                                                            DataCell(
                                                              widget.arguments != null
                                                                  ? Text(
                                                                      provider.farmComputerActionResponseModel.data![i].parcels!.isEmpty
                                                                          ? ""
                                                                          : provider
                                                                                  .farmComputerActionResponseModel.data![i].parcels![0].parcelName ??
                                                                              "",
                                                                      style: TextStyle(
                                                                        fontFamily: Montserrat_Medium,
                                                                      ))
                                                                  : Row(
                                                                      children: provider.farmComputerActionResponseModel.data![i].parcels!.map((e) {
                                                                        return Text(' ${e.parcelName ?? ""}',
                                                                            style: TextStyle(
                                                                              fontFamily: Montserrat_Medium,
                                                                            ));
                                                                      }).toList(),
                                                                    ),
                                                              onTap: () {
                                                                provider.getFarmComputerActionDetailData(
                                                                    id: provider.farmComputerActionResponseModel.data![i].id!, context: this.context);
                                                              },
                                                            ),
                                                            DataCell(
                                                              (widget.arguments != null &&
                                                                      provider.farmComputerActionResponseModel.data![i].subParcels!.isEmpty)
                                                                  ? Text("")
                                                                  : Row(
                                                                      children:
                                                                          provider.farmComputerActionResponseModel.data![i].subParcels!.map((e) {
                                                                      return Text(e.subParcelName ?? "",
                                                                          style: TextStyle(
                                                                            fontFamily: Montserrat_Medium,
                                                                          ));
                                                                    }).toList()),
                                                              onTap: () {
                                                                provider.getFarmComputerActionDetailData(
                                                                    id: provider.farmComputerActionResponseModel.data![i].id!, context: this.context);
                                                              },
                                                            ),
                                                            DataCell(Text('')),
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
