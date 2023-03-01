


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';

class TicketsDetailsCardWidget extends StatefulWidget {
  final String? title,counts;

    const TicketsDetailsCardWidget(this.title, this.counts,  {Key? key,}) : super(key: key);

  @override
  State<TicketsDetailsCardWidget> createState() => _TicketsDetailsCardWidgetState();
}

class _TicketsDetailsCardWidgetState extends State<TicketsDetailsCardWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 300,
        width: !Responsive.isDesktop(context)
            ? getWidth(context)
            : getWidth(context) / 3,
        padding: EdgeInsets.only(top: 8.0,right: 12,left: 12),
          child: Card(
            elevation: 2.0,
            color:lightGreen,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0,left: 20.0,right: 20.0,bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
              CustomText(
                text: '${widget.title}',
                size: 28,color:Colors.white,weight: FontWeight.w600,),
               CustomText(text: 'Added on: 9-2-2021'.tr(),size: 14,color:Colors.white,weight: FontWeight.w300,),
               CustomText(text: 'Added by: Admin'.tr(),size: 14,color:Colors.white,weight: FontWeight.w300,),
               CustomText(text: 'Status: under_review'.tr(),size: 14,color:Colors.white,weight: FontWeight.w300,),
            ],
            ),
          ),
        ),
      ),
    );
  }
}
