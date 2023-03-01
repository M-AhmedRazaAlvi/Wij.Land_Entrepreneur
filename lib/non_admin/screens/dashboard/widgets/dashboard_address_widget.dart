

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/non_admin/models/main_dashboard/get_fc_basic_info.dart';
import 'package:wij_land/utils/functions.dart';

import '../../../../app_common_widgets/custom_text.dart';

class DashboardAddressWidget extends StatefulWidget {
  GetFCBasicInfo basicInfo;
   DashboardAddressWidget({Key? key,required this.basicInfo}) : super(key: key);

  @override
  State<DashboardAddressWidget> createState() => _DashboardAddressWidgetState();
}

class _DashboardAddressWidgetState extends State<DashboardAddressWidget> {
  String? newValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var response = widget.basicInfo.data!.connectedToWijlandSince!.split('-');
    newValue = "${response[2]}-${response[1]}-${response[0]}";
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < 4; i++)
                    Padding(
                      padding:  EdgeInsets.only(left: getWidth(context)*0.07,bottom: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CustomText(
                             text: i == 0 ? "Address".tr() :i==1? "Province".tr():i==2?'Waterboard'.tr():'Municipality'.tr(),
                              textAligns: TextAlign.start,
                              size: 11,
                              weight: FontWeight.w600,
                            ),
                          ),
                          Expanded(
                            child: CustomText(
                             text: i == 0 ? widget.basicInfo.data?.address ?? "" :i==1? widget.basicInfo.data?.province ?? "":i==2?widget.basicInfo.data?.waterBody ?? "":widget.basicInfo.data?.municipality ?? "",
                              textAligns: TextAlign.start,
                              size: 11,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 24,
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              width: 24,
              height: 12,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < 3; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CustomText(
                              text: i==0?'Area'.tr():i==1?'Connection to Wij.land Since'.tr():'Farm Business Type'.tr(),
                              textAligns: TextAlign.start,
                              size: 11,
                              weight: FontWeight.w600,
                            ),
                          ),

                          Expanded(
                            child: CustomText(
                             text: i==0
                                  ? widget.basicInfo.data?.hectares.toString() ??""
                                  : i == 1
                                  ? newValue?? ""
                                  : widget.basicInfo.data!.businessType!.isNotEmpty?widget.basicInfo.data!.businessType![0] : "",
                              textAligns: TextAlign.start,
                              size: 11,
                            ),
                          ),
                          SizedBox(
                            width: 24,
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
