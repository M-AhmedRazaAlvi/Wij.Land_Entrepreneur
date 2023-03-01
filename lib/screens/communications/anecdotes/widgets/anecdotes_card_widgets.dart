import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/on_hover.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/images.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';

class AnecdotesCardWidget extends StatelessWidget {
  const AnecdotesCardWidget(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.date,
      required this.status,
      required this.onPress})
      : super(key: key);
  final onPress;
  final String title, date, status, imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      height: getHeight(context) / 1.5,
      width: !Responsive.isDesktop(context)
          ? getWidth(context)
          : getWidth(context) / 3.5,
      child: OnHover(builder: (hover) {
        return InkWell(
          onTap: onPress,
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(12),
              ),
            ),
            color: hover ? lightGreen : Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                    ),
                    child: Image.asset(
                      Images.wallpaperimg,
                      height: getHeight(context) / 3,
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomText(
                        text: title,
                        color: hover ? Colors.white : darkGreen,
                        size: 20,
                        weight: FontWeight.w600,
                      ),
                      SizedBox(height: 8),
                      CustomText(
                        text: date,
                        color: hover ? Colors.white : dark,
                        size: 14,
                        weight: FontWeight.w400,
                      ),
                      SizedBox(height: 8),
                      CustomText(
                        text: status,
                        color: hover ? Colors.white : dark,
                        size: 14,
                        weight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomText(
                        text: 'Read more',
                        color: hover ? Colors.white : darkGreen,
                        size: 20,
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
