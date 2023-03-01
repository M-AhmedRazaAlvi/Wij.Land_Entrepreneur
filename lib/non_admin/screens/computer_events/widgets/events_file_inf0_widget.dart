import 'package:flutter/material.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/responsive.dart';

class EventsFileInfoRowWidget extends StatelessWidget {
  const EventsFileInfoRowWidget({
    Key? key,
    required this.first,
    required this.size,
    required this.check,
    required this.fileName,
    required this.addedBy,
    required this.dateBy,
    this.onFileTap,
    required this.fileType,
    required this.total,
  }) : super(key: key);
  final bool first, check;
  final String fileName, fileType, addedBy, dateBy, total;
  final dynamic onFileTap;

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: Responsive.isMobile(context) ? 0 : 15),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black26))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (first)
            SizedBox(
              width: size / 7,
            )
          else
            SizedBox(
              width: size / 7,
              child: Icon(Icons.star_border, size: Responsive.isMobile(context) ? 15 : 30),
            ),
          SizedBox(
            width: Responsive.isMobile(context) ? 12 : 20,
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
                child: Icon(Icons.file_present, size: Responsive.isMobile(context) ? 15 : 30),
              ),
            ),
          Container(
            padding: EdgeInsets.only(right: Responsive.isMobile(context) ? 5 : 10),
            width: Responsive.isMobile(context) ? size * 1.5 : size * 1.5,
            child: CustomText(
              textAligns: TextAlign.start,
              lines: 3,
              overflows: TextOverflow.ellipsis,
              text: fileName,
              size: first
                  ? Responsive.isMobile(context)
                  ? 11
                  : 14
                  : Responsive.isMobile(context)
                  ? 8
                  : 12,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width: Responsive.isMobile(context) ? size * 1.5 : size,
            child: CustomText(
              textAligns: TextAlign.start,
              lines: 3,
              overflows: TextOverflow.ellipsis,
              text: fileType,
              size: first
                  ? Responsive.isMobile(context)
                  ? 11
                  : 14
                  : Responsive.isMobile(context)
                  ? 8
                  : 12,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: Responsive.isMobile(context) ? 5 : 10),
            width: Responsive.isMobile(context) ? size * 1.5 : size,
            child: CustomText(
              textAligns: TextAlign.start,
              lines: 3,
              overflows: TextOverflow.ellipsis,
              text: addedBy,
              size: first
                  ? Responsive.isMobile(context)
                  ? 11
                  : 14
                  : Responsive.isMobile(context)
                  ? 8
                  : 12,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width: Responsive.isMobile(context) ? size * 1.2 : size,
            child: CustomText(
              textAligns: TextAlign.start,
              lines: 3,
              overflows: TextOverflow.ellipsis,
              text: dateBy,
              size: first
                  ? Responsive.isMobile(context)
                  ? 11
                  : 14
                  : Responsive.isMobile(context)
                  ? 8
                  : 12,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width:  size,
            child: CustomText(
              textAligns: TextAlign.start,
              lines: 3,
              overflows: TextOverflow.ellipsis,
              text: total,
              size: first
                  ? Responsive.isMobile(context)
                  ? 11
                  : 14
                  : Responsive.isMobile(context)
                  ? 8
                  : 12,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
