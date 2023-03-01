


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/controller.dart';
import '../../../../utils/styles.dart';
import '../../../office/widgets/add_button.dart';

class AddTicketButton extends StatelessWidget {
  const AddTicketButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: "Tickets".tr(), size: 40,color:third, weight: FontWeight.w600,),
        Container(
          alignment: Alignment.topRight,
          child: ButtonWithAddIcon(
            text: 'Add Ticket'.tr(),
            onPressed: () {
             navigationController.navigateTo(addTicketsDetailsPageRoute);

            },
          ),
        ),
      ],
    );
  }
}