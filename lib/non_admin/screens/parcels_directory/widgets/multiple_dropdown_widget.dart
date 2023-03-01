// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:wij_land/non_admin/providers/farm_computer_parcels_provider/farm_computer_parcels_provider.dart';

// import '../../../../utils/styles.dart';
// import '../../../models/farm_computer_dropdown/parcel_project_drop_down.dart';

// class MultipleDropdownWidget extends StatefulWidget {
//   MultipleDropdownWidget({
//     Key? key,
//     required this.items,
//     required this.title,
//     this.widthSize = 250,
//     this.heightSize = 50,
//     this.isVertical = false,
//     required this.mOnDropDownChange,
//     required this.mSelectedItemsList,
//     required this.mSelectedValue,
//   }) : super(key: key);
//   final List<ProjectData> items;
//   final String title;
//   double widthSize;
//   double heightSize;
//   bool isVertical;
//   final Function(String?)? mOnDropDownChange;
//   final List<String> mSelectedItemsList;
//   final String mSelectedValue;

//   @override
//   State<MultipleDropdownWidget> createState() => _MultipleDropdownWidgetState();
// }

// class _MultipleDropdownWidgetState extends State<MultipleDropdownWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<FarmComputerParcelsProvider>(
//       builder: (context, _provider, widget) {
//         return SizedBox(
//           height:
//               this.widget.heightSize > 50 ? this.widget.heightSize + 45 : null,
//           width: this.widget.widthSize,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Text(this.widget.title),
//               Container(
//                 width: this.widget.widthSize,
//                 height: this.widget.heightSize,
//                 margin: EdgeInsets.symmetric(vertical: 10),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: lightGrey, width: 1),
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(8),
//                   ),
//                   color: Colors.white,
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 6),
//                   child: Stack(
//                     // crossAxisAlignment: CrossAxisAlignment.stretch,
//                     alignment: Alignment.center,
//                     children: [
//                       DropdownButtonHideUnderline(
//                         child: DropdownButton(
//                             hint: Text("Select-Multiple"),
//                             dropdownColor: Colors.white,
//                             iconSize: 20,
//                             isDense: true,
//                             isExpanded: true,
//                             style: Theme.of(context).textTheme.headline6,
//                             value: this.widget.mSelectedValue,
//                             elevation: 12,
//                             iconDisabledColor: Colors.white,
//                             iconEnabledColor: Colors.white,
//                             icon: const Icon(
//                               Icons.keyboard_arrow_down,
//                               color: Colors.black,
//                             ),
//                             items: this.widget.items.map((ProjectData items) {
//                               return DropdownMenuItem(
//                                   value: items.name,
//                                   child: Text(
//                                     items.name.toString(),
//                                     style: TextStyle(
//                                         color: Colors.black, fontSize: 12),
//                                   ));
//                             }).toList(),
//                             selectedItemBuilder: (BuildContext context) {
//                               return this.widget.items.map((ProjectData items) {
//                                 return DropdownMenuItem(
//                                     value: items.name,
//                                     child: Text(
//                                       items.name.toString(),
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 12),
//                                     ));
//                               }).toList();
//                             },
//                             onChanged: this.widget.mOnDropDownChange),
//                       ),
//                       Container(
//                         color: Colors.white,
//                         height: this.widget.heightSize,
//                         // width: dropDownSize(),
//                         child: ListView.builder(
//                           shrinkWrap: true,
//                           scrollDirection: this.widget.isVertical
//                               ? Axis.vertical
//                               : Axis.horizontal,
//                           itemCount: this.widget.mSelectedItemsList.length,
//                           itemBuilder: ((context, index) => Padding(
//                                 padding: const EdgeInsets.all(5.0),
//                                 child: Chip(
//                                   deleteIcon: const Icon(
//                                     Icons.close,
//                                     size: 10,
//                                   ),
//                                   onDeleted: () => setState(() {
//                                     this.widget.mSelectedItemsList.remove(
//                                         this.widget.mSelectedItemsList[index]);
//                                     //         _provider.projectsListID!.clear();
//                                     _provider.projectsListID!.remove(
//                                         _provider.projectsListID![index]);
//                                   }),
//                                   label: Text(
//                                     this.widget.mSelectedItemsList[index],
//                                     style: const TextStyle(fontSize: 12),
//                                   ),
//                                   backgroundColor: primary,
//                                 ),
//                               )),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   dropDownSize() {
//     const int largeScreenSize = 1360;
//     const int mediumScreenSize = 768;
//     const int smallSceenSize = 360;
//     const int customScreenSize = 1100;

//     if (widget.widthSize <= smallSceenSize) {
//       return widget.widthSize - 40;
//     } else if (widget.widthSize > smallSceenSize &&
//         widget.widthSize <= mediumScreenSize) {
//       return widget.widthSize - 60;
//     } else if (widget.widthSize > mediumScreenSize &&
//         widget.widthSize <= customScreenSize) {
//       return widget.widthSize - 50;
//     } else {
//       return widget.widthSize - 40;
//     }
//   }
// }
