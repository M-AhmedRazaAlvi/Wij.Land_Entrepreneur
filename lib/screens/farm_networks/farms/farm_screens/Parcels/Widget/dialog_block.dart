import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/icon_text_container.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../../../office/widgets/add_text_button_widget.dart';

class BlockDialogWidget extends StatefulWidget {
  const BlockDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<BlockDialogWidget> createState() => _BlockDialogWidgetState();
}

class _BlockDialogWidgetState extends State<BlockDialogWidget> {
  bool onclicked = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AddTextButtonWidget(
              text: "Save Blocks",
              colors: Colors.yellowAccent,
              onPress: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
                size: 30,
              ),
            ),
          ],
        ),
        content: SizedBox(
          width: getWidth(context) * 0.6,
          child: Column(
            children: [
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  SizedBox(
                      width: !Responsive.isDesktop(context)
                          ? getWidth(context)
                          : getWidth(context) * 0.28,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Unselected",
                            size: 18,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 50 * 20,
                            child: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                for (int i = 1; i <= 20; i++)
                                  Container(
                                    width: getWidth(context),
                                    margin: EdgeInsets.only(bottom: 10),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: Colors.black38, width: 2)),
                                    child: Wrap(
                                      alignment: WrapAlignment.spaceBetween,
                                      children: const [
                                        CustomText(text: "P04"),
                                        Icon(Icons.add)
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                      width: !Responsive.isDesktop(context)
                          ? getWidth(context)
                          : getWidth(context) * 0.28,
                      child: Column(
                        children: [
                          SizedBox(
                              width: getWidth(context),
                              child: IconAndTextContainer(
                                  onTap: () {}, addText: "Block")),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 50 * 5,
                            child: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                for (int i = 1; i <= 2; i++)
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        onclicked = !onclicked;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          width: getWidth(context),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: onclicked
                                                      ? Colors.black
                                                      : hoverColor,
                                                  width: onclicked ? 1 : 2)),
                                          child: Wrap(
                                            alignment:
                                                WrapAlignment.spaceBetween,
                                            children: [
                                              Wrap(
                                                children: [
                                                  Container(
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                        color: third,
                                                        border: Border.all(
                                                            color: Colors.black,
                                                            width: 2)),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  CustomText(text: "Block"),
                                                  CustomText(text: "1"),
                                                ],
                                              ),
                                              Icon(Icons.add)
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
