import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/on_hover.dart';

class GroundWaterWidget extends StatefulWidget {
  const GroundWaterWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<GroundWaterWidget> createState() => _GroundWaterWidgetState();
}

class _GroundWaterWidgetState extends State<GroundWaterWidget> {
  int counter = 0;
  bool clicked = false;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 20,
        children: [
          CustomText(
            text: "Trench Water Level",
            size: 16,
          ),
          Container(
            width: 120,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    color: clicked ? Colors.black : Colors.black26,
                    width: clicked ? 2 : 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "${counter}", color: Colors.grey),
                Column(
                  children: [
                    OnHover(
                      builder: (hover) => InkWell(
                        onTap: () {
                          setState(() {
                            counter++;
                            if (clicked = true) {
                              clicked = true;
                            } else {
                              clicked = false;
                            }
                          });
                        },
                        child: Icon(
                          Icons.arrow_drop_up_sharp,
                          size: 18,
                        ),
                      ),
                    ),
                    OnHover(
                      builder: (hover) => InkWell(
                        onTap: () {
                          setState(() {
                            counter--;
                            if (clicked = true) {
                              clicked = true;
                            } else {
                              clicked = false;
                            }
                          });
                        },
                        child: Icon(
                          Icons.arrow_drop_down_sharp,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
