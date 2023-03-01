// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wij_land/screens/office/office_programes/Widgets/dialog_edit_program.dart';
import 'package:wij_land/screens/office/office_programes/Widgets/on_hover_button_widget.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/images.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../../contacts/widgets/popup_menu_button.dart';

class InspiretionWidget extends StatelessWidget {
  final dynamic imgUrl;

  InspiretionWidget({
    Key? key,
    this.imgUrl,
  }) : super(key: key);

  bool filterTapped = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: getWidth(context),
      child: Card(
        clipBehavior: Clip.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Stack(
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  width: !Responsive.isDesktop(context)
                      ? getWidth(context)
                      : getWidth(context) * 0.3,
                  height: !Responsive.isDesktop(context)
                      ? getWidth(context) * 0.6
                      : getWidth(context) * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: !Responsive.isDesktop(context)
                          ? BorderRadius.vertical(top: Radius.circular(5))
                          : BorderRadius.horizontal(left: Radius.circular(5))),
                  child: Image(
                    image: AssetImage(Images.wallpaper),
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: !Responsive.isDesktop(context)
                      ? getWidth(context)
                      : getWidth(context) * 0.5,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: "Inspiration",
                          color: third,
                          size: 40,
                          weight: FontWeight.bold),
                      SizedBox(
                        height: 20,
                      ),
                      InspirationInfoRow(
                        textFirst: "Programme Coordinator :\t",
                        textSecond: "Mythili Kamath",
                      ),
                      InspirationInfoRow(
                        textFirst: "Programme Description :\t",
                        textSecond: "",
                      ),
                      CustomText(
                        text:
                            "Structuring the outreach, education and inspiration projects in our community with the ambition of cultivating an inspired and active community. ",
                        size: 18,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Wrap(
                children: [
                  OnHoverButtonWidget(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => EditProgrammeDialog());
                    },
                    icons: Icons.edit,
                  ),
                   PopUpMenuButtonWidget( mOnDeleteTap: () {},),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InspirationInfoRow extends StatelessWidget {
  final String textFirst;
  final String textSecond;
  const InspirationInfoRow({
    Key? key,
    required this.textFirst,
    required this.textSecond,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Wrap(
        spacing: 20,
        children: [
          Expanded(
            child: CustomText(
                text: textFirst,
                size: 18,
                weight: FontWeight.bold,
                color: darkBlue),
          ),
          Expanded(
            child: CustomText(
              text: textSecond,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
