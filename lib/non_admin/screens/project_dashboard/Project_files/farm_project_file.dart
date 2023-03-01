import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/responsive.dart';
import 'package:wij_land/utils/styles.dart';
import 'computer_project_files.dart';
import 'computer_project_my_file_.dart';

class FarmComputerProjectFileScreens extends StatefulWidget {
  const FarmComputerProjectFileScreens({
    Key? key,
    this.prjoectId,
  }) : super(key: key);
  final prjoectId;

  @override
  State<FarmComputerProjectFileScreens> createState() => _FarmComputerProjectFileScreensState();
}

class _FarmComputerProjectFileScreensState extends State<FarmComputerProjectFileScreens> {
  List<bool> projectTextBool = <bool>[];
  List<String> projectText = <String>[
    "My Project Files",
    "Project Files",
  ];

  @override
  void initState() {
    projectTextBool = List.filled(2, false);
    projectTextBool[0] = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Responsive.isMobile(context) ? 5 : 15),
      child: Column(
        children: [
          SizedBox(
            width: getWidth(context),
            //   height: getHeight(context),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                alignment: WrapAlignment.start,
                children: [
                  for (int i = 0; i < 2; i++)
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (projectTextBool.contains(true)) {
                            projectTextBool = List.filled(2, false);
                            projectTextBool[i] = true;
                          } else {
                            projectTextBool[i] = true;
                          }
                        });
                      },
                      child: Transform.translate(
                        offset: projectTextBool[i] ? Offset(0.0, 1.5) : Offset(0, 0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: projectTextBool[i] ? darkGreen : Colors.transparent, width: projectTextBool[i] ? 2 : 0.1))),
                          child: CustomText(
                              text: projectText[i].tr(),
                              size: Responsive.isMobile(context)
                                  ? 12
                                  : Responsive.isTablet(context)
                                      ? 14
                                      : 16,
                              color: projectTextBool[i] ? darkGreen : Colors.black,
                              weight: FontWeight.w600),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),

          /// My project files////////////

          projectTextBool[0]
              ? FarmMyProjectFileScreens(projectId: widget.prjoectId["id"])
              :

              /// project files////////////

              ComputerProjectFilesScreens(projectId: widget.prjoectId['id'])
        ],
      ),
    );
  }
}
