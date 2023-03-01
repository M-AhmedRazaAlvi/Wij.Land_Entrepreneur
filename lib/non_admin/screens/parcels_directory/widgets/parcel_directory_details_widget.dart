import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/non_admin/models/farm_computer_parcels/response/get_farm_computer_parcels_response.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/responsive.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../providers/farm_computer_parcels_provider/farm_computer_parcels_provider.dart';

class ParcelDirectoryDetailsWidget extends StatefulWidget {
  ParcelData? model;
  ParcelDirectoryDetailsWidget({required this.model});

  @override
  State<ParcelDirectoryDetailsWidget> createState() =>
      _ParcelDirectoryDetailsWidgetState();
}

class _ParcelDirectoryDetailsWidgetState
    extends State<ParcelDirectoryDetailsWidget> {
  bool checkedValue = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
//    var provider = Provider.of<FarmComputerParcelsProvider>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                //height: getHeight(context)*,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: Responsive.isMobile(context)
                                ? EdgeInsets.all(2.0)
                                : EdgeInsets.all(8.0),
                            child: CustomText(
                              text: "Location Description: ".tr(),
                              color: Colors.grey,
                              size: Responsive.isMobile(context) ? 10 : 13,
                            ),
                          ),
                          Padding(
                            padding: Responsive.isMobile(context)
                                ? EdgeInsets.all(2.0)
                                : EdgeInsets.all(8.0),
                            child: CustomText(
                              text: widget.model!.locationDescription!.isEmpty
                                  ? "No record found".tr()
                                  : widget.model!.locationDescription!,
                              color: Colors.black,
                              size: Responsive.isMobile(context) ? 10 : 13,
                              weight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: Responsive.isMobile(context)
                                ? EdgeInsets.all(2.0)
                                : EdgeInsets.all(8.0),
                            child: CustomText(
                                text: "Area:".tr(),
                                size: Responsive.isMobile(context) ? 10 : 13,
                                color: Colors.grey),
                          ),
                          Padding(
                            padding: Responsive.isMobile(context)
                                ? EdgeInsets.all(2.0)
                                : EdgeInsets.all(8.0),
                            child: CustomText(
                              text: widget.model!.area!.isEmpty
                                  ? "No record found".tr()
                                  : widget.model!.area!,
                              color: Colors.black,
                              size: Responsive.isMobile(context) ? 10 : 13,
                              weight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: Responsive.isMobile(context)
                                ? EdgeInsets.all(2.0)
                                : EdgeInsets.all(8.0),
                            child: CustomText(
                                text: "Ownership:".tr(),
                                size: Responsive.isMobile(context) ? 10 : 13,
                                color: Colors.grey),
                          ),
                          Padding(
                            padding: Responsive.isMobile(context)
                                ? EdgeInsets.all(2.0)
                                : EdgeInsets.all(8.0),
                            child: CustomText(
                              text: widget.model!.ownership!.contains("null")
                                  ? "No record found".tr()
                                  : widget.model!.ownership ?? "Null".tr(),
                              color: Colors.black,
                              weight: FontWeight.bold,
                              size: Responsive.isMobile(context) ? 10 : 13,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: Responsive.isMobile(context)
                                ? EdgeInsets.all(2.0)
                                : EdgeInsets.all(8.0),
                            child: CustomText(
                                text: "Purpose:".tr(),
                                size: Responsive.isMobile(context) ? 10 : 13,
                                color: Colors.grey),
                          ),
                          Padding(
                            padding: Responsive.isMobile(context)
                                ? EdgeInsets.all(2.0)
                                : EdgeInsets.all(8.0),
                            child: CustomText(
                              text: widget.model!.purpose!.contains("null")
                                  ? "No record found".tr()
                                  : widget.model!.purpose ?? "Null",
                              color: Colors.black,
                              weight: FontWeight.bold,
                              size: Responsive.isMobile(context) ? 10 : 13,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: Responsive.isMobile(context)
                                ? EdgeInsets.all(2.0)
                                : EdgeInsets.all(8.0),
                            child: CustomText(
                                text: "Land function:".tr(),
                                size: Responsive.isMobile(context) ? 10 : 13,
                                color: Colors.grey),
                          ),
                          Padding(
                            padding: Responsive.isMobile(context)
                                ? EdgeInsets.all(2.0)
                                : EdgeInsets.all(8.0),
                            child: CustomText(
                              text: widget.model!.landFunction!.contains("null")
                                  ? "No record found".tr()
                                  : widget.model!.landFunction!,
                              color: Colors.black,
                              size: Responsive.isMobile(context) ? 10 : 13,
                              weight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: Responsive.isMobile(context)
                                ? EdgeInsets.all(2.0)
                                : EdgeInsets.all(8.0),
                            child: CustomText(
                                text: "Land Management:".tr(),
                                size: Responsive.isMobile(context) ? 10 : 13,
                                color: Colors.grey),
                          ),
                          Padding(
                            padding: Responsive.isMobile(context)
                                ? EdgeInsets.all(2.0)
                                : EdgeInsets.all(8.0),
                            child: CustomText(
                              text:
                                  widget.model!.landManagement!.contains("null")
                                      ? "No record found".tr()
                                      : widget.model!.landManagement ?? "Null",
                              color: Colors.black,
                              size: Responsive.isMobile(context) ? 10 : 13,
                              weight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: Responsive.isMobile(context)
                                ? EdgeInsets.all(2.0)
                                : EdgeInsets.all(8.0),
                            child: CustomText(
                                text: "Organic:".tr(),
                                size: Responsive.isMobile(context) ? 10 : 13,
                                color: Colors.grey),
                          ),
                          Padding(
                              padding: EdgeInsets.all(8.0),
                              child: RealCheckBoxWidget(
                                Labeltext: "",
                                value: widget.model!.organic!,
                                onChanged: (val) {},
                              ))
                        ],
                      ),
                      Divider(
                        thickness: 2,
                        endIndent: 500,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: CustomText(
                          text: "View more / compare".tr(),
                          weight: FontWeight.bold,
                        ),
                      )
                    ]),
              ),
            ],
          )),
    );
  }
}
