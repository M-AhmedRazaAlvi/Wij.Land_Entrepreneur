import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/anacdots_mobile/app_common_widgets/selectable_dropdown_widget.dart';
import 'package:wij_land/anacdots_mobile/providers/anacdots_dropdowns_provider/anacdots_dropdowns_provider.dart';
import 'package:wij_land/anacdots_mobile/utils/NotificationKeys.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as map;
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import '../../../../../app_common_widgets/ancadots_toast_widget.dart';
import '../../../../../models/anecdotes_model/get_anacdots_by_id_reponse.dart';
import '../../../../../models/anecdotes_model/put_anecdots_request.dart' as put;
import '../../../../../providers/anecdotes_directory_providers/anecdotes_file_provider.dart';

// Create new Anacdot
AnacdotsDropDownsProvider? allDropDown;

class EditAnecdotsScreen extends StatefulWidget {
  int? createdById;
  String? date;
  String? description;
  int? id;
  bool? isShared;
  Locations? locations;
  String? title;
  List<AnecOrgs>? anecOrgs;
  List<AnecPersons>? anecPersons;
  List<AnecProjects>? anecProjects;
  List<AnecdoteFiles>? anecdoteFiles;
  List<String>? anecdoteTags;
  AnecdotsData model;

  EditAnecdotsScreen({
    super.key,
    this.createdById,
    this.date,
    this.description,
    this.id,
    this.isShared,
    this.locations,
    this.title,
    this.anecOrgs,
    this.anecPersons,
    this.anecProjects,
    this.anecdoteFiles,
    this.anecdoteTags,
    required this.model,
  });

  @override
  State<EditAnecdotsScreen> createState() => _EditAnecdotsScreenState();
}

bool showAll = false;
bool addImage = false;
DateTime? date;
PickResult? selectedPlace;

class _EditAnecdotsScreenState extends State<EditAnecdotsScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateCtl = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late String titleName = '';
  late String description = '';
  var kInitialPosition;
  String updatedAddressField = '';
  double? updatedLat;
  double? updatedLng;

  @override
  void initState() {
    print("herreererereree$isLoading");
    getData();

    super.initState();
  }

  bool isLoading = false;

  getData() {
    print("anecOrgs:::::::::::::::${widget.model.anecOrgs}");
    print("anecPersons:::::::::::::::${widget.model.anecPersons}");
    print("anecProjects:::::::::::::::${widget.model.anecProjects}");
    print("anecdoteTags:::::::::::::::${widget.model.anecdoteTags}");
    titleController.text = widget.title!;
    dateCtl.text = widget.date!;
    descriptionController.text = widget.description!;
    //  isLoading=true;
    //============Maps==================
    if (widget.locations!.lat != "") {
      kInitialPosition = map.LatLng(
          double.parse("${widget.model.locations!.lat}"),
          double.parse("${widget.model.locations!.long}"));
    } else {
      kInitialPosition = map.LatLng(double.parse("0"), double.parse("0"));
    }

    // debugPrint("Lat:::::::::::::::${widget.model.locations!.lat}"
    //     ""
    //     ""
    //     "long:::::::::::${widget.model.locations!.long}");
    var provider =
        Provider.of<AnacdotsDropDownsProvider>(context, listen: false);
    provider.selectedPlace = null;
    provider.selectedAnacdotsProjectDropDownList.clear();
    provider.projectsItemListIds.clear();
    provider.selectedAnacdotsOrganizationstDropDownList.clear();
    provider.selectedAnacdotsOrganizationstDropDownIds.clear();
    provider.selectedAnacdotsPersonsDropDownList.clear();
    provider.selectedAnacdotsPersonsDropDownIds.clear();
    provider.selectedItemsTagList.clear();
    updatedAddressField = widget.model.locations!.address!;

    //==============Project Data===============

    for (int i = 0; i < widget.anecProjects!.length; i++) {
      provider.selectedAnacdotsProjectDropDownList
          .add(widget.anecProjects![i].name!);
    }
    //==============Organization Data===============

    for (int i = 0; i < widget.anecOrgs!.length; i++) {
      provider.selectedAnacdotsOrganizationstDropDownList
          .add(widget.anecOrgs![i].orgName!);
      provider.selectedAnacdotsOrganizationstDropDownIds
          .add(widget.anecOrgs![i].orgId!);
    }

    //==============person Data===============

    for (int i = 0; i < widget.anecPersons!.length; i++) {
      provider.selectedAnacdotsPersonsDropDownList
          .add(widget.anecPersons![i].personName!);
      provider.selectedAnacdotsPersonsDropDownIds
          .add(widget.anecPersons![i].personId!);
      provider.calDropDownData();
    }

    //==============Tags Data===============

    for (int i = 0; i < widget.anecdoteTags!.length; i++) {
      provider.selectedItemsTagList.add(widget.anecdoteTags![i]);
      provider.calDropDownData();
    }
    //===========Media Files=============
    for (int i = 0; i < widget.anecdoteFiles!.length; i++) {
      provider.updatedAndecdotsFiles.add(widget.anecdoteFiles![i].id!);
      //   provider.calDropDownData();
    }
  }

  List<XFile>? imageList = [];

  //===========Gallary Access============

  final ImagePicker imagePicker = ImagePicker();
  void selectImagesFromGallery() async {
    var provider =
        Provider.of<AnacdotsDropDownsProvider>(context, listen: false);
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageList!.addAll(selectedImages);
      setState(() {
        imageList;

        provider.uploadMediaRequest(context, imageList!);

        debugPrint("image list == $imageList");
      });
    }
  }
  //===========Camera Access============

  XFile? _image;
  Future getImageFromCamera() async {
    var provider =
        Provider.of<AnacdotsDropDownsProvider>(context, listen: false);
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    final imageTemporary = XFile(image.path);

    setState(() {
      _image = imageTemporary;
      imageList!.add(imageTemporary);
      provider.uploadMediaRequest(context, imageList!);
    });
  }

  var newList = [];
  @override
  Widget build(BuildContext context) {
    return Consumer2<AnacdotsDropDownsProvider, CreateMyAnecdotesFileProvider>(
        builder: (context, provider, fileProvider, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text(widget.date!, style: TextStyle(color: Color(0xff2D2D2D))),
          centerTitle: true,
        ),
        //main body of form
        body: isLoading
            ? Center(child: SpinKitCircle(color: APPColor.darkGreen))
            : SafeArea(
                child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: 45.0,
                                margin: EdgeInsets.only(left: 10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      side: BorderSide(
                                          color: Color(0xff009966), width: 1.0),
                                      backgroundColor: Colors.white,
                                      textStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      PrefernceKey.anacdotCancel,
                                      style: TextStyle(
                                          color: Color(
                                        0xff009966,
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: 45.0,
                                margin: EdgeInsets.only(right: 10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff009966),
                                      textStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                  onPressed: () async {
                                    isLoading = true;

                                    setState(() {});

                                    debugPrint("step 1");
                                    print(
                                        "SELECTED persons Final ID's ${provider.selectedAnacdotsPersonsDropDownIds}");
                                    put.AnecdoteTags anectags = put.AnecdoteTags(
                                        organizationId: provider
                                            .selectedAnacdotsOrganizationstDropDownIds,
                                        personId: provider
                                            .selectedAnacdotsPersonsDropDownIds,
                                        projectId: provider
                                            .selectedAnacdotsProjectDropDownIds,
                                        tag: provider.selectedItemsTagList);
                                    put.AnecdotLocation locData =
                                        put.AnecdotLocation();
                                    if (provider.selectedPlace != null) {
                                      locData = put.AnecdotLocation(
                                          address:
                                              // provider.selectedPlace == null
                                              //     ? widget.locations!.address
                                              //     :
                                              provider.selectedPlace!
                                                  .formattedAddress!,
                                          city: "",
                                          country: "",
                                          houseNumber: "",
                                          lat: widget.locations!.lat,
                                          long: widget.locations!.long,
                                          municipality: "",
                                          zipCodeNumber: "");
                                    } else {
                                      locData = put.AnecdotLocation(
                                          address: widget.locations!.address,
                                          city: "",
                                          country: "",
                                          houseNumber: "",
                                          lat: widget.locations!.lat,
                                          long: widget.locations!.long,
                                          municipality: "",
                                          zipCodeNumber: "");
                                    }

                                    put.Anecdote anecData = put.Anecdote(
                                        anecdoteTags: anectags,
                                        date: dateCtl.text,
                                        description: descriptionController.text,
                                        fileIds: provider.updatedAndecdotsFiles,
                                        isShared: true,
                                        locationDescription: "",
                                        title: titleController.text,
                                        locations: locData);

                                    print("step 2");
                                    print("step 2 body ${anecData.toJson()}");

                                    put.PutAnecdotsRequest request =
                                        put.PutAnecdotsRequest(
                                            anecdote: anecData);

                                    await fileProvider.updateAnecdots(
                                        anecdotId: widget.id!,
                                        requestBody: request);
                                    // await provider
                                    //     .getAnacdotsProjectDropdownData();
                                    // await provider
                                    //     .getAnacdotsOrganizationsDropdownData();
                                    // await provider
                                    //     .getAnacdotsPersonsDropdownData();

                                    // await fileProvider.getAnecdotesFiles();
                                    // setState(() {
                                    //   isLoading = false;
                                    // });
                                    Navigator.of(context).pop('page1');
                                    //     .then(
                                    //   (value) async {
                                    //     var providerx = Provider.of<
                                    //             CreateMyAnecdotesFileProvider>(
                                    //         context,
                                    //         listen: false);
                                    //     setState(() {});
                                    //     Navigator.pop(context);
                                    //   },
                                    // );
                                  },

                                  //     async {
                                  //   print("chicken::::::${titleController.text}");
                                  //   put.PutAnecdotsRequest updateAnecdotRequestModel =
                                  //       put.PutAnecdotsRequest(
                                  //           anecdote: put.Anecdote(
                                  //     fileIds: provider.updatedAndecdotsFiles,
                                  //     date: provider.dateCtl.text,
                                  //     description: descriptionController.text,
                                  //     title: titleController.text,
                                  //     anecdoteTags: put.AnecdoteTags(
                                  //         organizationId: provider
                                  //             .selectedAnacdotsOrganizationstDropDownIds,
                                  //         personId: provider
                                  //             .selectedAnacdotsPersonsDropDownIds,
                                  //         projectId: provider
                                  //             .selectedAnacdotsProjectDropDownIds,
                                  //         tag: provider.selectedItemsTagList),
                                  //     locations: put.AnecdotLocation(
                                  //       address: "",
                                  //       city: '',
                                  //       country: '',
                                  //       lat: "",
                                  //       long: "",
                                  //       municipality: '',
                                  //       province: '',
                                  //       zipCodeNumber: "",
                                  //     ),
                                  //   ));
                                  //   await fileProvider
                                  //       .updateAnecdots(
                                  //           anecdotId: widget.id!,
                                  //           requestBody: updateAnecdotRequestModel)
                                  //       .then(
                                  //     (value) {
                                  //       var providerx = Provider.of<
                                  //               CreateMyAnecdotesFileProvider>(
                                  //           context,
                                  //           listen: false);

                                  //       providerx.getAnacdotsProjectDropdownData();
                                  //       providerx
                                  //           .getAnacdotsOrganizationsDropdownData();
                                  //       providerx.getAnacdotsPersonsDropdownData();
                                  //       providerx.getAnacdotsLocationsDropdownData();
                                  //       providerx.getAnecdotesFiles();
                                  //       Navigator.pop(context);
                                  //     },
                                  //   );
                                  // },

                                  child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Text(
                                        PrefernceKey.anacdotSave,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(
                                          0xfff5F5F5,
                                        )),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(PrefernceKey.report,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: AppFont.bold,
                                  fontSize: 20,
                                )),
                          ),
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        Container(
                            margin: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10, top: 10),
                            child: Text(
                              PrefernceKey.summary,
                              style: TextStyle(fontFamily: AppFont.light),
                            )),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: SizedBox(
                            height: 45,
                            width: getHeight(context) * 0.45,
                            child: TextFormField(
                              controller: titleController,
                              // onChanged: (value) {
                              //   // provider.titleName =
                              //   //     provider.titleController.text;
                              // },
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xff009966), width: 2.0),
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(2.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                      width: 0.4,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(2))),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10, top: 10),
                            child: Text(
                              PrefernceKey.date,
                              style: TextStyle(fontFamily: AppFont.light),
                            )),
                        Container(
                          height: 45,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: SizedBox(
                            child: InkWell(
                                onTap: () {
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime.now())
                                      .then((d) {
                                    debugPrint("$d");
                                    if (d != null) {
                                      setState(() {
                                        provider.dateCtl.text =
                                            d.toString().split(" ")[0];
                                      });
                                    }
                                  });
                                },
                                child: SizedBox(
                                    height: 50,
                                    width: getHeight(context) * 0.45,
                                    child: TextFormField(
                                        controller: dateCtl,
                                        enabled: false,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.calendar_today_outlined,
                                              color: Color(0xFF3B4E68),
                                            ),
                                            prefixText: "Date ",
                                            prefixStyle:
                                                TextStyle(color: Colors.black),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              borderSide: BorderSide(
                                                color: Colors.grey.shade300,
                                                width: 0.9,
                                              ),
                                            ),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF3B4E68),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        2.0)))))),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10, top: 10),
                            child: Text(
                              PrefernceKey.description,
                              style: TextStyle(fontFamily: AppFont.light),
                            )),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: SizedBox(
                            width: getHeight(context) * 0.45,
                            child: TextFormField(
                              controller: descriptionController,
                              onChanged: (value) {
                                provider.description =
                                    provider.descriptionController.text;
                              },
                              maxLines: 4,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(2.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 0.9,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xff009966), width: 2.0),
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(2))),
                            ),
                          ),
                        ),
                        Container(
                            width: getHeight(context) * 0.45,
                            margin: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10, top: 20),
                            child: Divider(
                              thickness: 1,
                              color: Color(0xffE4E4E4),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10, top: 10),
                                child: Text(
                                  PrefernceKey.media +
                                      " (${widget.model.anecdoteFiles?.length ?? imageList!.length})",
                                  style: TextStyle(
                                      fontFamily: AppFont.heavyBold,
                                      fontSize: 20),
                                )),

                            //// when images are null

                            Container(
                                color: Colors.white,
                                height: 45.0,
                                margin: EdgeInsets.only(right: 10),
                                child: Row(
                                  children: [
                                    Visibility(
                                      visible:
                                          widget.model.anecdoteFiles!.isNotEmpty
                                              ? true
                                              : false,
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                showAll = !showAll;
                                              });
                                            },
                                            child: Container(
                                              width: 90,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                  border: Border.all(
                                                      color:
                                                          APPColor.anecBlack)),
                                              child: Center(
                                                  child: Text("Show All")),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              setState(() {
                                                addImage = true;
                                              });
                                              addImage
                                                  ? _settingModalBottomSheet(
                                                      context)
                                                  : SizedBox.shrink();

                                              //   if(imageList!=null){
                                              //      var response = await AnecdotesDirectoryClients.uploadImage(context, imageList);
                                              //   }
                                              // provider.uploadMediaRequest(
                                              //     context, imageList!);
                                            },
                                            child: Container(
                                              width: 40,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                  border: Border.all(
                                                      color:
                                                          APPColor.anecBlack)),
                                              child: Icon(
                                                Icons.add,
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible: (widget.model.anecdoteFiles!
                                                  .isNotEmpty ||
                                              imageList!.isNotEmpty)
                                          ? false
                                          : true,
                                      child: Container(
                                        height: 45,
                                        margin: EdgeInsets.only(right: 10),
                                        width: getWidth(context) * 0.52,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              addImage = true;
                                            });
                                            addImage
                                                ? _settingModalBottomSheet(
                                                    context)
                                                : SizedBox.shrink();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              side: BorderSide(
                                                  color: Color(0xff009966),
                                                  width: 1.5),
                                              backgroundColor: Colors.white,
                                              textStyle: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500)),
                                          child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                              child: SvgPicture.asset(
                                                'assets/mobilizer-images/camera.svg',
                                                height: 20,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        Visibility(
                            visible: (widget.model.anecdoteFiles!.isEmpty &&
                                    imageList!.isEmpty)
                                ? false
                                : true,
                            child: Container(
                              margin: EdgeInsets.only(right: 5, left: 5),
                              child: Column(
                                children: [
                                  GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      //     scrollDirection: Axis.horizontal,
                                      gridDelegate:
                                          const SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 100,
                                              childAspectRatio: 2 / 2,
                                              crossAxisSpacing: 5,
                                              mainAxisSpacing: 20),
                                      itemCount:
                                          widget.model.anecdoteFiles!.isEmpty
                                              ? 0
                                              : showAll
                                                  ? widget.model.anecdoteFiles!
                                                      .length
                                                  : widget.model.anecdoteFiles!
                                                              .length >
                                                          4
                                                      ? 4
                                                      : widget
                                                          .model
                                                          .anecdoteFiles!
                                                          .length,
                                      itemBuilder: (context, index) {
                                        return Stack(
                                          children: [
                                            Container(
                                                margin: EdgeInsets.only(
                                                    right: 5, left: 5),
                                                width: 120,
                                                height: 90.0,
                                                child: widget.model
                                                        .anecdoteFiles!.isEmpty
                                                    ? Container()
                                                    : ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                        child: Image.network(
                                                          widget
                                                                  .model
                                                                  .anecdoteFiles!
                                                                  .isNotEmpty
                                                              ? widget
                                                                  .model
                                                                  .anecdoteFiles![
                                                                      index]
                                                                  .path!
                                                              : imageList![
                                                                      index]
                                                                  .path,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      )),
                                            Positioned(
                                              top: 7,
                                              right: 10,
                                              child: InkWell(
                                                onTap: () async {
                                                  await fileProvider
                                                      .deleteFileData(widget
                                                          .anecdoteFiles![index]
                                                          .id!);
                                                  widget.anecdoteFiles!
                                                      .removeAt(index);
                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color.fromARGB(
                                                      255, 110, 110, 110),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                ],
                              ),
                            )),

                        Container(
                            width: getHeight(context) * 0.45,
                            margin: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10, top: 20),
                            child: Divider(
                              thickness: 1,
                              color: Color(0xffE4E4E4),
                            )),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10, top: 10),
                                  child: Text(
                                    PrefernceKey.location,
                                    style: TextStyle(
                                        fontFamily: AppFont.heavyBold,
                                        fontSize: 20),
                                  )),
                            ),
                          ],
                        ),

                        Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.35,
                            child: PlacePicker(
                              automaticallyImplyAppBarLeading: false,
                              forceAndroidLocationManager: true,
                              apiKey: 'AIzaSyBNPqaEb4zwyD5DjJ8RRZ6srgO8_k5wJx0',
                              hintText: "Find a place ...",
                              searchingText: "Please wait ...",
                              selectText: "Select place",
                              initialPosition: kInitialPosition,
                              useCurrentLocation: true,
                              selectInitialPosition: true,
                              usePinPointingSearch: true,
                              usePlaceDetailSearch: true,
                              zoomGesturesEnabled: true,
                              // zoomControlsEnabled: true,
                              initialMapType: map.MapType.satellite,
                              selectedPlaceWidgetBuilder: (_, selectedPlace,
                                  state, isSearchBarFocused) {
                                debugPrint(
                                    "state: $state, isSearchBarFocused: $isSearchBarFocused");
                                return isSearchBarFocused
                                    ? Container()
                                    : FloatingCard(
                                        bottomPosition:
                                            0.0, // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
                                        leftPosition: 0.0,
                                        rightPosition: 0.0,
                                        width: 500,
                                        height: 45,
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        child: state == SearchingState.Searching
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    side: BorderSide(
                                                        color:
                                                            Color(0xff009966),
                                                        width: 1.0),
                                                    backgroundColor:
                                                        Color(0xff009966),
                                                    textStyle: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                child: Text("Pick Here"),
                                                onPressed: () {
                                                  provider.selectedPlace =
                                                      selectedPlace!;
                                                  showAnacdotsToast(
                                                      "Your address pick successfully");
                                                },
                                              ),
                                      );
                              },
                              pinBuilder: (context, state) {
                                if (state == PinState.Idle) {
                                  return Icon(
                                    Icons.location_on_rounded,
                                    size: 45,
                                    color: Color(0xff27AE60),
                                  );
                                } else {
                                  return Icon(
                                    Icons.location_on_rounded,
                                    size: 45,
                                    color: Color(0xff27AE60),
                                  );
                                }
                              },
                              onMapTypeChanged: (map.MapType mapType) {
                                debugPrint(
                                    "Map type changed to ${mapType.toString()}");
                              },
                              onPlacePicked: (PickResult result) {
                                setState(() {
                                  provider.selectedPlace = result;
                                  updatedAddressField =
                                      result.formattedAddress!;

                                  // showPlacePickerInContainer = false;
                                });
                              },
                            )),

                        Container(
                            width: getHeight(context) * 0.45,
                            margin: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10, top: 20),
                            child: Divider(
                              thickness: 1,
                              color: Color(0xffE4E4E4),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(PrefernceKey.tagHeading,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: AppFont.bold,
                                fontSize: 20,
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: SizedBox(
                            width: getHeight(context) * 0.45,
                            child: SelectableDropdownWidget(
                              items: provider.personsItemList,
                              title: PrefernceKey.people,
                              mSelectedValue:
                                  provider.anacdotsPersonsDropDownName,
                              //     mSelectedItemsListID: provider.selectedAnacdotsPersonsDropDownIds,
                              mSelectedItemsList:
                                  provider.selectedAnacdotsPersonsDropDownList,
                              mOnDropDownChange: (value) {
                                setState(
                                  () {
                                    provider.anacdotsPersonsDropDownName =
                                        value!;
                                    var selectedIndex = provider.personsItemList
                                        .indexOf(provider
                                            .anacdotsPersonsDropDownName);
                                    if (!provider
                                        .selectedAnacdotsPersonsDropDownList
                                        .contains(provider
                                            .anacdotsPersonsDropDownName)) {
                                      provider
                                          .selectedAnacdotsPersonsDropDownList
                                          .add(provider
                                              .anacdotsPersonsDropDownName);
                                      // newList = List.from(
                                      //     provider.selectedAnacdotsPersonsDropDownIds)
                                      //   ..addAll(provider.personsItemListIds);
                                      //   print("New List of persons IDS $newList");
                                      print(provider
                                          .personsItemList[selectedIndex]);
                                      print(provider
                                          .personsItemListIds[selectedIndex]);
                                    }
                                    if (!provider
                                        .selectedAnacdotsPersonsDropDownIds
                                        .contains(provider.personsItemListIds[
                                            selectedIndex])) {
                                      provider
                                          .selectedAnacdotsPersonsDropDownIds
                                          .add(provider.personsItemListIds[
                                              selectedIndex]);
                                    }
                                    debugPrint(
                                        "selectedId ${provider.selectedAnacdotsPersonsDropDownIds}");
                                    debugPrint(
                                        "selected ${provider.selectedAnacdotsPersonsDropDownList}");
                                  },
                                );
                              },
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: SizedBox(
                            width: getHeight(context) * 0.45,
                            child: SelectableDropdownWidget(
                              items: provider.organizationsItemList,
                              title: PrefernceKey.organization,
                              mSelectedValue:
                                  provider.anacdotsOrganizationsDropDownName,
                              mSelectedItemsList: provider
                                  .selectedAnacdotsOrganizationstDropDownList,
                              mOnDropDownChange: (value) {
                                setState(
                                  () {
                                    provider.anacdotsOrganizationsDropDownName =
                                        value!;
                                    var selectedIndex = provider
                                        .organizationsItemList
                                        .indexOf(provider
                                            .anacdotsOrganizationsDropDownName);
                                    if (!provider
                                        .selectedAnacdotsOrganizationstDropDownList
                                        .contains(provider
                                            .anacdotsOrganizationsDropDownName)) {
                                      provider
                                          .selectedAnacdotsOrganizationstDropDownList
                                          .add(provider
                                              .anacdotsOrganizationsDropDownName);

                                      debugPrint(provider.organizationsItemList[
                                          selectedIndex]);
                                      debugPrint(provider.organizationsItemList[
                                          selectedIndex]);
                                    }
                                    if (!provider
                                        .selectedAnacdotsOrganizationstDropDownIds
                                        .contains(
                                            provider.organizationsItemListIds[
                                                selectedIndex])) {
                                      provider
                                          .selectedAnacdotsOrganizationstDropDownIds
                                          .add(
                                              provider.organizationsItemListIds[
                                                  selectedIndex]);
                                    }
                                    debugPrint(
                                        "selectedId ${provider.selectedAnacdotsOrganizationstDropDownIds}");
                                    debugPrint(
                                        "selected ${provider.selectedAnacdotsOrganizationstDropDownList}");
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: SizedBox(
                            width: getHeight(context) * 0.45,
                            child: SelectableDropdownWidget(
                              items: provider.itemsListTags,
                              title: PrefernceKey.tags,
                              mSelectedValue: provider.selectedItem,
                              mSelectedItemsList: provider.selectedItemsTagList,
                              mOnDropDownChange: (value) {
                                setState(
                                  () {
                                    provider.selectedItem = value!;
                                    // var selectedIndex = provider.itemsListTags
                                    //     .indexOf(provider.selectedItem);
                                    // if (!provider.selectedItemsTagList
                                    //     .contains(provider.selectedItem)) {
                                    //   provider.selectedAnacdotsProjectDropDownList
                                    //       .add(provider.anacdotsProjectDropDownName);
                                    // }
                                    if (!provider.selectedItemsTagList
                                        .contains(provider.selectedItem)) {
                                      provider.selectedItemsTagList
                                          .add(provider.selectedItem);
                                    }
                                    debugPrint(
                                        "selected $provider.selectedItemsTagList");
                                    // _provider.mShowFilterActions = true;
                                  },
                                );
                              },
                            ),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: SizedBox(
                            width: getHeight(context) * 0.45,
                            child: SelectableDropdownWidget(
                              items: provider.projectsItemList,
                              title: PrefernceKey.project,
                              mSelectedValue:
                                  provider.anacdotsProjectDropDownName,
                              mSelectedItemsList:
                                  provider.selectedAnacdotsProjectDropDownList,
                              mOnDropDownChange: (value) {
                                setState(
                                  () {
                                    provider.anacdotsProjectDropDownName =
                                        value!;
                                    var selectedIndex = provider
                                        .projectsItemList
                                        .indexOf(provider
                                            .anacdotsProjectDropDownName);
                                    if (!provider
                                        .selectedAnacdotsProjectDropDownList
                                        .contains(provider
                                            .anacdotsProjectDropDownName)) {
                                      provider
                                          .selectedAnacdotsProjectDropDownList
                                          .add(provider
                                              .anacdotsProjectDropDownName);

                                      debugPrint(provider
                                          .projectsItemList[selectedIndex]);
                                      debugPrint(provider
                                          .projectsItemList[selectedIndex]);
                                    }
                                    if (!provider
                                        .selectedAnacdotsProjectDropDownIds
                                        .contains(provider.projectsItemListIds[
                                            selectedIndex])) {
                                      provider
                                          .selectedAnacdotsProjectDropDownIds
                                          .add(provider.projectsItemListIds[
                                              selectedIndex]);
                                    }
                                    debugPrint(
                                        "selectedId ${provider.selectedAnacdotsProjectDropDownIds}");
                                    debugPrint(
                                        "selected ${provider.selectedAnacdotsProjectDropDownList}");
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ]),
                ),
              )),
      );
    });
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        isDismissible: true,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.camera),
                    title: Text('Camera'),
                    onTap: () async => {
                          Navigator.pop(context),
                          getImageFromCamera(),
                        }),
                ListTile(
                  leading: Icon(Icons.browse_gallery_outlined),
                  title: Text('Gallery'),
                  onTap: () => {
                    Navigator.pop(context),
                    selectImagesFromGallery(),
                    setState(
                      () {},
                    )
                  },
                ),
              ],
            ),
          );
        });
  }
}
