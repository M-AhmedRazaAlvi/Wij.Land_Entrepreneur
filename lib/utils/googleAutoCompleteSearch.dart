import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:http/http.dart';
import 'package:wij_land/utils/styles.dart';

class GoogleSearchWidget extends StatefulWidget {
  final Function(String)? adddress;
  final Function(double)? lat;
  final Function(double)? lng;

  const GoogleSearchWidget({Key? key, this.adddress, this.lat, this.lng})
      : super(key: key);

  @override
  _GoogleSearchWidgetState createState() => _GoogleSearchWidgetState();
}

class _GoogleSearchWidgetState extends State<GoogleSearchWidget> {
  var predictions = <AutocompletePrediction>[];
  String googleKey = 'AIzaSyBNPqaEb4zwyD5DjJ8RRZ6srgO8_k5wJx0';

  @override
  void initState() {
    super.initState();
  }

  late final places = FlutterGooglePlacesSdk(googleKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(right: 20, left: 20, top: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Search".tr(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.black26,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.black26,
                      width: 0.5,
                    ),
                  ),
                  labelStyle: TextStyle(color: Colors.black,fontFamily: Montserrat_Medium),
                ),
                onChanged: (value) async {
                  if (value.isNotEmpty) {
                    var p = await places.findAutocompletePredictions('$value');
                    debugPrint('Result: ${p}');
                    setState(() {
                      predictions = p.predictions;
                    });
                  } else {
                    if (predictions.length > 0 && mounted) {
                      setState(() {
                        predictions = [];
                      });
                    }
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: predictions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(
                        Icons.pin_drop,
                        color: Colors.blueGrey,
                      ),
                      title: Text(
                        predictions[index].fullText,
                        style: TextStyle(fontFamily: Montserrat_Medium),
                      ),
                      onTap: () async {
                        GeoData data = await Geocoder2.getDataFromAddress(
                            address: predictions[index].fullText,
                            googleMapApiKey: googleKey);
                        /*var response = await get(
                            Uri.parse(
                                "https://maps.googleapis.com/maps/api/place/details/json?placeid=${predictions[index].placeId}&key=$googleKey"),
                            headers: {"Accept": "application/json", "Access-Control-Allow-Origin": "*"});
                         debugprint'response of lt ${response.body}');*/
                        /*FetchPlaceResponse value = await places.fetchPlace(predictions[index].placeId);
                         debugprint"VALUE ::::::::::::: ${value.place}");*/
                        widget.adddress!(predictions[index].fullText);
                        widget.lng!(data.longitude);
                        widget.lat!(data.latitude);

                        debugPrint(
                            'lat and lng is ${widget.adddress}- ${widget.lat}- ${widget.lng}');
                        Navigator.of(context).pop();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
