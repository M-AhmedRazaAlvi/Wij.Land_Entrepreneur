import 'package:flutter/material.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';

class FarmComputerFileInfoWidget extends StatelessWidget {
  const FarmComputerFileInfoWidget({
    Key? key,
    required this.first,
    required this.size,
    required this.fileName,
    required this.total,
    required this.fileProject,
    required this.addedBy,
    required this.dateBy,
    required this.starColor,
    required this.fileParcel,
    required this.starIcon,
    this.onFileTap, this.nameClick, this.projectClick, this.parcelClick, this.addedbyClick, this.dateByClick,
  }) : super(key: key);
  final bool first;
  final String fileName, fileProject, fileParcel, addedBy, dateBy,total;
  final dynamic onFileTap,nameClick,projectClick,parcelClick,addedbyClick,dateByClick;
  final double size;
  final Color starColor;
  final IconData starIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: getWidth(context),
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 12),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black26))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (first)
            SizedBox(
              width: size / 6,
            )
          else
            SizedBox(
              width: size / 6,
              child: Icon(starIcon,
              color: starColor,),
            ),
          const SizedBox(
            width: 20,
          ),
        /*  if (first)
            SizedBox(
              width: size / 2,
            )
          else
            SizedBox(
              width: size / 2,
              child: InkWell(
                onTap: onFileTap,
                child: const Icon(
                  Icons.file_present,
                ),
              ),
            ),
          const SizedBox(
            width: 20,
          ),*/
          SizedBox(
            width: size * 1.5,
            child: first?InkWell(
              onTap: nameClick,
              child: CustomText(
                textAligns: TextAlign.left,
                text: fileName,
                weight: first ? FontWeight.bold : FontWeight.normal,
              ),
            ): CustomText(
              textAligns: TextAlign.left,
              text: fileName,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: size * 1.5,
            child: first?InkWell(
              onTap: projectClick,
              child: CustomText(
                textAligns: TextAlign.left,
                text: fileProject,
                weight: first ? FontWeight.bold : FontWeight.normal,
              ),
            ):CustomText(
              textAligns: TextAlign.left,
              text: fileProject,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: size * 1.5,
            child:first?InkWell(
              onTap: parcelClick,
              child: CustomText(
                textAligns: TextAlign.left,
                text: fileParcel,
                weight: first ? FontWeight.bold : FontWeight.normal,
              ),
            ): CustomText(
              textAligns: TextAlign.left,
              text: fileParcel,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: size * 1.5,
            child:first?InkWell(
              onTap: addedbyClick,
              child: CustomText(
                textAligns: TextAlign.left,
                text: addedBy,
                weight: first ? FontWeight.bold : FontWeight.normal,
              ),
            ) :CustomText(
              textAligns: TextAlign.left,
              text: addedBy,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: size * 1,
            child: first?InkWell(
              onTap: dateByClick,
              child: CustomText(
                textAligns: TextAlign.left,
                text: dateBy,
                weight: first ? FontWeight.bold : FontWeight.normal,
              ),
            ):CustomText(
              textAligns: TextAlign.left,
              text: dateBy,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          if (first)
            SizedBox(
              width: size / 1.5,
              child: CustomText(text: total,textAligns: TextAlign.center,weight: FontWeight.bold,),
            )
          else
            SizedBox(
              width: size / 3,
              child: IconButton(
                  onPressed: () {
                    // showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return const EditInterviewDialogBox();
                    //     });
                  },
                  icon: const Icon(Icons.info_outline)),
            ),
        ],
      ),
    );
  }
}
