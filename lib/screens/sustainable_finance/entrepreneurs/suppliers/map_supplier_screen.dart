// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:wij_land/api_clients/entrepreneur_client.dart';
// import 'package:wij_land/app_common_widgets/on_hover.dart';
// import 'package:wij_land/app_common_widgets/text_widget.dart';
// import 'package:wij_land/models/entrepreneur/response/get_entrepreneure_supplier_response.dart';
// import 'package:wij_land/providers/entrepreneur/entrepreneur_screen_overview_provider.dart';
// import 'package:wij_land/screens/office/widgets/add_text_button_widget.dart';
// import 'package:wij_land/screens/sustainable_finance/entrepreneurs/suppliers/dialog_supplier.dart';
// import 'package:wij_land/screens/sustainable_finance/entrepreneurs/suppliers/edit_dialog.dart';
// import 'package:wij_land/screens/sustainable_finance/entrepreneurs/suppliers/map_info_supplier.dart';
// import 'package:wij_land/screens/sustainable_finance/entrepreneurs/suppliers/supplier_info.dart';
// import '../../../../app_common_widgets/animated_search.dart';
// import '../../../../app_common_widgets/custom_text.dart';
// import '../../../../app_common_widgets/icon_text_container.dart';
// import '../../../../providers/entrepreneur/entrepreneur_supplier_provider.dart';
// import '../../../../utils/functions.dart';
// import '../../../../utils/responsive.dart';
// import '../../../../utils/styles.dart';
// import '../../../office/office_programes/Widgets/on_hover_button_widget.dart';

// enum DeleteStatus {
//   single,
//   multiple,
//   all,
// }

// class MapSupplierScreen extends StatefulWidget {
//   final arguments;

//   final GetEntrepreneurSupplierResponse? model;
//   final int? id;

//   const MapSupplierScreen({Key? key, this.arguments, this.model, this.id})
//       : super(key: key);

//   @override
//   State<MapSupplierScreen> createState() => _MapSupplierScreenState();
// }

// class _MapSupplierScreenState extends State<MapSupplierScreen> {
//   bool isLoading = false;
//   final TextEditingController startdate = TextEditingController(),
//       endDate = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     isLoading = true;
//     WidgetsBinding.instance?.addPostFrameCallback((_) {
//       Provider.of<CreateNewEntreprenuerSupplier>(context, listen: false)
//           .getAllSupplier(
//         entreprenuerId: widget.arguments,
//       );

//       isLoading = false;
//     });
//   }

//   // mapDisalble() {
//   //   setState(() {
//   //     Provider.of<EntrepreneurOverviewScreenProvider>(context).mapOpened =
//   //         false;
//   //   });
//   // }

//   String? textController;

//   late int supplierId;
//   late int id;
//   bool checkedAllList = false;
//   List allCheckedBoxId = [];

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     setState(() {
//       //mapDisalble();

//       checkedAllList = false;
//       allCheckedBoxId.clear();
//     });
//   }

//   bool singleId = false, isFilter = false;
//   List multipleIndex = [];

//   @override
//   Widget build(BuildContext context) {
//     var responseData = Provider.of<CreateNewEntreprenuerSupplier>(context);

//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Card(
//           elevation: 3,
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//             child: Column(
//               //crossAxisAlignment: CrossAxisAlignment.stretch,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Responsive.isMobile(context)
//                     ? SizedBox(
//                         width: getWidth(context) * 0.3,
//                         child: Column(
//                           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           // crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Icon(
//                                   Icons.location_on,
//                                   size: 30,
//                                   color: yellowishGreen,
//                                 ),
//                                 CustomText(
//                                   text: "Supplier",
//                                   color: darkGreen,
//                                   size: 20,
//                                   weight: FontWeight.bold,
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 AnimatedSearchWidget(
//                                   width: 200,
//                                   onChangeValue: (value) {
//                                     setState(() {
//                                       textController = value;
//                                     });
//                                   },
//                                   onSubmit: (values) async {
//                                     setState(() {
//                                       isLoading = true;
//                                     });
//                                     await Provider.of<
//                                                 CreateNewEntreprenuerSupplier>(
//                                             context,
//                                             listen: false)
//                                         .getAllSupplier(
//                                             entreprenuerId: widget.arguments,
//                                             searchValue: values);
//                                     setState(() {
//                                       isLoading = false;
//                                     });
//                                   },
//                                 ),
//                                 OnHoverButtonWidget(
//                                   icons: Icons.filter_alt,
//                                   onTap: () {
//                                     setState(() {
//                                       isFilter = !isFilter;
//                                     });
//                                   },
//                                 ),
//                                 IconAndTextContainer(
//                                   addText: "Supplier",
//                                   onTap: () {
//                                     showDialog(
//                                         context: context,
//                                         builder: (BuildContext context) {
//                                           return SupplierDialog(
//                                               args: widget.arguments);
//                                         });
//                                   },
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       )
//                     : SizedBox(
//                         width: getWidth(context) * 0.37,
//                         child: Column(
//                           //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.location_on,
//                                       size: 35,
//                                       color: yellowishGreen,
//                                     ),
//                                     CustomText(
//                                       text: "Supplier",
//                                       color: darkGreen,
//                                       size: 25,
//                                       weight: FontWeight.bold,
//                                     ),
//                                   ],
//                                 ),
//                                 IconAndTextContainer(
//                                   addText: "Supplier",
//                                   onTap: () {
//                                     showDialog(
//                                         context: context,
//                                         builder: (BuildContext context) {
//                                           return SupplierDialog(
//                                               args: widget.arguments);
//                                         });
//                                   },
//                                 )
//                               ],
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 AnimatedSearchWidget(
//                                   width: 250,
//                                   onChangeValue: (value) {
//                                     setState(() {
//                                       textController = value;
//                                     });
//                                   },
//                                   onSubmit: (values) async {
//                                     setState(() {
//                                       isLoading = true;
//                                     });
//                                     await Provider.of<
//                                                 CreateNewEntreprenuerSupplier>(
//                                             context,
//                                             listen: false)
//                                         .getAllSupplier(
//                                             entreprenuerId: widget.arguments,
//                                             searchValue: values);
//                                     setState(() {
//                                       isLoading = false;
//                                     });
//                                   },
//                                 ),
//                                 OnHoverButtonWidget(
//                                   icons: Icons.filter_alt,
//                                   onTap: () {
//                                     setState(() {
//                                       isFilter = !isFilter;
//                                     });
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 isFilter
//                     ? SizedBox(
//                         height: 65,
//                         width: getWidth(context) * 0.37,
//                         child: Card(
//                           elevation: 4,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10)),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: SizedBox(
//                               height: 100,
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: [
//                                   InkWell(
//                                       onTap: () {
//                                         showDatePicker(
//                                                 context: context,
//                                                 initialDate: DateTime.now(),
//                                                 firstDate: DateTime(2001),
//                                                 lastDate: DateTime(2023))
//                                             .then((d) {
//                                           debug debugPrint"$d");
//                                           if (d != null) {
//                                             setState(() {
//                                               startdate.text =
//                                                   d.toString().split(" ")[0];
//                                             });
//                                           }
//                                         });
//                                       },
//                                       child: Builder(
//                                         builder: (context) => SizedBox(
//                                           height: 50,
//                                           width: 130,
//                                           child: TextWidgetField(
//                                             controller: startdate,
//                                             hintText: "From",
//                                             textPadding: EdgeInsets.only(
//                                                 top: 5, left: 10),
//                                             enabled: false,
//                                             suffixIcon: const Icon(
//                                               Icons.calendar_today_outlined,
//                                               size: 14,
//                                             ),
//                                           ),
//                                         ),
//                                       )),
//                                   SizedBox(
//                                     width: 12,
//                                   ),
//                                   InkWell(
//                                       onTap: () {
//                                         showDatePicker(
//                                                 context: context,
//                                                 initialDate: DateTime.now(),
//                                                 firstDate: DateTime(2001),
//                                                 lastDate: DateTime(2023))
//                                             .then((d) {
//                                           debug debugPrint"$d");
//                                           if (d != null) {
//                                             setState(() {
//                                               endDate.text =
//                                                   d.toString().split(" ")[0];
//                                             });
//                                           }
//                                         });
//                                       },
//                                       child: Builder(
//                                         builder: (context) => SizedBox(
//                                           height: 50,
//                                           width: 130,
//                                           child: TextWidgetField(
//                                             controller: endDate,
//                                             hintText: "To",
//                                             textPadding: EdgeInsets.only(
//                                                 top: 5, left: 10),
//                                             enabled: false,
//                                             suffixIcon: const Icon(
//                                               Icons.calendar_today_outlined,
//                                               size: 14,
//                                             ),
//                                           ),
//                                         ),
//                                       )),
//                                   Expanded(child: SizedBox.shrink()),
//                                   AddTextButtonWidget(
//                                     text: 'Apply',
//                                     colors: yellow,
//                                     onPress: () async {
//                                       setState(() {
//                                         isLoading = true;
//                                       });
//                                       await responseData.getAllSupplier(
//                                           entreprenuerId: widget.arguments,
//                                           from: startdate.text,
//                                           to: endDate.text);
//                                       setState(() {
//                                         isLoading = false;
//                                       });
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       )
//                     : SizedBox.shrink(),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 SizedBox(
//                   width: getWidth(context) * 0.37,
//                   child: Stack(
//                     children: [
//                       SingleChildScrollView(
//                         //scrollDirection: Axis.horizontal,
//                         child: Column(
//                           children: [
//                             MapSupplierInfoWidget(
//                               isChecked: true,
//                               farmName: "Farm Name",
//                               farmRep: "Farm Rep.",
//                               size: 16,
//                               weight: FontWeight.bold,
//                               width: Responsive.isMobile(context)
//                                   ? getWidth(context) / 4
//                                   : getWidth(context) / 8,
//                               value: checkedAllList,
//                               onChanged: (value) {
//                                 setState(() {
//                                   allCheckedBoxId.clear();
//                                   if (checkedAllList == true) {
//                                     checkedAllList = false;
//                                     for (int i = 0;
//                                         i <
//                                             responseData.getSupplierResponse!
//                                                 .data!.length;
//                                         i++) {
//                                       responseData.getcheckedBool[i] = false;
//                                     }
//                                     allCheckedBoxId = [];
//                                   } else {
//                                     checkedAllList = true;
//                                     for (int i = 0;
//                                         i <
//                                             responseData.getSupplierResponse!
//                                                 .data!.length;
//                                         i++) {
//                                       responseData.getcheckedBool[i] = true;
//                                       allCheckedBoxId.add(responseData
//                                           .getSupplierResponse!.data![i].id);
//                                     }
//                                   }
//                                 });
//                               },
//                             ),
//                             isLoading
//                                 ? SizedBox(
//                                     height: getHeight(context) / 2,
//                                     width: getWidth(context),
//                                     child: Center(
//                                       child: CircularProgressIndicator(),
//                                     ),
//                                   )
//                                 : responseData.getSupplierResponse!.status ==
//                                         404
//                                     ? SizedBox(
//                                         height: getHeight(context),
//                                         width: getWidth(context),
//                                         child: Align(
//                                             alignment: Alignment.topCenter,
//                                             child: CustomText(
//                                               text:
//                                                   '${responseData.getSupplierResponse!.message}',
//                                               color: Colors.red,
//                                               weight: FontWeight.w700,
//                                               size: 20,
//                                             )),
//                                       )
//                                     : Column(
//                                         children: [
//                                           for (int i = 0;
//                                               i <
//                                                   responseData
//                                                       .getSupplierResponse!
//                                                       .data!
//                                                       .length;
//                                               i++)
//                                             MapSupplierInfoWidget(
//                                               isChecked: true,
//                                               width:
//                                                   Responsive.isMobile(context)
//                                                       ? getWidth(context) / 4
//                                                       : getWidth(context) / 8,
//                                               value: responseData
//                                                   .getcheckedBool[i],
//                                               onChanged: (val) {
//                                                 setState(() {
//                                                   if (responseData
//                                                           .getcheckedBool[i] ==
//                                                       true) {
//                                                     responseData
//                                                             .getcheckedBool[i] =
//                                                         false;
//                                                     allCheckedBoxId.removeAt(i);
//                                                   } else {
//                                                     responseData
//                                                             .getcheckedBool[i] =
//                                                         true;
//                                                     if (!allCheckedBoxId
//                                                         .contains(responseData
//                                                             .getSupplierResponse!
//                                                             .data![i]
//                                                             .id!)) {
//                                                       allCheckedBoxId.add(
//                                                           responseData
//                                                               .getSupplierResponse!
//                                                               .data![i]
//                                                               .id!);
//                                                       multipleIndex.add(i);
//                                                     } else {
//                                                       supplierId = responseData
//                                                           .getSupplierResponse!
//                                                           .data![i]
//                                                           .id!;
//                                                       id = i;
//                                                       singleId = true;
//                                                     }
//                                                   }
//                                                 });
//                                               },
//                                               farmName: responseData
//                                                       .getSupplierResponse!
//                                                       .data![i]
//                                                       .farmAutoName ??
//                                                   "Null",
//                                               farmRep: responseData
//                                                       .getSupplierResponse!
//                                                       .data![i]
//                                                       .farmRepresentativeName ??
//                                                   "Null",
//                                               size: 14,
//                                               weight: FontWeight.normal,
//                                               onTap: () async {
//                                                 showDialog(
//                                                   context: context,
//                                                   builder:
//                                                       (BuildContext context) {
//                                                     return EditSupplierDialog(
//                                                       args: widget.arguments,
//                                                       isAllEditSupplier: false,
//                                                       supplierid: responseData
//                                                           .getSupplierResponse!
//                                                           .data![i]
//                                                           .id,
//                                                       farmId: responseData
//                                                           .getSupplierResponse!
//                                                           .data![i]
//                                                           .farmId
//                                                           .toString(),
//                                                       wiRelationType: responseData
//                                                               .getSupplierResponse!
//                                                               .data![i]
//                                                               .wiRelationType ??
//                                                           "Null",
//                                                       connectSince: responseData
//                                                               .getSupplierResponse!
//                                                               .data![i]
//                                                               .connectSince ??
//                                                           "Null",
//                                                       phone: responseData
//                                                               .getSupplierResponse!
//                                                               .data![i]
//                                                               .phoneNum ??
//                                                           "Null",
//                                                     );
//                                                   },
//                                                 );
//                                               },
//                                             ),
//                                         ],
//                                       ),
//                           ],
//                         ),
//                       ),
//                       Positioned(
//                         top: 0,
//                         right: 15,
//                         child: PopupMenuButton(
//                           // color: Colors.black,
//                           child: OnHover(
//                             builder: (hover) => SizedBox(
//                               height: 50,
//                               width: 50,
//                               child: Card(
//                                 color:
//                                     hover ? Colors.greenAccent : Colors.white,
//                                 shape: const RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(8),
//                                   ),
//                                 ),
//                                 child: const Icon(
//                                   Icons.more_vert,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                           ),

//                           itemBuilder: (context) => [
//                             PopupMenuItem(
//                               value: 1,
//                               child: Row(
//                                 children: const <Widget>[
//                                   Padding(
//                                     padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
//                                     child: Icon(
//                                       Icons.delete,
//                                       color: Colors.greenAccent,
//                                     ),
//                                   ),
//                                   Text('Delete'),
//                                 ],
//                               ),
//                             ),
//                             PopupMenuItem(
//                               value: 2,
//                               child: Row(
//                                 children: const <Widget>[
//                                   Padding(
//                                     padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
//                                     child: Icon(
//                                       Icons.download,
//                                       color: Colors.greenAccent,
//                                     ),
//                                   ),
//                                   Text('Download CSV'),
//                                 ],
//                               ),
//                             ),
//                             PopupMenuItem(
//                               value: 3,
//                               child: Row(
//                                 children: const <Widget>[
//                                   Padding(
//                                     padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
//                                     child: Icon(
//                                       Icons.edit,
//                                       color: Colors.greenAccent,
//                                     ),
//                                   ),
//                                   Text('Bulk Edit'),
//                                 ],
//                               ),
//                             ),
//                           ],
//                           onSelected: (value) async {
//                             if (value == 1) {
//                               showDialog(
//                                 context: context,
//                                 builder: (context) => AlertDialog(
//                                   title: const Text('Delete Blog'),
//                                   content: const Text(
//                                       'Do you want to delete this blog?'),
//                                   actions: [
//                                     InkWell(
//                                       onTap: () {
//                                         Navigator.of(context).pop();
//                                       },
//                                       child: const Padding(
//                                         padding: EdgeInsets.all(8.0),
//                                         child: Text('No'),
//                                       ),
//                                     ),
//                                     InkWell(
//                                       onTap: () async {
//                                         if (checkedAllList == false) {
//                                           if (singleId == true) {
//                                              debugprint
//                                                 "Single Selected======================================");
//                                             await EntrepreneurClients
//                                                 .deleteEntreprenuerSupplierResponseData(
//                                               id: widget.arguments,
//                                               supplierid: supplierId,
//                                               isBulkDelete: false,
//                                             );
//                                             responseData
//                                                 .getSupplierResponse!.data!
//                                                 .removeAt(id);
//                                             setState(() {
//                                               Provider.of<CreateNewEntreprenuerSupplier>(
//                                                       context,
//                                                       listen: false)
//                                                   .getAllSupplier(
//                                                 entreprenuerId:
//                                                     widget.arguments,
//                                               );
//                                             });
//                                             responseData.getcheckedBool[
//                                                 multipleIndex.length] = false;
//                                             Navigator.of(context).pop();
//                                           } else {
//                                              debugprint
//                                                 "Multiple selected data======================================");
//                                             await EntrepreneurClients
//                                                 .deleteEntreprenuerSupplierResponseData(
//                                               id: widget.arguments,
//                                               supplierid: allCheckedBoxId,
//                                               isBulkDelete: true,
//                                             );

//                                             setState(() {
//                                               Provider.of<CreateNewEntreprenuerSupplier>(
//                                                       context,
//                                                       listen: false)
//                                                   .getAllSupplier(
//                                                 entreprenuerId:
//                                                     widget.arguments,
//                                               );
//                                             });
//                                             responseData.getcheckedBool[
//                                                 multipleIndex.length] = false;
//                                             Navigator.of(context).pop();
//                                           }
//                                         } else {
//                                            debugprint
//                                               "All Selected======================================");
//                                           await EntrepreneurClients
//                                               .deleteEntreprenuerSupplierResponseData(
//                                             id: widget.arguments,
//                                             supplierid: allCheckedBoxId,
//                                             isBulkDelete: true,
//                                           );

//                                           setState(() {
//                                             Provider.of<CreateNewEntreprenuerSupplier>(
//                                                     context,
//                                                     listen: false)
//                                                 .getAllSupplier(
//                                               entreprenuerId: widget.arguments,
//                                             );
//                                           });
//                                           responseData.getcheckedBool[
//                                               multipleIndex.length] = false;
//                                           Navigator.of(context).pop();
//                                         }
//                                       },
//                                       child: const Padding(
//                                         padding: EdgeInsets.all(8.0),
//                                         child: Text('Yes'),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ).then((value) {
//                                 if (value == 'yes') {
//                                   setState(() {});
//                                 }
//                               });
//                             }
//                             if (value == 2) {}
//                             if (value == 3) {
//                               showDialog(
//                                   context: context,
//                                   builder: (_) {
//                                     return EditSupplierDialog(
//                                       farmId: '',
//                                       connectSince: '',
//                                       wiRelationType: '',
//                                       phone: '',
//                                       args: widget.arguments,
//                                       isAllEditSupplier: true,
//                                       supplierid: allCheckedBoxId,
//                                     );
//                                   });
//                             }
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
