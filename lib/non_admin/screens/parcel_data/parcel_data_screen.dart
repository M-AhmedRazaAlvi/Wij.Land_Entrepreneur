import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:wij_land/app_common_widgets/animated_search.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/screens/office/widgets/add_text_button_widget.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../utils/images.dart';
import '../../../utils/responsive.dart';
import '../../app_common_widgets/large_screen.dart';

class ParcelDataScreen extends StatelessWidget {
  final arguments;
  const ParcelDataScreen({Key? key,this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key:  Key('ParcelScreen-key'),
      onVisibilityChanged: (visibilityInfo) {
        var visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 50) {
          if(arguments!=null) {
            global_farmer_entitiy.value = [
              HoverWidget(
                child: Text(
                  'Home / '.tr(),

                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: shineGrey,
                    fontFamily: Montserrat_Medium,
                  ),
                ),
                hoverChild: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Home / '.tr(),
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: Montserrat_Medium,

                      fontWeight: FontWeight.bold,
                      color: shineGrey,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                    ),
                  ),
                ),
                onHover: (event) {},
              ),
              Text(
                'Parcel Data'.tr(),
                style: TextStyle(
                  fontFamily: Montserrat_Medium,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: darkRed,
                ),
              ),
            ];
          }else{
            global_farmer_entitiy.value = [
              Text(
                'Parcel Data'.tr(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: darkRed),
              ),
            ];
          }
        }
      },
      child: SingleChildScrollView(
        //physics: NeverScrollableScrollPhysics(),
        child: SizedBox(
          //  height: getHeight(context),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CustomText(
                text: "Parcel Data".tr(),
                color: darkRed,
                weight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                    ),
                    child: Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 300,
                        child: Card(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 15, left: 15),
                                  child: CustomText(
                                    text: "Parcels".tr(),
                                    weight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 15),
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(5)),
                                        color: Color(0xFFF6F6F6)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(text: "Parcel 1".tr()),
                                          CustomText(text: "Parcel 2".tr()),
                                          CustomText(text: "Parcel 3".tr())
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 300,
                      child: Card(
                        child: Container(
                          child: Image.asset(
                            Images.mapImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 300,
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            CustomText(
                              text: "All".tr(),
                              weight: FontWeight.bold,
                            ),
                            CustomText(
                              text: "Soil".tr(),
                              weight: FontWeight.bold,
                            ),
                            CustomText(
                              text: "Manure".tr(),
                              weight: FontWeight.bold,
                            ),
                            CustomText(
                              text: "Animals".tr(),
                              weight: FontWeight.bold,
                            ),
                            CustomText(
                              text: "BoerenWijzer".tr(),
                              weight: FontWeight.bold,
                            ),
                            CustomText(
                              text: "Survey Name".tr(),
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: getHeight(context) * 0.5,
                    width: getWidth(context) * 0.6,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                        text: "Survey Name".tr(),
                                        weight: FontWeight.bold,
                                        color: darkGreen,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      AnimatedSearchWidget(),
                                      AddTextButtonWidget(
                                        text: "Update".tr(),
                                        colors: darkyellow,
                                        onPress: () {},
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            DataTable(
                                dataRowHeight: 40,
                                showBottomBorder: true,
                                horizontalMargin: 0,
                                columnSpacing: 30,
                                columns: [
                                  DataColumn(
                                    label: CustomText(
                                      text: 'Group Name'.tr(),
                                      color: Colors.black,
                                      size: 12,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                  DataColumn(
                                    label: CustomText(
                                      text: 'Parcel 1'.tr(),
                                      color: Colors.black,
                                      size: 12,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                  DataColumn(
                                    label: CustomText(
                                      text: 'Parcel 2'.tr(),
                                      color: Colors.black,
                                      size: 12,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                  DataColumn(
                                    label: CustomText(
                                      text: '',
                                      color: Colors.black,
                                      size: 12,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                  DataColumn(
                                    label: CustomText(
                                      text: '',
                                      color: Colors.black,
                                      size: 12,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                  DataColumn(
                                      label: SizedBox(
                                          width: Responsive.isDesktop(context)
                                              ? 80
                                              : Responsive.isTablet(context)
                                                  ? 60
                                                  : 30)),
                                  DataColumn(
                                      label: CustomText(
                                    text: '',
                                    color: Colors.black,
                                    size: 12,
                                    weight: FontWeight.bold,
                                  )),
                                ],
                                rows: <DataRow>[
                                  for (int i = 0; i < 15; i++)
                                    DataRow(cells: [
                                      DataCell(Text('Property'.tr())),
                                      DataCell(Text('Value'.tr())),
                                      DataCell(Text('Date'.tr())),
                                      DataCell(Text('dd.mm.yyy'.tr())),
                                      DataCell(Text('')),
                                      DataCell(Text('')),
                                      DataCell(Image.asset(IconImages.hirtoryIcon,
                                          width: 12, height: 18))
                                    ]),
                                ]),
                          ],
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
