import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/non_admin/models/farm_computer_project/farm_computer_project_files/get_farm_computer_my_project_file_response.dart';
import 'package:wij_land/non_admin/providers/farm_computer_projects_provider/farm_computer_my_project_file_provider.dart';
import 'package:wij_land/non_admin/screens/project_dashboard/Project_files/wiget/Farm_my_project_grid_view_widget.dart';
import 'package:wij_land/non_admin/screens/project_dashboard/Project_files/wiget/farm_file_bookmarks.dart';
import 'package:wij_land/non_admin/screens/project_dashboard/Project_files/wiget/farm_my_project_info_widget.dart';
import 'package:wij_land/non_admin/screens/project_dashboard/Project_files/wiget/project_text_widget.dart';
import 'package:wij_land/screens/office/widgets/search_widget.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/responsive.dart';
import 'package:wij_land/utils/styles.dart';
import '../../../../screens/farm_networks/farms/farm_screens/Files/widget/file_folder.dart';
import '../../../../utils/url_scheme.dart';

class FarmMyProjectFileScreens extends StatefulWidget {
  const FarmMyProjectFileScreens({
    Key? key,
    this.projectId,
    this.model,
  }) : super(key: key);

  final projectId;
  final GetFarmComputerMyProjectFileResponse? model;

  @override
  State<FarmMyProjectFileScreens> createState() => _FarmMyProjectFileScreensState();
}

class _FarmMyProjectFileScreensState extends State<FarmMyProjectFileScreens> {
  List<bool> listTextBool = <bool>[];
  List<String> listText = <String>[
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
    await Provider.of<CreateFarmComputerMyProjectFileProvider>(context, listen: false).getFarmComputerMyProjectFile(projectId: widget.projectId);
    isLoading = false;
    for (int i = 0;
        i < Provider.of<CreateFarmComputerMyProjectFileProvider>(context, listen: false).farmComputerMyProjectFileResponseModel.data!.length;
        i++) {
      if (Provider.of<CreateFarmComputerMyProjectFileProvider>(context, listen: false).farmComputerMyProjectFileResponseModel.data![i].type ==
          "Media") {
        countMedia++;
      }
    }
    setState(() {});
  }

  void openDownloadLink(String href, String filename) {
    document.createElement('a') as AnchorElement
      ..href = href
      ..download = filename
      ..dispatchEvent(Event.eventType('MouseEvent', 'click'));
  }

  bool checkedGridViewWidget = false, isLoading = true;
  bool isWijLandBookmarks = false, isFavouriteBookmarks = false, isContract = false;
  int countMedia = 0, bookCountMedia = 0, contractCount = 0;

  @override
  Widget build(BuildContext context) {
    double widthSize = getWidth(context) / 11;

    return Consumer<CreateFarmComputerMyProjectFileProvider>(builder: (context, provider, child) {
      return SingleChildScrollView(
        child: SizedBox(
          width: getWidth(context),
          height: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Three  favorites card
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
                          setState(() {});
                          isContract = false;
                          isFavouriteBookmarks = false;
                          if (isWijLandBookmarks) {
                            listTextBool[0] = true;
                            listTextBool[1] = false;
                            listTextBool[2] = false;
                            await Provider.of<CreateFarmComputerMyProjectFileProvider>(context, listen: false)
                                .getFCProjectMyWijLandBookmarksFiles(projectId: widget.projectId);
                            for (int i = 0;
                                i <
                                    Provider.of<CreateFarmComputerMyProjectFileProvider>(context, listen: false)
                                        .farmComputerMyProjectFileResponseModel
                                        .data!
                                        .length;
                                i++) {
                              if (Provider.of<CreateFarmComputerMyProjectFileProvider>(context, listen: false)
                                      .farmComputerMyProjectFileResponseModel
                                      .data![i]
                                      .type ==
                                  "Media") {
                                bookCountMedia++;
                              }
                            }
                          } else {
                            await Provider.of<CreateFarmComputerMyProjectFileProvider>(context, listen: false)
                                .getFarmComputerMyProjectFile(projectId: widget.projectId);
                            listTextBool[0] = true;
                            listTextBool[1] = false;
                            listTextBool[2] = false;
                          }
                          setState(() {});
                        },
                      ),
                      FarmFileBookMarksWidget(
                        bgColors: isFavouriteBookmarks ? darkGreen : Colors.white,
                        textColor: isFavouriteBookmarks ? Colors.white : darkGreen,
                        iconColor: isFavouriteBookmarks ? Colors.white : darkGreen,
                        text: "My Bookmarks".tr(),
                        onTap: () async {
                          isFavouriteBookmarks = !isFavouriteBookmarks;
                          setState(() {});
                          isContract = false;
                          isWijLandBookmarks = false;
                          if (isFavouriteBookmarks) {
                            listTextBool[0] = true;
                            listTextBool[1] = false;
                            listTextBool[2] = false;
                            await Provider.of<CreateFarmComputerMyProjectFileProvider>(context, listen: false)
                                .getFCProjectMyBookmarksFiles(projectId: widget.projectId);
                            for (int i = 0;
                                i <
                                    Provider.of<CreateFarmComputerMyProjectFileProvider>(context, listen: false)
                                        .farmComputerMyProjectFileResponseModel
                                        .data!
                                        .length;
                                i++) {
                              if (Provider.of<CreateFarmComputerMyProjectFileProvider>(context, listen: false)
                                      .farmComputerMyProjectFileResponseModel
                                      .data![i]
                                      .type ==
                                  "Media") {
                                bookCountMedia++;
                              }
                            }
                          } else {
                            await Provider.of<CreateFarmComputerMyProjectFileProvider>(context, listen: false)
                                .getFarmComputerMyProjectFile(projectId: widget.projectId);
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
                          if (isContract) {
                            listTextBool[0] = true;
                            listTextBool[1] = false;
                            listTextBool[2] = false;
                            await Provider.of<CreateFarmComputerMyProjectFileProvider>(context, listen: false)
                                .getFCProjectMyContractFiles(projectId: widget.projectId);
                            for (int i = 0;
                                i <
                                    Provider.of<CreateFarmComputerMyProjectFileProvider>(context, listen: false)
                                        .farmComputerMyProjectFileResponseModel
                                        .data!
                                        .length;
                                i++) {
                              if (Provider.of<CreateFarmComputerMyProjectFileProvider>(context, listen: false)
                                      .farmComputerMyProjectFileResponseModel
                                      .data![i]
                                      .type ==
                                  "Media") {
                                contractCount++;
                              }
                            }
                          } else {
                            await Provider.of<CreateFarmComputerMyProjectFileProvider>(context, listen: false)
                                .getFarmComputerMyProjectFile(projectId: widget.projectId);
                            listTextBool[0] = true;
                            listTextBool[1] = false;
                            listTextBool[2] = false;
                            setState(() {});
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              isLoading
                  ? SizedBox(
                      height: getHeight(context),
                      width: getWidth(context),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : provider.farmComputerMyProjectFileResponseModel.error?.status == 404
                      ? Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.all(25),
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
                                                        for (int i = 0; i < provider.farmComputerMyProjectFileResponseModel.data!.length; i++) {
                                                          provider.docxLength.add(i);
                                                        }
                                                        if (provider.mediaBool.contains(true)) {
                                                          provider.docxLength.length = provider.docxLength.length - provider.mediaBool.length;
                                                        }
                                                      } else {
                                                        listTextBool[i] = true;
                                                      }
                                                      fileTextBool = List.filled(5, false);
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
                                                        text: listText[i].tr(),
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
                                            child: FarmMyProjectfileInfoWidget(
                                              first: true,
                                              fileName: "File name".tr(),
                                              fileType: "File type".tr(),
                                              parcels: "Parcel".tr(),
                                              addedBy: "Added by".tr(),
                                              dateBy: "Date".tr(),
                                              totalRow: listTextBool[0]
                                                  ? "Total".tr() + " ${provider.farmComputerMyProjectFileResponseModel.data!.length}"
                                                  : "Total".tr() + " ${provider.mediaBool.length}",
                                              size: getWidth(context) / 11,
                                            ),
                                          ),
                                        ),
                                        listTextBool[0]
                                            ? Column(
                                                children: [
                                                  for (int i = 0; i < provider.farmComputerMyProjectFileResponseModel.data!.length; i++)
                                                    Container(
                                                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: Responsive.isMobile(context) ? 0 : 15),
                                                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black26))),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          SizedBox(
                                                            width: Responsive.isMobile(context) ? widthSize / 2 : widthSize / 4,
                                                            child: IconButton(
                                                              alignment: Alignment.center,
                                                              splashRadius: Responsive.isMobile(context) ? 10 : 20,
                                                              padding: EdgeInsets.only(right: 1),
                                                              onPressed: () async {
                                                                if (provider.getcheckedBool[i] == true) {
                                                                  provider.getcheckedBool[i] = false;
                                                                  setState(() {});
                                                                  await provider.updateMyProjectFileFavouritesInterest(
                                                                      fileID: provider.farmComputerMyProjectFileResponseModel.data![i].id!,
                                                                      favourites: provider.getcheckedBool[i]);
                                                                } else {
                                                                  provider.getcheckedBool[i] = true;
                                                                  setState(() {});
                                                                  await provider.updateMyProjectFileFavouritesInterest(
                                                                      fileID: provider.farmComputerMyProjectFileResponseModel.data![i].id!,
                                                                      favourites: provider.getcheckedBool[i]);
                                                                }
                                                              },
                                                              icon: Icon(
                                                                provider.getcheckedBool[i] ? Icons.star : Icons.star_border,
                                                                color: provider.getcheckedBool[i] ? darkyellow : Colors.black,
                                                              ),
                                                              iconSize: Responsive.isMobile(context) ? 18 : 26,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: widthSize / 2,
                                                            child: InkWell(
                                                              onTap: () async {
                                                                launchUrlNewTab(provider.farmComputerMyProjectFileResponseModel.data![i].path!);

                                                                // openDownloadLink(provider.farmComputerMyProjectFileResponseModel.data![i].path!,
                                                                //     provider.farmComputerMyProjectFileResponseModel.data![i].name!);
                                                              },
                                                              child: Icon(
                                                                Icons.file_present,
                                                                size: Responsive.isMobile(context) ? 18 : 26,
                                                              ),
                                                            ),
                                                          ),
                                                          ProjectTextWidget(
                                                              width: widthSize * 1.8,
                                                              text: provider.farmComputerMyProjectFileResponseModel.data![i].name!.isEmpty
                                                                  ? "-"
                                                                  : provider.farmComputerMyProjectFileResponseModel.data![i].name ??
                                                                      ""
                                                                          "-"),
                                                          ProjectTextWidget(
                                                              width: widthSize * 1.2,
                                                              text: provider.farmComputerMyProjectFileResponseModel.data![i].type!.isEmpty
                                                                  ? "Other"
                                                                  : provider.farmComputerMyProjectFileResponseModel.data![i].type == ""
                                                                      ? "Other"
                                                                      : provider.farmComputerMyProjectFileResponseModel.data![i].type ?? "-"),
                                                          Container(
                                                            padding: EdgeInsets.only(left: Responsive.isMobile(context) ? 5 : 20),
                                                            width: widthSize * 1.2,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                if (provider.farmComputerMyProjectFileResponseModel.data![i].parcels != null)
                                                                  for (int j = 0;
                                                                      j <
                                                                          (provider.farmComputerMyProjectFileResponseModel.data![i].parcels!.isEmpty
                                                                              ? 0
                                                                              : provider
                                                                                  .farmComputerMyProjectFileResponseModel.data![i].parcels!.length);
                                                                      j++)
                                                                    CustomText(
                                                                      lines: 4,
                                                                      overflows: TextOverflow.ellipsis,
                                                                      textAligns: TextAlign.left,
                                                                      text: provider.farmComputerMyProjectFileResponseModel.data![i].parcels![j]
                                                                                  .parcelName ==
                                                                              null
                                                                          ? "-"
                                                                          : provider.farmComputerMyProjectFileResponseModel.data![i].parcels![j]
                                                                                  .parcelName!.isEmpty
                                                                              ? "-"
                                                                              : provider.farmComputerMyProjectFileResponseModel.data![i].parcels![j]
                                                                                      .parcelName ??
                                                                                  "-",
                                                                      size: Responsive.isMobile(context) ? 8 : 12,
                                                                      weight: FontWeight.normal,
                                                                    )
                                                              ],
                                                            ),
                                                          ),
                                                          ProjectTextWidget(
                                                              width: widthSize * 1.2,
                                                              text: provider.farmComputerMyProjectFileResponseModel.data![i].addedBy!.isEmpty
                                                                  ? "-"
                                                                  : provider.farmComputerMyProjectFileResponseModel.data![i].addedBy ??
                                                                      ""
                                                                          "-"),
                                                          ProjectTextWidget(
                                                              width: widthSize * 1.2,
                                                              text: provider.farmComputerMyProjectFileResponseModel.data![i].addedOn!.isEmpty
                                                                  ? "-"
                                                                  : provider.farmComputerMyProjectFileResponseModel.data![i].addedOn ?? "-"),
                                                          ProjectTextWidget(width: widthSize * 0.8, text: ""),
                                                        ],
                                                      ),
                                                    ),
                                                  Visibility(
                                                      visible: provider.farmComputerMyProjectFileResponseModel.data!.length.toString().isEmpty
                                                          ? true
                                                          : false,
                                                      child: Container(
                                                        alignment: Alignment.topCenter,
                                                        padding: EdgeInsets.all(25),
                                                        child: CustomText(
                                                          text: 'No any files'.tr(),
                                                          color: Colors.red,
                                                          weight: FontWeight.w700,
                                                          size: Responsive.isMobile(context) ? 12 : 20,
                                                        ),
                                                      )),
                                                ],
                                              )
                                            : listTextBool[1]
                                                ? Column(
                                                    children: [
                                                      for (int i = 0; i < provider.farmComputerMyProjectFileResponseModel.data!.length; i++)
                                                        if (provider.farmComputerMyProjectFileResponseModel.data![i].type == "Media")
                                                          Container(
                                                            padding:
                                                                EdgeInsets.symmetric(vertical: 15, horizontal: Responsive.isMobile(context) ? 0 : 15),
                                                            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black26))),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: [
                                                                SizedBox(
                                                                  width: Responsive.isMobile(context) ? widthSize / 2 : widthSize / 4,
                                                                  child: IconButton(
                                                                    alignment: Alignment.center,
                                                                    splashRadius: Responsive.isMobile(context) ? 10 : 20,
                                                                    padding: EdgeInsets.only(right: 1),
                                                                    onPressed: () async {
                                                                      if (provider.getcheckedBool[i] == true) {
                                                                        provider.getcheckedBool[i] = false;
                                                                        await provider.updateMyProjectFileFavouritesInterest(
                                                                            fileID: provider.farmComputerMyProjectFileResponseModel.data![i].id!,
                                                                            favourites: provider.getcheckedBool[i]);
                                                                      } else {
                                                                        provider.getcheckedBool[i] = true;
                                                                        setState(() {});
                                                                        await provider.updateMyProjectFileFavouritesInterest(
                                                                            fileID: provider.farmComputerMyProjectFileResponseModel.data![i].id!,
                                                                            favourites: provider.getcheckedBool[i]);
                                                                      }
                                                                    },
                                                                    icon: Icon(
                                                                      provider.getcheckedBool[i] ? Icons.star : Icons.star_border,
                                                                      color: provider.getcheckedBool[i] ? darkyellow : Colors.black,
                                                                    ),
                                                                    iconSize: Responsive.isMobile(context) ? 18 : 26,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: widthSize / 2,
                                                                  child: InkWell(
                                                                    onTap: () async {
                                                                      launchUrlNewTab(provider.farmComputerMyProjectFileResponseModel.data![i].path!);

                                                                      // openDownloadLink(provider.farmComputerMyProjectFileResponseModel.data![i].path!,
                                                                      //     provider.farmComputerMyProjectFileResponseModel.data![i].name!);
                                                                    },
                                                                    child: Icon(
                                                                      Icons.file_present,
                                                                      size: Responsive.isMobile(context) ? 18 : 26,
                                                                    ),
                                                                  ),
                                                                ),
                                                                ProjectTextWidget(
                                                                    width: widthSize * 1.8,
                                                                    text: provider.farmComputerMyProjectFileResponseModel.data![i].name!.isEmpty
                                                                        ? "-"
                                                                        : provider.farmComputerMyProjectFileResponseModel.data![i].name ?? "-"),
                                                                ProjectTextWidget(
                                                                    width: widthSize * 1.2,
                                                                    text: provider.farmComputerMyProjectFileResponseModel.data![i].type!.isEmpty
                                                                        ? "Other"
                                                                        : provider.farmComputerMyProjectFileResponseModel.data![i].type == null
                                                                            ? "Other"
                                                                            : provider.farmComputerMyProjectFileResponseModel.data![i].type ?? "-"),
                                                                Container(
                                                                  padding: EdgeInsets.only(left: Responsive.isMobile(context) ? 5 : 20),
                                                                  width: widthSize * 1.2,
                                                                  child: Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      if (provider.farmComputerMyProjectFileResponseModel.data![i].parcels != null)
                                                                        for (int j = 0;
                                                                            j <
                                                                                (provider.farmComputerMyProjectFileResponseModel.data![i].parcels!
                                                                                        .isEmpty
                                                                                    ? 0
                                                                                    : provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                        .parcels!.length);
                                                                            j++)
                                                                          CustomText(
                                                                            lines: 4,
                                                                            overflows: TextOverflow.ellipsis,
                                                                            textAligns: TextAlign.left,
                                                                            text: provider.farmComputerMyProjectFileResponseModel.data![i].parcels![j]
                                                                                        .parcelName ==
                                                                                    null
                                                                                ? "-"
                                                                                : provider.farmComputerMyProjectFileResponseModel.data![i].parcels![j]
                                                                                        .parcelName!.isEmpty
                                                                                    ? "-"
                                                                                    : provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                            .parcels![j].parcelName ??
                                                                                        "-",
                                                                            size: Responsive.isMobile(context) ? 8 : 12,
                                                                            weight: FontWeight.normal,
                                                                          )
                                                                    ],
                                                                  ),
                                                                ),
                                                                ProjectTextWidget(
                                                                    width: widthSize * 1.2,
                                                                    text: provider.farmComputerMyProjectFileResponseModel.data![i].addedBy!.isEmpty
                                                                        ? "-"
                                                                        : provider.farmComputerMyProjectFileResponseModel.data![i].addedBy ?? "-"),
                                                                ProjectTextWidget(
                                                                    width: widthSize * 1.2,
                                                                    text: provider.farmComputerMyProjectFileResponseModel.data![i].addedOn!.isEmpty
                                                                        ? "-"
                                                                        : provider.farmComputerMyProjectFileResponseModel.data![i].addedOn ?? "-"),
                                                                ProjectTextWidget(width: widthSize * 0.8, text: ""),
                                                              ],
                                                            ),
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
                                                            spacing: Responsive.isMobile(context) ? 5 : 10,
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
                                                                              i < provider.farmComputerMyProjectFileResponseModel.data!.length;
                                                                              i++) {
                                                                            if (provider.farmComputerMyProjectFileResponseModel.data![i].type !=
                                                                                    "Analysis Result" &&
                                                                                provider.farmComputerMyProjectFileResponseModel.data![i].type !=
                                                                                    "Farm Management Plan" &&
                                                                                provider.farmComputerMyProjectFileResponseModel.data![i].type !=
                                                                                    "Soil Advisory Report" &&
                                                                                provider.farmComputerMyProjectFileResponseModel.data![i].type !=
                                                                                    "Interview Report" &&
                                                                                provider.farmComputerMyProjectFileResponseModel.data![i].type !=
                                                                                    "Media") {
                                                                              provider.docxLength.add(i);
                                                                            }
                                                                          }
                                                                        } else {
                                                                          for (int i = 0;
                                                                              i < provider.farmComputerMyProjectFileResponseModel.data!.length;
                                                                              i++) {
                                                                            if (provider.farmComputerMyProjectFileResponseModel.data![i].type ==
                                                                                fileText[j]) {
                                                                              provider.docxLength.add(i);
                                                                            }
                                                                          }
                                                                        }
                                                                      });
                                                                    },
                                                                    child: FileFolderWidget(text: fileText[j])),
                                                            ],
                                                          ),
                                                        ),
                                                        Column(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets.symmetric(vertical: Responsive.isMobile(context) ? 10 : 15),
                                                              child: FarmMyProjectfileInfoWidget(
                                                                first: true,
                                                                fileName: "File name".tr(),
                                                                fileType: "File type".tr(),
                                                                parcels: "Parcel".tr(),
                                                                addedBy: "Added by".tr(),
                                                                dateBy: "Date".tr(),
                                                                totalRow: "Total".tr() + " ${provider.docxLength.length}",
                                                                size: getWidth(context) / 11,
                                                              ),
                                                            ),
                                                            Visibility(
                                                              visible: fileTextBool.contains(true) ? false : true,
                                                              child: Column(
                                                                children: [
                                                                  for (int i = 0;
                                                                      i < provider.farmComputerMyProjectFileResponseModel.data!.length;
                                                                      i++)
                                                                    if (provider.farmComputerMyProjectFileResponseModel.data![i].type != "Media")
                                                                      Container(
                                                                        padding: EdgeInsets.symmetric(
                                                                            vertical: 15, horizontal: Responsive.isMobile(context) ? 0 : 15),
                                                                        decoration:
                                                                            BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black26))),
                                                                        child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                          children: [
                                                                            SizedBox(
                                                                              width: Responsive.isMobile(context) ? widthSize / 2 : widthSize / 4,
                                                                              child: IconButton(
                                                                                alignment: Alignment.center,
                                                                                splashRadius: Responsive.isMobile(context) ? 10 : 20,
                                                                                padding: EdgeInsets.only(right: 1),
                                                                                onPressed: () async {
                                                                                  if (provider.getcheckedBool[i] == true) {
                                                                                    provider.getcheckedBool[i] = false;
                                                                                    await provider.updateMyProjectFileFavouritesInterest(
                                                                                        fileID: provider
                                                                                            .farmComputerMyProjectFileResponseModel.data![i].id!,
                                                                                        favourites: provider.getcheckedBool[i]);
                                                                                  } else {
                                                                                    provider.getcheckedBool[i] = true;
                                                                                    setState(() {});
                                                                                    await provider.updateMyProjectFileFavouritesInterest(
                                                                                        fileID: provider
                                                                                            .farmComputerMyProjectFileResponseModel.data![i].id!,
                                                                                        favourites: provider.getcheckedBool[i]);
                                                                                  }
                                                                                },
                                                                                icon: Icon(
                                                                                  provider.getcheckedBool[i] ? Icons.star : Icons.star_border,
                                                                                  color: provider.getcheckedBool[i] ? darkyellow : Colors.black,
                                                                                ),
                                                                                iconSize: Responsive.isMobile(context) ? 18 : 26,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: widthSize / 2,
                                                                              child: InkWell(
                                                                                onTap: () async {
                                                                                  launchUrlNewTab(
                                                                                      provider.farmComputerMyProjectFileResponseModel.data![i].path!);

                                                                                  // openDownloadLink(provider.farmComputerMyProjectFileResponseModel.data![i].path!,
                                                                                  //     provider.farmComputerMyProjectFileResponseModel.data![i].name!);
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.file_present,
                                                                                  size: Responsive.isMobile(context) ? 18 : 26,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            ProjectTextWidget(
                                                                                width: widthSize * 1.8,
                                                                                text: provider
                                                                                        .farmComputerMyProjectFileResponseModel.data![i].name!.isEmpty
                                                                                    ? "-"
                                                                                    : provider.farmComputerMyProjectFileResponseModel.data![i].name ??
                                                                                        "-"),
                                                                            ProjectTextWidget(
                                                                                width: widthSize * 1.2,
                                                                                text: provider
                                                                                        .farmComputerMyProjectFileResponseModel.data![i].type!.isEmpty
                                                                                    ? "Other"
                                                                                    : provider.farmComputerMyProjectFileResponseModel.data![i].type ==
                                                                                            null
                                                                                        ? "Other"
                                                                                        : provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                                .type ??
                                                                                            "-"),
                                                                            Container(
                                                                              padding: EdgeInsets.only(left: Responsive.isMobile(context) ? 5 : 20),
                                                                              width: widthSize * 1.2,
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  if (provider
                                                                                          .farmComputerMyProjectFileResponseModel.data![i].parcels !=
                                                                                      null)
                                                                                    for (int j = 0;
                                                                                        j <
                                                                                            (provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                                    .parcels!.isEmpty
                                                                                                ? 0
                                                                                                : provider.farmComputerMyProjectFileResponseModel
                                                                                                    .data![i].parcels!.length);
                                                                                        j++)
                                                                                      CustomText(
                                                                                        lines: 4,
                                                                                        overflows: TextOverflow.ellipsis,
                                                                                        textAligns: TextAlign.left,
                                                                                        text: provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                                    .parcels![j].parcelName ==
                                                                                                null
                                                                                            ? "-"
                                                                                            : provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                                    .parcels![j].parcelName!.isEmpty
                                                                                                ? "-"
                                                                                                : provider.farmComputerMyProjectFileResponseModel
                                                                                                        .data![i].parcels![j].parcelName ??
                                                                                                    "-",
                                                                                        size: Responsive.isMobile(context) ? 8 : 12,
                                                                                        weight: FontWeight.normal,
                                                                                      )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            ProjectTextWidget(
                                                                                width: widthSize * 1.2,
                                                                                text: provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                        .addedBy!.isEmpty
                                                                                    ? "-"
                                                                                    : provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                            .addedBy ??
                                                                                        "-"),
                                                                            ProjectTextWidget(
                                                                                width: widthSize * 1.2,
                                                                                text: provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                        .addedOn!.isEmpty
                                                                                    ? "-"
                                                                                    : provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                            .addedOn ??
                                                                                        "-"),
                                                                            ProjectTextWidget(width: widthSize * 0.8, text: ""),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                ],
                                                              ),
                                                            ),
                                                            for (int j = 0; j < 4; j++)
                                                              if (fileTextBool[j])
                                                                Column(
                                                                  children: [
                                                                    for (int i = 0;
                                                                        i < provider.farmComputerMyProjectFileResponseModel.data!.length;
                                                                        i++)
                                                                      if (provider.farmComputerMyProjectFileResponseModel.data![i].type ==
                                                                          fileText[j])
                                                                        Container(
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 15, horizontal: Responsive.isMobile(context) ? 0 : 15),
                                                                          decoration: BoxDecoration(
                                                                              border: Border(bottom: BorderSide(color: Colors.black26))),
                                                                          child: Row(
                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                            children: [
                                                                              SizedBox(
                                                                                width: Responsive.isMobile(context) ? widthSize / 2 : widthSize / 4,
                                                                                child: IconButton(
                                                                                  alignment: Alignment.center,
                                                                                  splashRadius: Responsive.isMobile(context) ? 10 : 20,
                                                                                  padding: EdgeInsets.only(right: 1),
                                                                                  onPressed: () async {
                                                                                    if (provider.getcheckedBool[i] == true) {
                                                                                      provider.getcheckedBool[i] = false;
                                                                                      await provider.updateMyProjectFileFavouritesInterest(
                                                                                          fileID: provider
                                                                                              .farmComputerMyProjectFileResponseModel.data![i].id!,
                                                                                          favourites: provider.getcheckedBool[i]);
                                                                                    } else {
                                                                                      provider.getcheckedBool[i] = true;
                                                                                      setState(() {});
                                                                                      await provider.updateMyProjectFileFavouritesInterest(
                                                                                          fileID: provider
                                                                                              .farmComputerMyProjectFileResponseModel.data![i].id!,
                                                                                          favourites: provider.getcheckedBool[i]);
                                                                                    }
                                                                                  },
                                                                                  icon: Icon(
                                                                                    provider.getcheckedBool[i] ? Icons.star : Icons.star_border,
                                                                                    color: provider.getcheckedBool[i] ? darkyellow : Colors.black,
                                                                                  ),
                                                                                  iconSize: Responsive.isMobile(context) ? 18 : 26,
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                width: widthSize / 2,
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    launchUrlNewTab(provider
                                                                                        .farmComputerMyProjectFileResponseModel.data![i].path!);

                                                                                    // openDownloadLink(provider.farmComputerMyProjectFileResponseModel.data![i].path!,
                                                                                    //     provider.farmComputerMyProjectFileResponseModel.data![i].name!);
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.file_present,
                                                                                    size: Responsive.isMobile(context) ? 18 : 26,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              ProjectTextWidget(
                                                                                  width: widthSize * 1.8,
                                                                                  text: provider.farmComputerMyProjectFileResponseModel.data![i].name!
                                                                                          .isEmpty
                                                                                      ? "-"
                                                                                      : "${provider.farmComputerMyProjectFileResponseModel.data![i].name} ${fileTextBool[j] == 4} " ??
                                                                                          "-"),
                                                                              ProjectTextWidget(
                                                                                  width: widthSize * 1.2,
                                                                                  text: provider.farmComputerMyProjectFileResponseModel.data![i].type!
                                                                                          .isEmpty
                                                                                      ? "Other"
                                                                                      : provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                                  .type ==
                                                                                              null
                                                                                          ? "Other"
                                                                                          : provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                                  .type ??
                                                                                              "-"),
                                                                              Container(
                                                                                padding: EdgeInsets.only(left: Responsive.isMobile(context) ? 5 : 20),
                                                                                width: widthSize * 1.2,
                                                                                child: Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    if (provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                            .parcels !=
                                                                                        null)
                                                                                      for (int j = 0;
                                                                                          j <
                                                                                              (provider.farmComputerMyProjectFileResponseModel
                                                                                                      .data![i].parcels!.isEmpty
                                                                                                  ? 0
                                                                                                  : provider.farmComputerMyProjectFileResponseModel
                                                                                                      .data![i].parcels!.length);
                                                                                          j++)
                                                                                        CustomText(
                                                                                          lines: 4,
                                                                                          overflows: TextOverflow.ellipsis,
                                                                                          textAligns: TextAlign.left,
                                                                                          text: provider.farmComputerMyProjectFileResponseModel
                                                                                                      .data![i].parcels![j].parcelName ==
                                                                                                  null
                                                                                              ? "-"
                                                                                              : provider.farmComputerMyProjectFileResponseModel
                                                                                                      .data![i].parcels![j].parcelName!.isEmpty
                                                                                                  ? "-"
                                                                                                  : provider.farmComputerMyProjectFileResponseModel
                                                                                                          .data![i].parcels![j].parcelName ??
                                                                                                      "-",
                                                                                          size: Responsive.isMobile(context) ? 8 : 12,
                                                                                          weight: FontWeight.normal,
                                                                                        )
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              ProjectTextWidget(
                                                                                  width: widthSize * 1.2,
                                                                                  text: provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                          .addedBy!.isEmpty
                                                                                      ? "-"
                                                                                      : provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                              .addedBy ??
                                                                                          "-"),
                                                                              ProjectTextWidget(
                                                                                  width: widthSize * 1.2,
                                                                                  text: provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                          .addedOn!.isEmpty
                                                                                      ? "-"
                                                                                      : provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                              .addedOn ??
                                                                                          "-"),
                                                                              ProjectTextWidget(width: widthSize * 0.8, text: ""),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                  ],
                                                                ),
                                                            if (fileTextBool[4])
                                                              Column(
                                                                children: [
                                                                  for (int i = 0;
                                                                      i < provider.farmComputerMyProjectFileResponseModel.data!.length;
                                                                      i++)
                                                                    if (provider.farmComputerMyProjectFileResponseModel.data![i].type != "Media" &&
                                                                        provider.farmComputerMyProjectFileResponseModel.data![i].type !=
                                                                            fileText[3] &&
                                                                        provider.farmComputerMyProjectFileResponseModel.data![i].type !=
                                                                            fileText[2] &&
                                                                        provider.farmComputerMyProjectFileResponseModel.data![i].type !=
                                                                            fileText[1] &&
                                                                        provider.farmComputerMyProjectFileResponseModel.data![i].type != fileText[0])
                                                                      Container(
                                                                        padding: EdgeInsets.symmetric(
                                                                            vertical: 15, horizontal: Responsive.isMobile(context) ? 0 : 15),
                                                                        decoration:
                                                                            BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black26))),
                                                                        child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                          children: [
                                                                            SizedBox(
                                                                              width: Responsive.isMobile(context) ? widthSize / 2 : widthSize / 4,
                                                                              child: IconButton(
                                                                                alignment: Alignment.center,
                                                                                splashRadius: Responsive.isMobile(context) ? 10 : 20,
                                                                                padding: EdgeInsets.only(right: 1),
                                                                                onPressed: () async {
                                                                                  if (provider.getcheckedBool[i] == true) {
                                                                                    provider.getcheckedBool[i] = false;
                                                                                    await provider.updateMyProjectFileFavouritesInterest(
                                                                                        fileID: provider
                                                                                            .farmComputerMyProjectFileResponseModel.data![i].id!,
                                                                                        favourites: provider.getcheckedBool[i]);
                                                                                  } else {
                                                                                    provider.getcheckedBool[i] = true;
                                                                                    setState(() {});
                                                                                    await provider.updateMyProjectFileFavouritesInterest(
                                                                                        fileID: provider
                                                                                            .farmComputerMyProjectFileResponseModel.data![i].id!,
                                                                                        favourites: provider.getcheckedBool[i]);
                                                                                  }
                                                                                },
                                                                                icon: Icon(
                                                                                  provider.getcheckedBool[i] ? Icons.star : Icons.star_border,
                                                                                  color: provider.getcheckedBool[i] ? darkyellow : Colors.black,
                                                                                ),
                                                                                iconSize: Responsive.isMobile(context) ? 18 : 26,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: widthSize / 2,
                                                                              child: InkWell(
                                                                                onTap: () async {
                                                                                  launchUrlNewTab(
                                                                                      provider.farmComputerMyProjectFileResponseModel.data![i].path!);

                                                                                  // openDownloadLink(provider.farmComputerMyProjectFileResponseModel.data![i].path!,
                                                                                  //     provider.farmComputerMyProjectFileResponseModel.data![i].name!);
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.file_present,
                                                                                  size: Responsive.isMobile(context) ? 18 : 26,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            ProjectTextWidget(
                                                                                width: widthSize * 1.8,
                                                                                text: provider
                                                                                        .farmComputerMyProjectFileResponseModel.data![i].name!.isEmpty
                                                                                    ? "-"
                                                                                    : "${provider.farmComputerMyProjectFileResponseModel.data![i].name}" ??
                                                                                        "-"),
                                                                            ProjectTextWidget(
                                                                                width: widthSize * 1.2,
                                                                                text: provider
                                                                                        .farmComputerMyProjectFileResponseModel.data![i].type!.isEmpty
                                                                                    ? "Other"
                                                                                    : provider.farmComputerMyProjectFileResponseModel.data![i].type ==
                                                                                            null
                                                                                        ? "Other"
                                                                                        : provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                                .type ??
                                                                                            "-"),
                                                                            Container(
                                                                              padding: EdgeInsets.only(left: Responsive.isMobile(context) ? 5 : 20),
                                                                              width: widthSize * 1.2,
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  if (provider
                                                                                          .farmComputerMyProjectFileResponseModel.data![i].parcels !=
                                                                                      null)
                                                                                    for (int j = 0;
                                                                                        j <
                                                                                            (provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                                    .parcels!.isEmpty
                                                                                                ? 0
                                                                                                : provider.farmComputerMyProjectFileResponseModel
                                                                                                    .data![i].parcels!.length);
                                                                                        j++)
                                                                                      CustomText(
                                                                                        lines: 4,
                                                                                        overflows: TextOverflow.ellipsis,
                                                                                        textAligns: TextAlign.left,
                                                                                        text: provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                                    .parcels![j].parcelName ==
                                                                                                null
                                                                                            ? "-"
                                                                                            : provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                                    .parcels![j].parcelName!.isEmpty
                                                                                                ? "-"
                                                                                                : provider.farmComputerMyProjectFileResponseModel
                                                                                                        .data![i].parcels![j].parcelName ??
                                                                                                    "-",
                                                                                        size: Responsive.isMobile(context) ? 8 : 12,
                                                                                        weight: FontWeight.normal,
                                                                                      )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            ProjectTextWidget(
                                                                                width: widthSize * 1.2,
                                                                                text: provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                        .addedBy!.isEmpty
                                                                                    ? "-"
                                                                                    : provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                            .addedBy ??
                                                                                        "-"),
                                                                            ProjectTextWidget(
                                                                                width: widthSize * 1.2,
                                                                                text: provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                        .addedOn!.isEmpty
                                                                                    ? "-"
                                                                                    : provider.farmComputerMyProjectFileResponseModel.data![i]
                                                                                            .addedOn ??
                                                                                        "-"),
                                                                            ProjectTextWidget(width: widthSize * 0.8, text: ""),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                ],
                                                              ),
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
                                        SizedBox(height: 100),
                                      ],
                                    )
                                  : FarmMyProjectGridViewWidget(model: widget.model),

                              ///////////////// ///////      /Grid IconButton Widget//
                              // ////////////////////////////////////////////////////////
                              Positioned(
                                right: Responsive.isMobile(context)
                                    ? 10
                                    : Responsive.isTablet(context)
                                        ? 10
                                        : 30,
                                top: Responsive.isMobile(context) ? 35 : 15,
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
