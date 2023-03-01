import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/projects/dialog_comment.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/projects/unkown_widget.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../office/office_programes/Widgets/on_hover_button_widget.dart';
import '../../../../office/wij_lan_team/person_profile/Contact_moments/widget/contact_info_row.dart';

class FarmProjectsInfoWidget extends StatelessWidget {
  const FarmProjectsInfoWidget({
    Key? key,
    required this.first,
    required this.size,
    required this.check,
    required this.projectName,
    required this.projectRep,
    required this.interest,
    required this.participation,
    required this.parcels,
    required this.actions,
  }) : super(key: key);
  final bool first, check;
  final String projectName,
      projectRep,
      interest,
      participation,
      parcels,
      actions;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black26))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (first)
            SizedBox(
                width: size / 6, child: ContactCheckBoxWidget(check: check))
          else
            SizedBox(
                width: size / 6, child: ContactCheckBoxWidget(check: check)),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: size,
            child: CustomText(
              text: projectName,
              size: first ? 18 : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width: size,
            child: CustomText(
              text: projectRep,
              size: first ? 18 : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (first)
            SizedBox(
              width: size,
              child: CustomText(
                text: interest,
                size: first ? 18 : 14,
                weight: first ? FontWeight.bold : FontWeight.normal,
              ),
            )
          else
            SizedBox(
              width: size,
              child: UnknownWidget(),
            ),
          if (first)
            SizedBox(
              width: size * 1.3,
              child: CustomText(
                text: participation,
                size: first ? 18 : 14,
                weight: first ? FontWeight.bold : FontWeight.normal,
              ),
            )
          else
            SizedBox(
              width: size * 1.3,
              child: UnknownWidget(),
            ),
          SizedBox(
            width: size,
            child: CustomText(
              text: parcels,
              size: first ? 18 : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (first)
            SizedBox(
              width: size,
              child: CustomText(
                text: actions,
                size: first ? 18 : 14,
                weight: first ? FontWeight.bold : FontWeight.normal,
              ),
            )
          else
            SizedBox(
              width: size,
              child: Row(
                children: [
                  OnHoverButtonWidget(
                    icons: Icons.mode_comment_outlined,
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return DialogCommentBox();
                          });
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  OnHoverButtonWidget(
                    icons: Icons.history,
                    onTap: () {},
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
