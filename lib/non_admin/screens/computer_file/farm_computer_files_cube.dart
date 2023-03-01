import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
// import 'package:universal_html/dart';
import 'package:universal_html/html.dart';
import 'package:wij_land/non_admin/providers/fc_files_provider/main_files_provider.dart';
import 'package:wij_land/utils/url_scheme.dart';
import '../../../app_common_widgets/custom_text.dart';
import '../../../utils/functions.dart';
import '../../../utils/responsive.dart';
import '../../../utils/styles.dart';
import '../../models/main_files/response/get_fc_files.dart';

class ProjectFileCubeWidget extends StatefulWidget {
  final GetFarmComputerFiles? fcFiles;

  const ProjectFileCubeWidget({Key? key, required this.fcFiles})
      : super(key: key);

  @override
  State<ProjectFileCubeWidget> createState() => _ProjectFileCubeWidgetState();
}

class _ProjectFileCubeWidgetState extends State<ProjectFileCubeWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainFilesProvider>(builder: (context, provider, child) {
      return Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              width: getWidth(context),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: widget.fcFiles!.data!.isEmpty
                    ? CustomText(text: 'No Files available for your farm..'.tr())
                    : Wrap(
                        spacing: 41,
                        runSpacing: 40,
                        alignment: Responsive.isMobile(context)
                            ? WrapAlignment.center
                            : widget.fcFiles!.data!.length % 10 == 0
                                ? WrapAlignment.center
                                : WrapAlignment.start,
                        children: [
                          for (int i = 0; i < widget.fcFiles!.data!.length; i++)
                            InkWell(
                              onTap: () {
                                if (widget.fcFiles!.data![i].file!.title!
                                        .split('.')[1]
                                        .toLowerCase() ==
                                    'pdf') {
                                  //  openFileDownloadLink(widget.fcFiles!.data![i].path!, widget.fcFiles!.data![i].fileTitle!.split(".")[0]);

                                } else {}
                                launchUrlNewTab(widget
                                    .fcFiles!.data![i].file!.file!.original!);

                                setState(() {});
                              },
                              child: Column(
                                children: [
                                  widget.fcFiles!.data![i].file!.title!
                                          .contains(".")
                                      ? FaIcon(
                                          widget.fcFiles!.data![i].file!.title!
                                                      .split('.')[1]
                                                      .toLowerCase() ==
                                                  'pdf'
                                              ? FontAwesomeIcons.solidFilePdf
                                              : FontAwesomeIcons.solidFileImage,
                                          size: 80,
                                          color: widget.fcFiles!.data![i].file!
                                                      .title!
                                                      .split('.')[1]
                                                      .toLowerCase() ==
                                                  'pdf'
                                              ? Colors.red
                                              : herbal,
                                        )
                                      : FaIcon(
                                          FontAwesomeIcons.solidFileImage,
                                          size: 80,
                                          color: herbal,
                                        ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  SizedBox(
                                    width: 70,
                                    child: CustomText(
                                      text: widget.fcFiles!.data![i].file!
                                                  .title ==
                                              null
                                          ? ''
                                          : widget
                                              .fcFiles!.data![i].file!.title!
                                              .split(".")[0],
                                      textAligns: TextAlign.center,
                                      lines: 5,
                                      size: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
              ),
            ),
          )
        ],
      );
    });
  }

  void openFileDownloadLink(String href, String filename) {
    document.createElement('a') as AnchorElement
      ..href = href
      ..download = filename
      ..dispatchEvent(Event.eventType('MouseEvent', 'click'));
  }
}
