import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/retailers/dialogs/dialog_retailer.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../app_common_widgets/text_widget.dart';
import '../../../../../utils/functions.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/responsive.dart';
import '../../../../office/widgets/add_text_button_widget.dart';

class WebShopRetailerDialog extends StatefulWidget {
  const WebShopRetailerDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<WebShopRetailerDialog> createState() => _WebShopRetailerDialogState();
}

class _WebShopRetailerDialogState extends State<WebShopRetailerDialog> {
  final TextEditingController fName = TextEditingController(),
      retailername = TextEditingController(),
      website = TextEditingController(),
      phoneNumber = TextEditingController(),
      address = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    retailername.dispose();
    website.dispose();
    phoneNumber.dispose();
    address.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: SingleChildScrollView(
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
                        size: 30,
                        weight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: getWidth(context),
                  padding: !Responsive.isDesktop(context)
                      ? EdgeInsets.symmetric(vertical: 10)
                      : EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          // showDialog(
                          //     context: context,
                          //     builder: (BuildContext context) {
                          //       return PhysicalRetailerDialog();
                          //     });
                        },
                        child: WebShopContainer(
                          icons: IconImages.homeIcon,
                          text: "Physical Store".tr(),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //  showDialog(
                          //     context: context,
                          //     builder: (BuildContext context) {
                          //       return WebShopRetailerDialog();
                          //     });
                        },
                        child: WebShopContainer(
                          icons: IconImages.earthIcon,
                          text: "Webshop".tr(),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: WebShopContainer(
                          icons: IconImages.buyIcon,
                          text: "Store & Webshop".tr(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                CustomText(
                  text: "Retailer Name".tr(),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: TextWidgetField(
                    controller: retailername,
                    enabled: true,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                 CustomText(
                  text: "Website".tr(),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: TextWidgetField(
                    controller: address,
                    enabled: true,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomText(text: "Phone number".tr()),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: TextWidgetField(
                    controller: phoneNumber,
                    enabled: true,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: AddTextButtonWidget(
                text: "Add Retailer".tr(),
                colors: Colors.yellow,
                onPress: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
