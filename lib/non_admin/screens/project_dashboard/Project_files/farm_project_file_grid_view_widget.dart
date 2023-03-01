import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/non_admin/models/farm_computer_project/farm_computer_project_files/get_computer_project_file_response.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/responsive.dart';

import '../../../../utils/styles.dart';
import '../../../providers/farm_computer_projects_provider/farm_computer_project_file_provider.dart';

class FarmProjectFileGridViewWidget extends StatefulWidget {
  const FarmProjectFileGridViewWidget({Key? key, this.projectId, this.model}) : super(key: key);
  final int? projectId;
  final GetFarmComputerProjectFilesResponse? model;

  @override
  State<FarmProjectFileGridViewWidget> createState() => _FarmProjectFileGridViewWidgetState();
}

class _FarmProjectFileGridViewWidgetState extends State<FarmProjectFileGridViewWidget> {
  List<String> filedataList = <String>[
    "All",
    "Media",
    "Documents",
  ];
  List<bool> titelBool = <bool>[];

  @override
  void initState() {
    super.initState();
    titelBool = List.filled(3, false);
    titelBool[0] = true;
  }

  bool isLoading = true;

  int countMedia = 0;

  //
  // void openDownloadLink(String href, String filename) {
  //   document.createElement('a') as AnchorElement
  //     ..href = href
  //     ..download = filename
  //     ..dispatchEvent(Event.eventType('MouseEvent', 'click'));
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateFarmComputerProjectFilesProvider>(builder: (context, provider, child) {
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
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  for (int i = 0; i < 3; i++)
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (titelBool.contains(true)) {
                            titelBool = List.filled(3, false);
                            titelBool[i] = true;
                          } else {
                            titelBool[i] = true;
                          }
                        });
                      },
                      child: Transform.translate(
                        offset: titelBool[i] ? Offset(0.0, 1.5) : Offset(0, 0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? 5 : 10, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: titelBool[i] ? Colors.black : Colors.black12, width: titelBool[i] ? 2 : 0.1))),
                          child: CustomText(
                            text: filedataList[i].tr(),
                            size: Responsive.isMobile(context)
                                ? titelBool[i]
                                    ? 12
                                    : 11
                                : titelBool[i]
                                    ? 16
                                    : 14,
                            weight: titelBool[i] ? FontWeight.bold : FontWeight.normal,
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
                    titelBool[0]
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
                                ? provider.farmComputerProjectFileResponseModel.data!.length % 4 == 0
                                    ? WrapAlignment.center
                                    : WrapAlignment.start
                                : provider.farmComputerProjectFileResponseModel.data!.length % 10 == 0
                                    ? WrapAlignment.center
                                    : WrapAlignment.start,
                            children: [
                              for (int i = 0; i < provider.farmComputerProjectFileResponseModel.data!.length; i++)
                                Column(
                                  children: [
                                    provider.farmComputerProjectFileResponseModel.data![i].name!.contains(".")
                                        ? FaIcon(
                                            provider.farmComputerProjectFileResponseModel.data![i].name!.split('.')[1].toLowerCase() == 'pdf'
                                                ? FontAwesomeIcons.solidFilePdf
                                                : FontAwesomeIcons.solidFileImage,
                                            size: Responsive.isMobile(context)
                                                ? 45
                                                : Responsive.isTablet(context)
                                                    ? 60
                                                    : 80,
                                            color: provider.farmComputerProjectFileResponseModel.data![i].name!.split('.')[1].toLowerCase() == 'pdf'
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
                                    SizedBox(
                                      height: 6,
                                    ),
                                    SizedBox(
                                      width: Responsive.isMobile(context)
                                          ? 45
                                          : Responsive.isTablet(context)
                                              ? 55
                                              : 70,
                                      child: CustomText(
                                        text: provider.farmComputerProjectFileResponseModel.data![i].name == null
                                            ? '-'
                                            : provider.farmComputerProjectFileResponseModel.data![i].name!.split(".")[0],
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
                                visible: (provider.farmComputerProjectFileResponseModel.data!.length == 0) ? true : false,
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
                        : titelBool[1]
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
                                    ? provider.farmComputerProjectFileResponseModel.data!.length % 4 == 0
                                        ? WrapAlignment.center
                                        : WrapAlignment.start
                                    : provider.farmComputerProjectFileResponseModel.data!.length % 10 == 0
                                        ? WrapAlignment.center
                                        : WrapAlignment.start,
                                children: [
                                  for (int i = 0; i < provider.farmComputerProjectFileResponseModel.data!.length; i++)
                                    if (provider.farmComputerProjectFileResponseModel.data![i].type == "Media")
                                      Column(
                                        children: [
                                          provider.farmComputerProjectFileResponseModel.data![i].name!.contains(".")
                                              ? FaIcon(
                                                  provider.farmComputerProjectFileResponseModel.data![i].name!.split('.')[1].toLowerCase() == 'pdf'
                                                      ? FontAwesomeIcons.solidFilePdf
                                                      : FontAwesomeIcons.solidFileImage,
                                                  size: Responsive.isMobile(context)
                                                      ? 45
                                                      : Responsive.isTablet(context)
                                                          ? 60
                                                          : 80,
                                                  color: provider.farmComputerProjectFileResponseModel.data![i].name!.split('.')[1].toLowerCase() ==
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
                                          SizedBox(
                                            height: 6,
                                          ),
                                          SizedBox(
                                            width: Responsive.isMobile(context)
                                                ? 45
                                                : Responsive.isTablet(context)
                                                    ? 55
                                                    : 70,
                                            child: CustomText(
                                              text: provider.farmComputerProjectFileResponseModel.data![i].name == null
                                                  ? '-'
                                                  : provider.farmComputerProjectFileResponseModel.data![i].name!.split(".")[0],
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
                                        ),
                                      ),
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
                                    ? provider.farmComputerProjectFileResponseModel.data!.length % 4 == 0
                                        ? WrapAlignment.center
                                        : WrapAlignment.start
                                    : provider.farmComputerProjectFileResponseModel.data!.length % 10 == 0
                                        ? WrapAlignment.center
                                        : WrapAlignment.start,
                                children: [
                                  for (int i = 0; i < provider.farmComputerProjectFileResponseModel.data!.length; i++)
                                    if (provider.farmComputerProjectFileResponseModel.data![i].type != "Media")
                                      Column(
                                        children: [
                                          provider.farmComputerProjectFileResponseModel.data![i].name!.contains(".")
                                              ? FaIcon(
                                                  provider.farmComputerProjectFileResponseModel.data![i].name!.split('.')[1].toLowerCase() == 'pdf'
                                                      ? FontAwesomeIcons.solidFilePdf
                                                      : FontAwesomeIcons.solidFileImage,
                                                  size: Responsive.isMobile(context)
                                                      ? 45
                                                      : Responsive.isTablet(context)
                                                          ? 60
                                                          : 80,
                                                  color: provider.farmComputerProjectFileResponseModel.data![i].name!.split('.')[1].toLowerCase() ==
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
                                          SizedBox(
                                            height: 6,
                                          ),
                                          SizedBox(
                                            width: Responsive.isMobile(context)
                                                ? 45
                                                : Responsive.isTablet(context)
                                                    ? 55
                                                    : 70,
                                            child: CustomText(
                                              text: provider.farmComputerProjectFileResponseModel.data![i].name == null
                                                  ? '-'
                                                  : provider.farmComputerProjectFileResponseModel.data![i].name!.split(".")[0],
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
                                        ),
                                      ),
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
