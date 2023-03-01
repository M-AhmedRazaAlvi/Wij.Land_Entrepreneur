import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/actions/action_info_widget.dart';

import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../contacts/widgets/popup_menu_button.dart';

class ParcelActionInfo extends StatelessWidget {
  const ParcelActionInfo({
    Key? key,
    required this.checkAll,
  }) : super(key: key);

  final bool checkAll;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: Stack(
        children: [
          Card(
            color: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                height: 35 * 20,
                width: getWidth(context),
                child: ListView(
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      children: [
                        ParcelActionInfoWidget(
                          first: true,
                          check: checkAll,
                          actionDate: "Action",
                          action: "Date",
                          actionDoneBy: "Done by",
                          parcels: "Parcels",
                          subParcel: "Sub-Parcels",
                          report: "Report",
                          actionImg: "Image",
                          size: !Responsive.isDesktop(context)
                              ? getWidth(context) / 3
                              : getWidth(context) / 8,
                        ),
                        for (int i = 0; i < 10; i++)
                          InkWell(
                            onTap: () {},
                            child: ParcelActionInfoWidget(
                              first: false,
                              check: checkAll,
                              actionDate: "Action",
                              action: "Date",
                              actionDoneBy: "Done by",
                              parcels: "Parcels",
                              subParcel: "Sub-Parcels",
                              report: "Report",
                              actionImg: "Image",
                              size: !Responsive.isDesktop(context)
                                  ? getWidth(context) / 3
                                  : getWidth(context) / 8,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: PopUpMenuButtonWidget( mOnDeleteTap: () {},),
          ),
        ],
      ),
    );
  }
}
