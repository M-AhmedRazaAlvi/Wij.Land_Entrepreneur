import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/styles.dart';
// import 'package:flutter_html/flutter_dart';

import '../../../utils/responsive.dart';
import '../../models/farm_computer_contact_moments/responce/get_contact_moment_details_responce.dart';
import '../../providers/farm_computer_projects_provider/farm_computer_contact_moments_provider.dart';

class ContactMomentDialogbox extends StatefulWidget {
  final contactMomentId;
  final GetFarmComputerContactMomentDetailsResponce? model;

  const ContactMomentDialogbox({
    Key? key,
    this.contactMomentId,
    this.model,
  }) : super(key: key);

  @override
  State<ContactMomentDialogbox> createState() => _ContactMomentDialogboxState();
}

class _ContactMomentDialogboxState extends State<ContactMomentDialogbox> {
  @override
  void initState() {
    super.initState();
    isLoading = true;
    print("ContactMomentId==============${widget.contactMomentId} ");
    Future.delayed(Duration(seconds: 0), () async {
      await Provider.of<CreateFarmComputerContactMomentsProvider>(context, listen: false)
          .getFarmComputerContactMomentDetails(contactMomentId: widget.contactMomentId);
      isLoading = false;
    });
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CreateFarmComputerContactMomentsProvider>(context);
    if (isLoading) {
      return SizedBox(
        height: getHeight(context) / 2,
        width: getWidth(context),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return provider.farmComputerContactMomentDetailsResponseModel.status == 404
          ? Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(20),
              child: CustomText(
                text: '${provider.farmComputerContactMomentDetailsResponseModel.message}',
                color: Colors.red,
                weight: FontWeight.w700,
                size: 20,
              ),
            )
          : AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
              scrollable: true,
              title: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.close,
                    size: Responsive.isMobile(context) ? 14 : 20,
                  ),
                ),
              ),
              content: SingleChildScrollView(
                child: Container(
                  width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.65,
                  padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? 0 : 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? 5 : 15, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                              size: Responsive.isMobile(context) ? 13 : 22,
                              color: darkred,
                              text: englishMonth(
                                provider.farmComputerContactMomentDetailsResponseModel.data!.contactMomentDate == null
                                    ? "-"
                                    : provider.farmComputerContactMomentDetailsResponseModel.data!.contactMomentDate.toString().substring(5, 7),
                              ),
                            ),
                            CustomText(
                              size: Responsive.isMobile(context) ? 13 : 22,
                              weight: FontWeight.bold,
                              text: provider.farmComputerContactMomentDetailsResponseModel.data!.contactMomentDate == null
                                  ? "-"
                                  : provider.farmComputerContactMomentDetailsResponseModel.data!.contactMomentDate.toString().substring(8, 10),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: Responsive.isMobile(context) ? 0 : 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: provider.farmComputerContactMomentDetailsResponseModel.data!.contactSubject == null
                                    ? "-"
                                    : provider.farmComputerContactMomentDetailsResponseModel.data!.contactSubject ?? "-",
                                size: Responsive.isMobile(context) ? 14 : 18,
                                textAligns: TextAlign.start,
                                overflows: TextOverflow.ellipsis,
                                lines: 1,
                                weight: FontWeight.w700,
                                color: darkRed,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: Responsive.isMobile(context) ? 10 : 20),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: Responsive.isMobile(context) ? 110 : 180,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: Responsive.isMobile(context) ? 5 : 7),
                                            child: Image.network(
                                              width: Responsive.isMobile(context) ? 15 : 20,
                                              height: Responsive.isMobile(context) ? 15 : 20,
                                              'https://staging-wij.land.landscape.computer${provider.farmComputerContactMomentDetailsResponseModel.data!.contactMomentsType == null ? "-" : provider.farmComputerContactMomentDetailsResponseModel.data!.contactMomentsType![0].icon ?? "-"}',
                                            ),
                                          ),
                                          CustomText(
                                            textAligns: TextAlign.left,
                                            text: "Kind of Contact".tr(),
                                            weight: FontWeight.w700,
                                            size: Responsive.isMobile(context) ? 10 : 14,
                                          ),
                                        ],
                                      ),
                                    ),
                                    CustomText(
                                      overflows: TextOverflow.ellipsis,
                                      lines: 1,
                                      textAligns: TextAlign.left,
                                      text: provider.farmComputerContactMomentDetailsResponseModel.data!.contactMomentsType == null
                                          ? "-"
                                          : provider.farmComputerContactMomentDetailsResponseModel.data!.contactMomentsType![0].name ?? "-",
                                      size: Responsive.isMobile(context) ? 10 : 14,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: Responsive.isMobile(context) ? 110 : 180,
                                    child: CustomText(
                                      textAligns: TextAlign.left,
                                      weight: FontWeight.w700,
                                      text: "Attendees".tr(),
                                      size: Responsive.isMobile(context) ? 10 : 14,
                                    ),
                                  ),
                                  CustomText(
                                    textAligns: TextAlign.left,
                                    overflows: TextOverflow.ellipsis,
                                    lines: 1,
                                    text: provider.farmComputerContactMomentDetailsResponseModel.data!.attendees!.isEmpty
                                        ? "-"
                                        : provider.farmComputerContactMomentDetailsResponseModel.data!.attendees![0].name == null
                                            ? "-"
                                            : provider.farmComputerContactMomentDetailsResponseModel.data!.attendees![0].name ?? "-",
                                    size: Responsive.isMobile(context) ? 10 : 14,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: Responsive.isMobile(context) ? 110 : 180,
                                    child: CustomText(
                                      textAligns: TextAlign.left,
                                      weight: FontWeight.w700,
                                      text: "Related Farm".tr(),
                                      size: Responsive.isMobile(context) ? 10 : 14,
                                    ),
                                  ),
                                  CustomText(
                                    textAligns: TextAlign.left,
                                    overflows: TextOverflow.ellipsis,
                                    lines: 1,
                                    text: provider.farmComputerContactMomentDetailsResponseModel.data!.farm!.farmName == null
                                        ? "-"
                                        : provider.farmComputerContactMomentDetailsResponseModel.data!.farm!.farmName ?? "-",
                                    size: Responsive.isMobile(context) ? 10 : 14,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: Responsive.isMobile(context) ? 110 : 180,
                                    child: CustomText(
                                      textAligns: TextAlign.left,
                                      weight: FontWeight.w700,
                                      text: "Related Project".tr(),
                                      size: Responsive.isMobile(context) ? 10 : 14,
                                    ),
                                  ),
                                  CustomText(
                                    textAligns: TextAlign.left,
                                    overflows: TextOverflow.ellipsis,
                                    lines: 1,
                                    text: provider.farmComputerContactMomentDetailsResponseModel.data!.project!.projectName == null
                                        ? '-'
                                        : provider.farmComputerContactMomentDetailsResponseModel.data!.project!.projectName ?? "-",
                                    size: Responsive.isMobile(context) ? 10 : 14,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: Responsive.isMobile(context) ? 10 : 20),
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.black45,
                                ),
                              ),
                              CustomText(
                                text: "Notes :".tr(),
                                size: Responsive.isMobile(context) ? 14 : 18,
                                color: darkGreen,
                                weight: FontWeight.w700,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10, top: Responsive.isMobile(context) ? 3 : 5),
                                child: Html(
                                  data: provider.farmComputerContactMomentDetailsResponseModel.data!.contactNotes == null
                                      ? "-"
                                      : provider.farmComputerContactMomentDetailsResponseModel.data!.contactNotes ?? "-",
                                  style: {
                                    "#": Style(
                                        fontWeight: Responsive.isMobile(context) ? FontWeight.w300 : FontWeight.normal,
                                        padding: EdgeInsets.zero,
                                        margin: EdgeInsets.zero),
                                    "body": Style(
                                      fontFamily: Montserrat_Medium,
                                      fontSize: Responsive.isMobile(context) ? FontSize.smaller : FontSize.medium,
                                      textAlign: TextAlign.start,
                                      textOverflow: TextOverflow.ellipsis,
                                      maxLines: 20,
                                    ),
                                    "span ": Style(
                                      fontFamily: Montserrat_Medium,
                                      fontSize: Responsive.isMobile(context) ? FontSize.smaller : FontSize.medium,
                                      textAlign: TextAlign.start,
                                      textOverflow: TextOverflow.ellipsis,
                                      maxLines: 20,
                                    ),
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
    }
  }

  String englishMonth(String? month) {
    if (month == null) {
      return "-";
    } else {
      switch (month) {
        case "01":
          return "JAN.".tr();
        case "02":
          return "FEB.".tr();
        case "03":
          return "MAR.".tr();
        case "04":
          return "APR.".tr();
        case "05":
          return "MAY.".tr();
        case "06":
          return "JUN.".tr();
        case "07":
          return "JUL.".tr();
        case "08":
          return "AUG.".tr();
        case "09":
          return "SEP.".tr();
        case "10":
          return "OCT.".tr();
        case "11":
          return "NOV.".tr();
        case "12":
          return "DEC.".tr();
        default:
          return "-";
      }
    }
  }
}
