import 'package:flutter/material.dart';

import '../../../utils/functions.dart';
import '../widgets/organization_bottom_widget.dart';
import '../widgets/organization_card_widgets.dart';

class OrganizationProfileScreen extends StatelessWidget {
  const OrganizationProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          width: getWidth(context),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          color: Colors.grey[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                height: 12,
              ),
              OrganizationCardLarge(),
              // !ResponsiveWidget.isSmallScreen(context)
              //     ? const OrganizationCardLarge()
              //     : const OrganizationCardSmall(),
              SizedBox(
                height: 20,
              ),
              OrganizarionBottomWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
