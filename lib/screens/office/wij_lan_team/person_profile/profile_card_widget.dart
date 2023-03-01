import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../utils/functions.dart';
import '../../../../../../utils/responsive.dart';
import '../../../../../../utils/styles.dart';
import '../../../../utils/images.dart';
import '../../widgets/information_text_widget.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Wrap(
          spacing: 20,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: !Responsive.isDesktop(context)
                  ? getWidth(context)
                  : getWidth(context) * 0.3,
              height: !Responsive.isDesktop(context)
                  ? getWidth(context) * 0.6
                  : getWidth(context) * 0.3,
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(5))),
              child: Image(
                image: AssetImage(Images.wallpaper),
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
                      text: "Gerd Mcalister",
                      size: 35,
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
                            textFirst: "Mail:\t\t",
                            textSecond: "gerd@gmail.com,",
                          ),
                          InformativeTextWidget(
                            textFirst: "Cell:\t\t",
                            textSecond: "928798379",
                          ),
                          InformativeTextWidget(
                            textFirst: "Home:\t\t",
                            textSecond: "98327863379",
                          ),
                          InformativeTextWidget(
                            textFirst: "Address:\t\t",
                            textSecond: 'Limburg',
                          ),
                          InformativeTextWidget(
                            textFirst: "Organization:\t\t",
                            textSecond: 'LTO, Wij.land,',
                          ),
                          InformativeTextWidget(
                            textFirst: "Farm:\t\t",
                            textSecond: 'Farm of Gerd Mcalister,',
                          ),
                          InformativeTextWidget(
                            textFirst: "Roles:\t\t",
                            textSecond: "Farmer, Employee",
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
      ),
    );
  }
}
