import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../../../../../utils/functions.dart';
import '../../../../../../../utils/images.dart';
import '../../../../../../contacts/widgets/popup_menu_button.dart';
import '../../../../../../office/office_programes/Widgets/on_hover_button_widget.dart';
import '../../../../../../office/widgets/information_text_widget.dart';
import '../../Widget/dialog_card_edit.dart';

class ParcelProfileCardWidget extends StatelessWidget {
  const ParcelProfileCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Wrap(
              spacing: 20,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(
                  //padding: const EdgeInsets.all(10),
                  clipBehavior: Clip.hardEdge,
                  width: !Responsive.isDesktop(context)
                      ? getWidth(context)
                      : getWidth(context) * 0.3,
                  height: !Responsive.isDesktop(context)
                      ? getWidth(context) * 0.6
                      : getWidth(context) * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: !Responsive.isDesktop(context)
                          ? BorderRadius.vertical(top: Radius.circular(10))
                          : BorderRadius.horizontal(left: Radius.circular(10))),
                  child: Image(
                    image: AssetImage(Images.parcelImg),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: CustomText(
                          text: "Koos & Monique TEST JESSICA:p04",
                          size: 30,
                          weight: FontWeight.bold,
                          color: third,
                        ),
                      ),
                      Wrap(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              InformativeTextWidget(
                                textFirst: "Location Description:\t\t",
                                textSecond: "ABC",
                              ),
                              InformativeTextWidget(
                                textFirst: "Arae:\t\t",
                                textSecond: "2.9 Hecteres",
                              ),
                              InformativeTextWidget(
                                textFirst: "Ownership:\t\t",
                                textSecond: "928798379",
                              ),
                              InformativeTextWidget(
                                textFirst: "Purpose:\t\t",
                                textSecond: "98327863379",
                              ),
                              InformativeTextWidget(
                                textFirst: "Land Function:\t\t",
                                textSecond: "Limburg",
                              ),
                              InformativeTextWidget(
                                textFirst: "Land Management:\t\t",
                                textSecond: "Grazing",
                              ),
                              InformativeTextWidget(
                                textFirst: "Organic:\t\t",
                                textSecond: "Farm of Gerd Mcalister,",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Row(
                children: [
                  OnHoverButtonWidget(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ParcelCardEditDialog();
                            });
                      },
                      icons: Icons.edit),
                  PopUpMenuButtonWidget( mOnDeleteTap: () {},),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
