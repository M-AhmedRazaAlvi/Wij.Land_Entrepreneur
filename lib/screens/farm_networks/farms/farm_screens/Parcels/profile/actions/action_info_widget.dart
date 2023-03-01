import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../office/wij_lan_team/person_profile/Contact_moments/widget/contact_info_row.dart';

class ParcelActionInfoWidget extends StatelessWidget {
  const ParcelActionInfoWidget({
    Key? key,
    required this.first,
    required this.size,
    required this.check,
    required this.action,
    required this.actionDate,
    required this.actionDoneBy,
    required this.parcels,
    required this.subParcel,
    required this.report,
    required this.actionImg,
  }) : super(key: key);
  final bool first, check;
  final String action,
      actionDate,
      actionDoneBy,
      parcels,
      subParcel,
      report,
      actionImg;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black26))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (first)
            SizedBox(
                width: size / 6, child: ContactCheckBoxWidget(check: check))
          else
            SizedBox(
                width: size / 6, child: ContactCheckBoxWidget(check: check)),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: size,
            child: CustomText(
              text: actionDate,
              size: first ? 18 : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width: size,
            child: CustomText(
              text: action,
              size: first ? 18 : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width: size,
            child: CustomText(
              text: actionDoneBy,
              size: first ? 18 : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width: size,
            child: CustomText(
              text: parcels,
              size: first ? 18 : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width: size,
            child: CustomText(
              text: subParcel,
              size: first ? 18 : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width: size,
            child: CustomText(
              text: report,
              size: first ? 18 : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width: size,
            child: CustomText(
              text: actionImg,
              size: first ? 18 : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
