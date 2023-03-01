import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../utils/styles.dart';

class KpiDetailsCardWidget extends StatefulWidget {
  final String? title,counts;

    const KpiDetailsCardWidget(this.title, this.counts,  {Key? key,}) : super(key: key);

  @override
  State<KpiDetailsCardWidget> createState() => _KpiDetailsCardWidgetState();
}

class _KpiDetailsCardWidgetState extends State<KpiDetailsCardWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 300,
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
              CustomText(
                text: '${widget.title}',
                size: 28,color:Colors.white,weight: FontWeight.w300,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  CustomText(text: '${widget.counts}',size: 40,color:Colors.white,weight: FontWeight.w600,),
                ],
              ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}
