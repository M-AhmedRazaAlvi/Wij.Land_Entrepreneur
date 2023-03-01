

import 'package:flutter/material.dart';
import 'package:wij_land/screens/reporting/kpi/widget/kpi_desc_card_widget.dart';
import 'package:wij_land/screens/reporting/kpi/widget/kpi_details_card_widget.dart';

import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';

class KpiWrapWidget extends StatelessWidget {
  const KpiWrapWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SizedBox(
          height: 300,
          width: !Responsive.isDesktop(context)
              ? getWidth(context)
              : getWidth(context) / 3,
          child:
          KpiDetailsCardWidget('Number of active farmers', '40 '),
        ),
        SizedBox(
          height: 300,
          width: !Responsive.isDesktop(context)
              ? getWidth(context)
              : getWidth(context) / 1.5,
          child: KpiDescriptionCardWidget('Number ', '40 '),
        ),
      ],
    );
  }
}
