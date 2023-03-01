import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/non_admin/screens/computer_events/widgets/events_file_inf0_widget.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Files/widget/file_folder.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/responsive.dart';
import 'package:universal_html/html.dart' as html;
import '../../../../utils/url_scheme.dart';
import '../../../models/farm_computer_events/computer_event_file/response/computer_events_file_response.dart';
import '../../../providers/farm_computer_projects_provider/farm_computer_events_file_provider.dart';

class EventsCheckedListWidget extends StatefulWidget {
  const EventsCheckedListWidget({Key? key, this.eventId, this.model}) : super(key: key);
  final eventId;
  final GetFarmComputerEventsFileResponse? model;

  @override
  State<EventsCheckedListWidget> createState() => _EventsCheckedListWidgetState();
}

class _EventsCheckedListWidgetState extends State<EventsCheckedListWidget> {
  List<String> filedataList = <String>[
    "All",
    "Media",
    "Documents",
  ];
  List<bool> titelBool = <bool>[];
  List<bool> fileTextBool = <bool>[];
  List<String> fileText = <String>[
    "Invitation",
    "Presentation Files",
    "Event Report",
    "Background Information",
    "Other",
  ];

  @override
  void initState() {
    super.initState();
    titelBool = List.filled(3, false);
    titelBool[0] = true;
  }

  initData() async {
    await Provider.of<CreateFarmComputerEventsFileProvider>(context, listen: false).getFarmComputerEventFileMedia(eventId: widget.eventId);
    print(
        "data-----${Provider.of<CreateFarmComputerEventsFileProvider>(context, listen: false).getFarmComputerEventFileMedia(eventId: widget.eventId)}");
    isLoading = false;
  }

  bool isLoading = false;

  bool allChecked = false;

  void openDownloadLink(String href, String filename) {
    document.createElement('a') as AnchorElement
      ..href = href
      ..download = filename
      ..dispatchEvent(Event.eventType('MouseEvent', 'click'));
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CreateFarmComputerEventsFileProvider>(context);

    return Column(
      children: [
        Container(
          width: getWidth(context),
          padding: const EdgeInsets.only(left: 20, top: 30, right: 30),
          // margin: const EdgeInsets.only(right: 40),
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
                      provider.docxLength = [];

                      if (titelBool.contains(true)) {
                        titelBool = List.filled(3, false);
                        titelBool[i] = true;
                        for (int i = 0; i < provider.farmComputerEventsFileMediaResponseModel.data!.length; i++) {
                          provider.docxLength.add(i);
                        }
                        if (provider.mediaBool.contains(true)) {
                          provider.docxLength.length = provider.docxLength.length - provider.mediaBool.length;
                        }
                      } else {
                        titelBool[i] = true;
                      }
                      fileTextBool = List.filled(5, false);
                    });
                  },
                  child: Transform.translate(
                    offset: titelBool[i] ? Offset(0.0, 1.5) : Offset(0, 0),
                    child: Container(
                      padding:  EdgeInsets.symmetric(horizontal:Responsive.isMobile(context)?5: 10, vertical:Responsive.isMobile(context)?5: 10),
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
        isLoading
            ? SizedBox(
                height: getHeight(context),
                width: getWidth(context),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Padding(
                padding: EdgeInsets.all(Responsive.isMobile(context) ? 5 : 15),
                child: SizedBox(
                  width: getWidth(context),
                  child: !provider.hasData
                      ? Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.all(20),
                          height: getHeight(context) * 0.7,
                          child: CustomText(
                            text: 'Only Invited Guests Can View Data'.tr(),
                            color: Colors.red,
                            weight: FontWeight.w700,
                            size: Responsive.isMobile(context) ? 13 : 20,
                          ),
                        )
                      : Column(
                          children: [
                            Visibility(
                              visible: titelBool[0] || titelBool[1] ? true : false,
                              child: EventsFileInfoRowWidget(
                                  first: true,
                                  check: allChecked,
                                  fileName: "File name".tr(),
                                  fileType: "File type".tr(),
                                  addedBy: "Added by".tr(),
                                  dateBy: "Date".tr(),
                                  total: titelBool[0]
                                      ? "Total".tr() + " ${provider.farmComputerEventsFileMediaResponseModel.data!.length}"
                                      : "Total".tr() + " ${provider.mediaBool.length}",
                                  size: getWidth(context) / 9),
                            ),
                            titelBool[0]
                                ? Column(
                                    children: [
                                      for (int i = 0; i < provider.farmComputerEventsFileMediaResponseModel.data!.length; i++)
                                        EventsFileInfoRowWidget(
                                          first: false,
                                          onFileTap: () async {
                                            launchUrlNewTab(provider.farmComputerEventsFileMediaResponseModel.data![i].path!);
                                            // openDownloadLink(provider.farmComputerEventsFileMediaResponseModel.data![i].path!,
                                            //     provider.farmComputerEventsFileMediaResponseModel.data![i].title!);
                                            // Uri getHref() =>
                                            //     Uri.parse(html.window.location.href);
                                          },
                                          check: allChecked,
                                          fileName: provider.farmComputerEventsFileMediaResponseModel.data![i].title == null
                                              ? "-"
                                              : provider.farmComputerEventsFileMediaResponseModel.data![i].title!,
                                          fileType: provider.farmComputerEventsFileMediaResponseModel.data![i].type ?? "-",
                                          addedBy: provider.farmComputerEventsFileMediaResponseModel.data![i].addedBy == null
                                              ? "-"
                                              : provider.farmComputerEventsFileMediaResponseModel.data![i].addedBy!,
                                          dateBy: provider.farmComputerEventsFileMediaResponseModel.data![i].dateUploaded == null
                                              ? "-"
                                              : provider.farmComputerEventsFileMediaResponseModel.data![i].dateUploaded!,
                                          total: "",
                                          size: getWidth(context) / 9,
                                        ),
                                    ],
                                  )
                                : titelBool[1]
                                    ? Column(
                                        children: [
                                          for (int i = 0; i < provider.farmComputerEventsFileMediaResponseModel.data!.length; i++)
                                            if (provider.farmComputerEventsFileMediaResponseModel.data![i].type == "Media")
                                              EventsFileInfoRowWidget(
                                                  first: false,
                                                  check: allChecked,
                                                  onFileTap: () async {
                                                      launchUrlNewTab(provider.farmComputerEventsFileMediaResponseModel.data![i].path!);
                                                    // Uri getHref() =>
                                                    //     Uri.parse(window.location.href);
                                                  },
                                                  fileName: provider.farmComputerEventsFileMediaResponseModel.data![i].title == null
                                                      ? "-"
                                                      : provider.farmComputerEventsFileMediaResponseModel.data![i].title!,
                                                  fileType: provider.farmComputerEventsFileMediaResponseModel.data![i].type ?? "-",
                                                  addedBy: provider.farmComputerEventsFileMediaResponseModel.data![i].addedBy == null
                                                      ? "-"
                                                      : provider.farmComputerEventsFileMediaResponseModel.data![i].addedBy!,
                                                  dateBy: provider.farmComputerEventsFileMediaResponseModel.data![i].dateUploaded == null
                                                      ? "-"
                                                      : provider.farmComputerEventsFileMediaResponseModel.data![i].dateUploaded!,
                                                  total: "",
                                                  size: getWidth(context) / 9),
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
                                                      size: Responsive.isMobile(context) ? 13 : 20,
                                                    ),
                                                  )),
                                            ),
                                        ],
                                      )
                                    : Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal:Responsive.isMobile(context) ? 6 : 15,
                                          vertical: Responsive.isMobile(context) ? 10 : 15,
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: getWidth(context),
                                              child: Wrap(
                                                alignment: WrapAlignment.start,
                                                spacing: Responsive.isMobile(context) ? 3 : 9,
                                                runSpacing: Responsive.isMobile(context) ? 5 : 15,
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
                                                            for (int i = 0; i < provider.farmComputerEventsFileMediaResponseModel.data!.length; i++) {
                                                              if (provider.farmComputerEventsFileMediaResponseModel.data![i].type != "Invitation" &&
                                                                  provider.farmComputerEventsFileMediaResponseModel.data![i].type !=
                                                                      "Presentation Files" &&
                                                                  provider.farmComputerEventsFileMediaResponseModel.data![i].type != "Event Report" &&
                                                                  provider.farmComputerEventsFileMediaResponseModel.data![i].type !=
                                                                      "Background Information" &&
                                                                  provider.farmComputerEventsFileMediaResponseModel.data![i].type != "Media") {
                                                                provider.docxLength.add(i);
                                                              }
                                                            }
                                                          } else {
                                                            for (int i = 0; i < provider.farmComputerEventsFileMediaResponseModel.data!.length; i++) {
                                                              if (provider.farmComputerEventsFileMediaResponseModel.data![i].type == fileText[j]) {
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
                                                  child: EventsFileInfoRowWidget(
                                                      first: true,
                                                      check: allChecked,
                                                      fileName: "File name".tr(),
                                                      fileType: "File type".tr(),
                                                      addedBy: "Added by".tr(),
                                                      dateBy: "Date".tr(),
                                                      total: "Total".tr() + " ${provider.docxLength.length}",
                                                      size: getWidth(context) / 9),
                                                ),
                                                Visibility(
                                                  visible: fileTextBool.contains(true) ? false : true,
                                                  child: Column(
                                                    children: [
                                                      for (int i = 0; i < provider.farmComputerEventsFileMediaResponseModel.data!.length; i++)
                                                        if (provider.farmComputerEventsFileMediaResponseModel.data![i].type != "Media")
                                                          EventsFileInfoRowWidget(
                                                              first: false,
                                                              check: allChecked,
                                                              onFileTap: () async {
                                                                  launchUrlNewTab(provider.farmComputerEventsFileMediaResponseModel.data![i].path!);
                                                                // Uri getHref() =>
                                                                //     Uri.parse(html.window.location.href);
                                                              },
                                                              fileName: provider.farmComputerEventsFileMediaResponseModel.data![i].title == null
                                                                  ? "-"
                                                                  : provider.farmComputerEventsFileMediaResponseModel.data![i].title!,
                                                              fileType: provider.farmComputerEventsFileMediaResponseModel.data![i].type ?? "-",
                                                              addedBy: provider.farmComputerEventsFileMediaResponseModel.data![i].addedBy == null
                                                                  ? "-"
                                                                  : provider.farmComputerEventsFileMediaResponseModel.data![i].addedBy!,
                                                              dateBy: provider.farmComputerEventsFileMediaResponseModel.data![i].dateUploaded == null
                                                                  ? "-"
                                                                  : provider.farmComputerEventsFileMediaResponseModel.data![i].dateUploaded!,
                                                              total: "",
                                                              size: getWidth(context) / 9),
                                                    ],
                                                  ),
                                                ),
                                                for (int j = 0; j < 4; j++)
                                                  if (fileTextBool[j])
                                                    Column(
                                                      children: [
                                                        for (int i = 0; i < provider.farmComputerEventsFileMediaResponseModel.data!.length; i++)
                                                          if (provider.farmComputerEventsFileMediaResponseModel.data![i].type == fileText[j])
                                                            EventsFileInfoRowWidget(
                                                                first: false,
                                                                check: allChecked,
                                                                onFileTap: () async {
                                                                    launchUrlNewTab(provider.farmComputerEventsFileMediaResponseModel.data![i].path!);
                                                                  // Uri getHref() =>
                                                                  //     Uri.parse(html.window.location.href);
                                                                },
                                                                fileName: provider.farmComputerEventsFileMediaResponseModel.data![i].title == null
                                                                    ? "-"
                                                                    : provider.farmComputerEventsFileMediaResponseModel.data![i].title!,
                                                                fileType: provider.farmComputerEventsFileMediaResponseModel.data![i].type ?? "-",
                                                                addedBy: provider.farmComputerEventsFileMediaResponseModel.data![i].addedBy == null
                                                                    ? "-"
                                                                    : provider.farmComputerEventsFileMediaResponseModel.data![i].addedBy!,
                                                                dateBy:
                                                                    provider.farmComputerEventsFileMediaResponseModel.data![i].dateUploaded == null
                                                                        ? "-"
                                                                        : provider.farmComputerEventsFileMediaResponseModel.data![i].dateUploaded!,
                                                                total: "",
                                                                size: getWidth(context) / 9),
                                                      ],
                                                    ),
                                                if (fileTextBool[4])
                                                  Column(
                                                    children: [
                                                      for (int i = 0; i < provider.farmComputerEventsFileMediaResponseModel.data!.length; i++)
                                                        if (provider.farmComputerEventsFileMediaResponseModel.data![i].type != "Media" &&
                                                            provider.farmComputerEventsFileMediaResponseModel.data![i].type != fileText[3] &&
                                                            provider.farmComputerEventsFileMediaResponseModel.data![i].type != fileText[2] &&
                                                            provider.farmComputerEventsFileMediaResponseModel.data![i].type != fileText[1] &&
                                                            provider.farmComputerEventsFileMediaResponseModel.data![i].type != fileText[0])
                                                          EventsFileInfoRowWidget(
                                                              first: false,
                                                              check: allChecked,
                                                              onFileTap: () async {
                                                                  launchUrlNewTab(provider.farmComputerEventsFileMediaResponseModel.data![i].path!);
                                                                // Uri getHref() =>
                                                                //     Uri.parse(html.window.location.href);
                                                              },
                                                              fileName: provider.farmComputerEventsFileMediaResponseModel.data![i].title == null
                                                                  ? "-"
                                                                  : provider.farmComputerEventsFileMediaResponseModel.data![i].title!,
                                                              fileType: provider.farmComputerEventsFileMediaResponseModel.data![i].type ?? "-",
                                                              addedBy: provider.farmComputerEventsFileMediaResponseModel.data![i].addedBy == null
                                                                  ? "-"
                                                                  : provider.farmComputerEventsFileMediaResponseModel.data![i].addedBy!,
                                                              dateBy: provider.farmComputerEventsFileMediaResponseModel.data![i].dateUploaded == null
                                                                  ? "-"
                                                                  : provider.farmComputerEventsFileMediaResponseModel.data![i].dateUploaded!,
                                                              total: "",
                                                              size: getWidth(context) / 9),
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
                            SizedBox(height: 100),
                          ],
                        ),
                ),
              ),
      ],
    );
  }
}
