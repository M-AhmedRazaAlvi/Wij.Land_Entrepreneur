import 'package:flutter/material.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import '../../../../../utils/responsive.dart';

class FarmProjectFileInfoWidget extends StatelessWidget {
  const FarmProjectFileInfoWidget({
    Key? key,
    required this.first,
    required this.size,
    required this.fileName,
    required this.addedBy,
    required this.dateBy,
    this.onFileTap,
    required this.totalRow,
    required this.fileType,
    this.starIcon,
    this.onStarTap,
  }) : super(key: key);
  final bool first;
  final String fileName, fileType, addedBy, dateBy, totalRow;
  final starIcon;
  final onStarTap;
  final onFileTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: Responsive.isMobile(context) ? 0 : 15),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black26))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (first)
            SizedBox(
              width: Responsive.isMobile(context) ? size / 2 : size / 4,
            )
          else
            SizedBox(
              width: Responsive.isMobile(context) ? size / 2 : size / 4,
              child: IconButton(
                alignment: Alignment.center,
                splashRadius: Responsive.isMobile(context) ? 10 : 20,
                padding: EdgeInsets.only(right: 1),
                onPressed: onStarTap,
                icon: starIcon,
                iconSize: Responsive.isMobile(context) ? 18 : 26,
              ),
            ),
          if (first)
            SizedBox(
              width: size / 2,
            )
          else
            SizedBox(
              width: size / 2,
              child: InkWell(
                onTap: onFileTap,
                child: Icon(
                  Icons.file_present,
                  size: Responsive.isMobile(context) ? 18 : 26,
                ),
              ),
            ),
          SizedBox(
            width: size * 1.8,
            child: CustomText(
              lines: 2,
              overflows: TextOverflow.visible,
              textAligns: TextAlign.left,
              text: fileName,
              size: Responsive.isMobile(context)
                  ? first
                      ? 10
                      : 9
                  : first
                      ? 16
                      : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: Responsive.isMobile(context) ? 5 : 20),
            width: size * 1.2,
            child: CustomText(
              lines: 2,
              textAligns: TextAlign.left,
              text: fileType,
              size: Responsive.isMobile(context)
                  ? first
                      ? 10
                      : 9
                  : first
                      ? 16
                      : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: Responsive.isMobile(context) ? 5 : 20),
            width: size * 1.2,
            child: CustomText(
              lines: 2,
              overflows: TextOverflow.visible,
              textAligns: TextAlign.left,
              text: addedBy,
              size: Responsive.isMobile(context)
                  ? first
                      ? 10
                      : 9
                  : first
                      ? 16
                      : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: Responsive.isMobile(context) ? 5 : 20),
            width: size * 1.2,
            child: CustomText(
              lines: 2,
              textAligns: TextAlign.left,
              text: dateBy,
              size: Responsive.isMobile(context)
                  ? first
                      ? 10
                      : 9
                  : first
                      ? 16
                      : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: Responsive.isMobile(context) ? 5 : 20),
            width: size * 1,
            child: CustomText(
              lines: 2,
              textAligns: TextAlign.left,
              text: totalRow,
              size: Responsive.isMobile(context)
                  ? first
                      ? 10
                      : 9
                  : first
                      ? 16
                      : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
