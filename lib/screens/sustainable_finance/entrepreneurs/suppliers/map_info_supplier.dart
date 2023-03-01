import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:wij_land/app_common_widgets/real_check_box_widget.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../../app_common_widgets/custom_text.dart';

class MapSupplierInfoWidget extends StatefulWidget {
  MapSupplierInfoWidget(
      {Key? key,
      required this.size,
      this.weight,
      required this.farmName,
      required this.farmRep,
      required this.farmConnect,
      required this.farmRelation,
      this.supplierid,
      this.onTap,
      this.isExpand = false,
      this.toolTipMessage,
      required this.isChecked,
      this.value,
      this.onChanged,
      this.width})
      : super(key: key);
  final String farmName;
  final String farmRep, farmRelation, farmConnect;
  String? toolTipMessage;

  final double size;
  final dynamic onTap;
  final weight;
  final supplierid;
  final width;
  final value;
  final onChanged;

  bool? isChecked = false, isExpand;

  @override
  State<MapSupplierInfoWidget> createState() => _MapSupplierInfoWidgetState();
}

class _MapSupplierInfoWidgetState extends State<MapSupplierInfoWidget> {
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
    final overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox?;

    var targetGlobalCenter = renderBox.localToGlobal(renderBox.size.centerLeft(Offset.zero), ancestor: overlay);

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
      touchThrougArea: Rect.fromLTWH(targetGlobalCenter.dx - 5, targetGlobalCenter.dy - 10, 10.0, 50.0),
      touchThroughAreaShape: ClipAreaShape.rectangle,
      content: Material(
          child: Container(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 8),
        child: Text(
          value!,
          softWrap: true,
          style: TextStyle(fontFamily: Montserrat_Medium),
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
        // width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: widget.width / 3.5,
                  child: widget.isChecked! ? RealCheckBoxWidget(value: widget.value, onChanged: widget.onChanged, Labeltext: "") : SizedBox(),
                ),
                SizedBox(
                  width: widget.width,
                  child: CustomText(
                    textAligns: TextAlign.left,
                    text: widget.farmName,
                    size: widget.size,
                    weight: widget.weight,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: widget.width,
                  child: CustomText(
                    text: widget.farmRep,
                    size: widget.size,
                    textAligns: TextAlign.left,
                    weight: widget.weight,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: widget.width,
                  child: CustomText(
                    text: widget.farmRelation,
                    size: widget.size,
                    textAligns: TextAlign.left,
                    weight: widget.weight,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(height: 12,),
            widget.isExpand!
                ? Padding(
              padding:  EdgeInsets.only(left: getWidth(context)*0.05,bottom: 8),
              child: Row(
                children: [
                  SizedBox(
                    width: widget.width,
                    child: CustomText(
                      text: 'Connected'.tr(),
                      size: 14,
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
                      text: widget.farmConnect,
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
