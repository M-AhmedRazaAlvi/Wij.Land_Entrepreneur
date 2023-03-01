import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hovering/hovering.dart';

import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:wij_land/app_common_widgets/common_elevated_button.dart';
import 'package:wij_land/app_common_widgets/common_outlined_button.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/app_common_widgets/icons_hover_buttons.dart';
import 'package:wij_land/app_common_widgets/real_dropdown_widget.dart';
import 'package:wij_land/app_common_widgets/text_widget.dart';
import 'package:wij_land/non_admin/models/farm_computer_files/get_farm_computer_action_dropdown.dart';
import 'package:wij_land/non_admin/providers/farm_computer_file_provider/farm_computer_files_provider.dart';
import 'package:wij_land/non_admin/screens/computer_file/farm_computer_file_info.dart';
import 'package:wij_land/non_admin/models/farm_computer_dropdown/farm_files_dropdown.dart';
import 'package:wij_land/non_admin/screens/computer_file/farm_computer_files_cube.dart';
import 'package:wij_land/non_admin/screens/computer_file/widget/farm_computer_file_dialog.dart';
import 'package:wij_land/non_admin/screens/computer_file/widget/farm_computer_file_multiple_project.dart';
import 'package:wij_land/non_admin/screens/computer_events/widgets/event_text_search_widget.dart';
import 'package:wij_land/non_admin/screens/computer_file/farm_computer_files_list.dart';
import 'package:wij_land/non_admin/screens/project_dashboard/Project_files/wiget/farm_file_bookmarks.dart';
import 'package:wij_land/screens/office/widgets/search_widget.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/responsive.dart';
import 'package:wij_land/utils/styles.dart';
import 'package:wij_land/utils/url_scheme.dart';

import '../../../../screens/office/widgets/add_text_button_widget.dart';
import '../../../utils/hex_color.dart';
import '../../app_common_widgets/large_screen.dart';
import '../../models/farm_computer_dropdown/parcel_project_drop_down.dart';
import '../../providers/fc_files_provider/main_files_provider.dart';

class FarmComputerFilesScreens extends StatefulWidget {
  const FarmComputerFilesScreens({
    Key? key,
    this.arguments,
    this.mOnDropDownChange,
    this.mSelectedItemsList,
    this.mSelectedValue,
    this.items,
    this.widthSize = 250,
    this.heightSize = 50,
    this.isVertical = false,
  }) : super(key: key);
  final arguments;
  final Function(String?)? mOnDropDownChange;
  final List<String>? mSelectedItemsList;
  final String? mSelectedValue;
  final List<FarmFilesData>? items;
  final double? widthSize;
  final double? heightSize;
  final bool isVertical;

  @override
  State<FarmComputerFilesScreens> createState() => _FarmComputerFilesScreensState();
}

class _FarmComputerFilesScreensState extends State<FarmComputerFilesScreens> {
  // textController = TextEditingController(),
  // nameController = TextEditingController(),
  // typeController = TextEditingController(),
  // actionController = TextEditingController();

  List<bool> fileTextBool = <bool>[];
  bool checkedView = false, isFilter = false, isSearch = false, myBookMark = false, myContract = false, wijLandBookMark = false;
  List<String> sortList = ['Sort', 'A-Z', 'Z-A'];
  List<String> folderList = ['Folder', 'Wij.land Bookmarks', 'My Bookmarks', 'My Contracts'];
  String folderValue = 'Folder';
  String sortValue = 'Sort';

  @override
  void initState() {
    super.initState();
    fileTextBool = List.filled(2, false);
    print("${widget.arguments}");
    fileTextBool[0] = true;
    initData();
  }

  initData() async {
    if (widget.arguments == null || widget.arguments==true) {
      print("If argument are not null ${widget.arguments}");
      await Provider.of<MainFilesProvider>(context, listen: false).getFCFiles();
    } else {
      print("If argument are  null " + widget.arguments);

      await Provider.of<MainFilesProvider>(context, listen: false).getFCFiles(parcelId: widget.arguments);
    }
    await Provider.of<MainFilesProvider>(context, listen: false).clearFields();

    await Provider.of<MainFilesProvider>(context, listen: false).projDropDown();
    isLoading = false;

    setState(() {});
  }

  bool isLoading = true;

  String? filename;
  bool isSort = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key:  Key('FilesScreen-key'),
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
                'Files'.tr(),
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
                'Files'.tr(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: darkRed),
              ),
            ];
          }
        }
      },
      child: Consumer<MainFilesProvider>(
        builder: (context, provider, child) {
          return Scaffold(
              body:isLoading
              ? SizedBox(
                  height: getHeight(context) / 2,
                  width: getWidth(context),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : provider.fcFiles!.status == 404
                  ? Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.all(20),
                      child: CustomText(
                        text: "No data found".tr(),
                        color: Colors.red,
                        weight: FontWeight.w700,
                        size: 20,
                      ),
                    )
                  : Responsive.isMobile(context) //////For mobile view filters
                      ? SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                height: 12,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconHoverButton(
                                        icons: FontAwesomeIcons.search,
                                        isClick: isSearch,
                                        onPress: () {
                                          setState(() {
                                            isSearch = !isSearch;
                                          });
                                        }),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    IconHoverButton(
                                        icons: FontAwesomeIcons.filter,
                                        isClick: isFilter,
                                        onPress: () {
                                          setState(() {
                                            isFilter = !isFilter;
                                          });
                                        }),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    SizedBox(
                                      width: getWidth(context) * 0.5,
                                      child: RealDropDownWidget(
                                        value: sortValue,
                                        onChanged: (va) {
                                          sortValue = va;

                                          if (sortValue == "A-Z") {
                                            provider.fcFiles!.data!
                                                .sort((a, b) => a.file!.title!.toLowerCase().compareTo(b.file!.title!.toLowerCase()));
                                          } else if (sortValue == "Z-A") {
                                            provider.fcFiles!.data!
                                                .sort((a, b) => b.file!.title!.toLowerCase().compareTo(a.file!.title!.toLowerCase()));
                                          } else {}
                                          setState(() {});
                                        },
                                        items: sortList.map<DropdownMenuItem<String>>(
                                          (String values) {
                                            return DropdownMenuItem<String>(
                                              value: values,
                                              child: Text(values),
                                            );
                                          },
                                        ).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              isSearch
                                  ? Card(
                                      margin: EdgeInsets.all(6),
                                      elevation: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Container(
                                          height: 40,
                                          //    width: getWidth(context) * 0.14,
                                          child: EventTextSearchWidget(
                                            hintText: "File Name".tr(),
                                            onChangeValue: (value) async {
                                              print(value);

                                              if (widget.arguments != null) {
                                                await Provider.of<MainFilesProvider>(context, listen: false).getFCFiles(parcelId: widget.arguments);
                                              } else {
                                                await Provider.of<MainFilesProvider>(context, listen: false).getFCFiles();
                                              }
                                              setState(() {});
                                            },
                                            controller: provider.searchController,
                                            //  autofocus: true,
                                            onSubmit: (values) async {},
                                          ),
                                        ),
                                      ),
                                    )
                                  : SizedBox.shrink(),
                              SizedBox(
                                height: 8,
                              ),
                              isFilter
                                  ? Card(
                                      margin: EdgeInsets.all(6),
                                      child: Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            CustomText(
                                              text: 'Filter by Tag'.tr(),
                                              weight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            /////////////////////////////////////// For mobile View
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('File Type'.tr(), style: TextStyle(fontSize: 12,fontFamily: Montserrat_Medium)),
                                                SizedBox(
                                                  // width: getWidth(context) * 0.24,
                                                  height: 40,
                                                  child: RealDropDownWidget(
                                                    value: provider.fileTypeDropDownSelectedValue,
                                                    color: normalGrey,
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        provider.fileTypeDropDownSelectedValue = newValue;
                                                        if (!provider.listOfSelectedFileDropdown.contains(provider.fileTypeDropDownSelectedValue)) {
                                                          provider.listOfSelectedFileDropdown.add(provider.fileTypeDropDownSelectedValue);
                                                        }
                                                        print("listOfSelectedFileDropdown  ${provider.listOfSelectedFileDropdown}");
                                                        print("fileTypeDropDown  ${provider.fileTypeDropDownSelectedValue}");
                                                      });
                                                    },
                                                    items: provider.fileTypeDropDownList.map<DropdownMenuItem<String>>((String value) {
                                                      return DropdownMenuItem<String>(value: value, child: Text(value));
                                                    }).toList(),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      // width: getWidth(context) *
                                                      //     0.18,
                                                      child: Row(
                                                          children: provider.listOfSelectedFileDropdown.map((e) {
                                                        return Container(
                                                          padding: EdgeInsets.all(3),
                                                          child: Chip(
                                                            label: Text(e, style: TextStyle(color: Colors.black,fontFamily: Montserrat_Medium)),
                                                            onDeleted: () {
                                                              provider.listOfSelectedFileDropdown.remove(e);
                                                              setState(() {});
                                                            },
                                                          ),
                                                        );
                                                      }).toList()),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Project(multi-select)'.tr(), style: TextStyle(fontSize: 12,fontFamily: Montserrat_Medium)),
                                                SizedBox(
                                                  //  width: getWidth(context) * 0.24,
                                                  height: 40,
                                                  child: RealDropDownWidget(
                                                    value: provider.projectSelectedDropDownName,
                                                    color: normalGrey,
                                                    onChanged: (newValue) {
                                                      ProjectData data = newValue;
                                                      print('newValue = $newValue');
                                                      setState(() {
                                                        provider.projectSelectedDropDownName = data;
                                                        if (!provider.listofSelectedProject.contains(provider.projectSelectedDropDownName!)) {
                                                          provider.listofSelectedProject.add(provider.projectSelectedDropDownName!);
                                                        }
                                                        print("listofSelectedProject  ${provider.listofSelectedProject}");
                                                        print("projectSelectedDropDownName  ${provider.projectSelectedDropDownName!.name}");
                                                      });
                                                    },
                                                    items: provider.projectsDropDownModel.map<DropdownMenuItem<ProjectData>>((ProjectData value) {
                                                      return DropdownMenuItem<ProjectData>(value: value, child: Text(value.name!));
                                                    }).toList(),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      // width: getWidth(context) *
                                                      //     0.14,
                                                      child: Row(
                                                          children: provider.listofSelectedProject.map((e) {
                                                        return Container(
                                                          padding: EdgeInsets.all(3),
                                                          child: Chip(
                                                            label: Text('${e.name}', style: TextStyle(color: Colors.black,fontFamily: Montserrat_Medium)),
                                                            onDeleted: () {
                                                              provider.listofSelectedProject.remove(e);
                                                              setState(() {});
                                                            },
                                                          ),
                                                        );
                                                      }).toList()),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Action(multi-select)'.tr(), style: TextStyle(fontSize: 12,fontFamily: Montserrat_Medium)),
                                                SizedBox(
                                                  //   width: getWidth(context) * 0.24,
                                                  height: 40,
                                                  child: RealDropDownWidget(
                                                    value: provider.farmActionDropdownName,
                                                    color: normalGrey,
                                                    onChanged: (newValue) {
                                                      ActionData data = newValue;
                                                      print('newValue = $newValue');
                                                      setState(() {
                                                        provider.farmActionDropdownName = data;
                                                        if (!provider.listOfSelectedAction.contains(provider.farmActionDropdownName!)) {
                                                          provider.listOfSelectedAction.add(provider.farmActionDropdownName!);
                                                        }
                                                        print("listofSelectedAction  ${provider.listOfSelectedAction}");
                                                        print("ActionSelectedDropDownName  ${provider.farmActionDropdownName!.id}");
                                                      });
                                                    },
                                                    items: provider.actionsDropDownModel.map<DropdownMenuItem<ActionData>>((ActionData value) {
                                                      return DropdownMenuItem<ActionData>(value: value, child: Text(value.name!));
                                                    }).toList(),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      // width: getWidth(context) *
                                                      //     0.14,
                                                      child: Row(
                                                          children: provider.listOfSelectedAction.map((e) {
                                                        return Container(
                                                          padding: EdgeInsets.all(3),
                                                          child: Chip(
                                                            label: Text('${e.name}', style: TextStyle(color: Colors.black,fontFamily: Montserrat_Medium)),
                                                            onDeleted: () {
                                                              provider.listOfSelectedAction.remove(e);
                                                              setState(() {});
                                                            },
                                                          ),
                                                        );
                                                      }).toList()),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            ////////////////////Filter by date for mobile view/////////////
                                            CustomText(
                                              text: 'Filter by Date'.tr(),
                                              weight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
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
                                                      provider.startdate.text = d.toString().split(" ")[0];
                                                    });
                                                  }
                                                });
                                              },
                                              child: Container(
                                                height: 35,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                  color: HexColor("#FAFAFA"),
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                child: TextWidgetField(
                                                  controller: provider.startdate,
                                                  hintText: "Start date".tr(),
                                                  enabled: false,
                                                  suffixIcon: const Icon(Icons.calendar_today),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: getWidth(context) * 0.01,
                                            ),
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
                                                      provider.endDate.text = d.toString().split(" ")[0];
                                                    });
                                                  }
                                                });
                                              },
                                              child: Container(
                                                height: 35,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                  color: HexColor("#FAFAFA"),
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                child: TextWidgetField(
                                                  controller: provider.endDate,
                                                  hintText: "End date".tr(),
                                                  enabled: false,
                                                  suffixIcon: const Icon(Icons.calendar_today),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            CustomText(
                                              text: 'Filter by Folder'.tr(),
                                              weight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            RealDropDownWidget(
                                              value: folderValue,
                                              onChanged: (va) async {
                                                folderValue = va;
                                                setState(() {});
                                              },
                                              items: folderList.map<DropdownMenuItem<String>>(
                                                (String values) {
                                                  return DropdownMenuItem<String>(
                                                    value: values,
                                                    child: Text(values.tr(),style: TextStyle(fontFamily: Montserrat_Medium),),
                                                  );
                                                },
                                              ).toList(),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                CommonElevatedButton(mOnTap: () {}, mButtonText: "Cancel".tr(), mButtonColor: dimMetalic2),
                                                CommonOutlinedButton(
                                                  mOnPressed: () async {
                                                    provider.clearFields();
                                                    if (widget.arguments != null) {
                                                      await Provider.of<MainFilesProvider>(context, listen: false)
                                                          .getFCFiles(parcelId: widget.arguments);
                                                    } else {
                                                      provider.clearFields();
                                                      await Provider.of<MainFilesProvider>(context, listen: false).getFCFiles();
                                                    }
                                                    setState(() {});
                                                  },
                                                  mButtonColor: darkyellow,
                                                  mLabelText: 'Clear Filter'.tr(),
                                                  mTextColor: Colors.black,
                                                ),
                                                CommonElevatedButton(
                                                    mOnTap: () async {
                                                      if (folderValue == "Wij.land Bookmarks") {
                                                        await Provider.of<MainFilesProvider>(context, listen: false).getWijLandBookmarks();
                                                      } else if (folderValue == "My Bookmarks") {
                                                        await Provider.of<MainFilesProvider>(context, listen: false).getFCBookMarkFiles();
                                                      } else {
                                                        await Provider.of<MainFilesProvider>(context, listen: false).getFCContractFiles();
                                                      }
                                                      if (widget.arguments != null) {
                                                        await Provider.of<MainFilesProvider>(context, listen: false)
                                                            .getFCFiles(parcelId: widget.arguments);
                                                      } else {
                                                        await Provider.of<MainFilesProvider>(context, listen: false).getFCFiles();
                                                      }

                                                      setState(() {});
                                                    },
                                                    mButtonText: "Apply Filter".tr(),
                                                    mButtonColor: darkyellow)
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : SizedBox.shrink(),
                              SizedBox(
                                height: 8,
                              ),
                              provider.fcFiles!.data!.isEmpty
                                  ? Container(
                                      alignment: Alignment.topCenter,
                                      padding: EdgeInsets.all(20),
                                      child: CustomText(
                                        text:"No data found".tr(),
                                        color: Colors.red,
                                        weight: FontWeight.w700,
                                        size: 20,
                                      ),
                                    )
                                  : Card(
                                      margin: EdgeInsets.all(12),
                                      child: DataTable(
                                        columnSpacing: 0,
                                        horizontalMargin: 0,
                                        decoration: BoxDecoration(),
                                        columns: <DataColumn>[
                                          DataColumn(
                                            label: SizedBox(
                                              width: 50,
                                              child: Text(
                                                '',
                                              ),
                                            ),
                                          ),
                                          DataColumn(
                                            label: SizedBox(
                                              width: getWidth(context) * 0.25,
                                              child: Text(
                                                'File Name'.tr(),
                                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,fontFamily: Montserrat_Medium),
                                              ),
                                            ),
                                          ),
                                          DataColumn(
                                            label: SizedBox(
                                              width: getWidth(context) * 0.28,
                                              child: CustomText(
                                                text: 'More information'.tr(),
                                                textAligns: TextAlign.center,
                                                overflows: TextOverflow.visible,
                                                weight: FontWeight.bold,
                                                size: 12,
                                                lines: 2,
                                              ),
                                            ),
                                          ),
                                        ],
                                        rows: <DataRow>[
                                          for (int i = 0; i < provider.fcFiles!.data!.length; i++)
                                            DataRow(
                                              cells: <DataCell>[
                                                DataCell(
                                                  IconButton(
                                                    icon: Icon(
                                                      provider.isBookMark[i] == true ? Icons.star : Icons.star_border,
                                                      color: provider.isBookMark[i] == true ? yellowishGreen : Colors.black,
                                                    ),
                                                    onPressed: () async {
                                                      if (provider.isBookMark[i] == true) {
                                                        provider.isBookMark[i] = false;
                                                        setState(() {});
                                                        await provider.putFCFilesBookMark(
                                                            id: provider.fcFiles!.data![i].file!.id!, isFavourite: provider.isBookMark[i]);
                                                      } else {
                                                        provider.isBookMark[i] = true;
                                                        setState(() {});
                                                        await provider.putFCFilesBookMark(
                                                            id: provider.fcFiles!.data![i].file!.id!, isFavourite: provider.isBookMark[i]);
                                                      }
                                                    },
                                                  ),
                                                ),
                                                DataCell(Container(
                                                    constraints: BoxConstraints(
                                                      minWidth: getWidth(context) * 0.1,
                                                      maxWidth: getWidth(context) * 0.4,
                                                    ),
                                                    child: InkWell(
                                                      onTap: () {
                                                        launchUrlNewTab(provider.fcFiles!.data![i].file!.file!.original!);
                                                        setState(() {});
                                                      },
                                                      child: CustomText(
                                                        text: provider.fcFiles!.data![i].file!.title!,
                                                        size: 12,
                                                        lines: 5,
                                                      ),
                                                    ))),
                                                DataCell(Center(
                                                    child: IconButton(
                                                  icon: FaIcon(Icons.info_outline),
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext context) {
                                                          return FarmComputerFileDialog(
                                                            fileId: provider.fcFiles!.data![i].file!.id!,
                                                          );
                                                        });
                                                  },
                                                ))),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                        )
                      : SingleChildScrollView(
                          // scrollDirection: Axis.horizontal,

                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CustomText(
                                        text: "Farm Files".tr(),
                                        size: 22,
                                        weight: FontWeight.w800,
                                        color: darkred,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: getWidth(context),
                                      child: Card(
                                        elevation: 2,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 12, top: 10),
                                              child: Wrap(
                                                alignment: WrapAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 40,
                                                    width: Responsive.isTablet(context) ? getWidth(context) * 0.16 : getWidth(context) * 0.20,
                                                    child: EventTextSearchWidget(
                                                      hintText: "File Name".tr(),
                                                      onChangeValue: (value) async {
                                                        print(value);

                                                        if (widget.arguments != null) {
                                                          await Provider.of<MainFilesProvider>(context, listen: false)
                                                              .getFCFiles(parcelId: widget.arguments);
                                                        } else {
                                                          await Provider.of<MainFilesProvider>(context, listen: false).getFCFiles();
                                                        }
                                                        setState(() {});
                                                      },
                                                      controller: provider.searchController,
                                                      //  autofocus: true,
                                                      onSubmit: (values) async {},
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: getWidth(context) * 0.01,
                                                  ),
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
                                                            provider.startdate.text = d.toString().split(" ")[0];
                                                          });
                                                        }
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 35,
                                                      width: Responsive.isTablet(context) ? getWidth(context) * 0.16 : getWidth(context) * 0.20,
                                                      decoration: BoxDecoration(
                                                        color: HexColor("#FAFAFA"),
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      child: TextWidgetField(
                                                        controller: provider.startdate,
                                                        hintText: "Start date".tr(),
                                                        enabled: false,
                                                        suffixIcon: const Icon(Icons.calendar_today),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: getWidth(context) * 0.01,
                                                  ),
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
                                                            provider.endDate.text = d.toString().split(" ")[0];
                                                          });
                                                        }
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 35,
                                                      width: Responsive.isTablet(context) ? getWidth(context) * 0.16 : getWidth(context) * 0.20,
                                                      decoration: BoxDecoration(
                                                        color: HexColor("#FAFAFA"),
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      child: TextWidgetField(
                                                        controller: provider.endDate,
                                                        hintText: "End date".tr(),
                                                        enabled: false,
                                                        suffixIcon: const Icon(Icons.calendar_today),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: !Responsive.isDesktop(context)
                                                        ? 10
                                                        : Responsive.isTablet(context)
                                                            ? 10
                                                            : 60,
                                                  ),
                                                  ////////visibility check to show buttons or not
                                                  Visibility(
                                                    visible: true,
                                                    child: Column(
                                                      // mainAxisAlignment:
                                                      //     MainAxisAlignment.end,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 5.0),
                                                          child: SizedBox(
                                                            width: !Responsive.isDesktop(context) ? 120 : 150,
                                                            child: AddTextButtonWidget(
                                                              text: "Apply".tr(),
                                                              colors: yellowishGreen,
                                                              onPress: () async {
                                                                isLoading = true;
                                                                setState(() {});
                                                                if (widget.arguments != null) {
                                                                  await Provider.of<MainFilesProvider>(context, listen: false)
                                                                      .getFCFiles(parcelId: widget.arguments);
                                                                } else {
                                                                  await Provider.of<MainFilesProvider>(context, listen: false).getFCFiles();
                                                                }
                                                                isLoading = false;
                                                                setState(() {});
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 12.0, bottom: 12),
                                              child: Wrap(
                                                alignment: WrapAlignment.start,
                                                // alignment: WrapAlignment.start,
                                                // crossAxisAlignment:
                                                //     WrapCrossAlignment.start,
                                                //runSpacing: 15,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('File Type'.tr(), style: TextStyle(fontSize: 12,fontFamily: Montserrat_Medium)),
                                                      SizedBox(
                                                        width: Responsive.isTablet(context) ? getWidth(context) * 0.16 : getWidth(context) * 0.20,
                                                        height: 40,
                                                        child: RealDropDownWidget(
                                                          value: provider.fileTypeDropDownSelectedValue,
                                                          color: normalGrey,
                                                          onChanged: (newValue) {
                                                            setState(() {
                                                              provider.fileTypeDropDownSelectedValue = newValue;
                                                              if (!provider.listOfSelectedFileDropdown
                                                                  .contains(provider.fileTypeDropDownSelectedValue)) {
                                                                provider.listOfSelectedFileDropdown.add(provider.fileTypeDropDownSelectedValue);
                                                              }
                                                              print("listOfSelectedFileDropdown  ${provider.listOfSelectedFileDropdown}");
                                                              print("fileTypeDropDown  ${provider.fileTypeDropDownSelectedValue}");
                                                            });
                                                          },
                                                          items: provider.fileTypeDropDownList.map<DropdownMenuItem<String>>((String value) {
                                                            return DropdownMenuItem<String>(value: value, child: Text(value));
                                                          }).toList(),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: getWidth(context) * 0.14,
                                                        child: Wrap(
                                                            children: provider.listOfSelectedFileDropdown.map((e) {
                                                          return Container(
                                                            padding: EdgeInsets.all(3),
                                                            child: Chip(
                                                              label: Text(e, style: TextStyle(color: Colors.black,fontFamily: Montserrat_Medium)),
                                                              onDeleted: () {
                                                                provider.listOfSelectedFileDropdown.remove(e);
                                                                setState(() {});
                                                              },
                                                            ),
                                                          );
                                                        }).toList()),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: getWidth(context) * 0.01,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('Project(multi-select)'.tr(), style: TextStyle(fontSize: 12,fontFamily: Montserrat_Medium)),
                                                      SizedBox(
                                                        width: Responsive.isTablet(context) ? getWidth(context) * 0.16 : getWidth(context) * 0.20,
                                                        height: 40,
                                                        child: RealDropDownWidget(
                                                          value: provider.projectSelectedDropDownName,
                                                          color: normalGrey,
                                                          onChanged: (newValue) {
                                                            ProjectData data = newValue;
                                                            print('newValue = $newValue');
                                                            setState(() {
                                                              provider.projectSelectedDropDownName = data;
                                                              if (!provider.listofSelectedProject.contains(provider.projectSelectedDropDownName!)) {
                                                                provider.listofSelectedProject.add(provider.projectSelectedDropDownName!);
                                                              }
                                                              print("listofSelectedProject  ${provider.listofSelectedProject}");
                                                              print("projectSelectedDropDownName  ${provider.projectSelectedDropDownName!.name}");
                                                            });
                                                          },
                                                          items: provider.projectsDropDownModel.map<DropdownMenuItem<ProjectData>>((ProjectData value) {
                                                            return DropdownMenuItem<ProjectData>(value: value, child: Text(value.name!));
                                                          }).toList(),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: getWidth(context) * 0.14,
                                                        child: Wrap(
                                                            children: provider.listofSelectedProject.map((e) {
                                                          return Container(
                                                            padding: EdgeInsets.all(3),
                                                            child: Chip(
                                                              label: Text('${e.name}', style: TextStyle(color: Colors.black,fontFamily: Montserrat_Medium)),
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
                                                  SizedBox(
                                                    width: getWidth(context) * 0.01,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('Action(multi-select)'.tr(), style: TextStyle(fontSize: 12,fontFamily: Montserrat_Medium)),
                                                      SizedBox(
                                                        width: Responsive.isTablet(context) ? getWidth(context) * 0.16 : getWidth(context) * 0.20,
                                                        height: 40,
                                                        child: RealDropDownWidget(
                                                          value: provider.farmActionDropdownName,
                                                          color: normalGrey,
                                                          onChanged: (newValue) {
                                                            ActionData data = newValue;
                                                            print('newValue = $newValue');
                                                            setState(() {
                                                              provider.farmActionDropdownName = data;
                                                              if (!provider.listOfSelectedAction.contains(provider.farmActionDropdownName!)) {
                                                                provider.listOfSelectedAction.add(provider.farmActionDropdownName!);
                                                              }
                                                              print("listofSelectedAction  ${provider.listOfSelectedAction}");
                                                              print("ActionSelectedDropDownName  ${provider.farmActionDropdownName!.id}");
                                                            });
                                                          },
                                                          items: provider.actionsDropDownModel.map<DropdownMenuItem<ActionData>>((ActionData value) {
                                                            return DropdownMenuItem<ActionData>(value: value, child: Text(value.name!));
                                                          }).toList(),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: getWidth(context) * 0.14,
                                                        child: Wrap(
                                                            children: provider.listOfSelectedAction.map((e) {
                                                          return Container(
                                                            padding: EdgeInsets.all(3),
                                                            child: Chip(
                                                              label: Text('${e.name}', style: TextStyle(color: Colors.black,fontFamily: Montserrat_Medium)),
                                                              onDeleted: () {
                                                                provider.listOfSelectedAction.remove(e);
                                                                setState(() {});
                                                              },
                                                            ),
                                                          );
                                                        }).toList()),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: !Responsive.isDesktop(context)
                                                        ? 10
                                                        : Responsive.isTablet(context)
                                                            ? 10
                                                            : 60,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 5.0),
                                                    child: SizedBox(
                                                      width: !Responsive.isDesktop(context) ? 120 : 150,
                                                      child: AddTextButtonWidget(
                                                        text: "Clear".tr(),
                                                        colors: dimMetalic2,
                                                        onPress: () async {
                                                          provider.clearFields();
                                                          isLoading = true;
                                                          setState(() {});
                                                          if (widget.arguments != null) {
                                                            await Provider.of<MainFilesProvider>(context, listen: false)
                                                                .getFCFiles(parcelId: widget.arguments);
                                                          } else {
                                                            provider.clearFields();
                                                            await Provider.of<MainFilesProvider>(context, listen: false).getFCFiles();
                                                          }
                                                          isLoading = false;
                                                          setState(() {});
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                SizedBox(
                                  width: getWidth(context),
                                  // height: getHeight(context),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                        child: Container(
                                          width: getWidth(context),
                                          padding: EdgeInsets.all(20),
                                          child: Wrap(
                                            spacing: 20,
                                            runSpacing: 15,
                                            children: [
                                              FarmFileBookMarksWidget(
                                                text: "Wij.land Bookmarks".tr(),
                                                bgColors: wijLandBookMark ? Colors.green : Colors.transparent,
                                                iconColor: wijLandBookMark ? Colors.white : Colors.green,
                                                textColor: wijLandBookMark ? Colors.white : Colors.green,
                                                onTap: () async {
                                                  wijLandBookMark = !wijLandBookMark;
                                                  provider.name = false;
                                                  provider.addBy = false;
                                                  provider.dateBy = false;

                                                  setState(() {});
                                                  if (wijLandBookMark) {
                                                    myContract = false;
                                                    myBookMark = false;
                                                    provider.name = false;
                                                    provider.addBy = false;
                                                    provider.dateBy = false;

                                                    await Provider.of<MainFilesProvider>(context, listen: false).getWijLandBookmarks();
                                                  } else {
                                                    await Provider.of<MainFilesProvider>(context, listen: false).getFCFiles();
                                                  }
                                                  setState(() {});
                                                },
                                              ),
                                              FarmFileBookMarksWidget(
                                                onTap: () async {
                                                  myBookMark = !myBookMark;
                                                  provider.name = false;
                                                  provider.addBy = false;
                                                  provider.dateBy = false;

                                                  setState(() {});

                                                  //                                              if (widget.arguments != null) {
                                                  //   await Provider.of<MainFilesProvider>(context, listen: false)
                                                  //       .getFCFiles(parcelId:  widget.arguments);
                                                  // } else {
                                                  //   await Provider.of<MainFilesProvider>(context, listen: false).getFCFiles();
                                                  // }

                                                  if (myBookMark) {
                                                    myContract = false;
                                                    wijLandBookMark = false;
                                                    provider.name = false;
                                                    provider.addBy = false;
                                                    provider.dateBy = false;

                                                    await Provider.of<MainFilesProvider>(context, listen: false).getFCBookMarkFiles();
                                                  } else {
                                                    await Provider.of<MainFilesProvider>(context, listen: false).getFCFiles();
                                                  }
                                                  setState(() {});
                                                },
                                                text: "My Bookmarks".tr(),
                                                bgColors: myBookMark ? Colors.green : Colors.transparent,
                                                iconColor: myBookMark ? Colors.white : Colors.green,
                                                textColor: myBookMark ? Colors.white : Colors.green,
                                              ),
                                              FarmFileBookMarksWidget(
                                                onTap: () async {
                                                  myContract = !myContract;
                                                  provider.name = false;
                                                  provider.addBy = false;
                                                  provider.dateBy = false;

                                                  setState(() {});
//  if (widget.arguments != null) {
//       await Provider.of<MainFilesProvider>(context, listen: false)
//           .getFCFiles(parcelId:  widget.arguments);
//     } else {
//       await Provider.of<MainFilesProvider>(context, listen: false).getFCFiles();
//     }
                                                  if (myContract) {
                                                    myBookMark = false;
                                                    wijLandBookMark = false;
                                                    provider.name = false;
                                                    provider.addBy = false;
                                                    provider.dateBy = false;

                                                    await Provider.of<MainFilesProvider>(context, listen: false).getFCContractFiles();
                                                  } else {
                                                    await Provider.of<MainFilesProvider>(context, listen: false).getFCFiles();
                                                  }
                                                  setState(() {});
                                                },
                                                text: "My Contract".tr(),
                                                bgColors: myContract ? Colors.green : Colors.transparent,
                                                iconColor: myContract ? Colors.white : Colors.green,
                                                textColor: myContract ? Colors.white : Colors.green,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Card(
                                        elevation: 4,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    ClickIconButton(
                                                      clickcolors: checkedView ? hoverColor : Colors.white,
                                                      icon: CupertinoIcons.square_grid_2x2_fill,
                                                      iconColor: !checkedView ? Colors.black : Colors.white,
                                                      onPressed: () {
                                                        setState(
                                                          () {
                                                            checkedView = true;
                                                          },
                                                        );
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 6,
                                                    ),
                                                    ClickIconButton(
                                                      clickcolors: !checkedView ? hoverColor : Colors.white,
                                                      icon: CupertinoIcons.list_dash,
                                                      iconColor: !checkedView ? Colors.white : Colors.black,
                                                      onPressed: () {
                                                        setState(() {
                                                          checkedView = false;
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              !checkedView
                                                  ? provider.fcFiles!.data!.isEmpty
                                                      ? Container(
                                                          alignment: Alignment.topCenter,
                                                          padding: EdgeInsets.all(20),
                                                          child: CustomText(
                                                            text: provider.fcFiles!.message ?? "Null".tr(),
                                                            color: Colors.red,
                                                            weight: FontWeight.w700,
                                                            size: 20,
                                                          ),
                                                        )
                                                      //For List View//
                                                      : FarmFilesWidget(
                                                          fcFiles: provider.fcFiles,
                                                        )
                                                  : provider.fcFiles!.data!.isEmpty
                                                      ? Container(
                                                          alignment: Alignment.topCenter,
                                                          padding: EdgeInsets.all(20),
                                                          child: CustomText(
                                                            text: provider.fcFiles!.message ?? "Null".tr(),
                                                            color: Colors.red,
                                                            weight: FontWeight.w700,
                                                            size: 20,
                                                          ),
                                                        )
                                                      : ProjectFileCubeWidget(
                                                          fcFiles: provider.fcFiles,
                                                        ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ));
        },
      ),
    );
  }
}
