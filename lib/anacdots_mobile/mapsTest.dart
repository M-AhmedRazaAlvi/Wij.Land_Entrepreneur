// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:wij_land/anacdots_mobile/app_common_widgets/selectable_dropdown_widget.dart';
// import 'package:wij_land/anacdots_mobile/providers/anacdots_dropdowns_provider/anacdots_dropdowns_provider.dart';
// import 'package:wij_land/anacdots_mobile/utils/NotificationKeys.dart';
// import 'package:wij_land/utils/functions.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

// // Create new Anacdot
// class CreateAnacdoteScreen extends StatefulWidget {
//   const CreateAnacdoteScreen({super.key});

//   @override
//   State<CreateAnacdoteScreen> createState() => _CreateAnacdoteScreenState();
// }

// // TextEditingController dateCtl = TextEditingController();
// bool showAll = false;
// bool addImage = false;
// DateTime? date;
// List<String> itemsList = ["check mate", "abc", "def", "asdf"];
// String selectedItem = "def";
// List<String> selectedItemsList = [];
// PickResult? selectedPlace;
// bool showPlacePickerInContainer = false;
// bool showGoogleMapInContainer = false;
// final kInitialPosition = LatLng(-33.8567844, 151.213108);

// class _CreateAnacdoteScreenState extends State<CreateAnacdoteScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     var provider =
//         Provider.of<AnacdotsDropDownsProvider>(context, listen: false);
//     provider.getAnacdotsProjectDropdownData();
//     provider.getAnacdotsOrganizationsDropdownData();
//     provider.getAnacdotsPersonsDropdownData();
//      debugprint"d name ${provider.anacdotsProjectDropDownName}");
//     super.initState();
//   }

//   List<XFile>? imageList = [];

//   final ImagePicker imagePicker = ImagePicker();
//   void selectImagesFromGallery() async {
//     final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
//     if (selectedImages!.isNotEmpty) {
//       imageList!.addAll(selectedImages);
//       setState(() {
//         imageList;
//          debugprint"image list == ${imageList}");
//       });
//     }
//   }

//   XFile? _image;
//   Future getImageFromCamera() async {
//     final image = await ImagePicker().pickImage(source: ImageSource.camera);
//     if (image == null) {
//       return;
//     }
//     final imageTemporary = XFile(image.path);

//     setState(() {
//       _image = imageTemporary;
//       imageList!.add(imageTemporary);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AnacdotsDropDownsProvider>(
//         builder: (context, provider, child) {
//       return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           iconTheme: IconThemeData(
//             color: Colors.black,
//           ),
//           title:
//               Text("Daily reports", style: TextStyle(color: Color(0xff2D2D2D))),
//           centerTitle: true,
//         ),
//         //main body of form
//         body: SafeArea(
//             child: SingleChildScrollView(
//           child: Container(
//             margin: EdgeInsets.only(top: 10),
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: <Widget>[
//                       Expanded(
//                         child: Container(
//                           width: double.infinity,
//                           height: 45.0,
//                           margin: EdgeInsets.only(left: 10),
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 side: BorderSide(
//                                     color: Color(0xff009966), width: 2.0),
//                                 backgroundColor: Color(0xfff5F5F5),
//                                 textStyle: TextStyle(
//                                     fontSize: 16, fontWeight: FontWeight.w500)),
//                             onPressed: () {},
//                             child: SizedBox(
//                               width: MediaQuery.of(context).size.width * 0.2,
//                               child: Text(
//                                 textAlign: TextAlign.center,
//                                 PrefernceKey.anacdotCancel,
//                                 style: TextStyle(
//                                     color: Color(
//                                   0xff009966,
//                                 )),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Expanded(
//                         child: Container(
//                           width: double.infinity,
//                           height: 45.0,
//                           margin: EdgeInsets.only(right: 10),
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: Color(0xff009966),
//                                 textStyle: TextStyle(
//                                     fontSize: 16, fontWeight: FontWeight.w500)),
//                             onPressed: () {},
//                             child: SizedBox(
//                                 width: MediaQuery.of(context).size.width * 0.2,
//                                 child: Text(
//                                   PrefernceKey.anacdotSave,
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: Color(
//                                     0xfff5F5F5,
//                                   )),
//                                 )),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text(PrefernceKey.report,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontFamily: AppFont.bold,
//                           fontSize: 20,
//                         )),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                       margin: EdgeInsets.only(
//                           left: 10, right: 10, bottom: 10, top: 10),
//                       child: Text(
//                         PrefernceKey.summary,
//                         style: TextStyle(fontFamily: AppFont.light),
//                       )),
//                   Container(
//                     margin: EdgeInsets.only(left: 10, right: 10),
//                     child: SizedBox(
//                       width: getHeight(context) * 0.45,
//                       child: TextFormField(
//                         // controller: emailController,

//                         decoration: InputDecoration(
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Color(0xff009966), width: 2.0),
//                               borderRadius: BorderRadius.circular(0.0),
//                             ),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(2))),
//                       ),
//                     ),
//                   ),
//                   Container(
//                       margin: EdgeInsets.only(
//                           left: 10, right: 10, bottom: 10, top: 10),
//                       child: Text(
//                         PrefernceKey.date,
//                         style: TextStyle(fontFamily: AppFont.light),
//                       )),
//                   Container(
//                     margin: EdgeInsets.only(left: 10, right: 10),
//                     child: SizedBox(
//                       child: InkWell(
//                           onTap: () {
//                             showDatePicker(
//                                     context: context,
//                                     initialDate: DateTime.now(),
//                                     firstDate: DateTime(2001),
//                                     lastDate: DateTime(2023))
//                                 .then((d) {
//                               debug debugPrint"$d");
//                               if (d != null) {
//                                 setState(() {
//                                   dateCtl.text = d.toString().split(" ")[0];
//                                 });
//                               }
//                             });
//                           },
//                           child: SizedBox(
//                               height: 50,
//                               width: getHeight(context) * 0.45,
//                               child: TextFormField(
//                                   controller: dateCtl,
//                                   enabled: false,
//                                   decoration: InputDecoration(
//                                       prefixIcon: Icon(
//                                         Icons.calendar_today_outlined,
//                                         color: Color(0xFF3B4E68),
//                                       ),
//                                       prefixText: "Date ",
//                                       prefixStyle:
//                                           TextStyle(color: Colors.black),
//                                       border: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             color: Color(0xFF3B4E68),
//                                             width: 2.0,
//                                           ),
//                                           borderRadius:
//                                               BorderRadius.circular(2.0)))))),
//                     ),
//                   ),
//                   Container(
//                       margin: EdgeInsets.only(
//                           left: 10, right: 10, bottom: 10, top: 10),
//                       child: Text(
//                         PrefernceKey.description,
//                         style: TextStyle(fontFamily: AppFont.light),
//                       )),
//                   Container(
//                     margin: EdgeInsets.only(left: 10, right: 10),
//                     child: SizedBox(
//                       width: getHeight(context) * 0.45,
//                       child: TextFormField(
//                         // controller: emailController,
//                         maxLines: 5,
//                         keyboardType: TextInputType.multiline,

//                         decoration: InputDecoration(
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Color(0xff009966), width: 2.0),
//                               borderRadius: BorderRadius.circular(0.0),
//                             ),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(2))),
//                       ),
//                     ),
//                   ),
//                   Container(
//                       margin: EdgeInsets.only(
//                           left: 13, right: 13, bottom: 10, top: 30),
//                       child: Divider(
//                         thickness: 1,
//                         color: Color(0xffE4E4E4),
//                       )),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                           margin: EdgeInsets.only(
//                               left: 10, right: 10, bottom: 10, top: 10),
//                           child: Text(
//                             "Media (${imageList!.length.toString()})",
//                             style: TextStyle(
//                                 fontFamily: AppFont.heavyBold, fontSize: 20),
//                           )),

//                       //// when images are null

//                       Container(
//                           height: 45.0,
//                           margin: EdgeInsets.only(right: 10),
//                           child: Row(
//                             children: [
//                               Visibility(
//                                 visible: imageList!.isNotEmpty ? true : false,
//                                 child: Row(
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         setState(() {
//                                           showAll = !showAll;
//                                         });
//                                       },
//                                       child: Container(
//                                         width: 90,
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(5)),
//                                             border: Border.all(
//                                                 color: APPColor.anecBlack)),
//                                         child: Center(child: Text("Show All")),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 5,
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         setState(() {
//                                           addImage = true;
//                                         });
//                                         addImage
//                                             ? _settingModalBottomSheet(context)
//                                             : SizedBox.shrink();
//                                       },
//                                       child: Container(
//                                         width: 40,
//                                         height: 30,
//                                         decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(5)),
//                                             border: Border.all(
//                                                 color: APPColor.anecBlack)),
//                                         child: Icon(
//                                           Icons.add,
//                                           size: 16,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Visibility(
//                                 visible: imageList!.isEmpty ? true : false,
//                                 child: Container(
//                                   margin: EdgeInsets.only(right: 10),
//                                   width: getWidth(context) * 0.52,
//                                   child: ElevatedButton(
//                                     onPressed: () {
//                                       setState(() {
//                                         addImage = true;
//                                       });
//                                       addImage
//                                           ? _settingModalBottomSheet(context)
//                                           : SizedBox.shrink();
//                                     },
//                                     style: ElevatedButton.styleFrom(
//                                         side: BorderSide(
//                                             color: Color(0xff009966),
//                                             width: 2.0),
//                                         backgroundColor: Color(0xfff5F5F5),
//                                         textStyle: TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w500)),
//                                     child: SizedBox(
//                                         width:
//                                             MediaQuery.of(context).size.width *
//                                                 0.2,
//                                         child: SvgPicture.asset(
//                                             'assets/mobilizer-images/camera.svg')),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           )),
//                     ],
//                   ),
//                   Visibility(
//                     visible: imageList!.isEmpty ? false : true,
//                     child: Container(
//                       margin: EdgeInsets.only(right: 10, left: 8),
//                       child: Column(
//                         children: [
//                           GridView.builder(
//                               shrinkWrap: true,
//                               gridDelegate:
//                                   const SliverGridDelegateWithMaxCrossAxisExtent(
//                                       maxCrossAxisExtent: 120,
//                                       childAspectRatio: 2 / 2,
//                                       crossAxisSpacing: 10,
//                                       mainAxisSpacing: 20),
//                               itemCount: imageList!.isEmpty
//                                   ? 0
//                                   : showAll
//                                       ? imageList!.length
//                                       : imageList!.length > 4
//                                           ? 4
//                                           : imageList!.length,
//                               itemBuilder: (_, index) {
//                                 return Stack(
//                                   children: [
//                                     Container(
//                                         margin:
//                                             EdgeInsets.only(right: 5, left: 5),
//                                         width: 120,
//                                         height: 90.0,
//                                         child: imageList == null
//                                             ? Container()
//                                             : ClipRRect(
//                                                 borderRadius: BorderRadius.all(
//                                                     Radius.circular(10)),
//                                                 child: Image.file(
//                                                   File(imageList![index].path),
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               )),
//                                     Positioned(
//                                       top: 10,
//                                       right: 10,
//                                       child: InkWell(
//                                         onTap: () {
//                                           setState(() {
//                                             setState(() =>
//                                                 imageList!.removeAt(index));
//                                           });
//                                         },
//                                         child: Icon(
//                                           Icons.close,
//                                           color: Color.fromARGB(
//                                               255, 110, 110, 110),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 );
//                               }),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Container(
//                       margin: EdgeInsets.only(
//                           left: 13, right: 13, bottom: 10, top: 30),
//                       child: Divider(
//                         thickness: 1,
//                         color: Color(0xffE4E4E4),
//                       )),
//                   Row(
//                     children: [
//                       Expanded(
//                         flex: 5,
//                         child: Container(
//                             margin: EdgeInsets.only(
//                                 left: 10, right: 10, bottom: 10, top: 10),
//                             child: Text(
//                               PrefernceKey.location,
//                               style: TextStyle(
//                                   fontFamily: AppFont.heavyBold, fontSize: 20),
//                             )),
//                       ),
//                       showPlacePickerInContainer
//                           ? Expanded(
//                               flex: 1,
//                               child: InkWell(
//                                   onTap: (() {
//                                     showPlacePickerInContainer = false;
//                                   }),
//                                   child: Icon(Icons.close)),
//                             )
//                           : Expanded(
//                               flex: 7,
//                               child: InkWell(
//                                 onTap: (() {
//                                   showPlacePickerInContainer = true;
//                                 }),
//                                 child: Container(
//                                   width: double.infinity,
//                                   height: 45.0,
//                                   margin: EdgeInsets.only(right: 20),
//                                   child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                         side: BorderSide(
//                                             color: Color(0xff009966),
//                                             width: 2.0),
//                                         backgroundColor: Color(0xfff5F5F5),
//                                         textStyle: TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w500)),
//                                     onPressed: () {},
//                                     child: SizedBox(
//                                       width: MediaQuery.of(context).size.width *
//                                           0.2,
//                                       child: SvgPicture.asset(
//                                           'assets/mobilizer-images/map_marker.svg'),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                     ],
//                   ),
//                   showPlacePickerInContainer
//                       ? Container(
//                           margin: EdgeInsets.only(left: 10, right: 10),
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height * 0.35,
//                           child: PlacePicker(
//                               forceAndroidLocationManager: true,
//                               apiKey: 'AIzaSyBNPqaEb4zwyD5DjJ8RRZ6srgO8_k5wJx0',
//                               hintText: "Find a place ...",
//                               searchingText: "Please wait ...",
//                               selectText: "Select place",
//                               initialPosition: kInitialPosition,
//                               useCurrentLocation: true,
//                               selectInitialPosition: true,
//                               usePinPointingSearch: true,
//                               usePlaceDetailSearch: true,
//                               zoomGesturesEnabled: true,
//                               zoomControlsEnabled: true,
//                               initialMapType: MapType.hybrid,
//                               onPlacePicked: (PickResult result) {
//                                 setState(() {
//                                   // selectedPlace = result;
//                                   showPlacePickerInContainer = false;
//                                 });
//                               },
//                               onTapBack: () {
//                                 setState(() {
//                                   showPlacePickerInContainer = false;
//                                 });
//                               }))
//                       : Container(),
//                   Container(
//                       margin: EdgeInsets.only(
//                           left: 13, right: 13, bottom: 10, top: 30),
//                       child: Divider(
//                         thickness: 1,
//                         color: Color(0xffE4E4E4),
//                       )),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text(PrefernceKey.tagHeading,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontFamily: AppFont.bold,
//                           fontSize: 20,
//                         )),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(left: 10, right: 10),
//                     child: SizedBox(
//                       width: getHeight(context) * 0.45,
//                       child: SelectableDropdownWidget(
//                         items: provider.personsItemList,
//                         title: PrefernceKey.people,
//                         mSelectedValue: provider.anacdotsPersonsDropDownName,
//                         mSelectedItemsList:
//                             provider.selectedAnacdotsPersonsDropDownList,
//                         mOnDropDownChange: (value) {
//                           setState(
//                             () {
//                               provider.anacdotsPersonsDropDownName =
//                                   value as String;
//                               if (!provider.selectedAnacdotsPersonsDropDownList
//                                   .contains(
//                                       provider.anacdotsPersonsDropDownName)) {
//                                 provider.selectedAnacdotsPersonsDropDownList
//                                     .add(provider.anacdotsPersonsDropDownName);
//                               }
//                                debugprint
//                                   "selected ${provider.selectedAnacdotsPersonsDropDownList}");
//                               // _provider.mShowFilterActions = true;
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(left: 10, right: 10),
//                     child: SizedBox(
//                       width: getHeight(context) * 0.45,
//                       child: SelectableDropdownWidget(
//                         items: provider.organizationsItemList,
//                         title: PrefernceKey.organization,
//                         mSelectedValue:
//                             provider.anacdotsOrganizationsDropDownName,
//                         mSelectedItemsList:
//                             provider.selectedAnacdotsOrganizationstDropDownList,
//                         mOnDropDownChange: (value) {
//                           setState(
//                             () {
//                               provider.anacdotsOrganizationsDropDownName =
//                                   value as String;
//                               if (!provider
//                                   .selectedAnacdotsOrganizationstDropDownList
//                                   .contains(provider
//                                       .anacdotsOrganizationsDropDownName)) {
//                                 provider
//                                     .selectedAnacdotsOrganizationstDropDownList
//                                     .add(provider
//                                         .anacdotsOrganizationsDropDownName);
//                               }
//                                debugprint
//                                   "selected ${provider.selectedAnacdotsOrganizationstDropDownList}");
//                               // _provider.mShowFilterActions = true;
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(left: 10, right: 10),
//                     child: SizedBox(
//                       width: getHeight(context) * 0.45,
//                       child: SelectableDropdownWidget(
//                         items: itemsList,
//                         title: PrefernceKey.tags,
//                         mSelectedValue: selectedItem,
//                         mSelectedItemsList: selectedItemsList,
//                         mOnDropDownChange: (value) {
//                           setState(
//                             () {
//                               selectedItem = value as String;
//                               if (!selectedItemsList.contains(selectedItem)) {
//                                 selectedItemsList.add(selectedItem);
//                               }
//                                debugprint"selected $selectedItemsList");
//                               // _provider.mShowFilterActions = true;
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(left: 10, right: 10),
//                     child: SizedBox(
//                       width: getHeight(context) * 0.45,
//                       child: SelectableDropdownWidget(
//                         items: provider.projectsItemList,
//                         title: PrefernceKey.project,
//                         mSelectedValue: provider.anacdotsProjectDropDownName,
//                         mSelectedItemsList:
//                             provider.selectedAnacdotsProjectDropDownList,
//                         mOnDropDownChange: (value) {
//                           setState(
//                             () {
//                               provider.anacdotsProjectDropDownName =
//                                   value as String;
//                               if (!provider.selectedAnacdotsProjectDropDownList
//                                   .contains(
//                                       provider.anacdotsProjectDropDownName)) {
//                                 provider.selectedAnacdotsProjectDropDownList
//                                     .add(provider.anacdotsProjectDropDownName);
//                               }
//                                debugprint
//                                   "selected ${provider.selectedAnacdotsProjectDropDownList}");
//                               // _provider.mShowFilterActions = true;
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                 ]),
//           ),
//         )),
//       );
//     });
//   }

//   void _settingModalBottomSheet(context) {
//     showModalBottomSheet(
//         isDismissible: true,
//         context: context,
//         builder: (BuildContext bc) {
//           return Container(
//             child: Wrap(
//               children: <Widget>[
//                 ListTile(
//                     leading: Icon(Icons.camera),
//                     title: Text('Camera'),
//                     onTap: () =>
//                         {Navigator.pop(context), getImageFromCamera()}),
//                 ListTile(
//                   leading: Icon(Icons.browse_gallery_outlined),
//                   title: Text('Gallery'),
//                   onTap: () => {
//                     Navigator.pop(context),
//                     selectImagesFromGallery(),
//                     setState(
//                       () {},
//                     )
//                   },
//                 ),
//               ],
//             ),
//           );
//         });
//   }
// }
