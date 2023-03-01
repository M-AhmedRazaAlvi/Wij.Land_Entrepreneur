import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/non_admin/screens/computer_file/farm_computer_file_info.dart';
import 'package:wij_land/non_admin/screens/computer_file/widget/farm_computer_file_dialog.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../utils/controller.dart';
import '../../../utils/url_scheme.dart';
import '../../models/main_files/response/get_fc_files.dart';
import '../../providers/fc_files_provider/main_files_provider.dart';
import '../../routes/routes.dart';

class FarmFilesWidget extends StatefulWidget {
  final GetFarmComputerFiles? fcFiles;

  const FarmFilesWidget({Key? key, required this.fcFiles}) : super(key: key);

  @override
  State<FarmFilesWidget> createState() => _FarmFilesWidgetState();
}

class _FarmFilesWidgetState extends State<FarmFilesWidget> {
  List idFiles = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainFilesProvider>(builder: (context, provider, child) {
      return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FarmComputerFileInfoWidget(
                    first: true,
                    starIcon: Icons.star,
                    starColor: Colors.transparent,
                    fileName: "File name".tr(),
                    fileProject: "Project".tr(),
                    fileParcel: "Parcel".tr(),
                    addedBy: "Added by".tr(),
                    dateBy: "Date".tr(),
                    total: "Total".tr()+"${widget.fcFiles!.data!.length}",
                    nameClick: () async {
                      provider.name = !provider.name;
                      provider.addBy = false;
                      provider.dateBy = false;

                      if (provider.name) {
                        provider.fcFiles!.data!.sort((a, b) => a.file!.title!.toLowerCase().compareTo(b.file!.title!.toLowerCase()));
                      } else {
                        provider.fcFiles!.data!.sort((a, b) => b.file!.title!.toLowerCase().compareTo(a.file!.title!.toLowerCase()));
                      }
                      setState(() {});
                    },
                    addedbyClick: () {
                      provider.addBy = !provider.addBy;
                      provider.dateBy = false;
                      provider.name = false;

                      if (provider.addBy) {
                        provider.fcFiles!.data!.sort((a, b) {
                          return a.file!.description!.toLowerCase().compareTo(b.file!.description!.toLowerCase());
                        });
                      } else {
                        provider.fcFiles!.data!.sort((a, b) => b.file!.description!.toLowerCase().compareTo(a.file!.description!.toLowerCase()));
                      }
                      setState(() {});
                    },
                    dateByClick: () {
                      provider.dateBy = !provider.dateBy;
                      provider.addBy = false;
                      provider.name = false;
                      if (provider.dateBy) {
                        provider.fcFiles!.data!.sort((a, b) {
                          var aDate = DateTime.parse(a.file!.date!);
                          var bDate = DateTime.parse(b.file!.date!);
                          return aDate.compareTo(bDate);
                        });
                      } else {
                        provider.fcFiles!.data!.sort((a, b) {
                          var aDate = DateTime.parse(a.file!.date!);
                          var bDate = DateTime.parse(b.file!.date!);
                          return bDate.compareTo(aDate);
                        });
                      }
                      setState(() {});
                    },
                    size: getWidth(context) / 10),
                for (int i = 0; i < widget.fcFiles!.data!.length; i++)
                  Container(
                    // width: getWidth(context),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black26))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: (getWidth(context) / 10) / 6,
                          child: IconButton(
                            icon: Icon(
                              provider.isBookMark[i] == true ? Icons.star : Icons.star_border,
                              color: provider.isBookMark[i] == true ? yellowishGreen : Colors.black,
                            ),
                            onPressed: () async {
                              if (provider.isBookMark[i] == true) {
                                provider.isBookMark[i] = false;
                                setState(() {});
                                await provider.putFCFilesBookMark(id: widget.fcFiles!.data![i].file!.id!, isFavourite: provider.isBookMark[i]);
                              } else {
                                provider.isBookMark[i] = true;
                                setState(() {});
                                await provider.putFCFilesBookMark(id: widget.fcFiles!.data![i].file!.id!, isFavourite: provider.isBookMark[i]);
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: (getWidth(context) / 10) * 1.5,
                          child: InkWell(
                            onTap: () {
                              launchUrlNewTab(widget.fcFiles!.data![i].file!.file!.original!);
                              setState(() {});
                            },
                            child: CustomText(
                              textAligns: TextAlign.left,
                              text: widget.fcFiles!.data![i].file!.title == null ? "" : widget.fcFiles!.data![i].file!.title!,
                              weight: FontWeight.normal,
                              size: 12,
                              lines: 12,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: (getWidth(context) / 10) * 1.5,
                          child: Wrap(
                            children: [
                              for (int j = 0;
                                  j <
                                      (widget.fcFiles!.data![i].fileTags!.projects!.isEmpty
                                          ? 0
                                          : widget.fcFiles!.data![i].fileTags!.projects!.length);
                                  j++)
                                if (widget.fcFiles!.data![i].fileTags!.projects!.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 1.0),
                                    child: Wrap(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            navigationController.navigateToWithArguments(
                                              routeName: farmComputerProjectDashboardPageRoute,
                                              arguments: widget.fcFiles!.data![i].fileTags!.projects![j].id,
                                            );
                                          },
                                          child: CustomText(
                                            textAligns: TextAlign.left,
                                            text: widget.fcFiles!.data![i].fileTags!.projects![j].name == null
                                                ? " "
                                                : "${widget.fcFiles!.data![i].fileTags!.projects![j].name!},",
                                            weight: FontWeight.normal,
                                            overflows: TextOverflow.clip,
                                            lines: 10,
                                            size: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: (getWidth(context) / 10) * 1.5,
                          child: Wrap(
                            children: [
                              for (int j = 0;
                                  j < (widget.fcFiles!.data![i].fileTags!.parcels!.isEmpty ? 0 : widget.fcFiles!.data![i].fileTags!.parcels!.length);
                                  j++)
                                if (widget.fcFiles!.data![i].fileTags!.parcels!.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Row(
                                      children: [
                                        CustomText(
                                          textAligns: TextAlign.left,
                                          text: widget.fcFiles!.data![i].fileTags!.parcels![j].nameAuto == null
                                              ? " "
                                              : widget.fcFiles!.data![i].fileTags!.parcels![j].nameAuto!,
                                          weight: FontWeight.normal,
                                          size: 12,
                                          lines: 10,
                                        ),
                                        CustomText(text: ","),
                                      ],
                                    ),
                                  ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: (getWidth(context) / 10) * 1.5,
                          child: CustomText(
                            textAligns: TextAlign.left,
                            text: widget.fcFiles!.data![i].file!.description == null ? "" : widget.fcFiles!.data![i].file!.description!,
                            weight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: (getWidth(context) / 10) * 1.5,
                          child: CustomText(
                            textAligns: TextAlign.left,
                            text: widget.fcFiles!.data![i].file!.date == null
                                ? ""
                                : '${widget.fcFiles!.data![i].file!.date!.split('-')[2]}-${widget.fcFiles!.data![i].file!.date!.split('-')[1]}-${widget.fcFiles!.data![i].file!.date!.split('-')[0]}',
                            weight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: (getWidth(context) / 10) / 3,
                          child: IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return FarmComputerFileDialog(
                                        fileId: widget.fcFiles!.data![i].file!.id!,
                                      );
                                    });
                              },
                              icon: const Icon(Icons.info_outline)),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          );
    });
  }
}
