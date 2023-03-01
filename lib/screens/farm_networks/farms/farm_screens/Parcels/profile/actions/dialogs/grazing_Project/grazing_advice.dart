import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/controller.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../../../../../../office/widgets/add_text_button_widget.dart';
import '../biomassProject/card_general_information.dart';
import '../biomassProject/card_map_img.dart';

class GrazingAdviceScreen extends StatefulWidget {
  const GrazingAdviceScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<GrazingAdviceScreen> createState() => _GrazingAdviceScreenState();
}

class _GrazingAdviceScreenState extends State<GrazingAdviceScreen> {
  final TextEditingController actiondate = TextEditingController();
  List<String> actionList = [
    "Amber Lemming",
    "Arjun Milan ",
    " Bob Martin",
  ];

  String? farms = 'Farm of Iona';
  List<String> farmList = [
    'Farm of Iona',
    'Farm of noone',
    'Farm of zikry',
    'Farm of tan',
  ];
  String? season = 'Fall';
  List<String> seasonList = [
    'Fall',
    'Autumn',
    'Spring',
    'Winter',
  ];

  int countBokashi = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Obx(
                () => Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      CustomText(
                        text: menuController.activeItemRoute.value,
                        size: 20,
                        color: secondary,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: CustomText(
              text: "Grazing Project / Grazing Advice",
              size: 25,
              weight: FontWeight.bold,
              color: third,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AddTextButtonWidget(
                text: "Cancel",
                colors: Colors.white,
                onPress: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                width: 10,
              ),
              AddTextButtonWidget(
                text: "Save",
                colors: Colors.yellow,
                onPress: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: getWidth(context),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 20,
              children: [
                SizedBox(
                  width: !Responsive.isDesktop(context)
                      ? getWidth(context)
                      : getWidth(context) * 0.47,
                  child: Column(
                    children: [
                      CardGeneralInformation(
                          farmOgrInfo: true,
                          farms: farms,
                          onClickedFarms: (newValue) {
                            setState(() {
                              farms = newValue;
                            });
                          },
                          farmList: farmList,
                          actionList: actionList,
                          actiondate: actiondate,
                          season: season,
                          onClickedseason: (newValue) {
                            setState(() {
                              season = newValue;
                            });
                          },
                          seasonList: seasonList),
                    ],
                  ),
                ),
                SizedBox(
                  width: !Responsive.isDesktop(context)
                      ? getWidth(context)
                      : getWidth(context) * 0.47,
                  child: CardMapAndImage(),
                )
              ],
            ),
          )
        ]),
      ),
    ));
  }
}
