// // import 'package:flutter/material.dart';
// // import 'package:wij_land/app_common_widgets/custom_text.dart';
// // import 'package:wij_land/utils/functions.dart';
// // import 'package:wij_land/utils/styles.dart';
// // import 'package:flutter_html/flutter_dart';
// //
// // import '../../../../screens/office/widgets/up_down_button_widget.dart';
// // import '../../../../utils/responsive.dart';
// // import '../../../models/farm_computer_project/farm_computer_project_contact_moments/responce/get_farm_project_contact_moments_response.dart';
// //
// // class ProjectContactMomentDialogBoxWidget extends StatefulWidget {
// //   final ContactMomentData model;
// //
// //   const ProjectContactMomentDialogBoxWidget({
// //     Key? key,
// //     required this.model,
// //   }) : super(key: key);
// //
// //   @override
// //   State<ProjectContactMomentDialogBoxWidget> createState() =>
//       _ProjectContactMomentDialogBoxWidgetState();
// // }
// //
// // class _ProjectContactMomentDialogBoxWidgetState
// //    extends State<ProjectContactMomentDialogBoxWidget> {
// //   bool taskContact = true;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // var provider = Provider.of<CreateFarmComputerContactMomentsProvider>(context);
// //     // if (isLoading) {
// //     //   return SizedBox(
// //     //     height: getHeight(context) / 2,
// //     //     width: getWidth(context),
// //     //     child: Center(
// //     //       child: CircularProgressIndicator(),
// //     //     ),
// //     //   );
// //     // } else {
// //     //   return provider.farmComputerContactMomentDetailsResponseModel.status == 404
// //     //       ? Container(
// //     //           alignment: Alignment.topCenter,
// //     //           padding: EdgeInsets.all(20),
// //     //           child: CustomText(
// //     //             text: '${provider.farmComputerContactMomentDetailsResponseModel.message}',
// //     //             color: Colors.red,
// //     //             weight: FontWeight.w700,
// //     //             size: 20,
// //     //           ),
// //     //         )
// //     //       :
// //     return AlertDialog(
// //       shape: RoundedRectangleBorder(
// //          borderRadius: BorderRadius.all(Radius.circular(15.0))),
// //       scrollable: true,
// //       contentPadding: EdgeInsets.all(Responsive.isMobile(context) ? 10 : 20),
// //       backgroundColor: lightskin,
// //       content: SizedBox(
// //         width: Responsive.isMobile(context)
// //            ? getWidth(context)
//  //           : getWidth(context) * 0.65,
// //         child: Column(
// //           children: [
// //             Card(
// //               elevation: 0,
// //               child: Padding(
// //                 padding:
// //                    EdgeInsets.all(Responsive.isMobile(context) ? 10 : 25.0),
// //                 child: Column(
// //                   children: [
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: [
// //                         CustomText(
// //                           text: widget.model.contactSubject!,
// //                           size: Responsive.isMobile(context) ? 14 : 22,
// //                           weight: FontWeight.bold,
// //                           color: darkRed,
// //                         ),
// //                         Row(
// //                           children: [
// //                             CustomText(
// //                               text: widget.model.contactMomentDate ?? '',
// //                               size: Responsive.isMobile(context) ? 10 : 14,
// //                             ),
// //                             SizedBox(width: 100),
// //                             SizedBox(
// //                               width: Responsive.isMobile(context) ? 40 : 50,
// //                               height: Responsive.isMobile(context) ? 45 : 50,
// //                               child: UpDownButtonWidget(
// //                                 upDownIcon: taskContact,
// //                                 onPressed: () {
// //                                   setState(() {
// //                                     taskContact = !taskContact;
// //                                   });
// //                                 },
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                     Visibility(
// //                       visible: taskContact ? true : false,
// //                       child: Column(
// //                         children: [
// //                           Row(
// //                             children: [
// //                               SizedBox(
// //                                 width: Responsive.isMobile(context) ? 150 : 230,
// //                                 child: CustomText(
// //                                   textAligns: TextAlign.left,
// //                                   weight: FontWeight.w700,
// //                                   text: "Attendees",
// //                                   size: Responsive.isMobile(context) ? 10 : 14,
// //                                 ),
// //                               ),
// //                               CustomText(
// //                                 textAligns: TextAlign.left,
// //                                 text: widget.model.attendees![0].name ?? "-",
// //                                 size: Responsive.isMobile(context) ? 10 : 14,
// //                               ),
// //                             ],
// //                           ),
// //                           SizedBox(
// //                             height: 10,
// //                           ),
// //                           Row(
// //                             children: [
// //                               SizedBox(
// //                                 width: Responsive.isMobile(context) ? 150 : 230,
// //                                 child: CustomText(
// //                                   textAligns: TextAlign.left,
// //                                   weight: FontWeight.w700,
// //                                   text: "Contact Moment subject",
// //                                   size: Responsive.isMobile(context) ? 10 : 14,
// //                                 ),
// //                               ),
// //                               CustomText(
// //                                 textAligns: TextAlign.left,
// //                                 text: widget.model.contactSubject ?? "-",
// //                                 size: Responsive.isMobile(context) ? 10 : 14,
// //                               ),
// //                             ],
// //                           ),
// //                           SizedBox(
// //                             height: 10,
// //                           ),
// //                           Row(
// //                             children: [
// //                               SizedBox(
// //                                 width: Responsive.isMobile(context) ? 150 : 230,
// //                                 child: CustomText(
// //                                   textAligns: TextAlign.left,
// //                                   weight: FontWeight.w700,
// //                                   text: "Kind of Contact",
// //                                   size: Responsive.isMobile(context) ? 10 : 14,
// //                                 ),
// //                               ),
// //                               CustomText(
// //                                 textAligns: TextAlign.left,
// //                                 text: widget.model.contactMomentType ?? "-",
// //                                 size: Responsive.isMobile(context) ? 10 : 14,
// //                               ),
// //                             ],
// //                           ),
// //                           SizedBox(
// //                             height: 10,
// //                           ),
// //                           Row(
// //                             children: [
// //                               SizedBox(
// //                                 width: Responsive.isMobile(context) ? 150 : 230,
// //                                 child: CustomText(
// //                                   textAligns: TextAlign.left,
// //                                   weight: FontWeight.w700,
// //                                   text: "Related Farm",
// //                                   size: Responsive.isMobile(context) ? 10 : 14,
// //                                 ),
// //                               ),
// //                               CustomText(
// //                                 textAligns: TextAlign.left,
// //                                 text: widget.model.farm!.farmName ?? "-",
// //                                 size: Responsive.isMobile(context) ? 10 : 14,
// //                               ),
// //                             ],
// //                           ),
// //                           SizedBox(
// //                             height: 10,
// //                           ),
// //                           Row(
// //                             children: [
// //                               SizedBox(
// //                                 width: Responsive.isMobile(context) ? 150 : 230,
// //                                 child: CustomText(
// //                                   textAligns: TextAlign.left,
// //                                   weight: FontWeight.w700,
// //                                   text: "Related Project",
// //                                   size: Responsive.isMobile(context) ? 10 : 14,
// //                                 ),
// //                               ),
// //                               CustomText(
// //                                 textAligns: TextAlign.left,
// //                                 text: widget.model.project!.projectName ?? "-",
// //                                 size: Responsive.isMobile(context) ? 10 : 14,
// //                               ),
// //                             ],
// //                           ),
// //                           SizedBox(
// //                             height: 10,
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             SizedBox(
// //               height: 10,
// //             ),
// //             Card(
// //               elevation: 0,
// //               child: Container(
// //                 width: getWidth(context),
// //                 padding:
//                     EdgeInsets.all(Responsive.isMobile(context) ? 10 : 25.0),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     CustomText(
// //                       text: "Attendee Notes:",
// //                       size: Responsive.isMobile(context) ? 14 : 22,
// //                       color: darkGreen,
// //                       weight: FontWeight.bold,
// //                     ),
// //                     Html(
// //                       data: widget.model.attendeeNote ?? "-",
// //                       style: {
// //                         "body": Style(
// //                             fontWeight: FontWeight.normal,
// //                             fontSize: Responsive.isMobile(context)
//                                 ? FontSize.small
//                                 : FontSize.medium,
// //                             textAlign: TextAlign.start,
// //                             textOverflow: TextOverflow.ellipsis,
// //                             maxLines: 10,
// //                             padding: EdgeInsets.zero,
// //                             margin: EdgeInsets.zero),
// //                         "span ": Style(
// //                             fontWeight: FontWeight.normal,
// //                             fontSize: Responsive.isMobile(context)
//                                 ? FontSize.small
//                                 : FontSize.medium,
// //                             textAlign: TextAlign.start,
// //                             textOverflow: TextOverflow.ellipsis,
// //                             maxLines: 10,
// //                             padding: EdgeInsets.zero,
// //                             margin: EdgeInsets.zero),
//                       },
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //       // title: Align(
// //       //   alignment: Alignment.topRight,
// //       //   child: InkWell(
// //       //     onTap: () {
// //       //       Navigator.of(context).pop();
// //       //     },
// //       //     child: Icon(
// //       //       Icons.close,
// //       //       size: 25,
// //       //     ),
// //       //   ),
// //       // ),
// //       // content: Container(
// //       //   width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.65,
// //       //   padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? 0 : 15),
// //       //   child: Column(
// //       //     children: [
// //       //       Row(
// //       //         crossAxisAlignment: CrossAxisAlignment.start,
// //       //         children: [
// //       //           Container(
// //       //             padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? 6 : 30, vertical: 20),
// //       //             child: Column(
// //       //               crossAxisAlignment: CrossAxisAlignment.center,
// //       //               children: [
// //       //                 CustomText(
// //       //                   size: Responsive.isMobile(context) ? 18 : 26,
// //       //                   color: darkred,
// //       //                   text: englishMonth(
// //       //                     provider.farmComputerContactMomentDetailsResponseModel.data!.contactMomentDate == null
// //       //                         ? "-"
// //       //                         : provider.farmComputerContactMomentDetailsResponseModel.data!.contactMomentDate.toString().substring(5, 7),
// //       //                   ),
// //       //                 ),
// //       //                 CustomText(
// //       //                   size: Responsive.isMobile(context) ? 18 : 26,
// //       //                   weight: FontWeight.bold,
// //       //                   text: provider.farmComputerContactMomentDetailsResponseModel.data!.contactMomentDate == null
// //       //                       ? "-"
// //       //                       : provider.farmComputerContactMomentDetailsResponseModel.data!.contactMomentDate.toString().substring(8, 10),
// //       //                 ),
// //       //               ],
// //       //             ),
// //       //           ),
// //       //           Expanded(
// //       //             child: Padding(
// //       //               padding: const EdgeInsets.only(right: 25),
// //       //               child: Column(
// //       //                 crossAxisAlignment: CrossAxisAlignment.start,
// //       //                 children: [
// //       //                   Row(
// //       //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //       //                     children: [
// //       //                       CustomText(
// //       //                         text: provider.farmComputerContactMomentDetailsResponseModel.data!.contactSubject ?? "-",
// //       //                         size: Responsive.isMobile(context) ? 16 : 22,
// //       //                         weight: FontWeight.w700,
// //       //                         color: darkRed,
// //       //                       ),
// //       //                     ],
// //       //                   ),
// //       //                   Padding(
// //       //                     padding: const EdgeInsets.symmetric(vertical: 25),
// //       //                     child: Row(
// //       //                       children: [
// //       //                         SizedBox(
// //       //                           width: Responsive.isMobile(context) ? 120 : 180,
// //       //                           child: Row(
// //       //                             children: [
// //       //                               Padding(
// //       //                                 padding: const EdgeInsets.only(right: 10),
// //       //                                 child: Icon(
// //       //                                   Icons.phone_outlined,
// //       //                                   size: Responsive.isMobile(context) ? 12 : 16,
// //       //                                 ),
// //       //                               ),
// //       //                               CustomText(
// //       //                                 textAligns: TextAlign.left,
// //       //                                 text: "Kind of Contact",
// //       //                                 weight: FontWeight.w700,
// //       //                                 size: Responsive.isMobile(context) ? 10 : 14,
// //       //                               ),
// //       //                             ],
// //       //                           ),
// //       //                         ),
// //       //                         CustomText(
// //       //                           textAligns: TextAlign.left,
// //       //                           text: provider.farmComputerContactMomentDetailsResponseModel.data!.contactMomentType!.isEmpty
// //       //                               ? "-"
// //       //                               : provider.farmComputerContactMomentDetailsResponseModel.data!.contactMomentType ?? "-",
// //       //                           size: Responsive.isMobile(context) ? 10 : 14,
// //       //                         ),
// //       //                       ],
// //       //                     ),
// //       //                   ),
// //       //                   Row(
// //       //                     children: [
// //       //                       SizedBox(
// //       //                         width: Responsive.isMobile(context) ? 120 : 180,
// //       //                         child: CustomText(
// //       //                           textAligns: TextAlign.left,
// //       //                           weight: FontWeight.w700,
// //       //                           text: "Attendees",
// //       //                           size: Responsive.isMobile(context) ? 10 : 14,
// //       //                         ),
// //       //                       ),
// //       //                       CustomText(
// //       //                         textAligns: TextAlign.left,
// //       //                         text: provider.farmComputerContactMomentDetailsResponseModel.data!.attendees![0].name ?? "-",
// //       //                         size: Responsive.isMobile(context) ? 10 : 14,
// //       //                       ),
// //       //                     ],
// //       //                   ),
// //       //                   SizedBox(
// //       //                     height: 10,
// //       //                   ),
// //       //                   Row(
// //       //                     children: [
// //       //                       SizedBox(
// //       //                         width: Responsive.isMobile(context) ? 120 : 180,
// //       //                         child: CustomText(
// //       //                           textAligns: TextAlign.left,
// //       //                           weight: FontWeight.w700,
// //       //                           text: "Related Farm",
// //       //                           size: Responsive.isMobile(context) ? 10 : 14,
// //       //                         ),
// //       //                       ),
// //       //                       CustomText(
// //       //                         textAligns: TextAlign.left,
// //       //                         text: Responsive.isMobile(context)
// //       //                             ? provider.farmComputerContactMomentDetailsResponseModel.data!.farm!.farmName!.substring(0, 25)
// //       //                             : provider.farmComputerContactMomentDetailsResponseModel.data!.farm!.farmName!,
// //       //                         size: Responsive.isMobile(context) ? 10 : 14,
// //       //                       ),
// //       //                     ],
// //       //                   ),
// //       //                   SizedBox(
// //       //                     height: 10,
// //       //                   ),
// //       //                   Row(
// //       //                     children: [
// //       //                       SizedBox(
// //       //                         width: Responsive.isMobile(context) ? 120 : 180,
// //       //                         child: CustomText(
// //       //                           textAligns: TextAlign.left,
// //       //                           weight: FontWeight.w700,
// //       //                           text: "Related Project",
// //       //                           size: Responsive.isMobile(context) ? 10 : 14,
// //       //                         ),
// //       //                       ),
// //       //                       CustomText(
// //       //                         textAligns: TextAlign.left,
// //       //                         text: provider.farmComputerContactMomentDetailsResponseModel.data!.project!.projectName == null
// //       //                             ? ''
// //       //                             : provider.farmComputerContactMomentDetailsResponseModel.data!.project!.projectName.toString(),
// //       //                         size: Responsive.isMobile(context) ? 10 : 14,
// //       //                       ),
// //       //                     ],
// //       //                   ),
// //       //                   SizedBox(
// //       //                     height: 26,
// //       //                   ),
// //       //                   Divider(
// //       //                     thickness: 1,
// //       //                     color: Colors.black,
// //       //                   ),
// //       //                   SizedBox(
// //       //                     height: 26,
// //       //                   ),
// //       //                   CustomText(text: "Notes:", size: Responsive.isMobile(context) ? 16 : 22, color: darkGreen, weight: FontWeight.w700),
// //       //                   SizedBox(
// //       //                     height: 20,
// //       //                   ),
// //       //                   CustomText(
// //       //                     text: provider.farmComputerContactMomentDetailsResponseModel.data!.attendeeNote ?? "-",
// //       //                     size: Responsive.isMobile(context) ? 10 : 14,
// //       //                     lines: 4,
// //       //                   ),
// //       //                 ],
// //       //               ),
// //       //             ),
// //       //           ),
// //       //         ],
// //       //       ),
// //       //       SizedBox(
// //       //         height: 40,
// //       //       ),
// //       //     ],
// //       //   ),
// //       // ),
// //     );
// //   }
// //
// //   String englishMonth(String? month) {
// //     if (month == null) {
// //       return "-";
// //     } else {
// //       switch (month) {
// //         case "01":
// //           return "JAN.";
// //         case "02":
// //           return "FEB.";
// //         case "03":
// //           return "MAR.";
// //         case "04":
// //           return "APR.";
// //         case "05":
// //           return "MAY.";
// //         case "06":
// //           return "JUN.";
// //         case "07":
// //           return "JUL.";
// //         case "08":
// //           return "AUG.";
// //         case "09":
// //           return "SEP.";
// //         case "10":
// //           return "OCT.";
// //         case "11":
// //           return "NOV.";
// //         case "12":
// //           return "DEC.";
// //         default:
// //           return "-";
// //       }
// //     }
// //   }
// // }
