


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../utils/styles.dart';

class TicketCardsWidget extends StatelessWidget {
  const TicketCardsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: CustomText(
              text: 'Step to Reproduce'.tr(),
              size: 28,
              weight: FontWeight.w300,
              color: darkBlue,
            ),
          ),

          Padding(
            padding:  EdgeInsets.all(8.0),
            child: CustomText(
              text: 'test'.tr(),
              size: 16,
              weight: FontWeight.w300,
              color: darkBlue,
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: CustomText(
              text: 'Screenshots'.tr(),
              size: 28,
              weight: FontWeight.w300,
              color: darkBlue,
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: CustomText(
              text: 'Developer Notes'.tr(),
              size: 28,
              weight: FontWeight.w300,
              color: darkBlue,
            ),
          ),
        ],
      ),
    );
  }
}
