import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wij_land/screens/clients/widgets/clients_table.dart';

import '../../app_common_widgets/custom_text.dart';
import '../../utils/controller.dart';
import '../../utils/responsive.dart';
import '../../utils/styles.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Obx(
            () => Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: !Responsive.isDesktop(context) ? 56 : 6),
                    child: CustomText(
                      text: menuController.activeItem.value,
                      size: 24,
                      weight: FontWeight.bold,
                      color: active,
                    )),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: const [
              ClientsTable(),
            ],
          )),
        ],
      ),
    );
  }
}
