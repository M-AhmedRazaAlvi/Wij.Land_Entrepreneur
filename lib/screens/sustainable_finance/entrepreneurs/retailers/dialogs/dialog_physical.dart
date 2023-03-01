
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../app_common_widgets/text_widget.dart';
import '../../../../office/widgets/add_text_button_widget.dart';

class PhysicalRetailerDialog extends StatefulWidget {
  PhysicalRetailerDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<PhysicalRetailerDialog> createState() => _PhysicalRetailerDialogState();
}

class _PhysicalRetailerDialogState extends State<PhysicalRetailerDialog> {
  final TextEditingController fName = TextEditingController(),
      retailername = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    retailername.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomText(
                      text: "Add Retailer".tr(),
                      size: 20,
                      weight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             CustomText(
              text: "Retailer Name".tr(),
              size: 13,
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {},
              child: TextWidgetField(
                controller: retailername,
                enabled: true,
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: AddTextButtonWidget(
              text: "Add Retailer".tr(),
              colors: yellowishGreen,
              onPress: () {},
            ),
          ),
        ],
      ),
    );
  }
}
