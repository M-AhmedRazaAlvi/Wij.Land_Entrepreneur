import 'package:flutter/material.dart';
import 'package:wij_land/screens/office/office_programes/Widgets/add_programes_dialog.dart';
import 'package:wij_land/screens/office/office_programes/Widgets/inspiretion_widget_small.dart';

import '../../../app_common_widgets/custom_text.dart';
import '../../../utils/images.dart';
import '../../../utils/styles.dart';
import '../widgets/add_button.dart';
import '../widgets/search_widget.dart';

class OfficeProgrammesSmall extends StatelessWidget {
  const OfficeProgrammesSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomText(text: "Office/Programme", size: 16),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        text: "Programmes",
                        size: 30,
                        color: third,
                        weight: FontWeight.bold),
                    Row(
                      children: [
                        ClickIconButton(icon: Icons.search, onPressed: () {}),
                        ClickIconButton(icon: Icons.filter_alt, onPressed: () {}),
                        ButtonWithAddIcon(
                          text: "Programme",
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AddProgrammesDialog();
                                });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const InspiretionWidgetSmall(
                  imgUrl: Images.wallpaper,
                  textNeme: "Inspiration",
                  textCoordi: 'Mythili Kamath',
                  textDistr:
                      "Structuring the outreach, education and inspiration projects in our community with the ambition of cultivating an inspired and active community. d",
                ),
                const SizedBox(
                  height: 20,
                ),
                const InspiretionWidgetSmall(
                  imgUrl: Images.wallpaperimg,
                  textNeme: "Sustainable Farming",
                  textCoordi: 'Julie1 Solano',
                  textDistr:
                      "Structuring the outreach, education and inspiration projects in our community with the ambition of cultivating an inspired and active community.",
                ),
              ]),
        ),
      ),
    );
  }
}
