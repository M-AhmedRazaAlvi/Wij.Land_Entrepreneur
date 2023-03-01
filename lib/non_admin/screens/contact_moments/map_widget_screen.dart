import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:location/location.dart';

import 'package:latlong2/latlong.dart' as latLng;

import '../../../anacdots_mobile/app_common_widgets/styles.dart';

class MapWidgetScreen extends StatefulWidget {
  const MapWidgetScreen({Key? key}) : super(key: key);

  @override
  _MapWidgetScreenState createState() => _MapWidgetScreenState();
}

class _MapWidgetScreenState extends State<MapWidgetScreen> {
  // late GoogleMapController myController;
  // final LatLng _center = const LatLng(45.521563, -122.677433);
  //
  // void _onMapCreated(GoogleMapController controller) {
  //   myController = controller;
  // }

  LocationData? _currentLocation;
  final Location _locationService = Location();
  late String error;

  //var listofLatLng = LatLngBounds();

  @override
  void initState() {
    super.initState();
    _locationService.onLocationChanged.listen(
      (LocationData result) {
        setState(
          () {
            _currentLocation = result;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _currentLocation == null
                ? Center(child: CircularProgressIndicator())
                : Container(
                    width: 300,
                    height: 300,
                    child: FlutterMap(
                      options: MapOptions(
                        center: latLng.LatLng(_currentLocation!.latitude!.toDouble(), _currentLocation!.longitude!.toDouble()),
                        boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(10.0)),
                        interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                        zoom: 14.0,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate: "https://api.mapbox.com/styles/v1/mapbox/satellite-v9/tiles/"
                              "{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw",
                          retinaMode: true,
                          maxZoom: 22,
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: latLng.LatLng(_currentLocation!.latitude!.toDouble(), _currentLocation!.longitude!.toDouble()),
                              height: 80,
                              width: 80,
                              builder: (context) {
                                return IconButton(
                                  icon: Icon(Icons.location_on_rounded, color: darkGreen, size: 20),
                                  tooltip: "marker",
                                  onPressed: () {},
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
