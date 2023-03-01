import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/menu_popup_widget.dart';
import '../../../../utils/styles.dart';
import '../../widgets/search_widget.dart';

class InspiretionWidgetSmall extends StatelessWidget {
  final String textNeme;
  final String textCoordi;
  final String textDistr;
  final dynamic imgUrl;

  const InspiretionWidgetSmall({
    Key? key,
    required this.textNeme,
    required this.textCoordi,
    required this.textDistr,
    this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            height: 400,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage(imgUrl), fit: BoxFit.cover)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClickIconButton(
                    //  clickcolors: Colors.green,
                    icon: Icons.edit,
                    onPressed: () {}),
                const MenuPopupWidget(contents: ["Delete"]),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: textNeme,
                    color: third,
                    size: 28,
                    weight: FontWeight.bold),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Programme Coordinator : ',
                          style: TextStyle(
                              color: dark,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: textCoordi,
                          style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const CustomText(
                  text: "Programme Description",
                  size: 16,
                  weight: FontWeight.bold,
                ),
                const SizedBox(height: 20),
                CustomText(
                  text: textDistr,
                  size: 16,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
