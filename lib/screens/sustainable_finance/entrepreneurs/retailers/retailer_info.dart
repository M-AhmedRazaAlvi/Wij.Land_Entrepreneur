import 'package:flutter/material.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/real_check_box_widget.dart';

class RetailerInfoWidget extends StatefulWidget {
  const RetailerInfoWidget({
    Key? key,
    required this.size,
    this.onAllChange,
    this.onAllValue,
    this.weight,
    required this.reName,
    required this.reType,
    required this.reAddress,
    required this.reWebsite,
    required this.isHeader,
     this.optionValue='Option',
    required this.rePhone,
    this.dropDownEdit,
    this.width,
  }) : super(key: key);
  final String reName;
  final String reType;
  final String reAddress;
  final String reWebsite;
  final String rePhone,optionValue;
  final double size;
  final bool isHeader;
  final Widget? dropDownEdit;
  final weight, onAllChange, onAllValue;
  final width;
  @override
  State<RetailerInfoWidget> createState() => _RetailerInfoWidgetState();
}

class _RetailerInfoWidgetState extends State<RetailerInfoWidget> {
  late bool checkContactInfo = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: dimMetalic,width: 0.1))),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: widget.width / 3,
                child: RealCheckBoxWidget(
                    value: widget.onAllValue,
                    onChanged: widget.onAllChange,
                    Labeltext: ""),
              ),
              SizedBox(
                width: widget.width,
                child: CustomText(
                  text: widget.reName,
                  size: widget.size,
                  weight: widget.weight,
                ),
              ),
              SizedBox(
                width: widget.width,
                child: CustomText(
                  text: widget.reType,
                  size: widget.size,
                  weight: widget.weight,
                ),
              ),
              SizedBox(
                width: widget.width,
                child: CustomText(
                  text: widget.reAddress,
                  size: widget.size,
                  textAligns: TextAlign.start,
                  weight: widget.weight,
                ),
              ),
              SizedBox(
                width: widget.width,
                child: CustomText(
                  text: widget.reWebsite,
                  size: widget.size,
                  weight: widget.weight,
                ),
              ),
              SizedBox(
                width: widget.width,
                child: CustomText(
                  text: widget.rePhone,
                  size: widget.size,
                  weight: widget.weight,
                ),
              ),
            /* (widget.isHeader) ?SizedBox(
               width: widget.width,
               child: CustomText(
                 text: widget.optionValue,
                 size: widget.size,
                 weight: widget.weight,
               ),
             ): SizedBox(width: widget.width/2, child: widget.dropDownEdit),*/
            ],
          ),
        ],
      ),
    );
  }
}
