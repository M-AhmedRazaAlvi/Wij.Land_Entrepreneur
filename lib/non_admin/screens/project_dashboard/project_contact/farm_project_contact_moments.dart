import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/non_admin/providers/farm_computer_projects_provider/farm_computer_project_contact_moments_provider.dart';
import 'package:wij_land/non_admin/screens/computer_events/widgets/event_text_search_widget.dart';
import 'package:wij_land/utils/responsive.dart';
import 'package:wij_land/utils/styles.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../app_common_widgets/text_widget.dart';
import '../../../../providers/GlobalProvider/navigation/navigation_provider.dart';
import '../../../../screens/office/widgets/add_text_button_widget.dart';
import '../../../../screens/office/widgets/search_widget.dart';
import '../../../../utils/functions.dart';
import '../../../models/farm_computer_contact_moments/responce/get_contact_moments_responce.dart';
import '../../../models/farm_computer_dropdown/parcel_project_drop_down.dart';
import '../../contact_moments/dialog_contact.dart';

class FramComputerProjectContactMomentScreens extends StatefulWidget {
  final GetFarmComputerContactMomentsResponse? model;
  final projectId;

  const FramComputerProjectContactMomentScreens({
    Key? key,
    this.model,
    this.projectId,
  }) : super(key: key);

  @override
  State<FramComputerProjectContactMomentScreens> createState() => _FramComputerProjectContactMomentScreensState();
}

class _FramComputerProjectContactMomentScreensState extends State<FramComputerProjectContactMomentScreens> {
  final TextEditingController startdate = TextEditingController(), endDate = TextEditingController(), nameController = TextEditingController();

  bool viewChecked = true, calanderList = false;

  @override
  void initState() {
    isLoading = true;
    super.initState();
    initData();
  }

  initData() async {
    var _provider = Provider.of<CreateFarmComputerProjectContactMomentsProvider>(context, listen: false);
    await _provider.getFarmComputerProjectContact(projectId: widget.projectId["id"]);
    if (_provider.farmComputerProjectContactResponseModel.error?.status != 404) {
      _provider.farmComputerProjectContactResponseModel.data!.sort((start, end) {
        if (start.contactMomentDate != null && end.contactMomentDate != null) {
          var aDate = DateTime.parse(start.contactMomentDate.toString());
          var bDate = DateTime.parse(end.contactMomentDate.toString());
          return bDate.compareTo(aDate);
        } else {
          if (start.contactMomentDate == null) {
            start.contactMomentDate = DateTime.tryParse("0000-00-00").toString();
            var aDate = DateTime.parse(start.toString());
            var bDate = DateTime.parse(end.toString());
            return bDate.compareTo(aDate);
          } else {
            end.contactMomentDate = DateTime.tryParse("0000-00-00").toString();
            var aDate = DateTime.parse(start.toString());
            var bDate = DateTime.parse(end.toString());
            return bDate.compareTo(aDate);
          }
        }
      });
    }
    await Provider.of<CreateFarmComputerProjectContactMomentsProvider>(context, listen: false).allDropDown();
    isLoading = false;
    setState(() {});
  }

  bool filterActive = false;
  bool isLoading = false;
  bool isLoadFilterData = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CreateFarmComputerProjectContactMomentsProvider>(context);

    return Container(
      padding: EdgeInsets.all(15),
      child: isLoading
          ? SizedBox(
              height: getHeight(context),
              width: getWidth(context),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClickIconButton(
                      clickcolors: filterActive ? hoverColor : Colors.white,
                      icon: Icons.filter_alt,
                      iconColor: filterActive ? Colors.white : dark,
                      onPressed: () {
                        filterActive = !filterActive;
                        setState(() {});
                      },
                    )
                  ],
                ),
                SizedBox(height: 15),
                Column(
                  children: [
                    Visibility(
                      visible: filterActive ? true : false,
                      child: SizedBox(
                        width: getWidth(context),
                        child: !filterActive
                            ? SizedBox()
                            : Column(
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
                                                CustomText(text: "Contact Summary".tr(), size: Responsive.isMobile(context) ? 10 : 12),
                                                SizedBox(height: 5),
                                                EventTextSearchWidget(
                                                  hintText: "",
                                                  width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.14,
                                                  controller: nameController,
                                                  sufixIcon: null,
                                                  onChangeValue: (v) {
                                                    provider.contactSummy = v;
                                                  },
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                CustomText(text: "Project".tr(), size: Responsive.isMobile(context) ? 10 : 12),
                                                SizedBox(height: 5),
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
                                                        if (!provider.listofProjectInContact.contains(provider.parcelProjectSelectedDropDownName!)) {
                                                          provider.listofProjectInContact.add(provider.parcelProjectSelectedDropDownName!);
                                                        }
                                                      });
                                                    },
                                                    items:
                                                        provider.parcelProjectsDropDownModel.map<DropdownMenuItem<ProjectData>>((ProjectData value) {
                                                      return DropdownMenuItem<ProjectData>(
                                                          value: value,
                                                          child: Text(
                                                            value.name!,
                                                            style: TextStyle(fontFamily: Montserrat_Medium),
                                                          ));
                                                    }).toList(),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.14,
                                                  child: Wrap(
                                                      children: provider.listofProjectInContact.map((e) {
                                                    return Container(
                                                      padding: EdgeInsets.all(3),
                                                      child: Chip(
                                                        label: Text('${e.name}',
                                                            style: TextStyle(color: Colors.black, fontSize: 11, fontFamily: Montserrat_Medium)),
                                                        onDeleted: () {
                                                          provider.listofProjectInContact.remove(e);
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
                                                  width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.14,
                                                  height: 47,
                                                  child: RealDropDownWidget(
                                                    value: provider.contactType_selected_dopDown,
                                                    color: normalGrey,
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        provider.contactType_selected_dopDown = newValue;
                                                        if (!provider.listofSelectedContact.contains(provider.contactType_selected_dopDown)) {
                                                          provider.listofSelectedContact.add(provider.contactType_selected_dopDown);
                                                        }
                                                      });
                                                    },
                                                    items: provider.contactTypeDropDownList.map<DropdownMenuItem<String>>((String value) {
                                                      return DropdownMenuItem<String>(
                                                          value: value,
                                                          child: Text(
                                                            value,
                                                            style: TextStyle(fontFamily: Montserrat_Medium),
                                                          ));
                                                    }).toList(),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.14,
                                                  child: Wrap(
                                                      children: provider.listofSelectedContact.map((e) {
                                                    return Container(
                                                      padding: EdgeInsets.all(3),
                                                      child: Chip(
                                                        label: Text('$e',
                                                            style: TextStyle(color: Colors.black, fontSize: 11, fontFamily: Montserrat_Medium)),
                                                        onDeleted: () {
                                                          provider.listofSelectedContact.remove(e);
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
                                                      print("${d.toString().split(" ")[0]}");
                                                      if (d != null) {
                                                        setState(() {
                                                          provider.startdate.text = d.toString().split(" ")[0];
                                                        });
                                                      }
                                                    });
                                                  },
                                                  child: SizedBox(
                                                    width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.14,
                                                    height: 45,
                                                    child: TextWidgetField(
                                                      controller: provider.startdate,
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
                                                          provider.endDate.text = d.toString().split(" ")[0];
                                                        });
                                                      }
                                                    });
                                                  },
                                                  child: SizedBox(
                                                    width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.14,
                                                    height: 45,
                                                    child: TextWidgetField(
                                                      controller: provider.endDate,
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
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                CustomText(text: "Sort".tr(), size: Responsive.isMobile(context) ? 10 : 12),
                                                SizedBox(height: 5),
                                                SizedBox(
                                                  width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.14,
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
                                                      return DropdownMenuItem<String>(
                                                          value: value,
                                                          child: Text(
                                                            value,
                                                            style: TextStyle(fontFamily: Montserrat_Medium),
                                                          ));
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
                                            await provider.getFarmProjectContactMomentsSearchResponse(projectId: widget.projectId["id"]);
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

                                            provider.parcelProjectSelectedDropDownName = ProjectData(id: -1, name: '');
                                            provider.contactType_selected_dopDown = '';
                                            provider.parcelProjectSelectedDropDownName = provider.parcelProjectsDropDownModel[0];
                                            nameController.clear();
                                            setState(() {});
                                            provider.contactSummy = '';
                                            provider.startdate.text = '';
                                            provider.endDate.text = '';
                                            provider.listofProjectInContact = [];
                                            provider.listofSelectedContact = [];
                                            provider.sortSelected = '';
                                            await provider.getFarmComputerProjectContact(projectId: widget.projectId["id"]);
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
                      height: 15,
                    ),
                  ],
                ),
                isLoadFilterData
                    ? Container(
                        alignment: Alignment.topCenter,
                        height: getHeight(context) / 2,
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : provider.farmComputerProjectContactResponseModel.error?.status == 404
                        ? Container(
                            alignment: Alignment.topCenter,
                            height: getHeight(context),
                            child: CustomText(
                              text: "No data found".tr(),
                              color: Colors.red,
                              weight: FontWeight.w700,
                              size: 20,
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              for (int i = 0; i < provider.farmComputerProjectContactResponseModel.data!.length; i++)
                                Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return ContactMomentDialogbox(
                                            contactMomentId: provider.farmComputerProjectContactResponseModel.data![i].id,
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: Responsive.isMobile(context) ? 2 : 5,
                                        vertical: Responsive.isMobile(context) ? 15 : 30,
                                      ),
                                      width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.8,
                                      // height: Responsive.isMobile(context) ? getHeight(context) * 0.15 : getHeight(context) * 0.2,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: Responsive.isMobile(context) ? 5 : 20.0, right: Responsive.isMobile(context) ? 5 : 10),
                                            child: CircleAvatar(
                                              radius: Responsive.isMobile(context) ? 20 : 30,
                                              backgroundColor: realGreyColor,
                                              child: Image.network(
                                                width: Responsive.isMobile(context) ? 17 : 25,
                                                height: Responsive.isMobile(context) ? 17 : 25,
                                                'https://$gloal_base_path${provider.farmComputerProjectContactResponseModel.data![i].contactMomentsType == null ? "-" : provider.farmComputerProjectContactResponseModel.data![i].contactMomentsType![0].icon ?? "-"}',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: Responsive.isMobile(context) ? getWidth(context) * 0.1 : getWidth(context) * 0.07,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                CustomText(
                                                  size: Responsive.isMobile(context) ? 14 : 22,
                                                  color: darkred,
                                                  text: englishMonth(provider.farmComputerProjectContactResponseModel.data![i].contactMomentDate!
                                                          .toString()
                                                          .substring(5, 7) ??
                                                      "-"),
                                                ),
                                                CustomText(
                                                  size: Responsive.isMobile(context) ? 14 : 22,
                                                  weight: FontWeight.bold,
                                                  text: provider.farmComputerProjectContactResponseModel.data![i].contactMomentDate!
                                                          .toString()
                                                          .substring(8, 10) ??
                                                      "-",
                                                ),
                                                CustomText(
                                                  size: Responsive.isMobile(context) ? 11 : 14,
                                                  color: darkred,
                                                  text: provider.farmComputerProjectContactResponseModel.data![i].contactMomentDate!
                                                      .toString()
                                                      .substring(0, 4) ??
                                                      "-",
                                                ),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Container(
                                              padding: EdgeInsets.only(right: Responsive.isMobile(context) ? 5 : 10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      CustomText(
                                                          text: provider.farmComputerProjectContactResponseModel.data![i].contactSubject ?? "-",
                                                          size: Responsive.isMobile(context) ? 12 : 18,
                                                          color: darkred,
                                                          weight: FontWeight.bold),
                                                      SizedBox(height: 5),
                                                      CustomText(
                                                          size: Responsive.isMobile(context) ? 10 : 14,
                                                          text: provider.farmComputerProjectContactResponseModel.data![i].contactMomentsType == null
                                                              ? "-"
                                                              : provider
                                                                      .farmComputerProjectContactResponseModel.data![i].contactMomentsType![0].name ??
                                                                  "-",
                                                          weight: FontWeight.w600),
                                                    ],
                                                  ),
                                                  SizedBox(height: 5),
                                                  Html(
                                                    shrinkWrap: true,
                                                    data: provider.farmComputerProjectContactResponseModel.data![i].contactNotes ?? "-",
                                                    style: {
                                                      "#": Style(padding: EdgeInsets.zero, margin: EdgeInsets.zero),
                                                      "body": Style(
                                                          fontFamily: Montserrat_Medium,
                                                          fontWeight: FontWeight.normal,
                                                          fontSize: Responsive.isMobile(context) ? FontSize.small : FontSize.medium,
                                                          textAlign: TextAlign.start,
                                                          textOverflow: TextOverflow.ellipsis,
                                                          maxLines: Responsive.isMobile(context) ? 3 : 2,
                                                          padding: EdgeInsets.zero,
                                                          margin: EdgeInsets.zero),
                                                      "span ": Style(
                                                          fontFamily: Montserrat_Medium,
                                                          fontWeight: FontWeight.normal,
                                                          fontSize: Responsive.isMobile(context) ? FontSize.small : FontSize.medium,
                                                          textAlign: TextAlign.start,
                                                          textOverflow: TextOverflow.ellipsis,
                                                          maxLines: Responsive.isMobile(context) ? 3 : 2,
                                                          padding: EdgeInsets.zero,
                                                          margin: EdgeInsets.zero),
                                                    },
                                                  ),
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
                          )
              ],
            ),
    );
  }

  String englishMonth(String? month) {
    switch (month) {
      case "01":
        return "JAN.".tr();
      case "02":
        return "FEB.".tr();
      case "03":
        return "MAR.".tr();
      case "04":
        return "APR.".tr();
      case "05":
        return "MAY.".tr();
      case "06":
        return "JUN.".tr();
      case "07":
        return "JUL.".tr();
      case "08":
        return "AUG.".tr();
      case "09":
        return "SEP.".tr();
      case "10":
        return "OCT.".tr();
      case "11":
        return "NOV.".tr();
      case "12":
        return "DEC.".tr();
      default:
        return "-";
    }
  }
}
