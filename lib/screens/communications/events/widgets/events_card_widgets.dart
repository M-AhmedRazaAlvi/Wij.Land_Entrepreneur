import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/on_hover.dart';
import '../../../../utils/images.dart';
import '../../../../utils/styles.dart';

class EventsCardWidget extends StatelessWidget {
  const EventsCardWidget(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.location,
      required this.date,
      required this.status,
      required this.onPress})
      : super(key: key);
  final onPress;
  final String title, date, location, status, imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: 350,
      height: 395,
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
            color: hover ? Colors.green : Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                    ),
                    child: Image.asset(
                      Images.wallpaper,
                      height: 180,
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12),
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
                        text: 'Location : $location',
                        color: hover ? Colors.white : dark,
                        size: 14,
                        weight: FontWeight.w400,
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
                        text: 'Status : $status',
                        color: hover ? Colors.white : dark,
                        size: 14,
                        weight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 25,
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
