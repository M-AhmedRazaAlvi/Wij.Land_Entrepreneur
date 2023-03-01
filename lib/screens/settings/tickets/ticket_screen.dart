import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

//import 'package:get/get.dart';
import 'package:wij_land/screens/settings/tickets/widget/TicketCardWidget.dart';
import 'package:wij_land/screens/settings/tickets/widget/add_tickets_buttons.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../utils/controller.dart';
class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(() =>SizedBox(
              child: CustomText(
                text: menuController.activeItemRoute.value,
                size: 16,
              ),
            )),
            Container(
              margin: EdgeInsets.only(right: 24.0, bottom: 8, top: 8,left: 24),
              child: AddTicketButton(),
            ),

            Container(
                    padding: EdgeInsets.all(16),
                    child: TicketCardWidget(
                      'Number of farmers involved with Wij.land i '.tr(),
                      'i ',
                      'i-3-2022',),
                  ),

          ],
        ),
      ),
    );
  }
}

