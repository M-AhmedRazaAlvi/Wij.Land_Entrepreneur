import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Boerenwijzer/widget/soil_info_widget.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../utils/functions.dart';
import '../../../../../../utils/responsive.dart';
import '../../../../../../utils/styles.dart';

class SoilStructureWidget extends StatefulWidget {
  const SoilStructureWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SoilStructureWidget> createState() => _SoilStructureWidgetState();
}

class _SoilStructureWidgetState extends State<SoilStructureWidget> {
  List<bool> blockList = <bool>[];

  @override
  void initState() {
    super.initState();
    blockList = List.filled(6, false);
  }

  List<String> blocktextList = [
    "Block 1",
    "Block 2",
    "Block 3",
    "Block 4",
    "Block 5",
    "Block 6",
    "Block 7",
  ];
  List<String> textList = [
    "p01",
    "p02",
    "p03",
    "p04",
    "p05",
    "p06",
    "p07",
  ];
  List<Color> blockColors = <Color>[
    third,
    lightGreen,
    Colors.pink,
    yellow,
    primary,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: SizedBox(
            height: 40 * 30,
            width: getWidth(context),
            child: ListView(
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: Colors.transparent, width: 8))),
                      child: SoilStructureInfoWidget(
                        first: true,
                        child: Container(),
                        parcelLevel: "Parcel Level",
                        manureTpye: "Year till age?",
                        fertilization: "Type till age?",
                        size: !Responsive.isDesktop(context)
                            ? getWidth(context) / 2
                            : !Responsive.isDesktop(context)
                                ? getWidth(context) / 3
                                : getWidth(context) / 6,
                      ),
                    ),
                    for (int i = 0; i < 6; i++)
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: Colors.transparent, width: 8))),
                            child: SoilStructureInfoWidget(
                              second: false,
                              first: false,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.white),
                                        borderRadius: BorderRadius.circular(5)),
                                    value: blockList[i],
                                    onChanged: (value) {
                                      setState(() {
                                        blockList[i] = !blockList[i];
                                      });
                                    }),
                              ),
                              parcelLevel: "",
                              manureTpye: "",
                              fertilization: "",
                              size: !Responsive.isDesktop(context)
                                  ? getWidth(context) / 2
                                  : !Responsive.isDesktop(context)
                                      ? getWidth(context) / 3
                                      : getWidth(context) / 6,
                              blockChild: Wrap(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        color: blockColors[i],
                                        border: Border.all(
                                            color: Colors.black, width: 2)),
                                  ),
                                  CustomText(text: blocktextList[i])
                                ],
                              ),
                            ),
                          ),
                          blockList[i]
                              ? Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          left: BorderSide(
                                              color: third, width: 8))),
                                  child: Column(
                                    children: [
                                      for (int i = 0; i < 4; i++)
                                        SoilStructureInfoWidget(
                                          second: true,
                                          first: false,
                                          child: Container(),
                                          parcelLevel: "",
                                          manureTpye: "",
                                          fertilization: "",
                                          size: !Responsive.isDesktop(context)
                                              ? getWidth(context) / 2
                                              : !Responsive.isDesktop(context)
                                                  ? getWidth(context) / 3
                                                  : getWidth(context) / 6,
                                          blockChild: Wrap(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                    color: lightGreen,
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 2)),
                                              ),
                                              CustomText(text: textList[i])
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                )
                              : Container()
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
