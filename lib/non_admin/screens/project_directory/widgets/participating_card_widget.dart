import 'package:flutter/material.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/app_common_widgets/on_hover.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/images.dart';
import 'package:wij_land/utils/responsive.dart';
import 'package:wij_land/utils/styles.dart';

class ParticipatingCardWidget extends StatelessWidget {
  const ParticipatingCardWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.farmValue,
    required this.onPress,
    required this.thumbImageURL,
  }) : super(key: key);
  final Function()? onPress;
  final String title, date, farmValue, imageUrl, thumbImageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      // height: getHeight(context) / 2.5,
      width: !Responsive.isDesktop(context) ? getWidth(context) : getWidth(context) / 5.5,
      child: OnHover(builder: (hover) {
        return InkWell(
          onTap: onPress,
          child: Material(
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
                  child: imageUrl.isEmpty
                      ? Image.asset(
                    Images.wallpaper,
                    height: getHeight(context) / 4.5,
                    fit: BoxFit.cover,
                  )
                      : Image.network(
                    imageUrl,
                    height: getHeight(context) / 4.5,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return SizedBox(
                        height: getHeight(context) / 4.5,
                        child: Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                : null,
                            strokeWidth: 1,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomText(
                        text: title,
                        color: hover ? Colors.white : darkGreen,
                        size: 20,
                        weight: FontWeight.w600,
                        lines: 1,
                        overflows: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      CustomText(
                        text: date,
                        color: hover ? Colors.white : dark,
                        size: 14,
                        weight: FontWeight.w600,
                      ),
                      SizedBox(height: 8),
                      CustomText(
                        text: farmValue.isEmpty ? "" : "#$farmValue",
                        color: hover ? Colors.white : dark,
                        size: 14,
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