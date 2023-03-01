import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Boerenwijzer/widget/nutrients_info_widget.dart';

import '../../../../../../app_common_widgets/counter_widget.dart';
import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../utils/functions.dart';
import '../../../../../../utils/responsive.dart';
import '../../../../../../utils/styles.dart';

class NutrientsWidget extends StatefulWidget {
  const NutrientsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<NutrientsWidget> createState() => _NutrientsWidgetState();
}

class _NutrientsWidgetState extends State<NutrientsWidget> {
  int countNkg = 0;
  int countNH3Kg = 0;

  List<bool> blockList = <bool>[];

  @override
  void initState() {
    super.initState();
    blockList = List.filled(6, false);
  }

  List<Color> blockColors = <Color>[
    third,
    lightGreen,
    Colors.pink,
    yellow,
    primary,
    Colors.purple,
  ];
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
  bool blockChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: "GVE"),
        SizedBox(
          height: 5,
        ),
        Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(
              width: !Responsive.isDesktop(context)
                  ? getWidth(context) * 0.8
                  : getWidth(context) / 8,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black12),
              child: CustomText(text: "0.24242"),
            ),
            InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox();
                      });
                },
                child: Icon(Icons.info_outline)),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        CustomText(text: "GVE_ha"),
        SizedBox(
          height: 5,
        ),
        Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(
              width: !Responsive.isDesktop(context)
                  ? getWidth(context) * 0.8
                  : getWidth(context) / 8,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black12),
              child: CustomText(text: "0.24242"),
            ),
            InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox();
                      });
                },
                child: Icon(Icons.info_outline)),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        CustomText(text: "N(kg/ha)"),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          width: !Responsive.isDesktop(context)
              ? getWidth(context)
              : getWidth(context) / 6,
          child: CounterWidget(
            count: countNkg,
            onAddTap: () {
              setState(
                () {
                  countNkg++;
                },
              );
            },
            onCloseTap: () {
              setState(
                () {
                  countNkg--;
                },
              );
            },
          ),
        ),
        SizedBox(
          height: 5,
        ),
        CustomText(text: "NH3(kg/ha)"),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          width: !Responsive.isDesktop(context)
              ? getWidth(context)
              : getWidth(context) / 6,
          child: CounterWidget(
            count: countNH3Kg,
            onAddTap: () {
              setState(
                () {
                  countNH3Kg++;
                },
              );
            },
            onCloseTap: () {
              setState(
                () {
                  countNH3Kg--;
                },
              );
            },
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
                      child: NutrientsInfoWidget(
                        first: true,
                        child: Container(),
                        parcelLevel: "Parcel Level",
                        manureTpye: "Manure type",
                        fertilization: "If Fertilizer,Type?",
                        method: "Method Fertilization",
                        solidManure: "% Solid Manure",
                        size: !Responsive.isDesktop(context)
                            ? getWidth(context) / 2
                            : !Responsive.isDesktop(context)
                                ? getWidth(context) / 5
                                : !Responsive.isDesktop(context)
                                    ? getWidth(context) / 6
                                    : getWidth(context) / 8,
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
                            child: NutrientsInfoWidget(
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
                              method: "",
                              solidManure: "",
                              size: !Responsive.isDesktop(context)
                                  ? getWidth(context) / 2
                                  : !Responsive.isDesktop(context)
                                      ? getWidth(context) / 5
                                      : !Responsive.isDesktop(context)
                                          ? getWidth(context) / 6
                                          : getWidth(context) / 8,
                              blockChild: Wrap(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        blockChecked = !blockChecked;
                                      });
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              blockChecked ? 5 : 0),
                                          color: blockColors[i],
                                          border: Border.all(
                                              color: Colors.black, width: 2)),
                                    ),
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
                                      for (int i = 0; i < 6; i++)
                                        NutrientsInfoWidget(
                                          second: true,
                                          first: false,
                                          child: Container(),
                                          parcelLevel: "",
                                          manureTpye: "",
                                          fertilization: "",
                                          method: "",
                                          solidManure: "",
                                          size: !Responsive.isDesktop(context)
                                              ? getWidth(context) / 2
                                              : !Responsive.isDesktop(context)
                                                  ? getWidth(context) / 5
                                                  : !Responsive.isDesktop(
                                                          context)
                                                      ? getWidth(context) / 6
                                                      : getWidth(context) / 8,
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
