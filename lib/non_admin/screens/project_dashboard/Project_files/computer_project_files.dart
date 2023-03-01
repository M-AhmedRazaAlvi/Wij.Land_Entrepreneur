import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/non_admin/providers/farm_computer_projects_provider/farm_computer_project_file_provider.dart';
import 'package:wij_land/non_admin/screens/project_dashboard/Project_files/wiget/farm_file_bookmarks.dart';
import 'package:wij_land/non_admin/screens/project_dashboard/Project_files/wiget/farm_file_info.dart';
import 'package:wij_land/screens/office/widgets/search_widget.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/styles.dart';
import 'package:wij_land/utils/url_scheme.dart';
import 'package:universal_html/html.dart' as html;
import '../../../../screens/farm_networks/farms/farm_screens/Files/widget/file_folder.dart';
import '../../../../utils/responsive.dart';
import '../../../models/farm_computer_project/farm_computer_project_files/get_computer_project_file_response.dart';
import 'farm_project_file_grid_view_widget.dart';

class ComputerProjectFilesScreens extends StatefulWidget {
  const ComputerProjectFilesScreens({
    Key? key,
    this.projectId,
    this.model,
  }) : super(key: key);
  final projectId;
  final GetFarmComputerProjectFilesResponse? model;

  @override
  State<ComputerProjectFilesScreens> createState() => _ComputerProjectFilesScreensState();
}

class _ComputerProjectFilesScreensState extends State<ComputerProjectFilesScreens> {
  List<bool> listTextBool = <bool>[];
  List<String> listfileText = <String>[
    "All",
    "Media",
    "Documents",
  ];
  List<bool> fileTextBool = <bool>[];
  List<String> fileText = <String>[
    "Analysis Result",
    "Farm Management Plan",
    "Soil Advisory Report",
    "Interview Report",
    "Other",
  ];

  @override
  void initState() {
    super.initState();
    listTextBool = List.filled(3, false);
    listTextBool[0] = true;
    initData();
  }

  initData() async {
    await Provider.of<CreateFarmComputerProjectFilesProvider>(context, listen: false).getFarmComputerProjectFile(
      projectId: widget.projectId,
    );
    isLoading = false;

    for (int i = 0;
        i < Provider.of<CreateFarmComputerProjectFilesProvider>(context, listen: false).farmComputerProjectFileResponseModel.data!.length;
        i++) {
      if (Provider.of<CreateFarmComputerProjectFilesProvider>(context, listen: false).farmComputerProjectFileResponseModel.data![i].type == "Media") {
        countMedia++;
      }
    }
    setState(() {});
  }

  void openDownloadLink(String href, String filename) {
    html.document.createElement('a') as html.AnchorElement
      ..href = href
      ..download = filename
      ..dispatchEvent(html.Event.eventType('MouseEvent', 'click'));
  }

  bool checkedGridViewWidget = false, isLoading = true;
  bool isWijLandBookmarks = false, isFavouriteBookmarks = false, isContract = false;
  int countMedia = 0, bookCountMedia = 0, contractCount = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateFarmComputerProjectFilesProvider>(builder: (context, provider, child) {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: getWidth(context),
          height: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// favorites card
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: Container(
                  width: getWidth(context),
                  padding: EdgeInsets.all(Responsive.isMobile(context) ? 10 : 20),
                  child: Wrap(
                    spacing: Responsive.isMobile(context) ? 10 : 20,
                    runSpacing: Responsive.isMobile(context) ? 10 : 15,
                    children: [
                      FarmFileBookMarksWidget(
                        bgColors: isWijLandBookmarks ? darkGreen : Colors.white,
                        textColor: isWijLandBookmarks ? Colors.white : darkGreen,
                        iconColor: isWijLandBookmarks ? Colors.white : darkGreen,
                        text: "Wij.land Bookmarks".tr(),
                        onTap: () async {
                          isWijLandBookmarks = !isWijLandBookmarks;
                          isContract = false;
                          isFavouriteBookmarks = false;
                          setState(() {});
                          if (isWijLandBookmarks) {
                            listTextBool[0] = true;
                            listTextBool[1] = false;
                            listTextBool[2] = false;
                            await Provider.of<CreateFarmComputerProjectFilesProvider>(context, listen: false)
                                .getFCProjectFileWijLandBookmarks(projectId: widget.projectId);
                            for (int i = 0;
                                i <
                                    Provider.of<CreateFarmComputerProjectFilesProvider>(context, listen: false)
                                        .farmComputerProjectFileResponseModel
                                        .data!
                                        .length;
                                i++) {
                              if (Provider.of<CreateFarmComputerProjectFilesProvider>(context, listen: false)
                                      .farmComputerProjectFileResponseModel
                                      .data![i]
                                      .type ==
                                  "Media") {
                                bookCountMedia++;
                              }
                            }
                          } else {
                            await Provider.of<CreateFarmComputerProjectFilesProvider>(context, listen: false)
                                .getFarmComputerProjectFile(projectId: widget.projectId);
                            listTextBool[0] = true;
                            listTextBool[1] = false;
                            listTextBool[2] = false;
                          }
                        },
                      ),
                      FarmFileBookMarksWidget(
                        bgColors: isFavouriteBookmarks ? darkGreen : Colors.white,
                        textColor: isFavouriteBookmarks ? Colors.white : darkGreen,
                        iconColor: isFavouriteBookmarks ? Colors.white : darkGreen,
                        text: "My Bookmarks".tr(),
                        onTap: () async {
                          isFavouriteBookmarks = !isFavouriteBookmarks;
                          isContract = false;
                          isWijLandBookmarks = false;
                          setState(() {});
                          if (isFavouriteBookmarks) {
                            listTextBool[0] = true;
                            listTextBool[1] = false;
                            listTextBool[2] = false;
                            await Provider.of<CreateFarmComputerProjectFilesProvider>(context, listen: false)
                                .getFCProjectFileBookmarks(projectId: widget.projectId);
                            for (int i = 0;
                                i <
                                    Provider.of<CreateFarmComputerProjectFilesProvider>(context, listen: false)
                                        .farmComputerProjectFileResponseModel
                                        .data!
                                        .length;
                                i++) {
                              if (Provider.of<CreateFarmComputerProjectFilesProvider>(context, listen: false)
                                      .farmComputerProjectFileResponseModel
                                      .data![i]
                                      .type ==
                                  "Media") {
                                bookCountMedia++;
                              }
                            }
                          } else {
                            await Provider.of<CreateFarmComputerProjectFilesProvider>(context, listen: false)
                                .getFarmComputerProjectFile(projectId: widget.projectId);
                            listTextBool[0] = true;
                            listTextBool[1] = false;
                            listTextBool[2] = false;
                          }
                          setState(() {});
                        },
                      ),
                      FarmFileBookMarksWidget(
                        bgColors: isContract ? darkGreen : Colors.white,
                        textColor: isContract ? Colors.white : darkGreen,
                        iconColor: isContract ? Colors.white : darkGreen,
                        text: "My Contract".tr(),
                        onTap: () async {
                          isContract = !isContract;
                          isFavouriteBookmarks = false;
                          isWijLandBookmarks = false;
                          setState(() {});

                          if (isContract) {
                            listTextBool[0] = true;
                            listTextBool[1] = false;
                            listTextBool[2] = false;
                            await Provider.of<CreateFarmComputerProjectFilesProvider>(context, listen: false)
                                .getFCProjectContractFiles(projectId: widget.projectId);
                            if (provider.farmComputerProjectFileResponseModel.error?.status != 404) {
                              for (int i = 0;
                                  i <
                                      Provider.of<CreateFarmComputerProjectFilesProvider>(context, listen: false)
                                          .farmComputerProjectFileResponseModel
                                          .data!
                                          .length;
                                  i++) {
                                if (Provider.of<CreateFarmComputerProjectFilesProvider>(context, listen: false)
                                        .farmComputerProjectFileResponseModel
                                        .data![i]
                                        .type ==
                                    "Media") {
                                  contractCount++;
                                }
                              }
                            } else {
                              Container(
                                alignment: Alignment.topCenter,
                                padding: EdgeInsets.all(20),
                                child: CustomText(
                                  text: '${provider.farmComputerProjectFileResponseModel.error?.message}',
                                  color: Colors.red,
                                  weight: FontWeight.w700,
                                  size: 20,
                                ),
                              );
                            }
                          } else {
                            await Provider.of<CreateFarmComputerProjectFilesProvider>(context, listen: false)
                                .getFarmComputerProjectFile(projectId: widget.projectId);
                            listTextBool[0] = true;
                            listTextBool[1] = false;
                            listTextBool[2] = false;
                          }
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              isLoading
                  ? SizedBox(
                      height: getHeight(context),
                      width: getWidth(context),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : provider.farmComputerProjectFileResponseModel.error?.status == 404
                      ? Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.all(20),
                          child: CustomText(
                            text: 'No any files'.tr(),
                            color: Colors.red,
                            weight: FontWeight.w700,
                            size: Responsive.isMobile(context)
                                ? 12
                                : Responsive.isTablet(context)
                                    ? 14
                                    : 20,
                          ),
                        )
                      : Card(
                          elevation: 0,
                          child: Stack(
                            children: [
                              !checkedGridViewWidget
                                  ? Column(
                                      children: [
                                        Container(
                                          width: getWidth(context),
                                          padding: EdgeInsets.only(left: Responsive.isMobile(context) ? 10 : 30, top: 30),
                                          decoration: const BoxDecoration(
                                            border: Border(bottom: BorderSide(color: Colors.black26)),
                                          ),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              for (int i = 0; i < 3; i++)
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      provider.docxLength = [];
                                                      if (listTextBool.contains(true)) {
                                                        listTextBool = List.filled(3, false);
                                                        listTextBool[i] = true;
                                                        for (int i = 0; i < provider.farmComputerProjectFileResponseModel.data!.length; i++) {
                                                          provider.docxLength.add(i);
                                                        }
                                                        if (provider.mediaBool.contains(true)) {
                                                          provider.docxLength.length = provider.docxLength.length - provider.mediaBool.length;
                                                        }
                                                      } else {
                                                        listTextBool[i] = true;
                                                      }
                                                      fileTextBool = List.filled(5, false);
                                                      //provider.docxLength=provider.farmComputerProjectFileResponseModel.data!.length;
                                                    });
                                                  },
                                                  child: Transform.translate(
                                                    offset: listTextBool[i] ? Offset(0.0, 1.5) : Offset(0, 0),
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? 5 : 10, vertical: 10),
                                                      decoration: BoxDecoration(
                                                          border: Border(
                                                              bottom: BorderSide(
                                                        color: listTextBool[i] ? Colors.black : Colors.black12,
                                                        width: listTextBool[i] ? 2 : 0.1,
                                                      ))),
                                                      child: CustomText(
                                                        text: listfileText[i].tr(),
                                                        size: Responsive.isMobile(context)
                                                            ? listTextBool[i]
                                                                ? 12
                                                                : 11
                                                            : listTextBool[i]
                                                                ? 16
                                                                : 14,
                                                        weight: listTextBool[i] ? FontWeight.bold : FontWeight.normal,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Visibility(
                                          visible: listTextBool[0] || listTextBool[1] ? true : false,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(vertical: Responsive.isMobile(context) ? 10 : 15),
                                            child: FarmProjectFileInfoWidget(
                                                first: true,
                                                fileName: "File name".tr(),
                                                fileType: "File type".tr(),
                                                addedBy: "Added by".tr(),
                                                dateBy: "Date".tr(),
                                                totalRow: listTextBool[0]
                                                    ? "Total".tr() + " ${provider.farmComputerProjectFileResponseModel.data!.length}"
                                                    : "Total".tr() + " ${provider.mediaBool.length}",
                                                size: getWidth(context) / 11),
                                          ),
                                        ),
                                        listTextBool[0]
                                            ? Column(
                                                children: [
                                                  for (int i = 0; i < provider.farmComputerProjectFileResponseModel.data!.length; i++)
                                                    FarmProjectFileInfoWidget(
                                                        starIcon: Icon(
                                                          provider.getcheckedBool[i] ? Icons.star : Icons.star_border,
                                                          color: provider.getcheckedBool[i] ? darkyellow : Colors.black,
                                                        ),
                                                        onStarTap: () async {
                                                          if (provider.getcheckedBool[i] == true) {
                                                            provider.getcheckedBool[i] = false;
                                                            await provider.updateProjectFileFavouriteInterest(
                                                                fileID: provider.farmComputerProjectFileResponseModel.data![i].id!,
                                                                favourites: provider.getcheckedBool[i]);
                                                          } else {
                                                            provider.getcheckedBool[i] = true;
                                                            setState(() {});
                                                            await provider.updateProjectFileFavouriteInterest(
                                                                fileID: provider.farmComputerProjectFileResponseModel.data![i].id!,
                                                                favourites: provider.getcheckedBool[i]);
                                                          }
                                                        },
                                                        first: false,
                                                        onFileTap: () async {
                                                          // openDownloadLink(provider.farmComputerProjectFileResponseModel.data![i].path!,
                                                          //     provider.farmComputerProjectFileResponseModel.data![i].name!);
                                                          launchUrlNewTab(provider.farmComputerProjectFileResponseModel.data![i].path!);
                                                        },
                                                        fileName: provider.farmComputerProjectFileResponseModel.data![i].name!.isEmpty
                                                            ? "-"
                                                            : provider.farmComputerProjectFileResponseModel.data![i].name ?? "-",
                                                        fileType: provider.farmComputerProjectFileResponseModel.data![i].type!.isEmpty
                                                            ? "-"
                                                            : provider.farmComputerProjectFileResponseModel.data![i].type ?? "-",
                                                        addedBy: provider.farmComputerProjectFileResponseModel.data![i].addedBy!.isEmpty
                                                            ? "-"
                                                            : provider.farmComputerProjectFileResponseModel.data![i].addedBy ?? "-",
                                                        dateBy: provider.farmComputerProjectFileResponseModel.data![i].addedOn!.isEmpty
                                                            ? "-"
                                                            : provider.farmComputerProjectFileResponseModel.data![i].addedOn ?? "-",
                                                        totalRow: "",
                                                        size: getWidth(context) / 11),
                                                ],
                                              )
                                            : listTextBool[1]
                                                ? SizedBox(
                                                    width: getWidth(context),
                                                    child: Column(
                                                      children: [
                                                        for (int i = 0; i < provider.farmComputerProjectFileResponseModel.data!.length; i++)
                                                          if (provider.farmComputerProjectFileResponseModel.data![i].type == "Media")
                                                            FarmProjectFileInfoWidget(
                                                              starIcon: Icon(
                                                                provider.getcheckedBool[i] ? Icons.star : Icons.star_border,
                                                                color: provider.getcheckedBool[i] ? darkyellow : Colors.black,
                                                              ),
                                                              onStarTap: () async {
                                                                if (provider.getcheckedBool[i] == true) {
                                                                  provider.getcheckedBool[i] = false;
                                                                  await provider.updateProjectFileFavouriteInterest(
                                                                      fileID: provider.farmComputerProjectFileResponseModel.data![i].id!,
                                                                      favourites: provider.getcheckedBool[i]);
                                                                } else {
                                                                  provider.getcheckedBool[i] = true;
                                                                  setState(() {});
                                                                  await provider.updateProjectFileFavouriteInterest(
                                                                      fileID: provider.farmComputerProjectFileResponseModel.data![i].id!,
                                                                      favourites: provider.getcheckedBool[i]);
                                                                }
                                                              },
                                                              first: false,
                                                              onFileTap: () async {
                                                                // openDownloadLink(provider.farmComputerProjectFileResponseModel.data![i].path!,
                                                                //     provider.farmComputerProjectFileResponseModel.data![i].name!);
                                                                launchUrlNewTab(provider.farmComputerProjectFileResponseModel.data![i].path!);
                                                              },
                                                              fileName: provider.farmComputerProjectFileResponseModel.data![i].name!.isEmpty
                                                                  ? "-"
                                                                  : provider.farmComputerProjectFileResponseModel.data![i].name ?? "-",
                                                              fileType: provider.farmComputerProjectFileResponseModel.data![i].type!.isEmpty
                                                                  ? "-"
                                                                  : provider.farmComputerProjectFileResponseModel.data![i].type ?? "-",
                                                              addedBy: provider.farmComputerProjectFileResponseModel.data![i].addedBy!.isEmpty
                                                                  ? "-"
                                                                  : provider.farmComputerProjectFileResponseModel.data![i].addedBy ?? "-",
                                                              dateBy: provider.farmComputerProjectFileResponseModel.data![i].addedOn!.isEmpty
                                                                  ? "-"
                                                                  : provider.farmComputerProjectFileResponseModel.data![i].addedOn ?? "-",
                                                              totalRow: "",
                                                              size: getWidth(context) / 11,
                                                            ),
                                                        if (!provider.mediaBool.contains(true))
                                                          SizedBox(
                                                            child: Align(
                                                              alignment: Alignment.topCenter,
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(25.0),
                                                                child: CustomText(
                                                                  text: "No any media file".tr(),
                                                                  color: Colors.red,
                                                                  weight: FontWeight.w700,
                                                                  size: Responsive.isMobile(context) ? 12 : 20,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  )
                                                : Padding(
                                                    padding: EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: Responsive.isMobile(context) ? 10 : 15,
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          width: getWidth(context),
                                                          child: Wrap(
                                                            alignment: WrapAlignment.start,
                                                            spacing: Responsive.isMobile(context) ? 5 : 9,
                                                            runSpacing: Responsive.isMobile(context) ? 7 : 15,
                                                            children: [
                                                              for (int j = 0; j < 5; j++)
                                                                InkWell(
                                                                  onTap: () {
                                                                    setState(() {
                                                                      provider.docxLength = [];
                                                                      if (fileTextBool.contains(false)) {
                                                                        fileTextBool = List.filled(5, false);
                                                                        fileTextBool[j] = true;
                                                                      } else {
                                                                        fileTextBool[j] = true;
                                                                      }
                                                                      if (j == 4) {
                                                                        for (int i = 0;
                                                                            i < provider.farmComputerProjectFileResponseModel.data!.length;
                                                                            i++) {
                                                                          if (provider.farmComputerProjectFileResponseModel.data![i].type !=
                                                                                  "Analysis Result" &&
                                                                              provider.farmComputerProjectFileResponseModel.data![i].type !=
                                                                                  "Farm Management Plan" &&
                                                                              provider.farmComputerProjectFileResponseModel.data![i].type !=
                                                                                  "Soil Advisory Report" &&
                                                                              provider.farmComputerProjectFileResponseModel.data![i].type !=
                                                                                  "Interview Report" &&
                                                                              provider.farmComputerProjectFileResponseModel.data![i].type !=
                                                                                  "Media") {
                                                                            provider.docxLength.add(i);
                                                                          }
                                                                        }
                                                                      } else {
                                                                        for (int i = 0;
                                                                            i < provider.farmComputerProjectFileResponseModel.data!.length;
                                                                            i++) {
                                                                          if (provider.farmComputerProjectFileResponseModel.data![i].type ==
                                                                              fileText[j]) {
                                                                            provider.docxLength.add(i);
                                                                          }
                                                                        }
                                                                      }
                                                                    });
                                                                  },
                                                                  child: FileFolderWidget(text: fileText[j]),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                        Column(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets.symmetric(vertical: Responsive.isMobile(context) ? 10 : 15),
                                                              child: FarmProjectFileInfoWidget(
                                                                  first: true,
                                                                  fileName: "File name".tr(),
                                                                  fileType: "File type".tr(),
                                                                  addedBy: "Added by".tr(),
                                                                  dateBy: "Date".tr(),
                                                                  totalRow: "Total".tr() + " ${provider.docxLength.length}",
                                                                  size: getWidth(context) / 11),
                                                            ),
                                                            Visibility(
                                                              visible: fileTextBool.contains(true) ? false : true,
                                                              child: Column(
                                                                children: [
                                                                  for (int i = 0; i < provider.farmComputerProjectFileResponseModel.data!.length; i++)
                                                                    if (provider.farmComputerProjectFileResponseModel.data![i].type != "Media")
                                                                      FarmProjectFileInfoWidget(
                                                                        starIcon: Icon(
                                                                          provider.getcheckedBool[i] ? Icons.star : Icons.star_border,
                                                                          color: provider.getcheckedBool[i] ? darkyellow : Colors.black,
                                                                        ),
                                                                        onStarTap: () async {
                                                                          if (provider.getcheckedBool[i] == true) {
                                                                            provider.getcheckedBool[i] = false;
                                                                            await provider.updateProjectFileFavouriteInterest(
                                                                                fileID: provider.farmComputerProjectFileResponseModel.data![i].id!,
                                                                                favourites: provider.getcheckedBool[i]);
                                                                          } else {
                                                                            provider.getcheckedBool[i] = true;
                                                                            setState(() {});
                                                                            await provider.updateProjectFileFavouriteInterest(
                                                                                fileID: provider.farmComputerProjectFileResponseModel.data![i].id!,
                                                                                favourites: provider.getcheckedBool[i]);
                                                                          }
                                                                        },
                                                                        first: false,
                                                                        onFileTap: () async {
                                                                          // openDownloadLink(provider.farmComputerProjectFileResponseModel.data![i].path!,
                                                                          //     provider.farmComputerProjectFileResponseModel.data![i].name!);
                                                                          launchUrlNewTab(
                                                                              provider.farmComputerProjectFileResponseModel.data![i].path!);
                                                                        },
                                                                        fileName: provider.farmComputerProjectFileResponseModel.data![i].name!.isEmpty
                                                                            ? "-"
                                                                            : provider.farmComputerProjectFileResponseModel.data![i].name ?? "-",
                                                                        fileType: provider.farmComputerProjectFileResponseModel.data![i].type!.isEmpty
                                                                            ? "-"
                                                                            : provider.farmComputerProjectFileResponseModel.data![i].type ?? "-",
                                                                        addedBy: provider
                                                                                .farmComputerProjectFileResponseModel.data![i].addedBy!.isEmpty
                                                                            ? "-"
                                                                            : provider.farmComputerProjectFileResponseModel.data![i].addedBy ?? "-",
                                                                        dateBy: provider
                                                                                .farmComputerProjectFileResponseModel.data![i].addedOn!.isEmpty
                                                                            ? "-"
                                                                            : provider.farmComputerProjectFileResponseModel.data![i].addedOn ?? "-",
                                                                        totalRow: "",
                                                                        size: getWidth(context) / 11,
                                                                      ),
                                                                ],
                                                              ),
                                                            ),
                                                            for (int j = 0; j < 4; j++)
                                                              if (fileTextBool[j])
                                                                Column(
                                                                  children: [
                                                                    for (int i = 0;
                                                                        i < provider.farmComputerProjectFileResponseModel.data!.length;
                                                                        i++)
                                                                      if (provider.farmComputerProjectFileResponseModel.data![i].type == fileText[j])
                                                                        FarmProjectFileInfoWidget(
                                                                          starIcon: Icon(
                                                                            provider.getcheckedBool[i] ? Icons.star : Icons.star_border,
                                                                            color: provider.getcheckedBool[i] ? darkyellow : Colors.black,
                                                                          ),
                                                                          onStarTap: () async {
                                                                            if (provider.getcheckedBool[i] == true) {
                                                                              provider.getcheckedBool[i] = false;
                                                                              await provider.updateProjectFileFavouriteInterest(
                                                                                  fileID: provider.farmComputerProjectFileResponseModel.data![i].id!,
                                                                                  favourites: provider.getcheckedBool[i]);
                                                                            } else {
                                                                              provider.getcheckedBool[i] = true;
                                                                              setState(() {});
                                                                              await provider.updateProjectFileFavouriteInterest(
                                                                                  fileID: provider.farmComputerProjectFileResponseModel.data![i].id!,
                                                                                  favourites: provider.getcheckedBool[i]);
                                                                            }
                                                                          },
                                                                          first: false,
                                                                          onFileTap: () async {
                                                                            // openDownloadLink(provider.farmComputerProjectFileResponseModel.data![i].path!,
                                                                            //     provider.farmComputerProjectFileResponseModel.data![i].name!);
                                                                            launchUrlNewTab(
                                                                                provider.farmComputerProjectFileResponseModel.data![i].path!);
                                                                          },
                                                                          fileName: provider
                                                                                  .farmComputerProjectFileResponseModel.data![i].name!.isEmpty
                                                                              ? "-"
                                                                              : provider.farmComputerProjectFileResponseModel.data![i].name ?? "-",
                                                                          fileType: provider
                                                                                  .farmComputerProjectFileResponseModel.data![i].type!.isEmpty
                                                                              ? "-"
                                                                              : provider.farmComputerProjectFileResponseModel.data![i].type ?? "-",
                                                                          addedBy: provider
                                                                                  .farmComputerProjectFileResponseModel.data![i].addedBy!.isEmpty
                                                                              ? "-"
                                                                              : provider.farmComputerProjectFileResponseModel.data![i].addedBy ?? "-",
                                                                          dateBy: provider
                                                                                  .farmComputerProjectFileResponseModel.data![i].addedOn!.isEmpty
                                                                              ? "-"
                                                                              : provider.farmComputerProjectFileResponseModel.data![i].addedOn ?? "-",
                                                                          totalRow: "",
                                                                          size: getWidth(context) / 11,
                                                                        ),
                                                                  ],
                                                                ),
                                                            if (fileTextBool[4])
                                                              Column(
                                                                children: [
                                                                  for (int i = 0; i < provider.farmComputerProjectFileResponseModel.data!.length; i++)
                                                                    if (provider.farmComputerProjectFileResponseModel.data![i].type != "Media" &&
                                                                        provider.farmComputerProjectFileResponseModel.data![i].type != fileText[3] &&
                                                                        provider.farmComputerProjectFileResponseModel.data![i].type != fileText[2] &&
                                                                        provider.farmComputerProjectFileResponseModel.data![i].type != fileText[1] &&
                                                                        provider.farmComputerProjectFileResponseModel.data![i].type != fileText[0])
                                                                      FarmProjectFileInfoWidget(
                                                                        starIcon: Icon(
                                                                          provider.getcheckedBool[i] ? Icons.star : Icons.star_border,
                                                                          color: provider.getcheckedBool[i] ? darkyellow : Colors.black,
                                                                        ),
                                                                        onStarTap: () async {
                                                                          if (provider.getcheckedBool[i] == true) {
                                                                            provider.getcheckedBool[i] = false;
                                                                            await provider.updateProjectFileFavouriteInterest(
                                                                                fileID: provider.farmComputerProjectFileResponseModel.data![i].id!,
                                                                                favourites: provider.getcheckedBool[i]);
                                                                          } else {
                                                                            provider.getcheckedBool[i] = true;
                                                                            setState(() {});
                                                                            await provider.updateProjectFileFavouriteInterest(
                                                                                fileID: provider.farmComputerProjectFileResponseModel.data![i].id!,
                                                                                favourites: provider.getcheckedBool[i]);
                                                                          }
                                                                        },
                                                                        first: false,
                                                                        onFileTap: () async {
                                                                          // openDownloadLink(provider.farmComputerProjectFileResponseModel.data![i].path!,
                                                                          //     provider.farmComputerProjectFileResponseModel.data![i].name!);
                                                                          launchUrlNewTab(
                                                                              provider.farmComputerProjectFileResponseModel.data![i].path!);
                                                                        },
                                                                        fileName: provider.farmComputerProjectFileResponseModel.data![i].name!.isEmpty
                                                                            ? "-"
                                                                            : provider.farmComputerProjectFileResponseModel.data![i].name ?? "-",
                                                                        fileType: provider.farmComputerProjectFileResponseModel.data![i].type!.isEmpty
                                                                            ? "-"
                                                                            : provider.farmComputerProjectFileResponseModel.data![i].type ?? "-",
                                                                        addedBy: provider
                                                                                .farmComputerProjectFileResponseModel.data![i].addedBy!.isEmpty
                                                                            ? "-"
                                                                            : provider.farmComputerProjectFileResponseModel.data![i].addedBy ?? "-",
                                                                        dateBy: provider
                                                                                .farmComputerProjectFileResponseModel.data![i].addedOn!.isEmpty
                                                                            ? "-"
                                                                            : provider.farmComputerProjectFileResponseModel.data![i].addedOn ?? "-",
                                                                        totalRow: "",
                                                                        size: getWidth(context) / 11,
                                                                      ),
                                                                ],
                                                              )
                                                          ],
                                                        ),
                                                        if (!provider.documentBool.contains(true))
                                                          SizedBox(
                                                            child: Align(
                                                              alignment: Alignment.topCenter,
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(25.0),
                                                                child: CustomText(
                                                                  text: "No any document file".tr(),
                                                                  color: Colors.red,
                                                                  weight: FontWeight.w700,
                                                                  size: Responsive.isMobile(context) ? 12 : 20,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                        SizedBox(height: 50),
                                      ],
                                    )
                                  : FarmProjectFileGridViewWidget(model: widget.model),
                              Positioned(
                                right: Responsive.isMobile(context) ? 10 : 30,
                                top: Responsive.isMobile(context) ? 25 : 15,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ClickIconButton(
                                      clickcolors: checkedGridViewWidget ? hoverColor : Colors.white,
                                      icon: Icons.grid_view_sharp,
                                      iconColor: checkedGridViewWidget ? Colors.white : Colors.black,
                                      onPressed: () {
                                        setState(
                                          () {
                                            checkedGridViewWidget = true;
                                          },
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    ClickIconButton(
                                      clickcolors: !checkedGridViewWidget ? hoverColor : Colors.white,
                                      icon: Icons.view_list,
                                      iconColor: !checkedGridViewWidget ? Colors.white : Colors.black,
                                      onPressed: () {
                                        setState(() {
                                          checkedGridViewWidget = false;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
            ],
          ),
        ),
      );
    });
  }
}
