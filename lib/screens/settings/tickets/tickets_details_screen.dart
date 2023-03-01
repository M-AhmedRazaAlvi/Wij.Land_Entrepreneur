import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/screens/settings/tickets/widget/Tickets_details_card_widget.dart';
import 'package:wij_land/screens/settings/tickets/widget/ticket_card_widget.dart';
import 'package:wij_land/screens/settings/tickets/widget/tickets_desc_card_widget.dart';

import '../../../../utils/responsive.dart';
import '../../../utils/functions.dart';
class TicketDetailsScreen extends StatefulWidget {
  const TicketDetailsScreen({Key? key}) : super(key: key);

  @override
  State<TicketDetailsScreen> createState() => _TicketDetailsScreenState();
}

class _TicketDetailsScreenState extends State<TicketDetailsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Wrap(
              children: [
                SizedBox(
                  height: 300,
                  width: !Responsive.isDesktop(context)
                      ? getWidth(context)
                      : getWidth(context) / 3,
                  child:
                      TicketsDetailsCardWidget('Ticket 1'.tr(), '40 '),
                ),
                SizedBox(
                  height: 300,
                  width: !Responsive.isDesktop(context)
                      ? getWidth(context)
                      : getWidth(context) / 1.5,
                  child: TicketsDescriptionCardWidget('Number '.tr(), '40 '),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 16),
              child: TicketCardsWidget(),
            )
          ],
        ),
      ),
    );
  }

}

