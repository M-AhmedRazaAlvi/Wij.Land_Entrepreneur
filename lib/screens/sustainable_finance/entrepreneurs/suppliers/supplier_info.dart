import 'package:flutter/material.dart';
import 'package:wij_land/app_common_widgets/real_check_box_widget.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../../app_common_widgets/custom_text.dart';

class SupplierInfo extends StatelessWidget {
  SupplierInfo(
      {Key? key,
      required this.size,
      this.weight,
      required this.farmName,
      required this.farmRep,
      required this.connectedSince,
      required this.relationShip,
      required this.rePhone,
      this.supplierid,
      this.onTap,
      required this.isChecked,
      this.value,
      this.onChanged,
      this.onName,
      this.width})
      : super(key: key);
  final String farmName;
  final String farmRep;
  final String connectedSince;
  final String relationShip;
  final String rePhone;
  final double size;
  final dynamic onTap,onName;
  final weight;
  final supplierid;
  final width;
  final value;
  final onChanged;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: dimMetalic2, width: 0.2))),
        // width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: width / 3,
              child: isChecked
                  ? RealCheckBoxWidget(
                      value: value, onChanged: onChanged, Labeltext: "")
                  : SizedBox(),
            ),
            SizedBox(
              width: width,
              child: InkWell(
                onTap: onName,
                child: CustomText(
                  textAligns: TextAlign.left,
                  text: farmName,
                  size: size,
                  weight: weight,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: width,
              child: CustomText(
                textAligns: TextAlign.left,
                text: farmRep,
                size: size,
                weight: weight,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: width,
              child: CustomText(
                textAligns: TextAlign.left,
                text: connectedSince,
                size: size,
                weight: weight,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: width,
              child: CustomText(
                textAligns: TextAlign.left,
                text: relationShip,
                size: size,
                weight: weight,
              ),
            ),
            SizedBox(
              width: 10,
            ),
          /*  SizedBox(
              width: width,
              child: CustomText(
                textAligns: TextAlign.left,
                text: rePhone,
                size: size,
                weight: weight,
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
