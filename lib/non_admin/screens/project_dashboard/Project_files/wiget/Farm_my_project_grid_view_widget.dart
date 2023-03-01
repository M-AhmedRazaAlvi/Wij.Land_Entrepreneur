import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/non_admin/models/farm_computer_project/farm_computer_project_files/get_farm_computer_my_project_file_response.dart';
import 'package:wij_land/non_admin/providers/farm_computer_projects_provider/farm_computer_my_project_file_provider.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/styles.dart';
import '../../../../../utils/responsive.dart';

class FarmMyProjectGridViewWidget extends StatefulWidget {
  const FarmMyProjectGridViewWidget({
    Key? key,
    this.projectId,
    this.model,
  }) : super(key: key);

  final projectId;
  final GetFarmComputerMyProjectFileResponse? model;

  @override
  State<FarmMyProjectGridViewWidget> createState() => _FarmMyProjectGridViewWidgetState();
}

class _FarmMyProjectGridViewWidgetState extends State<FarmMyProjectGridViewWidget> {
  List<bool> viewTextBool = <bool>[];
  List<String> ViewText = <String>[
    "All",
    "Media",
    "Documents",
  ];

  @override
  void initState() {
    viewTextBool = List.filled(3, false);
    viewTextBool[0] = true;
    super.initState();
  }

  // void openDownloadLink(String href, String filename) {
  //   document.createElement('a') as AnchorElement
  //     ..href = href
  //     ..download = filename
  //     ..dispatchEvent(Event.eventType('MouseEvent', 'click'));
  // }

  bool checkedGridViewWidget = false, checkedViewListWidget = true;
  bool isLoading = true;
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateFarmComputerMyProjectFileProvider>(builder: (context, provider, child) {
      return Card(
        elevation: 0,
        child: Column(
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
                          if (viewTextBool.contains(true)) {
                            viewTextBool = List.filled(3, false);
                            viewTextBool[i] = true;
                          } else {
                            viewTextBool[i] = true;
                          }
                        });
                      },
                      child: Transform.translate(
                        offset: viewTextBool[i] ? Offset(0.0, 1.5) : Offset(0, 0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? 5 : 10, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: viewTextBool[i] ? Colors.black : Colors.black12,
                            width: viewTextBool[i] ? 2 : 0.1,
                          ))),
                          child: CustomText(
                            text: ViewText[i].tr(),
                            size: Responsive.isMobile(context)
                                ? viewTextBool[i]
                                    ? 12
                                    : 11
                                : viewTextBool[i]
                                    ? 16
                                    : 14,
                            weight: viewTextBool[i] ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              width: getWidth(context),
              child: Padding(
                padding: EdgeInsets.all(Responsive.isMobile(context) ? 15 : 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    viewTextBool[0]
                        ? Wrap(
                            spacing: Responsive.isMobile(context)
                                ? 15
                                : Responsive.isTablet(context)
                                    ? 20
                                    : 30,
                            runSpacing: Responsive.isMobile(context)
                                ? 15
                                : Responsive.isTablet(context)
                                    ? 20
                                    : 30,
                            alignment: Responsive.isMobile(context)
                                ? provider.farmComputerMyProjectFileResponseModel.data!.length % 4 == 0
                                    ? WrapAlignment.center
                                    : WrapAlignment.start
                                : provider.farmComputerMyProjectFileResponseModel.data!.length % 10 == 0
                                    ? WrapAlignment.center
                                    : WrapAlignment.start,
                            children: [
                              for (int i = 0; i < provider.farmComputerMyProjectFileResponseModel.data!.length; i++)
                                Column(
                                  children: [
                                    provider.farmComputerMyProjectFileResponseModel.data![i].name!.contains(".")
                                        ? FaIcon(
                                            provider.farmComputerMyProjectFileResponseModel.data![i].name!.split('.')[1].toLowerCase() == 'pdf'
                                                ? FontAwesomeIcons.solidFilePdf
                                                : FontAwesomeIcons.solidFileImage,
                                            size: Responsive.isMobile(context)
                                                ? 45
                                                : Responsive.isTablet(context)
                                                    ? 60
                                                    : 80,
                                            color: provider.farmComputerMyProjectFileResponseModel.data![i].name!.split('.')[1].toLowerCase() == 'pdf'
                                                ? Colors.red
                                                : herbal,
                                          )
                                        : FaIcon(
                                            FontAwesomeIcons.solidFileImage,
                                            size: Responsive.isMobile(context)
                                                ? 45
                                                : Responsive.isTablet(context)
                                                    ? 60
                                                    : 80,
                                            color: herbal,
                                          ),
                                    SizedBox(height: 5),
                                    SizedBox(
                                      width: Responsive.isMobile(context)
                                          ? 45
                                          : Responsive.isTablet(context)
                                              ? 55
                                              : 70,
                                      child: CustomText(
                                        text: provider.farmComputerMyProjectFileResponseModel.data![i].name == null
                                            ? '-'
                                            : provider.farmComputerMyProjectFileResponseModel.data![i].name!.split(".")[0],
                                        textAligns: TextAlign.center,
                                        lines: 5,
                                        size: Responsive.isMobile(context)
                                            ? 7
                                            : Responsive.isTablet(context)
                                                ? 8
                                                : 10,
                                      ),
                                    ),
                                  ],
                                ),
                              Visibility(
                                visible: (provider.farmComputerMyProjectFileResponseModel.data!.length == 0) ? true : false,
                                child: SizedBox(
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: CustomText(
                                        text: "No any files".tr(),
                                        color: Colors.red,
                                        weight: FontWeight.w700,
                                        size: Responsive.isMobile(context)
                                            ? 12
                                            : Responsive.isTablet(context)
                                                ? 16
                                                : 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : viewTextBool[1]
                            ? Wrap(
                                spacing: Responsive.isMobile(context)
                                    ? 15
                                    : Responsive.isTablet(context)
                                        ? 20
                                        : 30,
                                runSpacing: Responsive.isMobile(context)
                                    ? 15
                                    : Responsive.isTablet(context)
                                        ? 20
                                        : 30,
                                alignment: Responsive.isMobile(context)
                                    ? provider.farmComputerMyProjectFileResponseModel.data!.length % 4 == 0
                                        ? WrapAlignment.center
                                        : WrapAlignment.start
                                    : provider.farmComputerMyProjectFileResponseModel.data!.length % 10 == 0
                                        ? WrapAlignment.center
                                        : WrapAlignment.start,
                                children: [
                                  for (int i = 0; i < provider.farmComputerMyProjectFileResponseModel.data!.length; i++)
                                    if (provider.farmComputerMyProjectFileResponseModel.data![i].type == "Media")
                                      Column(
                                        children: [
                                          provider.farmComputerMyProjectFileResponseModel.data![i].name!.contains(".")
                                              ? FaIcon(
                                                  provider.farmComputerMyProjectFileResponseModel.data![i].name!.split('.')[1].toLowerCase() == 'pdf'
                                                      ? FontAwesomeIcons.solidFilePdf
                                                      : FontAwesomeIcons.solidFileImage,
                                                  size: Responsive.isMobile(context)
                                                      ? 45
                                                      : Responsive.isTablet(context)
                                                          ? 60
                                                          : 80,
                                                  color: provider.farmComputerMyProjectFileResponseModel.data![i].name!.split('.')[1].toLowerCase() ==
                                                          'pdf'
                                                      ? Colors.red
                                                      : herbal,
                                                )
                                              : FaIcon(
                                                  FontAwesomeIcons.solidFileImage,
                                                  size: Responsive.isMobile(context)
                                                      ? 45
                                                      : Responsive.isTablet(context)
                                                          ? 60
                                                          : 80,
                                                  color: herbal,
                                                ),
                                          SizedBox(height: 5),
                                          SizedBox(
                                            width: Responsive.isMobile(context)
                                                ? 45
                                                : Responsive.isTablet(context)
                                                    ? 55
                                                    : 70,
                                            child: CustomText(
                                              text: provider.farmComputerMyProjectFileResponseModel.data![i].name == null
                                                  ? '-'
                                                  : provider.farmComputerMyProjectFileResponseModel.data![i].name!.split(".")[0],
                                              textAligns: TextAlign.center,
                                              lines: 5,
                                              size: Responsive.isMobile(context)
                                                  ? 7
                                                  : Responsive.isTablet(context)
                                                      ? 8
                                                      : 10,
                                            ),
                                          )
                                        ],
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
                                              size: Responsive.isMobile(context)
                                                  ? 12
                                                  : Responsive.isTablet(context)
                                                      ? 16
                                                      : 20,
                                            ),
                                          )),
                                    ),
                                ],
                              )
                            : Wrap(
                                spacing: Responsive.isMobile(context)
                                    ? 15
                                    : Responsive.isTablet(context)
                                        ? 20
                                        : 30,
                                runSpacing: Responsive.isMobile(context)
                                    ? 15
                                    : Responsive.isTablet(context)
                                        ? 20
                                        : 30,
                                alignment: Responsive.isMobile(context)
                                    ? provider.farmComputerMyProjectFileResponseModel.data!.length % 4 == 0
                                        ? WrapAlignment.center
                                        : WrapAlignment.start
                                    : provider.farmComputerMyProjectFileResponseModel.data!.length % 10 == 0
                                        ? WrapAlignment.center
                                        : WrapAlignment.start,
                                children: [
                                  for (int i = 0; i < provider.farmComputerMyProjectFileResponseModel.data!.length; i++)
                                    if (provider.farmComputerMyProjectFileResponseModel.data![i].type != "Media")
                                      Column(
                                        children: [
                                          provider.farmComputerMyProjectFileResponseModel.data![i].name!.contains(".")
                                              ? FaIcon(
                                                  provider.farmComputerMyProjectFileResponseModel.data![i].name!.split('.')[1].toLowerCase() == 'pdf'
                                                      ? FontAwesomeIcons.solidFilePdf
                                                      : FontAwesomeIcons.solidFileImage,
                                                  size: Responsive.isMobile(context)
                                                      ? 45
                                                      : Responsive.isTablet(context)
                                                          ? 60
                                                          : 80,
                                                  color: provider.farmComputerMyProjectFileResponseModel.data![i].name!.split('.')[1].toLowerCase() ==
                                                          'pdf'
                                                      ? Colors.red
                                                      : herbal,
                                                )
                                              : FaIcon(
                                                  FontAwesomeIcons.solidFileImage,
                                                  size: Responsive.isMobile(context)
                                                      ? 45
                                                      : Responsive.isTablet(context)
                                                          ? 60
                                                          : 80,
                                                  color: herbal,
                                                ),
                                          SizedBox(height: 5),
                                          SizedBox(
                                            width: Responsive.isMobile(context)
                                                ? 45
                                                : Responsive.isTablet(context)
                                                    ? 55
                                                    : 70,
                                            child: CustomText(
                                              text: provider.farmComputerMyProjectFileResponseModel.data![i].name == null
                                                  ? '-'
                                                  : provider.farmComputerMyProjectFileResponseModel.data![i].name!.split(".")[0],
                                              textAligns: TextAlign.center,
                                              lines: 5,
                                              size: Responsive.isMobile(context)
                                                  ? 7
                                                  : Responsive.isTablet(context)
                                                      ? 8
                                                      : 10,
                                            ),
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
                                              size: Responsive.isMobile(context)
                                                  ? 12
                                                  : Responsive.isTablet(context)
                                                      ? 16
                                                      : 20,
                                            ),
                                          )),
                                    ),
                                ],
                              ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      );
    });
  }
}
