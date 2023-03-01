import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../../utils/functions.dart';

class RetailerMapInfoWidget extends StatefulWidget {
  RetailerMapInfoWidget({
    Key? key,
    required this.size,
    this.onAllChange,
    this.onAllValue,
    this.weight,
    required this.reName,
    required this.reType,
    this.toolTipMessge,
    required this.rePhone,
    this.dropDownEdit,
    this.isExpand=false,
    this.width,required this.reAddress,required this.reWeb, this.onTap,
  }) : super(key: key);
  final String reName;
  final String reType;
  final String reAddress;
  bool? isExpand;
  final dynamic onTap;
  final String rePhone;
  final String reWeb;
  final double size;
  final Widget? dropDownEdit;
  final weight, onAllChange, onAllValue;
  final width;
  String? toolTipMessge;
  @override
  State<RetailerMapInfoWidget> createState() => _RetailerMapInfoWidgetState();
}

class _RetailerMapInfoWidgetState extends State<RetailerMapInfoWidget> {
  late bool checkContactInfo = false;
  SuperTooltip? tooltip;

  Future<bool> _willPopCallback() async {
    // If the tooltip is open we don't pop the page on a backbutton press
    // but close the ToolTip
    if (tooltip!.isOpen) {
      tooltip!.close();
      return false;
    }
    return true;
  }

  void onTap({String? value}) {
    if (tooltip != null && tooltip!.isOpen) {
      tooltip!.close();
      return;
    }

    var renderBox = context.findRenderObject() as RenderBox;
    final overlay =
        Overlay.of(context)!.context.findRenderObject() as RenderBox?;

    var targetGlobalCenter = renderBox.localToGlobal(
        renderBox.size.centerLeft(Offset.zero),
        ancestor: overlay);

    // We create the tooltip on the first use
    tooltip = SuperTooltip(
      popupDirection: TooltipDirection.down,
      arrowTipDistance: 1.0,
      arrowBaseWidth: 10.0,
      arrowLength: 10.0,
      maxWidth: 150,
      maxHeight: 200,
      borderColor: Colors.transparent,
      borderWidth: 1.0,
      left: 50,
      closeButtonSize: 16,
      showCloseButton: ShowCloseButton.none,
      minimumOutSidePadding: 0,
      hasShadow: false,
      touchThrougArea: Rect.fromLTWH(
          targetGlobalCenter.dx - 5, targetGlobalCenter.dy - 10, 10.0, 50.0),
      touchThroughAreaShape: ClipAreaShape.rectangle,
      content: Material(
          child: Container(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 8),
        child: Text(
          value!,
          softWrap: true,
        ),
      )),
    );

    tooltip!.show(context);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: dimGrey, width: 0.1))),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: widget.width / 3.5,
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
                    text: widget.rePhone,
                    size: widget.size,
                    weight: widget.weight,
                  ),
                ),

                //SizedBox(width: widget.width, child: widget.dropDownEdit),
              ],
            ),
            SizedBox(height: 12,),
            widget.isExpand!
                ? Padding(
              padding:  EdgeInsets.only(left: getWidth(context)*0.04,bottom: 8),
              child: Row(
                children: [
                  SizedBox(
                    width: widget.width,
                    child: CustomText(
                      text: 'Website'.tr(),
                      size: 13,
                      textAligns: TextAlign.left,
                      weight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: widget.width,
                    child: CustomText(
                      text: widget.reWeb,
                      size: widget.size-2,
                      textAligns: TextAlign.left,
                      weight: widget.weight,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
                : SizedBox.shrink(),
            SizedBox(height: 8,),
            widget.isExpand!
                ? Padding(
              padding:  EdgeInsets.only(left: getWidth(context)*0.04,bottom: 8),
              child: Row(
                children: [
                  SizedBox(
                    width: widget.width,
                    child: CustomText(
                      text: 'Address #'.tr(),
                      size: 13,
                      textAligns: TextAlign.left,
                      weight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: widget.width,
                    child: CustomText(
                      text: widget.reAddress,
                      size: widget.size-2,
                      textAligns: TextAlign.left,
                      weight: widget.weight,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
                : SizedBox.shrink(),
            SizedBox(height: 2,),
          ],
        ),
      ),
    );
  }
}
