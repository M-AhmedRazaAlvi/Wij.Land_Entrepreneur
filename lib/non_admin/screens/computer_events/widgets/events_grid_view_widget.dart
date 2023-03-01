import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../../models/farm_computer_events/computer_event_file/response/computer_events_file_response.dart';
import '../../../providers/farm_computer_projects_provider/farm_computer_events_file_provider.dart';
import 'package:universal_html/html.dart' as html;

class EventsGridViewWidget extends StatefulWidget {
  const EventsGridViewWidget({Key? key, this.eventId, this.model}) : super(key: key);
  final eventId;
  final GetFarmComputerEventsFileResponse? model;

  @override
  State<EventsGridViewWidget> createState() => _EventsGridViewWidgetState();
}

class _EventsGridViewWidgetState extends State<EventsGridViewWidget> {
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

  initData() async {
    await Provider.of<CreateFarmComputerEventsFileProvider>(context, listen: false).getFarmComputerEventFileMedia(eventId: widget.eventId);
    print(
        "data-----${Provider.of<CreateFarmComputerEventsFileProvider>(context, listen: false).getFarmComputerEventFileMedia(eventId: widget.eventId)}");
    isLoading = false;
  }

  bool isLoading = false;

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
          margin: const EdgeInsets.only(right: 40),
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
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
            : !provider.hasData
                ? Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.all(20),
                    height: getHeight(context) * 0.7,
                    child: CustomText(
                      text: 'No data found'.tr(),
                      color: Colors.red,
                      weight: FontWeight.w700,
                      size: Responsive.isMobile(context) ? 13 : 20,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Responsive.isMobile(context) ? 20 : 30,
                      vertical: Responsive.isMobile(context) ? 15 : 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titelBool[0]
                            ? SizedBox(
                                width: getWidth(context),
                                child: Wrap(
                                  spacing: Responsive.isMobile(context) ? 10 : 40,
                                  runSpacing: Responsive.isMobile(context) ? 10 : 40,
                                  alignment: Responsive.isMobile(context)
                                      ? WrapAlignment.start
                                      : provider.farmComputerEventsFileMediaResponseModel.data!.length % 10 == 0
                                          ? WrapAlignment.center
                                          : WrapAlignment.start,
                                  children: [
                                    for (int i = 0; i < provider.farmComputerEventsFileMediaResponseModel.data!.length; i++)
                                      Column(
                                        children: [
                                          provider.farmComputerEventsFileMediaResponseModel.data![i].title!.contains(".")
                                              ? FaIcon(
                                                  provider.farmComputerEventsFileMediaResponseModel.data![i].title!.split('.')[1].toLowerCase() ==
                                                          'pdf'
                                                      ? FontAwesomeIcons.solidFilePdf
                                                      : FontAwesomeIcons.solidFileImage,
                                                  size: Responsive.isMobile(context) ? 45 : 80,
                                                  color:
                                                      provider.farmComputerEventsFileMediaResponseModel.data![i].title!.split('.')[1].toLowerCase() ==
                                                              'pdf'
                                                          ? Colors.red
                                                          : herbal)
                                              : FaIcon(FontAwesomeIcons.solidFileImage, size: Responsive.isMobile(context) ? 45 : 80, color: herbal),
                                          SizedBox(height: 6),
                                          SizedBox(
                                            width: Responsive.isMobile(context) ? 45 : 70,
                                            child: CustomText(
                                                text: provider.farmComputerEventsFileMediaResponseModel.data![i].title == null
                                                    ? ''
                                                    : provider.farmComputerEventsFileMediaResponseModel.data![i].title!.split(".")[0],
                                                textAligns: TextAlign.center,
                                                overflows: TextOverflow.ellipsis,
                                                lines: 5,
                                                size: Responsive.isMobile(context) ? 8 : 12),
                                          )
                                        ],
                                      ),
                                  ],
                                ),
                              )
                            : titelBool[1]
                                ? Column(
                                    children: [
                                      SizedBox(
                                        width: getWidth(context),
                                        child: Wrap(
                                          spacing: Responsive.isMobile(context) ? 10 : 40,
                                          runSpacing: Responsive.isMobile(context) ? 10 : 40,
                                          alignment: Responsive.isMobile(context)
                                              ? WrapAlignment.start
                                              : provider.farmComputerEventsFileMediaResponseModel.data!.length % 10 == 0
                                                  ? WrapAlignment.center
                                                  : WrapAlignment.start,
                                          children: [
                                            for (int i = 0; i < provider.farmComputerEventsFileMediaResponseModel.data!.length; i++)
                                              if (provider.farmComputerEventsFileMediaResponseModel.data![i].type == "Media")
                                                Column(
                                                  children: [
                                                    provider.farmComputerEventsFileMediaResponseModel.data![i].title!.contains(".")
                                                        ? FaIcon(
                                                            provider.farmComputerEventsFileMediaResponseModel.data![i].title!
                                                                        .split('.')[1]
                                                                        .toLowerCase() ==
                                                                    'pdf'
                                                                ? FontAwesomeIcons.solidFilePdf
                                                                : FontAwesomeIcons.solidFileImage,
                                                            size: Responsive.isMobile(context) ? 45 : 80,
                                                            color: provider.farmComputerEventsFileMediaResponseModel.data![i].title!
                                                                        .split('.')[1]
                                                                        .toLowerCase() ==
                                                                    'pdf'
                                                                ? Colors.red
                                                                : herbal)
                                                        : FaIcon(FontAwesomeIcons.solidFileImage,
                                                            size: Responsive.isMobile(context) ? 45 : 80, color: herbal),
                                                    SizedBox(height: 6),
                                                    SizedBox(
                                                      width: Responsive.isMobile(context) ? 45 : 70,
                                                      child: CustomText(
                                                          text: provider.farmComputerEventsFileMediaResponseModel.data![i].title == null
                                                              ? '-'
                                                              : provider.farmComputerEventsFileMediaResponseModel.data![i].title!.split(".")[0],
                                                          textAligns: TextAlign.center,
                                                          overflows: TextOverflow.ellipsis,
                                                          lines: 5,
                                                          size: Responsive.isMobile(context) ? 8 : 12),
                                                    )
                                                  ],
                                                ),
                                          ],
                                        ),
                                      ),
                                      if (!provider.mediaBool.contains(true))
                                        SizedBox(
                                          child: Align(
                                            alignment: Responsive.isMobile(context) ? Alignment.topLeft : Alignment.topCenter,
                                            child: Padding(
                                              padding: const EdgeInsets.all(25.0),
                                              child: CustomText(
                                                text: "No Any Media File".tr(),
                                                color: Colors.red,
                                                weight: FontWeight.w700,
                                                size: Responsive.isMobile(context) ? 13 : 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      SizedBox(
                                        width: getWidth(context),
                                        child: Wrap(
                                          spacing: Responsive.isMobile(context) ? 10 : 40,
                                          runSpacing: Responsive.isMobile(context) ? 10 : 40,
                                          alignment: Responsive.isMobile(context)
                                              ? WrapAlignment.start
                                              : provider.farmComputerEventsFileMediaResponseModel.data!.length % 10 == 0
                                                  ? WrapAlignment.center
                                                  : WrapAlignment.start,
                                          children: [
                                            for (int i = 0; i < provider.farmComputerEventsFileMediaResponseModel.data!.length; i++)
                                              if (provider.farmComputerEventsFileMediaResponseModel.data![i].type != "Media")
                                                Column(
                                                  children: [
                                                    provider.farmComputerEventsFileMediaResponseModel.data![i].title!.contains(".")
                                                        ? FaIcon(
                                                            provider.farmComputerEventsFileMediaResponseModel.data![i].title!
                                                                        .split('.')[1]
                                                                        .toLowerCase() ==
                                                                    'pdf'
                                                                ? FontAwesomeIcons.solidFilePdf
                                                                : FontAwesomeIcons.solidFileImage,
                                                            size: Responsive.isMobile(context) ? 45 : 80,
                                                            color: provider.farmComputerEventsFileMediaResponseModel.data![i].title!
                                                                        .split('.')[1]
                                                                        .toLowerCase() ==
                                                                    'pdf'
                                                                ? Colors.red
                                                                : herbal)
                                                        : FaIcon(FontAwesomeIcons.solidFileImage,
                                                            size: Responsive.isMobile(context) ? 45 : 80, color: herbal),
                                                    SizedBox(height: 6),
                                                    SizedBox(
                                                      width: Responsive.isMobile(context) ? 45 : 70,
                                                      child: CustomText(
                                                          text: provider.farmComputerEventsFileMediaResponseModel.data![i].title == null
                                                              ? '-'
                                                              : provider.farmComputerEventsFileMediaResponseModel.data![i].title!.split(".")[0],
                                                          textAligns: TextAlign.center,
                                                          overflows: TextOverflow.ellipsis,
                                                          lines: 5,
                                                          size: Responsive.isMobile(context) ? 8 : 12),
                                                    ),
                                                  ],
                                                ),
                                          ],
                                        ),
                                      ),
                                      if (!provider.documentBool.contains(true))
                                        Align(
                                          alignment: Responsive.isMobile(context) ? Alignment.topLeft : Alignment.topCenter,
                                          child: Padding(
                                            padding: const EdgeInsets.all(25.0),
                                            child: CustomText(
                                                text: "No Any Document File".tr(),
                                                color: Colors.red,
                                                weight: FontWeight.w700,
                                                size: Responsive.isMobile(context) ? 13 : 20),
                                          ),
                                        ),
                                    ],
                                  ),
                        SizedBox(height: 100),
                      ],
                    ),
                  ),
      ],
    );
  }
}
