import 'package:flutter/material.dart';
import 'package:wij_land/screens/office/wij_lan_team/person_profile/File_Screens/Widgets/view_all_widget.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../utils/functions.dart';

class CheckedViewWidget extends StatefulWidget {
  const CheckedViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckedViewWidget> createState() => _CheckedViewWidgetState();
}

class _CheckedViewWidgetState extends State<CheckedViewWidget> {
  bool first = false, second = true, all = true, media = false, documents = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: getWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(right: 40),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black26)),
              ),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      setState(
                        () {
                          all = true;
                          media = false;
                          documents = false;
                        },
                      );
                    },
                    child: Transform.translate(
                      offset: all ? Offset(0.0, 1.5) : Offset(0, 0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration:
                            BoxDecoration(border: Border(bottom: BorderSide(color: all ? Colors.black : Colors.black26, width: all ? 2 : 0.1))),
                        child: CustomText(
                          text: "All",
                          size: all ? 20 : 16,
                          weight: all ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(
                        () {
                          all = false;
                          media = true;
                          documents = false;
                        },
                      );
                    },
                    child: Transform.translate(
                      offset: media ? Offset(0.0, 1.5) : Offset(0, 0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration:
                            BoxDecoration(border: Border(bottom: BorderSide(color: media ? Colors.black : Colors.black26, width: media ? 2 : 0.1))),
                        child: CustomText(
                          text: "Media",
                          size: media ? 20 : 16,
                          weight: media ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(
                        () {
                          all = false;
                          media = false;
                          documents = true;
                        },
                      );
                    },
                    child: Transform.translate(
                      offset: documents ? Offset(0.0, 1.5) : Offset(0, 0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: documents ? Colors.black : Colors.black26, width: documents ? 2 : 0.1))),
                        child: CustomText(
                          text: "Documents",
                          size: documents ? 20 : 16,
                          weight: documents ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            all
                ? SizedBox(
                    height: 300,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        for (var i = 0; i <= 1; i++) ViewAllWidget(),
                      ],
                    ),
                  )
                : Container(),
            media
                ? SizedBox(
                    height: 300,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        for (var i = 0; i < 2; i++) const ViewAllWidget(),
                      ],
                    ))
                : Container(),
            documents
                ? SizedBox(
                    height: 300,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        for (var i = 0; i < 3; i++) const ViewAllWidget(),
                      ],
                    ))
                : Container(),
          ],
        ),
      ],
    );
  }
}
