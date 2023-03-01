import 'package:flutter/material.dart';

import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../contacts/widgets/popup_menu_button.dart';
import '../../../../../../office/wij_lan_team/person_profile/Contact_moments/widget/contact_info_row.dart';

class SubParcelInfoRow extends StatelessWidget {
  const SubParcelInfoRow({
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
                        ContactInfoWidget(
                          first: true,
                          check: checkAll,
                          contactType: "Sub Parcel Name",
                          contactDate: "Area(ha)",
                          peopleInvolved: "Test Plot",
                          comment: "Last Action",
                          size: !Responsive.isDesktop(context)
                              ? getWidth(context) / 2.5
                              : getWidth(context) / 4.5,
                        ),
                        for (int i = 0; i < 10; i++)
                          InkWell(
                            onTap: () {},
                            child: ContactInfoWidget(
                              first: false,
                              check: checkAll,
                              contactType: "P04",
                              contactDate: "2.9",
                              peopleInvolved: "test",
                              comment: "Gerd McAlister",
                              size: !Responsive.isDesktop(context)
                                  ? getWidth(context) / 2.5
                                  : getWidth(context) / 4.5,
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
