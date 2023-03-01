import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/anacdots_mobile/app_common_widgets/selectable_dropdown_widget.dart';
import 'package:wij_land/anacdots_mobile/models/anecdotPostModel.dart';
import 'package:wij_land/anacdots_mobile/providers/anacdots_dropdowns_provider/anacdots_dropdowns_provider.dart';
import 'package:wij_land/anacdots_mobile/providers/anecdotes_directory_providers/anecdotes_file_provider.dart';
import 'package:wij_land/anacdots_mobile/utils/NotificationKeys.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../app_common_widgets/ancadots_toast_widget.dart';

// Create new Anacdot
class CreateAnacdoteScreen extends StatefulWidget {
  const CreateAnacdoteScreen({super.key});

  @override
  State<CreateAnacdoteScreen> createState() => _CreateAnacdoteScreenState();
}

bool isLoading = false;

bool showAll = false;
bool addImage = false;
DateTime? date;

List<String> selectedItemsListProject = [];
List<String> selectedItemsListOrgnization = [];

bool showPlacePickerInContainer = false;
bool showGoogleMapInContainer = false;
final kInitialPosition = LatLng(-33.8567844, 151.213108);

class _CreateAnacdoteScreenState extends State<CreateAnacdoteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    var provider =
        Provider.of<AnacdotsDropDownsProvider>(context, listen: false);
    provider.getAnacdotsProjectDropdownData();
    provider.getAnacdotsOrganizationsDropdownData();
    provider.getAnacdotsPersonsDropdownData();
    provider.clearAllSelectedDropdownList();
    print("image list =======..............${imageList.toString()}");
    debugPrint("d name ${provider.anacdotsProjectDropDownName}");
    //  isLoading = true;

    super.initState();
  }

  List<int> mediafilesIds = [];
  List<XFile>? imageList = [];
  List<String> imageListPath = [];

  final ImagePicker imagePicker = ImagePicker();
  void selectImagesFromGallery() async {
    var provider =
        Provider.of<AnacdotsDropDownsProvider>(context, listen: false);
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageList!.addAll(selectedImages);
// for(XFile file in imageList!){
//         imageListPath.add(file.path.toString());
//       }
      setState(() {
        imageList;

        provider.uploadMediaRequest(context, imageList!).then((value) {
          if (provider.mediaRequestModel.data != null) {
            for (int i = 0; i < provider.mediaRequestModel.data!.length; i++) {
              mediafilesIds.add(
                  int.parse(provider.mediaRequestModel.data![i].id.toString()));
            }
            debugPrint("media::::::::::::::::::$mediafilesIds");
          }
        });

        debugPrint("image list == ${imageList.toString()}");
      });
    }
  }

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
      provider.uploadMediaRequest(context, imageList!).then((value) => {
            if (provider.mediaRequestModel.data != null)
              {
                for (int i = 0;
                    i < provider.mediaRequestModel.data!.length;
                    i++)
                  {
                    mediafilesIds.add(int.parse(
                        provider.mediaRequestModel.data![i].id.toString()))
                  }
              }
          });
      debugPrint("media::::::::::::::::::$mediafilesIds");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AnacdotsDropDownsProvider>(
        builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text("Create new anecdots",
              style: TextStyle(color: Color(0xff2D2D2D))),
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
                                    // print("Selcted place null ${provider.selectedPlace}")
                                    isLoading = true;
                                    setState(() {});
                                    AnecdotPostModel
                                        createdAnecdotRequestModel =
                                        AnecdotPostModel(
                                            anecdote: Anecdote(
                                                anecdoteTags: AnecdoteTags(
                                                    organizationId: provider
                                                        .selectedAnacdotsOrganizationstDropDownIds,
                                                    personId: provider
                                                        .selectedAnacdotsPersonsDropDownIds,
                                                    projectId: provider
                                                        .selectedAnacdotsProjectDropDownIds,
                                                    tag: provider
                                                        .selectedItemsTagList),
                                                fileIds: mediafilesIds,
                                                date: provider.dateCtl.text,
                                                description: provider
                                                    .descriptionController.text,
                                                title: provider
                                                    .titleController.text,
                                                locations:
                                                    provider.selectedPlace !=
                                                            null
                                                        ? AnecdotLocation(
                                                            address: provider
                                                                .selectedPlace!
                                                                .adrAddress,
                                                            city: '',
                                                            country: '',
                                                            lat: provider
                                                                .selectedPlace!
                                                                .geometry!
                                                                .location
                                                                .lat
                                                                .toString(),
                                                            long: provider
                                                                .selectedPlace!
                                                                .geometry!
                                                                .location
                                                                .lat
                                                                .toString(),
                                                            municipality: '',
                                                            province: '',
                                                            zipCodeNumber: "",
                                                          )
                                                        : AnecdotLocation(
                                                            address: "",
                                                            city: '',
                                                            country: '',
                                                            lat: "",
                                                            long: "",
                                                            municipality: '',
                                                            province: '',
                                                            zipCodeNumber: "",
                                                          )));
                                    await provider
                                        .addNewAnecdotes(
                                            createdAnecdotRequestModel)
                                        .then((value) {
                                      debugPrint(
                                          "mediaa Ids::::::${mediafilesIds.toString()}");
                                      provider.titleController.clear();
                                      provider.descriptionController.clear();
                                      provider.dateCtl.clear();
                                      provider
                                          .selectedAnacdotsPersonsDropDownIds
                                          .clear();
                                      provider
                                          .selectedAnacdotsProjectDropDownIds
                                          .clear();
                                      provider
                                          .selectedAnacdotsOrganizationstDropDownIds
                                          .clear();

                                      provider.selectedItemsTagList.clear();

                                      // provider.selectedPlace;
                                      var providerx = Provider.of<
                                              CreateMyAnecdotesFileProvider>(
                                          context,
                                          listen: false);

                                      providerx
                                          .getAnacdotsProjectDropdownData();
                                      providerx
                                          .getAnacdotsOrganizationsDropdownData();
                                      providerx
                                          .getAnacdotsPersonsDropdownData();
                                      providerx
                                          .getAnacdotsLocationsDropdownData();
                                      providerx.getAnecdotesFiles();
                                      Navigator.pop(context);
                                    });
                                    setState(() {
                                      isLoading = false;
                                    });
                                    showAnacdotsToast(
                                        "sucessfully added new anecdote");
                                  },
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
                            width: getHeight(context) / 0.45,
                            child: TextFormField(
                              controller: provider.titleController,
                              onChanged: (value) {
                                provider.titleName =
                                    provider.titleController.text;
                              },
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
                                        SystemChannels.textInput
                                            .invokeMethod('TextInput.hide');
                                        provider.dateCtl.text =
                                            d.toString().split(" ")[0];
                                      });
                                    }
                                  });
                                },
                                child: SizedBox(
                                    height: 50,
                                    width: getHeight(context) / 0.45,
                                    child: TextFormField(
                                        controller: provider.dateCtl,
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
                            width: getHeight(context) / 0.45,
                            child: TextFormField(
                              controller: provider.descriptionController,
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
                            width: getHeight(context) / 0.45,
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
                                      " (${imageList!.length.toString()})",
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
                                          imageList!.isNotEmpty ? true : false,
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
                                            onTap: () {
                                              setState(() {
                                                addImage = true;
                                              });
                                              addImage
                                                  ? _settingModalBottomSheet(
                                                      context)
                                                  : SizedBox.shrink();
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
                                      visible:
                                          imageList!.isEmpty ? true : false,
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
                          visible: imageList!.isEmpty ? false : true,
                          child: Container(
                            margin: EdgeInsets.only(right: 10, left: 8),
                            child: Column(
                              children: [
                                GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent: 120,
                                            childAspectRatio: 2 / 2,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 20),
                                    itemCount: imageList!.isEmpty
                                        ? 0
                                        : showAll
                                            ? imageList!.length
                                            : imageList!.length > 4
                                                ? 4
                                                : imageList!.length,
                                    itemBuilder: (_, index) {
                                      return Stack(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(
                                                  right: 5, left: 5),
                                              width: 120,
                                              height: 90.0,
                                              child: imageList == null
                                                  ? Container()
                                                  : ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      child: Image.file(
                                                        File(imageList![index]
                                                            .path),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                          Positioned(
                                            top: 10,
                                            right: 10,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  setState(() => imageList!
                                                      .removeAt(index));
                                                });
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
                          ),
                        ),
                        Container(
                            width: getHeight(context) / 0.45,
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
                            showPlacePickerInContainer
                                ? Expanded(
                                    flex: 1,
                                    child: InkWell(
                                        onTap: (() {
                                          setState(() {});
                                          showPlacePickerInContainer = false;
                                        }),
                                        child: Icon(Icons.close)),
                                  )
                                : Expanded(
                                    flex: 7,
                                    child: Container(
                                      width: double.infinity,
                                      height: 45.0,
                                      margin: EdgeInsets.only(right: 20),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            side: BorderSide(
                                                color: Color(0xff009966),
                                                width: 1.5),
                                            backgroundColor: Colors.white,
                                            textStyle: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500)),
                                        onPressed: () {
                                          setState(() {});
                                          showPlacePickerInContainer = true;
                                        },
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          child: SvgPicture.asset(
                                            'assets/mobilizer-images/map_marker.svg',
                                            height: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                        showPlacePickerInContainer
                            ? Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                                child: PlacePicker(
                                  automaticallyImplyAppBarLeading: false,
                                  forceAndroidLocationManager: true,
                                  apiKey:
                                      'AIzaSyBNPqaEb4zwyD5DjJ8RRZ6srgO8_k5wJx0',
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
                                  initialMapType: MapType.satellite,
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
                                            child: state ==
                                                    SearchingState.Searching
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator())
                                                : ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            side: BorderSide(
                                                                color: Color(
                                                                    0xff009966),
                                                                width: 1.0),
                                                            backgroundColor:
                                                                Color(
                                                                    0xff009966),
                                                            textStyle: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                    child: Text("Pick Here"),
                                                    onPressed: () {
                                                      provider.selectedPlace =
                                                          selectedPlace!;
                                                      print(
                                                          "address picked ${selectedPlace.adrAddress}");
                                                      showAnacdotsToast(
                                                          "Your address pick successfully");
                                                      // IMPORTANT: You MUST manage selectedPlace data yourself as using this build will not invoke onPlacePicker as
                                                      //            this will override default 'Select here' Button.
                                                      debugPrint(selectedPlace
                                                          .formattedAddress
                                                          .toString());
                                                      // Navigator.of(context).pop();
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
                                  onMapTypeChanged: (MapType mapType) {
                                    debugPrint(
                                        "Map type changed to ${mapType.toString()}");
                                  },
                                  onPlacePicked: (PickResult result) {
                                    setState(() {
                                      provider.selectedPlace = result;
                                    });
                                  },
                                ))
                            : Container(),
                        Container(
                            width: getHeight(context) / 0.45,
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
                            width: getHeight(context) / 0.45,
                            child: SelectableDropdownWidget(
                              items: provider.personsItemList,
                              title: PrefernceKey.people,
                              mSelectedValue:
                                  provider.anacdotsPersonsDropDownName,
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
                            width: getHeight(context) / 0.45,
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

                                      print(provider.organizationsItemList[
                                          selectedIndex]);
                                      print(provider.organizationsItemListIds[
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
                            width: getHeight(context) / 0.45,
                            child: SelectableDropdownWidget(
                              items: provider.itemsListTags,
                              title: PrefernceKey.tags,
                              mSelectedValue: provider.selectedItem,
                              mSelectedItemsList: provider.selectedItemsTagList,
                              mOnDropDownChange: (value) {
                                setState(
                                  () {
                                    provider.selectedItem = value!;
                                    if (!provider.selectedItemsTagList
                                        .contains(provider.selectedItem)) {
                                      provider.selectedItemsTagList
                                          .add(provider.selectedItem);
                                    }
                                    debugPrint(
                                        "selected ${provider.selectedItemsTagList}");
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
                            width: getHeight(context) / 0.45,
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
                    onTap: () =>
                        {Navigator.pop(context), getImageFromCamera()}),
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
