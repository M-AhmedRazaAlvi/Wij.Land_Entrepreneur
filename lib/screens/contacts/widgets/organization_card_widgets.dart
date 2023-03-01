import 'package:flutter/material.dart';
import 'package:wij_land/screens/contacts/widgets/add_organization_dialog.dart';
import 'package:wij_land/screens/contacts/widgets/popup_menu_button.dart';

import '../../../app_common_widgets/custom_text.dart';
import '../../../app_common_widgets/on_hover.dart';
import '../../../utils/constants.dart';
import '../../../utils/functions.dart';
import '../../../utils/responsive.dart';
import '../../../utils/styles.dart';
import '../../office/widgets/information_text_widget.dart';

class OrganizationCardLarge extends StatelessWidget {
  const OrganizationCardLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          SizedBox(
            width: getWidth(context),
            child: Wrap(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: Responsive.isDesktop(context)
                      ? 240
                      : MediaQuery.of(context).size.width,
                  height: 240,
                  // margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      image: DecorationImage(
                          image: NetworkImage(BGImage), fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 15),
                        child: CustomText(
                          text: "Better Soils",
                          size: 28,
                          weight: FontWeight.bold,
                          color: third,
                        ),
                      ),
                      Wrap(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              InformativeTextWidget(
                                textFirst: "Organization Type:",
                                textSecond: "Association/collective",
                              ),
                              InformativeTextWidget(
                                textFirst: "Address:",
                                textSecond:
                                    "Doctor de Bruijnestraat 2, 2351 PC, Leiderdorp",
                              ),
                              InformativeTextWidget(
                                textFirst: "Relation with Wij.land: ",
                                textSecond: "Collaborative",
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
          Positioned(
              top: 15,
              right: 15,
              child: Row(
                children: [
                  OnHover(
                      builder: (hover) => InkWell(
                            onTap: () => showDialog(
                                context: context,
                                builder: (_) =>
                                    const AddOrganizationDialog(edit: false)),
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Card(
                                color: hover ? hoverColor : Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: Center(
                                    child: Icon(
                                  Icons.edit,
                                  color: secondary,
                                )),
                              ),
                            ),
                          )),
                   PopUpMenuButtonWidget( mOnDeleteTap: () {},),
                ],
              )),
        ],
      ),
    );
  }
}

class OrganizationCardSmall extends StatelessWidget {
  const OrganizationCardSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 240,
              // margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                      image: NetworkImage(BGImage), fit: BoxFit.cover),
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(12))),
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
                      text: "Better Soils",
                      size: 28,
                      weight: FontWeight.bold,
                      color: third,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            InformativeTextWidget(
                              textFirst: "Organization Type:",
                              textSecond: "Association/collective",
                            ),
                            InformativeTextWidget(
                              textFirst: "Address:",
                              textSecond:
                                  "Doctor de Bruijnestraat 2, 2351 PC, Leiderdorp",
                            ),
                            InformativeTextWidget(
                              textFirst: "Relation with Wij.land: ",
                              textSecond: "Collaborative",
                            ),
                          ],
                        ),
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
