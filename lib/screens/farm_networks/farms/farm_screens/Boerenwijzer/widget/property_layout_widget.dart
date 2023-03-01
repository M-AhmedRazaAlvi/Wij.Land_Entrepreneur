import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/counter_widget.dart';
import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../../../../utils/functions.dart';
import '../../../../../../utils/responsive.dart';

class PropertyLayoutWidget extends StatefulWidget {
  const PropertyLayoutWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PropertyLayoutWidget> createState() => _PropertyLayoutWidgetState();
}

class _PropertyLayoutWidgetState extends State<PropertyLayoutWidget> {
  String property = "Bijenkorf";
  List<String> propertyList = [
    'Bijenkorf',
    'Erfscan-elementen',
    'Vruchtdragende boman',
    "Overige boman en struiken",
    "Nestkasten",
    "Broedplaatsen voor vogels",
    "Voedselhagen",
    "Houtwallen",
    "Takkenrillen",
  ];

  int countFruitMuch = 30,
      countFruittype = 50,
      countWoodwall = 50,
      countNestBoxes = 5,
      countInsectHotels = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomText(text: "How are ditches property?"),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          width: !Responsive.isDesktop(context)
              ? getWidth(context)
              : getWidth(context) * 0.6,
          child: SelectableDropdownWidget(
              widthSize: !Responsive.isDesktop(context)
                  ? getWidth(context) * 0.98
                  : getWidth(context) * 0.58,
              items: propertyList,
              mSelectedValue: "",
              mOnDropDownChange: (value) {},
              mSelectedItemsList: [],
              title: "Which property elements?"),
        ),
        SizedBox(
          height: 10,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 20,
          children: [
            CustomText(
              text: "If fruittrees, how much?",
            ),
            SizedBox(
              width: 120,
              child: CounterWidget(
                count: countFruitMuch,
                onAddTap: () {
                  setState(() {
                    countFruitMuch++;
                  });
                },
                onCloseTap: () {
                  setState(() {
                    countFruitMuch--;
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 20,
          children: [
            CustomText(
              text: "If fruittrees, how many types?",
            ),
            SizedBox(
              width: 120,
              child: CounterWidget(
                count: countFruittype,
                onAddTap: () {
                  setState(() {
                    countFruittype++;
                  });
                },
                onCloseTap: () {
                  setState(() {
                    countFruittype--;
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 20,
          children: [
            CustomText(
              text: "If woodwall, how many meters?",
            ),
            SizedBox(
              width: 120,
              child: CounterWidget(
                count: countWoodwall,
                onAddTap: () {
                  setState(() {
                    countWoodwall++;
                  });
                },
                onCloseTap: () {
                  setState(() {
                    countWoodwall--;
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 20,
          children: [
            CustomText(
              text: "If nest-boxes: how many?",
            ),
            SizedBox(
              width: 120,
              child: CounterWidget(
                count: countNestBoxes,
                onAddTap: () {
                  setState(() {
                    countNestBoxes++;
                  });
                },
                onCloseTap: () {
                  setState(() {
                    countNestBoxes--;
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 20,
          children: [
            CustomText(
              text: "If insect hotels: how many?",
            ),
            SizedBox(
              width: 120,
              child: CounterWidget(
                count: countInsectHotels,
                onAddTap: () {
                  setState(() {
                    countInsectHotels++;
                  });
                },
                onCloseTap: () {
                  setState(() {
                    countInsectHotels--;
                  });
                },
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
