import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/app_common_widgets/real_dropdown_widget.dart';
import 'package:wij_land/app_common_widgets/text_widget.dart';
import 'package:wij_land/non_admin/providers/farm_computer_projects_provider/farm_computer_events_provider.dart';
import 'package:wij_land/non_admin/routes/routes.dart';
import 'package:wij_land/non_admin/screens/computer_events/widgets/event_going_button.dart';
import 'package:wij_land/non_admin/screens/computer_events/widgets/event_rsvp_dialog.dart';
import 'package:wij_land/utils/controller.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/images.dart';
import 'package:wij_land/utils/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../screens/office/widgets/add_text_button_widget.dart';
import '../../../utils/responsive.dart';
import '../../models/farm_computer_dropdown/parcel_project_drop_down.dart';
import '../../models/farm_computer_events/computer_events/request/put_farm_computer_event_attendance_request.dart';
import '../../models/farm_computer_events/computer_events_list/get_computer_events_list_response.dart';
import '../../providers/farm_computer_projects_provider/farm_computer_events_file_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FarmComputerEventsListScreen extends StatefulWidget {
  final bool? activeFilter;
  final arguments;
  final FarmComputerEventsListScreen? loadData;

  const FarmComputerEventsListScreen({
    Key? key,
    this.model,
    this.activeFilter,
    this.arguments,
    this.loadData,
  }) : super(key: key);
  final GetFarmComputerEventsListResponse? model;

  @override
  State<FarmComputerEventsListScreen> createState() => _FarmComputerEventsListScreenState();
}

class _FarmComputerEventsListScreenState extends State<FarmComputerEventsListScreen> {
  @override
  void initState() {
    isLoading = true;
    isLoadFilterData = false;
    initData();
    super.initState();
  }

  initData() async {
    print("New call ===============");
    isLoadFilterData = true;

    var _provider = Provider.of<CreateFarmComputerEventsListProvider>(context, listen: false);
    await _provider.getFarmComputerEvent();
    if (_provider.farmComputerEventsResponseModel.error?.status != 404) {
      _provider.farmComputerEventsResponseModel.data!.sort((start, end) {
        if (start.date != null && end.date != null) {
          var aDate = DateTime.parse(start.date.toString());
          var bDate = DateTime.parse(end.date.toString());
          return bDate.compareTo(aDate);
        }
        if (start.date == "0000-00-00" && end.date == "0000-00-00") {
          var aDate = DateTime.parse(start.date.toString());
          var bDate = DateTime.parse(end.date.toString());
          return aDate.compareTo(bDate);
        } else if (start.date == "0000-00-00") {
          String secondDate = "${end.date.toString().split('-')[0]}-${end.date.toString().split('-')[1]}-${end.date.toString().split('-')[2]}";
          var aDate = DateTime.parse(start.date.toString());
          var bDate = DateTime.parse(secondDate);
          return aDate.compareTo(bDate);
        } else if (end.date == "0000-00-00") {
          String firstDate = "${start.date.toString().split('-')[0]}-${start.date.toString().split('-')[1]}-${start.date.toString().split('-')[2]}";
          var aDate = DateTime.parse(firstDate);
          var bDate = DateTime.parse(end.date.toString());
          return aDate.compareTo(bDate);
        } else if (start.date != null && end.date != null) {
          String firstDate = "${start.date.toString().split('-')[0]}-${start.date.toString().split('-')[1]}-${start.date.toString().split('-')[2]}";
          String secondDate = "${end.date.toString().split('-')[0]}-${end.date.toString().split('-')[1]}-${end.date.toString().split('-')[2]}";
          var aDate = DateTime.parse(firstDate);
          var bDate = DateTime.parse(secondDate);
          return aDate.compareTo(bDate);
        } else {
          if (start.date == null) {
            String secondDate = "${end.date.toString().split('-')[0]}-${end.date.toString().split('-')[1]}-${end.date.toString().split('-')[2]}";
            start.date = DateTime.parse("0000-00-00").toString();
            var aDate = DateTime.parse(start.date.toString());
            var bDate = DateTime.parse(secondDate);
            return aDate.compareTo(bDate);
          } else {
            String firstDate = "${start.date.toString().split('-')[0]}-${start.date.toString().split('-')[1]}-${start.date.toString().split('-')[2]}";
            end.date = DateTime.parse("0000-00-00").toString();
            print("first===============${firstDate}");
            var bDate = DateTime.parse(end.date.toString());

            var aDate = DateTime.parse(firstDate);
            return aDate.compareTo(bDate);
          }
        }
      });
    } else {
      _provider.farmComputerEventsResponseModel.data!.sort((start, end) {
        if (start.date == "0000-00-00" && end.date == "0000-00-00") {
          var aDate = DateTime.parse(start.date.toString());
          var bDate = DateTime.parse(end.date.toString());
          return bDate.compareTo(aDate);
        } else if (start.date == "0000-00-00") {
          String secondDate = "${end.date.toString().split('-')[0]}-${end.date.toString().split('-')[1]}-${end.date.toString().split('-')[2]}";
          var aDate = DateTime.parse(start.date.toString());
          var bDate = DateTime.parse(secondDate);
          return aDate.compareTo(bDate);
        } else if (end.date == "0000-00-00") {
          String firstDate = "${start.date.toString().split('-')[0]}-${start.date.toString().split('-')[1]}-${start.date.toString().split('-')[2]}";
          var aDate = DateTime.parse(firstDate);
          var bDate = DateTime.parse(end.date.toString());
          return bDate.compareTo(aDate);
        } else if (start.date != null && end.date != null) {
          String firstDate = "${start.date.toString().split('-')[0]}-${start.date.toString().split('-')[1]}-${start.date.toString().split('-')[2]}";
          String secondDate = "${end.date.toString().split('-')[0]}-${end.date.toString().split('-')[1]}-${end.date.toString().split('-')[2]}";
          var aDate = DateTime.parse(firstDate);
          var bDate = DateTime.parse(secondDate);
          return bDate.compareTo(aDate);
        } else {
          if (start.date == null) {
            String secondDate = "${end.date.toString().split('-')[0]}-${end.date.toString().split('-')[1]}-${end.date.toString().split('-')[2]}";
            start.date = DateTime.parse("0000-00-00").toString();
            var aDate = DateTime.parse(start.date.toString());
            var bDate = DateTime.parse(secondDate);
            return bDate.compareTo(aDate);
          } else {
            String firstDate = "${start.date.toString().split('-')[0]}-${start.date.toString().split('-')[1]}-${start.date.toString().split('-')[2]}";
            end.date = DateTime.parse("00-00-0000").toString();
            var aDate = DateTime.parse(firstDate);
            var bDate = DateTime.parse(end.date.toString());
            return bDate.compareTo(aDate);
          }
        }
      });
    }
    isLoading = false;
    // setState(() {});
    isLoadFilterData = false;

    await Provider.of<CreateFarmComputerEventsListProvider>(context, listen: false).allDropDown();
  }

  ValueNotifier<bool> buttonClickedTimes = ValueNotifier(false);

  upDateStatus() {
    buttonClickedTimes.value = true;
    print(" buttonClickedTimes.value================${buttonClickedTimes.value}");
    Future.delayed(Duration(milliseconds: 50), () {
      buttonClickedTimes.value = false;
      print(" buttonClickedTimes.value 1===============${buttonClickedTimes.value}");
    });
  }

  bool isLoadFilterData = false;
  var progress = false.obs;
  bool isLoading = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CreateFarmComputerEventsListProvider>(context);
    return isLoading
        ? SizedBox(
            height: getHeight(context) / 2,
            width: getWidth(context),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Column(
            children: [
              Visibility(
                visible: widget.activeFilter!,
                child: SizedBox(
                  width: getWidth(context),
                  child: !widget.activeFilter!
                      ? SizedBox()
                      : Column(
                          children: [
                            SizedBox(
                              width: getWidth(context),
                              child: Card(
                                elevation: 0,
                                child: Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Wrap(
                                    alignment: WrapAlignment.spaceBetween,
                                    crossAxisAlignment: WrapCrossAlignment.start,
                                    runSpacing: 15,
                                    spacing: 5,
                                    runAlignment: WrapAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomText(text: "Project".tr(), size: Responsive.isMobile(context) ? 10 : 12),
                                          SizedBox(height: 5),
                                          SizedBox(
                                            width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.15,
                                            height: 47,
                                            child: RealDropDownWidget(
                                              value: provider.parcelProjectSelectedDropDownName,
                                              color: normalGrey,
                                              onChanged: (newValue) {
                                                ProjectData data = newValue;
                                                // print('newValue = $newValue');
                                                setState(() {
                                                  provider.parcelProjectSelectedDropDownName = data;
                                                  if (!provider.listofSelectedProject.contains(provider.parcelProjectSelectedDropDownName!)) {
                                                    provider.listofSelectedProject.add(provider.parcelProjectSelectedDropDownName!);
                                                  }
                                                });
                                              },
                                              items: provider.parcelProjectsDropDownModel.map<DropdownMenuItem<ProjectData>>((ProjectData value) {
                                                return DropdownMenuItem<ProjectData>(value: value, child: Text(value.name!));
                                              }).toList(),
                                            ),
                                          ),
                                          SizedBox(
                                            width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.15,
                                            child: Wrap(
                                                children: provider.listofSelectedProject.map((e) {
                                              return Container(
                                                padding: EdgeInsets.all(3),
                                                child: Chip(
                                                  label: Text('${e.name}', style: TextStyle(color: Colors.black, fontSize: 11)),
                                                  onDeleted: () {
                                                    provider.listofSelectedProject.remove(e);
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
                                          CustomText(text: "Type".tr(), size: Responsive.isMobile(context) ? 10 : 12),
                                          SizedBox(height: 5),
                                          SizedBox(
                                            width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.15,
                                            height: 47,
                                            child: RealDropDownWidget(
                                              value: provider.eventType_selected_dopDown,
                                              color: normalGrey,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  provider.eventType_selected_dopDown = newValue;
                                                  if (!provider.listofSelectedEvents.contains(provider.eventType_selected_dopDown)) {
                                                    provider.listofSelectedEvents.add(provider.eventType_selected_dopDown);
                                                  }
                                                });
                                              },
                                              items: provider.eventTypeDropDownList.map<DropdownMenuItem<String>>((String value) {
                                                return DropdownMenuItem<String>(value: value, child: Text(value));
                                              }).toList(),
                                            ),
                                          ),
                                          SizedBox(
                                            width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.15,
                                            child: Wrap(
                                                children: provider.listofSelectedEvents.map((e) {
                                              return Container(
                                                padding: EdgeInsets.all(3),
                                                child: Chip(
                                                  label: Text('$e', style: TextStyle(color: Colors.black, fontSize: 11)),
                                                  onDeleted: () {
                                                    provider.listofSelectedEvents.remove(e);
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
                                                //   print("${d.toString().split(" ")[0]}");
                                                if (d != null) {
                                                  setState(() {
                                                    provider.startdate.text = d.toString().split(" ")[0];
                                                  });
                                                }
                                              });
                                            },
                                            child: SizedBox(
                                              width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.15,
                                              height: 45,
                                              child: TextWidgetField(
                                                controller: provider.startdate,
                                                hintText: "",
                                                enabled: false,
                                                fillColor: normalGrey,
                                                suffixIcon: Padding(
                                                  padding: EdgeInsets.only(right: 10),
                                                  child: const Icon(Icons.calendar_today, size: 20),
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
                                                    provider.endDate.text = d.toString().split(" ")[0];
                                                  });
                                                }
                                              });
                                            },
                                            child: SizedBox(
                                              width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.15,
                                              height: 45,
                                              child: TextWidgetField(
                                                controller: provider.endDate,
                                                fillColor: normalGrey,
                                                hintText: "",
                                                enabled: false,
                                                suffixIcon: Padding(
                                                  padding: EdgeInsets.only(right: 10),
                                                  child: const Icon(Icons.calendar_today, size: 20),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomText(text: "Sort".tr(), size: Responsive.isMobile(context) ? 10 : 12),
                                          SizedBox(height: 5),
                                          SizedBox(
                                            width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.15,
                                            height: 47,
                                            child: RealDropDownWidget(
                                              value: provider.sortSelected,
                                              color: normalGrey,
                                              hint: 'Sort'.tr(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  provider.sortSelected = newValue;
                                                });
                                              },
                                              items: provider.selectList.map<DropdownMenuItem<String>>((String value) {
                                                return DropdownMenuItem<String>(value: value, child: Text(value));
                                              }).toList(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: getHeight(context) * 0.015),
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  AddTextButtonWidget(
                                    text: "Apply".tr(),
                                    colors: darkyellow,
                                    onPress: () async {
                                      isLoadFilterData = true;
                                      setState(() {});
                                      await provider.getFarmComputerEventSearchResponse();
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
                                      provider.parcelProjectSelectedDropDownName = ProjectData(id: -1, name: '');
                                      provider.eventType_selected_dopDown = '';
                                      provider.parcelProjectSelectedDropDownName = provider.parcelProjectsDropDownModel[0];
                                      controller.clear();
                                      setState(() {});
                                      provider.contactSummy = '';
                                      provider.startdate.text = '';
                                      provider.endDate.text = '';
                                      provider.listofSelectedEvents = [];
                                      provider.listofSelectedProject = [];
                                      provider.sortSelected = '';
                                      await provider.getFarmComputerEvent();
                                      isLoadFilterData = false;
                                      initData();
                                      setState(() {});
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              isLoadFilterData
                  ? Container(
                      alignment: Alignment.topCenter,
                      height: getHeight(context) / 2,
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : provider.farmComputerEventsResponseModel.status == 400
                      ? Container(
                          alignment: Alignment.topCenter,
                          height: getHeight(context) / 2,
                          child: Center(
                            child: CustomText(
                              text: provider.farmComputerEventsResponseModel.message ?? "",
                              color: Colors.red,
                              weight: FontWeight.w700,
                              size: 20,
                            ),
                          ),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Responsive.isMobile(context) ? Axis.horizontal : Axis.vertical,
                          child: Column(
                            children: [
                              for (int i = 0; i < provider.farmComputerEventsResponseModel.data!.length; i++)
                                InkWell(
                                  onTap: () async {
                                    await navigationController.navigateToWithArguments(routeName: eventsFileScreenPageRoute, arguments: {
                                      "event_ids": provider.farmComputerEventsResponseModel.data![i].id,
                                      "event_name": provider.farmComputerEventsResponseModel.data![i].name,
                                      "argument": widget.arguments
                                    });
                                    await provider.getFarmComputerEvent();
                                    setState(() {});
                                  },
                                  child: SizedBox(
                                    width: getWidth(context),
                                    // height: Responsive.isDesktop(context)
                                    //     ? getHeight(context) * 0.20
                                    //     : Responsive.isTablet(context)
                                    //         ? getHeight(context) * 0.25
                                    //         : getHeight(context) * 0.21,
                                    child: Card(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(10))),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          // provider.farmComputerEventsResponseModel.data![i].eventPicture != null
                                          //     ? CachedNetworkImage(
                                          //         imageUrl: provider.farmComputerEventsResponseModel.data![i].eventPicture!.path!,
                                          //         imageBuilder: (context, imageProvider) => Container(
                                          //           width: Responsive.isMobile(context) ? getWidth(context) * 0.13 : getWidth(context) * 0.1,
                                          //           height: Responsive.isMobile(context) ? getWidth(context) * 0.2 : getWidth(context) * 0.08,
                                          //           decoration: BoxDecoration(
                                          //             image: DecorationImage(
                                          //               image: imageProvider,
                                          //               fit: BoxFit.cover,
                                          //             ),
                                          //           ),
                                          //         ),
                                          //         placeholder: (context, url) => Center(
                                          //           child: Image(
                                          //             image: AssetImage(Images.eventImage),
                                          //             width: Responsive.isMobile(context) ? getWidth(context) * 0.13 : getWidth(context) * 0.1,
                                          //             height: Responsive.isMobile(context) ? getWidth(context) * 0.2 : getWidth(context) * 0.08,
                                          //             fit: BoxFit.cover,
                                          //           ),
                                          //         ),
                                          //         errorWidget: (context, url, error) => Icon(Icons.error),
                                          //       )
                                          //     : Image(
                                          //         image: AssetImage(Images.eventImage),
                                          //         width: Responsive.isMobile(context) ? getWidth(context) * 0.13 : getWidth(context) * 0.1,
                                          //         height: Responsive.isMobile(context) ? getWidth(context) * 0.2 : getWidth(context) * 0.08,
                                          //         fit: BoxFit.cover,
                                          //       ),
                                          provider.farmComputerEventsResponseModel.data![i].eventPicture != null
                                              ? Image.network(
                                                  provider.farmComputerEventsResponseModel.data![i].eventPicture!.path!,
                                                  width: Responsive.isMobile(context) ? getWidth(context) * 0.13 : getWidth(context) * 0.1,
                                                  height: Responsive.isMobile(context) ? getWidth(context) * 0.2 : getWidth(context) * 0.08,
                                                  fit: BoxFit.cover,
                                                )
                                              : Image(
                                                  image: AssetImage(Images.eventImage),
                                                  width: Responsive.isMobile(context) ? getWidth(context) * 0.13 : getWidth(context) * 0.1,
                                                  height: Responsive.isMobile(context) ? getWidth(context) * 0.2 : getWidth(context) * 0.08,
                                                  fit: BoxFit.cover,
                                                ),
                                          SizedBox(
                                            width: Responsive.isMobile(context) ? getWidth(context) * 0.12 : getWidth(context) * 0.07,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                CustomText(
                                                  size: Responsive.isMobile(context) ? 14 : 22,
                                                  color: darkred,
                                                  text: englishMonth(
                                                    provider.farmComputerEventsResponseModel.data![i].date == null
                                                        ? "-"
                                                        : provider.farmComputerEventsResponseModel.data![i].date.toString().substring(5, 7),
                                                  ),
                                                ),
                                                CustomText(
                                                  size: Responsive.isMobile(context) ? 14 : 22,
                                                  weight: FontWeight.bold,
                                                  text: provider.farmComputerEventsResponseModel.data![i].date == null
                                                      ? "-"
                                                      : provider.farmComputerEventsResponseModel.data![i].date.toString().substring(8, 10),
                                                ),
                                                CustomText(
                                                  size: Responsive.isMobile(context) ? 11 : 14,
                                                  color: darkred,
                                                  text:
                                                    provider.farmComputerEventsResponseModel.data![i].date == null
                                                        ? "-"
                                                        : provider.farmComputerEventsResponseModel.data![i].date.toString().substring(0, 4),

                                                ),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Container(
                                              padding: EdgeInsets.only(right: Responsive.isMobile(context) ? 5 : 10, top: 5, bottom: 5),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: getWidth(context),
                                                    child: Wrap(
                                                      alignment: WrapAlignment.spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            CustomText(
                                                              text: provider.farmComputerEventsResponseModel.data![i].name ?? "-",
                                                              size: Responsive.isMobile(context) ? 11 : 18,
                                                              weight: Responsive.isMobile(context) ? FontWeight.w800 : FontWeight.bold,
                                                              overflows: TextOverflow.ellipsis,
                                                              lines: 1,
                                                              color: darkred,
                                                            ),
                                                            SizedBox(height: 4),
                                                            CustomText(
                                                              text: provider.farmComputerEventsResponseModel.data![i].location ?? '-',
                                                              overflows: TextOverflow.ellipsis,
                                                              lines: 1,
                                                              weight: Responsive.isMobile(context) ? FontWeight.w600 : FontWeight.w700,
                                                              size: Responsive.isMobile(context) ? 9 : 14,
                                                            ),
                                                          ],
                                                        ),

                                                        ///
                                                        ///         /////////          Desktop View            /////////////

                                                        ValueListenableBuilder(
                                                            valueListenable: buttonClickedTimes,
                                                            builder: (BuildContext? context, bool? counterValue, Widget? child) {
                                                              if (counterValue == true) {
                                                                return SizedBox(
                                                                  height: getWidth(context) * 0.03,
                                                                );
                                                              }
                                                              return Visibility(
                                                                visible: Responsive.isDesktop(context!) ? true : false,
                                                                child: Padding(
                                                                  padding: EdgeInsets.only(top: 10, right: 10),
                                                                  child: Wrap(
                                                                    children: [
                                                                      EventGoingButton(
                                                                        text: "Going".tr(),
                                                                        onTap: () async {
                                                                          //In case if event mode is Hybrid
                                                                          if (provider.farmComputerEventsResponseModel.data![i].eventMode!
                                                                                      .contains("Hybrid") &&
                                                                                  provider.farmComputerEventsResponseModel.data![i].rsvpAnswer!
                                                                                      .contains("yes") ||
                                                                              provider.farmComputerEventsResponseModel.data![i].eventMode!
                                                                                      .contains("Hybrid") &&
                                                                                  provider.farmComputerEventsResponseModel.data![i].rsvpAnswer!
                                                                                      .contains("maybe")) {
                                                                            showDialog(
                                                                                context: context,
                                                                                builder: (BuildContext context) {
                                                                                  return EventsRSVPDialogBox(
                                                                                    eventId: provider.farmComputerEventsResponseModel.data![i].id!,
                                                                                    isAllEvent: true,
                                                                                    argument: "yes",
                                                                                  );
                                                                                }).then((value) {
                                                                              if (value == "close") {
                                                                              } else {
                                                                                initData();
                                                                                upDateStatus();
                                                                              }
                                                                            });
                                                                          }
                                                                          //In case if event mode is online

                                                                          if (provider.farmComputerEventsResponseModel.data![i].eventMode!
                                                                                  .contains("Online") &&
                                                                              provider
                                                                                  .farmComputerEventsResponseModel.data![i].eventMode!.isNotEmpty) {
                                                                            PutFarmComputerEventAttendanceUpdateRequest request =
                                                                                PutFarmComputerEventAttendanceUpdateRequest(
                                                                                    attendedMode: "Online", response: "yes");
                                                                            await provider.putfarmComputerEventAttendanceUpdateForAllEvents(
                                                                                eventID: provider.farmComputerEventsResponseModel.data![i].id!,
                                                                                requestBody: request);

                                                                            provider.farmComputerEventsResponseModel.data![i].eventMode = ["Online"];
                                                                            provider.farmComputerEventsResponseModel.data![i].rsvpAnswer = ["yes"];
                                                                            upDateStatus();
                                                                          }
                                                                          //In case if event mode is Live
                                                                          if (provider.farmComputerEventsResponseModel.data![i].eventMode!
                                                                                  .contains("Live") &&
                                                                              provider
                                                                                  .farmComputerEventsResponseModel.data![i].eventMode!.isNotEmpty) {
                                                                            PutFarmComputerEventAttendanceUpdateRequest request =
                                                                                PutFarmComputerEventAttendanceUpdateRequest(
                                                                                    attendedMode: "Live", response: "yes");
                                                                            await provider.putfarmComputerEventAttendanceUpdateForAllEvents(
                                                                                eventID: provider.farmComputerEventsResponseModel.data![i].id!,
                                                                                requestBody: request);

                                                                            //initData();
                                                                            provider.farmComputerEventsResponseModel.data![i].eventMode = ["live"];
                                                                            provider.farmComputerEventsResponseModel.data![i].rsvpAnswer = ["yes"];

                                                                            upDateStatus();
                                                                          }
                                                                        },
                                                                        backColor:
                                                                            provider.farmComputerEventsResponseModel.data![i].rsvpAnswer!.isNotEmpty
                                                                                ? (provider.farmComputerEventsResponseModel.data![i].rsvpAnswer![0]
                                                                                        .toLowerCase()
                                                                                        .contains("yes"))
                                                                                    ? darkGreen
                                                                                    : Colors.transparent
                                                                                : Colors.transparent,
                                                                        textColor:
                                                                            provider.farmComputerEventsResponseModel.data![i].rsvpAnswer!.isNotEmpty
                                                                                ? provider.farmComputerEventsResponseModel.data![i].rsvpAnswer![0]
                                                                                        .toLowerCase()
                                                                                        .contains("yes")
                                                                                    ? Colors.white
                                                                                    : Colors.black
                                                                                : Colors.black,
                                                                      ),
                                                                      EventGoingButton(
                                                                        text: "Maybe".tr(),
                                                                        onTap: () async {
                                                                          //In case if event mode is Hybrid
                                                                          if (provider.farmComputerEventsResponseModel.data![i].eventMode!
                                                                                      .contains("Hybrid") &&
                                                                                  provider.farmComputerEventsResponseModel.data![i].rsvpAnswer!
                                                                                      .contains("yes") ||
                                                                              provider.farmComputerEventsResponseModel.data![i].eventMode!
                                                                                      .contains("Hybrid") &&
                                                                                  provider.farmComputerEventsResponseModel.data![i].rsvpAnswer!
                                                                                      .contains("maybe")) {
                                                                            showDialog(
                                                                                context: context,
                                                                                builder: (BuildContext context) {
                                                                                  return EventsRSVPDialogBox(
                                                                                    eventId: provider.farmComputerEventsResponseModel.data![i].id!,
                                                                                    isAllEvent: true,
                                                                                    argument: "maybe",
                                                                                  );
                                                                                }).then((value) {
                                                                              if (value == "close") {
                                                                              } else {
                                                                                initData();
                                                                                upDateStatus();
                                                                              }
                                                                            });
                                                                          }
                                                                          //In case if event mode is Online

                                                                          if (provider.farmComputerEventsResponseModel.data![i].eventMode!
                                                                              .contains("Online")) {
                                                                            PutFarmComputerEventAttendanceUpdateRequest request =
                                                                                PutFarmComputerEventAttendanceUpdateRequest(
                                                                                    attendedMode: "Online", response: "maybe");
                                                                            await provider.putfarmComputerEventAttendanceUpdateForAllEvents(
                                                                                eventID: provider.farmComputerEventsResponseModel.data![i].id!,
                                                                                requestBody: request);
                                                                            provider.farmComputerEventsResponseModel.data![i].eventMode = ["Online"];
                                                                            provider.farmComputerEventsResponseModel.data![i].rsvpAnswer = ["maybe"];

                                                                            upDateStatus();
                                                                          }
                                                                          //In case if event mode is Live
                                                                          if (provider.farmComputerEventsResponseModel.data![i].eventMode!
                                                                              .contains("Live")) {
                                                                            PutFarmComputerEventAttendanceUpdateRequest request =
                                                                                PutFarmComputerEventAttendanceUpdateRequest(
                                                                                    attendedMode: "Live", response: "maybe");
                                                                            await provider.putfarmComputerEventAttendanceUpdateForAllEvents(
                                                                                eventID: provider.farmComputerEventsResponseModel.data![i].id!,
                                                                                requestBody: request);
                                                                            provider.farmComputerEventsResponseModel.data![i].eventMode = ["Live"];
                                                                            provider.farmComputerEventsResponseModel.data![i].rsvpAnswer = ["maybe"];

                                                                            upDateStatus();
                                                                          }
                                                                        },
                                                                        backColor: (provider.farmComputerEventsResponseModel.data![i].rsvpAnswer!
                                                                                    .isNotEmpty &&
                                                                                provider.farmComputerEventsResponseModel.data![i].rsvpAnswer![0]
                                                                                    .toLowerCase()
                                                                                    .contains("maybe"))
                                                                            ? darkGreen
                                                                            : Colors.transparent,
                                                                        textColor: provider.farmComputerEventsResponseModel.data![i].rsvpAnswer!
                                                                                    .isNotEmpty &&
                                                                                provider.farmComputerEventsResponseModel.data![i].rsvpAnswer![0]
                                                                                    .toLowerCase()
                                                                                    .contains("maybe")
                                                                            ? Colors.white
                                                                            : Colors.black,
                                                                      ),
                                                                      EventGoingButton(
                                                                        text: "Not going".tr(),
                                                                        onTap: () async {
                                                                          if (provider
                                                                              .farmComputerEventsResponseModel.data![i].eventMode!.isNotEmpty) {
                                                                            PutFarmComputerEventAttendanceUpdateRequest request =
                                                                                PutFarmComputerEventAttendanceUpdateRequest(
                                                                                    attendedMode: "", response: "no");
                                                                            await provider.putfarmComputerEventAttendanceUpdateForAllEvents(
                                                                                eventID: provider.farmComputerEventsResponseModel.data![i].id!,
                                                                                requestBody: request);
                                                                            setState(() {});
                                                                          } else {}
                                                                        },
                                                                        backColor: (provider.farmComputerEventsResponseModel.data![i].rsvpAnswer!
                                                                                    .isNotEmpty &&
                                                                                provider.farmComputerEventsResponseModel.data![i].rsvpAnswer![0]
                                                                                    .toLowerCase()
                                                                                    .contains("no"))
                                                                            ? darkGreen
                                                                            : Colors.transparent,
                                                                        textColor: provider.farmComputerEventsResponseModel.data![i].rsvpAnswer!
                                                                                    .isNotEmpty &&
                                                                                provider.farmComputerEventsResponseModel.data![i].rsvpAnswer![0]
                                                                                    .toLowerCase()
                                                                                    .contains("no")
                                                                            ? Colors.white
                                                                            : Colors.black,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            }),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(top: 5, bottom: Responsive.isMobile(context) ? 3 : 6),
                                                    child: Html(
                                                      data: provider.farmComputerEventsResponseModel.data![i].desctiption ?? '-',
                                                      shrinkWrap: true,
                                                      style: {
                                                        "#": Style(padding: EdgeInsets.zero, margin: EdgeInsets.zero),
                                                        "body": Style(
                                                            fontWeight: FontWeight.normal,
                                                            fontSize: Responsive.isDesktop(context)
                                                                ? FontSize.medium
                                                                : Responsive.isTablet(context)
                                                                    ? FontSize.small
                                                                    : FontSize.xSmall,
                                                            textAlign: TextAlign.start,
                                                            textOverflow: TextOverflow.ellipsis,
                                                            maxLines: 2,
                                                            padding: EdgeInsets.zero,
                                                            margin: EdgeInsets.zero),
                                                        "span ": Style(
                                                            fontWeight: FontWeight.normal,
                                                            fontSize: Responsive.isDesktop(context)
                                                                ? FontSize.medium
                                                                : Responsive.isTablet(context)
                                                                    ? FontSize.small
                                                                    : FontSize.xSmall,
                                                            textAlign: TextAlign.start,
                                                            textOverflow: TextOverflow.ellipsis,
                                                            maxLines: 2,
                                                            padding: EdgeInsets.zero,
                                                            margin: EdgeInsets.zero),
                                                      },
                                                    ),
                                                  ),

                                                  ///
                                                  ///     ////////  Tablet and   Mobile View   ////////////////////
                                                  ///
                                                  ValueListenableBuilder(
                                                      valueListenable: buttonClickedTimes,
                                                      builder: (BuildContext? context, bool? counterValue, Widget? child) {
                                                        if (counterValue == true) {
                                                          return SizedBox(
                                                            height: getHeight(context) * 0.05,
                                                          );
                                                        }
                                                        return Visibility(
                                                          visible: Responsive.isMobile(context!) || Responsive.isTablet(context) ? true : false,
                                                          child: Align(
                                                            alignment: Alignment.bottomRight,
                                                            child: Padding(
                                                              padding: EdgeInsets.only(top: 10, right: 5),
                                                              child: Wrap(
                                                                children: [
                                                                  EventGoingButton(
                                                                    text: "Going".tr(),
                                                                    onTap: () async {
                                                                      print(
                                                                          "mode ========${provider.farmComputerEventsResponseModel.data![i].eventMode!}");
                                                                      //In case if event mode is Hybrid
                                                                      if (provider.farmComputerEventsResponseModel.data![i].eventMode!
                                                                                  .contains("Hybrid") &&
                                                                              provider.farmComputerEventsResponseModel.data![i].rsvpAnswer!
                                                                                  .contains("yes") ||
                                                                          provider.farmComputerEventsResponseModel.data![i].eventMode!
                                                                                  .contains("Hybrid") &&
                                                                              provider.farmComputerEventsResponseModel.data![i].rsvpAnswer!
                                                                                  .contains("maybe")) {
                                                                        showDialog(
                                                                            context: context,
                                                                            builder: (BuildContext context) {
                                                                              return EventsRSVPDialogBox(
                                                                                eventId: provider.farmComputerEventsResponseModel.data![i].id!,
                                                                                isAllEvent: true,
                                                                                argument: "yes",
                                                                              );
                                                                            }).then((value) {
                                                                          if (value == "close") {
                                                                          } else {
                                                                            initData();
                                                                            upDateStatus();
                                                                          }
                                                                        });

                                                                        // upDateStatus();
                                                                      }
                                                                      //In case if event mode is online

                                                                      if (provider.farmComputerEventsResponseModel.data![i].eventMode!
                                                                              .contains("Online") &&
                                                                          provider.farmComputerEventsResponseModel.data![i].eventMode!.isNotEmpty) {
                                                                        PutFarmComputerEventAttendanceUpdateRequest request =
                                                                            PutFarmComputerEventAttendanceUpdateRequest(
                                                                                attendedMode: "Online", response: "yes");
                                                                        await provider.putfarmComputerEventAttendanceUpdateForAllEvents(
                                                                            eventID: provider.farmComputerEventsResponseModel.data![i].id!,
                                                                            requestBody: request);

                                                                        provider.farmComputerEventsResponseModel.data![i].eventMode = ["Online"];
                                                                        provider.farmComputerEventsResponseModel.data![i].rsvpAnswer = ["yes"];
                                                                        upDateStatus();
                                                                      }
                                                                      //In case if event mode is Live
                                                                      if (provider.farmComputerEventsResponseModel.data![i].eventMode!
                                                                              .contains("Live") &&
                                                                          provider.farmComputerEventsResponseModel.data![i].eventMode!.isNotEmpty) {
                                                                        PutFarmComputerEventAttendanceUpdateRequest request =
                                                                            PutFarmComputerEventAttendanceUpdateRequest(
                                                                                attendedMode: "Live", response: "yes");
                                                                        await provider.putfarmComputerEventAttendanceUpdateForAllEvents(
                                                                            eventID: provider.farmComputerEventsResponseModel.data![i].id!,
                                                                            requestBody: request);

                                                                        //initData();
                                                                        provider.farmComputerEventsResponseModel.data![i].eventMode = ["live"];
                                                                        provider.farmComputerEventsResponseModel.data![i].rsvpAnswer = ["yes"];

                                                                        upDateStatus();
                                                                      }
                                                                    },
                                                                    backColor: provider.farmComputerEventsResponseModel.data![i].rsvpAnswer!.isNotEmpty
                                                                        ? (provider.farmComputerEventsResponseModel.data![i].rsvpAnswer![0]
                                                                                .toLowerCase()
                                                                                .contains("yes"))
                                                                            ? darkGreen
                                                                            : Colors.transparent
                                                                        : Colors.transparent,
                                                                    textColor: provider.farmComputerEventsResponseModel.data![i].rsvpAnswer!.isNotEmpty
                                                                        ? provider.farmComputerEventsResponseModel.data![i].rsvpAnswer![0]
                                                                                .toLowerCase()
                                                                                .contains("yes")
                                                                            ? Colors.white
                                                                            : Colors.black
                                                                        : Colors.black,
                                                                  ),
                                                                  EventGoingButton(
                                                                    text: "Maybe".tr(),
                                                                    onTap: () async {
                                                                      //In case if event mode is Hybrid
                                                                      if (provider.farmComputerEventsResponseModel.data![i].eventMode!
                                                                                  .contains("Hybrid") &&
                                                                              provider.farmComputerEventsResponseModel.data![i].rsvpAnswer!
                                                                                  .contains("yes") ||
                                                                          provider.farmComputerEventsResponseModel.data![i].eventMode!
                                                                                  .contains("Hybrid") &&
                                                                              provider.farmComputerEventsResponseModel.data![i].rsvpAnswer!
                                                                                  .contains("maybe")) {
                                                                        showDialog(
                                                                            context: context,
                                                                            builder: (BuildContext context) {
                                                                              return EventsRSVPDialogBox(
                                                                                eventId: provider.farmComputerEventsResponseModel.data![i].id!,
                                                                                isAllEvent: true,
                                                                                argument: "maybe",
                                                                              );
                                                                            }).then((value) {
                                                                          if (value == "close") {
                                                                          } else {
                                                                            initData();
                                                                            upDateStatus();
                                                                          }
                                                                        });

                                                                        //upDateStatus();
                                                                      }
                                                                      //In case if event mode is Online

                                                                      if (provider.farmComputerEventsResponseModel.data![i].eventMode!
                                                                          .contains("Online")) {
                                                                        PutFarmComputerEventAttendanceUpdateRequest request =
                                                                            PutFarmComputerEventAttendanceUpdateRequest(
                                                                                attendedMode: "Online", response: "maybe");
                                                                        await provider.putfarmComputerEventAttendanceUpdateForAllEvents(
                                                                            eventID: provider.farmComputerEventsResponseModel.data![i].id!,
                                                                            requestBody: request);
                                                                        provider.farmComputerEventsResponseModel.data![i].eventMode = ["Online"];
                                                                        provider.farmComputerEventsResponseModel.data![i].rsvpAnswer = ["maybe"];

                                                                        upDateStatus();
                                                                      }
                                                                      //In case if event mode is Live
                                                                      if (provider.farmComputerEventsResponseModel.data![i].eventMode!
                                                                          .contains("Live")) {
                                                                        PutFarmComputerEventAttendanceUpdateRequest request =
                                                                            PutFarmComputerEventAttendanceUpdateRequest(
                                                                                attendedMode: "Live", response: "maybe");
                                                                        await provider.putfarmComputerEventAttendanceUpdateForAllEvents(
                                                                            eventID: provider.farmComputerEventsResponseModel.data![i].id!,
                                                                            requestBody: request);
                                                                        provider.farmComputerEventsResponseModel.data![i].eventMode = ["Live"];
                                                                        provider.farmComputerEventsResponseModel.data![i].rsvpAnswer = ["maybe"];

                                                                        upDateStatus();
                                                                      }
                                                                    },
                                                                    backColor:
                                                                        (provider.farmComputerEventsResponseModel.data![i].rsvpAnswer!.isNotEmpty &&
                                                                                provider.farmComputerEventsResponseModel.data![i].rsvpAnswer![0]
                                                                                    .toLowerCase()
                                                                                    .contains("maybe"))
                                                                            ? darkGreen
                                                                            : Colors.transparent,
                                                                    textColor:
                                                                        provider.farmComputerEventsResponseModel.data![i].rsvpAnswer!.isNotEmpty &&
                                                                                provider.farmComputerEventsResponseModel.data![i].rsvpAnswer![0]
                                                                                    .toLowerCase()
                                                                                    .contains("maybe")
                                                                            ? Colors.white
                                                                            : Colors.black,
                                                                  ),
                                                                  EventGoingButton(
                                                                    text: "Not going".tr(),
                                                                    onTap: () async {
                                                                      if (provider.farmComputerEventsResponseModel.data![i].eventMode!.isNotEmpty) {
                                                                        PutFarmComputerEventAttendanceUpdateRequest request =
                                                                            PutFarmComputerEventAttendanceUpdateRequest(
                                                                                attendedMode: "", response: "no");
                                                                        await provider.putfarmComputerEventAttendanceUpdateForAllEvents(
                                                                            eventID: provider.farmComputerEventsResponseModel.data![i].id!,
                                                                            requestBody: request);
                                                                        setState(() {});
                                                                      } else {}
                                                                    },
                                                                    backColor:
                                                                        (provider.farmComputerEventsResponseModel.data![i].rsvpAnswer!.isNotEmpty &&
                                                                                provider.farmComputerEventsResponseModel.data![i].rsvpAnswer![0]
                                                                                    .toLowerCase()
                                                                                    .contains("no"))
                                                                            ? darkGreen
                                                                            : Colors.transparent,
                                                                    textColor:
                                                                        provider.farmComputerEventsResponseModel.data![i].rsvpAnswer!.isNotEmpty &&
                                                                                provider.farmComputerEventsResponseModel.data![i].rsvpAnswer![0]
                                                                                    .toLowerCase()
                                                                                    .contains("no")
                                                                            ? Colors.white
                                                                            : Colors.black,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
              Obx(
                () => Visibility(
                  visible: progress.value,
                  child: Container(
                      height: getHeight(context),
                      width: getWidth(context),
                      decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
                      child: SizedBox(
                        height: getHeight(context) / 2,
                        width: getWidth(context),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )),
                ),
              )
            ],
          );
  }

  String englishMonth(String? month) {
    if (month == null) {
      return "-";
    } else {
      switch (month) {
        case "01":
          return "JAN.";
        case "02":
          return "FEB.";
        case "03":
          return "MAR.";
        case "04":
          return "APR.";
        case "05":
          return "MAY.";
        case "06":
          return "JUN.";
        case "07":
          return "JUL.";
        case "08":
          return "AUG.";
        case "09":
          return "SEP.";
        case "10":
          return "OCT.";
        case "11":
          return "NOV.";
        case "12":
          return "DEC.";
        default:
          return "-";
      }
    }
  }
}
