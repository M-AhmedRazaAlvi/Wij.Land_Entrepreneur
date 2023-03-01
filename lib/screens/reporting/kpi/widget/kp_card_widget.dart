import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/on_hover.dart';
import '../../../../utils/styles.dart';


class KpiCardWidget extends StatefulWidget {
  final String? title,counts,date;
  final Function()? onPress;

    const KpiCardWidget(this.title, this.counts, this.date, {Key? key,required this.onPress}) : super(key: key);

  @override
  State<KpiCardWidget> createState() => _KpiCardWidgetState();
}

class _KpiCardWidgetState extends State<KpiCardWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        padding: EdgeInsets.only(top: 8.0,right: 12,left: 12),
          child: OnHover(
            builder: (isHover) {
              return InkWell(
                onTap: widget.onPress,
                child: Card(
                  elevation: 2.0,
                  color: isHover?lightGreen:Colors.white,

                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0,left: 20.0,right: 20.0,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                    CustomText(
                      text: '${widget.title}',
                      size: 16,color:isHover?Colors.white: ivoryBlack,weight: FontWeight.w600,textAligns: TextAlign.start,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        CustomText(text: '${widget.counts}',size: 34,color:isHover?Colors.white: lightGreen,
                        weight: FontWeight.w400,),
                        CustomText(text: '${widget.date}',size: 18,color: isHover?Colors.white:ivoryBlack,weight: FontWeight.w300,),
                      ],
                    ),
                  ],
                  ),
                ),
        ),
              );
            }
          ),
      );
  }
}
