import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/anacdots_mobile/providers/anecdotes_directory_providers/anecdotes_file_provider.dart';
import 'package:wij_land/anacdots_mobile/providers/anecdotes_directory_providers/get_anacdots_by_id_provider.dart';
import 'package:wij_land/anacdots_mobile/screens/dashboard/anacdot_directory/report/widget/edit_anecdots.dart';
import 'package:wij_land/anacdots_mobile/them.dart';
import 'package:wij_land/anacdots_mobile/utils/NotificationKeys.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as map;
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../utils/styles.dart';
import '../../../../../app_common_widgets/ancadots_toast_widget.dart';
import '../../../../../models/anecdotes_model/get_anacdots_by_id_reponse.dart';
import '../../../../../models/anecdotes_model/get_my_anecdotes_response.dart';

AnecdotsData model = AnecdotsData();

class ReportScreen extends StatefulWidget {
  final int anecdoteID;
  DataModel? model;
  ReportScreen({Key? key, required this.anecdoteID, required this.model})
      : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  bool isEdit = false;
  bool showAll = false;
  bool isLoading = true;
  List projectNames = [];
  @override
  void initState() {
    // TODO: implement initState
    var provider = Provider.of<GetAnacdotsByIdProvider>(context, listen: false);
    provider.getAnacdotsByIdData(widget.anecdoteID);

    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<GetAnacdotsByIdProvider, CreateMyAnecdotesFileProvider>(
        builder: (context, provider, providerX, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back, color: darkBlack, size: 20)),
          title: CustomText(text: "Report", weight: FontWeight.bold),
        ),
        body: provider.isLoading
            ? Center(child: SpinKitCircle(color: APPColor.darkGreen))
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${provider.getAnacdotsByIDResponse.data?.title}",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: AppFont.heavyBold,
                                fontSize: 20),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star_border_outlined, size: 20),
                              SizedBox(width: 10),
                              PopupMenuButton(
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                      value: 'page1', child: Text('Edit')),
                                  PopupMenuItem(
                                      value: 'noroute', child: Text('Remove')),
                                ],
                                onSelected: (v) {
                                  if (v == 'page1') {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (BuildContext context) {
                                      return EditAnecdotsScreen(
                                        model: provider
                                            .getAnacdotsByIDResponse.data!,
                                        anecProjects: provider
                                            .getAnacdotsByIDResponse
                                            .data!
                                            .anecProjects!,
                                        anecOrgs: provider
                                            .getAnacdotsByIDResponse
                                            .data!
                                            .anecOrgs!,
                                        anecPersons: provider
                                            .getAnacdotsByIDResponse
                                            .data!
                                            .anecPersons,
                                        anecdoteFiles: provider
                                            .getAnacdotsByIDResponse
                                            .data!
                                            .anecdoteFiles,
                                        anecdoteTags: provider
                                            .getAnacdotsByIDResponse
                                            .data!
                                            .anecdoteTags,
                                        createdById: provider
                                            .getAnacdotsByIDResponse
                                            .data!
                                            .createdById,
                                        date: provider
                                            .getAnacdotsByIDResponse.data!.date,
                                        description: provider
                                            .getAnacdotsByIDResponse
                                            .data!
                                            .description,
                                        id: provider
                                            .getAnacdotsByIDResponse.data!.id,
                                        isShared: provider
                                            .getAnacdotsByIDResponse
                                            .data!
                                            .isShared,
                                        locations: provider
                                            .getAnacdotsByIDResponse
                                            .data!
                                            .locations,
                                        title: provider.getAnacdotsByIDResponse
                                            .data!.title,
                                      );
                                    })).then((value) async {
                                      if (value == 'page1') {
                                        print("yahooooooooooooo");

                                        await provider.getAnacdotsByIdData(
                                            provider.getAnacdotsByIDResponse
                                                .data!.id!);
                                        setState(() {
                                          //  isLoading = false;
                                        });
                                      }
                                    });
                                  } else if (v == 'noroute') {
                                    setState(() {
                                      //     isLoading = true;
                                    });
                                    provider
                                        .deleteAnacdotsByID(widget.anecdoteID)
                                        .then((value) async {
                                      var providerx = Provider.of<
                                              CreateMyAnecdotesFileProvider>(
                                          context,
                                          listen: false);

                                      await providerx.getAnecdotesFiles();
                                      Navigator.pop(context);
                                    });
                                    if (provider.deletAnacdotsById.status ==
                                        200) {
                                      showAnacdotsToast("Deleted Successfully");
                                    }

                                    setState(() {
                                      //   isLoading = false;
                                    });
                                  }
                                  //   });
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        //  crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.calendar_today,
                              size: 14, color: APPColor.dateColor),
                          SizedBox(width: 5),
                          Text(
                            "${provider.getAnacdotsByIDResponse.data!.date}",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Html(
                          data:
                              "${provider.getAnacdotsByIDResponse.data!.description}"),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Media(${provider.getAnacdotsByIDResponse.data!.anecdoteFiles!.length})",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: AppFont.heavyBold,
                                fontSize: 20),
                          ),
                          Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      showAll = !showAll;
                                      print("show all $showAll ");
                                    });
                                  },
                                  child: _TextWidget(
                                      text: "Show All",
                                      bgColor: APPColor.dateColor)),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Visibility(
                        visible: provider.getAnacdotsByIDResponse.data!
                                .anecdoteFiles!.isEmpty
                            ? false
                            : true,
                        child: Container(
                          margin: EdgeInsets.only(right: 5, left: 5),
                          child: Column(
                            children: [
                              GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 120,
                                          childAspectRatio: 2 / 2,
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 20),
                                  itemCount: provider.getAnacdotsByIDResponse
                                          .data!.anecdoteFiles!.isEmpty
                                      ? 0
                                      : showAll
                                          ? provider.getAnacdotsByIDResponse
                                              .data!.anecdoteFiles!.length
                                          : provider
                                                      .getAnacdotsByIDResponse
                                                      .data!
                                                      .anecdoteFiles!
                                                      .length >
                                                  4
                                              ? 4
                                              : provider.getAnacdotsByIDResponse
                                                  .data!.anecdoteFiles!.length,
                                  itemBuilder: (_, index) {
                                    return Stack(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(
                                                right: 5, left: 5),
                                            width: 120,
                                            height: 90.0,
                                            child: provider
                                                        .getAnacdotsByIDResponse
                                                        .data!
                                                        .anecdoteFiles ==
                                                    null
                                                ? Container()
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    child: Image.network(
                                                      provider
                                                          .getAnacdotsByIDResponse
                                                          .data!
                                                          .anecdoteFiles![index]
                                                          .path!,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )),
                                        Visibility(
                                          visible: isEdit ? true : false,
                                          child: Positioned(
                                            top: 7,
                                            right: 10,
                                            child: InkWell(
                                              onTap: () {
                                                // setState(() {
                                                //   setState(() =>
                                                //       imageList!.removeAt(index));
                                                // });
                                              },
                                              child: Icon(
                                                Icons.close,
                                                color: Color.fromARGB(
                                                    255, 110, 110, 110),
                                              ),
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
                      SizedBox(height: 10),
                      Text(
                        "Location",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: AppFont.heavyBold,
                            fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      provider.getAnacdotsByIDResponse.data!.locations!.lat !=
                                  null &&
                              provider.getAnacdotsByIDResponse.data!.locations!
                                      .long !=
                                  ""
                          ? Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.35,
                              child: PlacePicker(
                                automaticallyImplyAppBarLeading: false,

                                forceAndroidLocationManager: true,
                                apiKey:
                                    'AIzaSyBNPqaEb4zwyD5DjJ8RRZ6srgO8_k5wJx0',
                                hintText: "Find a place ...",
                                searchingText: "Please wait ...",
                                selectText: "Select place",
                                initialPosition: LatLng(
                                    double.parse(
                                        // "${
                                        provider.getAnacdotsByIDResponse.data!
                                            .locations!.lat
                                            .toString()
                                        //}"
                                        ),
                                    double.parse(provider
                                        .getAnacdotsByIDResponse
                                        .data!
                                        .locations!
                                        .long
                                        .toString())),
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
                                      : Container();
                                  // FloatingCard(
                                  //     bottomPosition:
                                  //         0.0, // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
                                  //     leftPosition: 0.0,
                                  //     rightPosition: 0.0,
                                  //     width: 500,
                                  //     height: 45,
                                  //     color: Colors.transparent,
                                  //     borderRadius: BorderRadius.circular(5.0),
                                  //     child: state == SearchingState.Searching
                                  //         ? Center(
                                  //             child:
                                  //                 CircularProgressIndicator())
                                  //         :
                                  //          ElevatedButton(
                                  //             style: ElevatedButton.styleFrom(
                                  //                 side: BorderSide(
                                  //                     color: Color(0xff009966),
                                  //                     width: 1.0),
                                  //                 backgroundColor:
                                  //                     Color(0xff009966),
                                  //                 textStyle: TextStyle(
                                  //                     fontSize: 16,
                                  //                     fontWeight:
                                  //                         FontWeight.w500)),
                                  //             child: Text("Pick Here"),
                                  //             onPressed: () {
                                  //               showAnacdotsToast(
                                  //                   "Your address pick successfully");
                                  //               // IMPORTANT: You MUST manage selectedPlace data yourself as using this build will not invoke onPlacePicker as
                                  //               //            this will override default 'Select here' Button.
                                  //               debugPrint(selectedPlace!
                                  //                   .formattedAddress
                                  //                   .toString());
                                  //               // Navigator.of(context).pop();
                                  //             },
                                  //           ),
                                  //   );
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
                                    // showPlacePickerInContainer = false;
                                  });
                                },
                              ))
                          : Container(
                              child: Text("No location added it"),
                            ),
                      SizedBox(height: 10),
                      Text(
                        "Location comment and description",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 10),
                      CustomText(
                          text: "Tags", weight: FontWeight.bold, size: 16),
                      SizedBox(height: 10),
                      Row(
                        children: [],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: [
                            for (int i = 0;
                                i <
                                    provider.getAnacdotsByIDResponse.data!
                                        .anecProjects!.length;
                                i++)
                              _TextWidget(
                                  text:
                                      "${provider.getAnacdotsByIDResponse.data!.anecProjects![i].name}",
                                  bgColor: greenColor,
                                  size: 8),
                            for (int i = 0;
                                i <
                                    provider.getAnacdotsByIDResponse.data!
                                        .anecOrgs!.length;
                                i++)
                              _TextWidget(
                                  text:
                                      "${provider.getAnacdotsByIDResponse.data!.anecOrgs![i].orgName}",
                                  bgColor: greenColor,
                                  size: 8),
                            for (int i = 0;
                                i <
                                    provider.getAnacdotsByIDResponse.data!
                                        .anecPersons!.length;
                                i++)
                              _TextWidget(
                                  text:
                                      "${provider.getAnacdotsByIDResponse.data!.anecPersons![i].personName}",
                                  bgColor: greenColor,
                                  size: 8),
                            for (int i = 0;
                                i <
                                    provider.getAnacdotsByIDResponse.data!
                                        .anecdoteTags!.length;
                                i++)
                              // if (provider.getAnacdotsByIDResponse.data!
                              //     .anecdoteTags!.isNotEmpty)
                              _TextWidget(
                                  text: provider.getAnacdotsByIDResponse.data!
                                      .anecdoteTags!
                                      .join(','),
                                  bgColor: greenColor,
                                  size: 8),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
      );
    });
  }
}

class _TextWidget extends StatelessWidget {
  final String text;
  final dynamic bgColor;
  final double size;

  const _TextWidget({
    Key? key,
    required this.text,
    this.bgColor,
    this.size = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: bgColor),
        ),
        child: CustomText(
          text: text,
          size: size,
          color: bgColor,
          weight: FontWeight.w600,
        ),
      ),
    );
  }
}
