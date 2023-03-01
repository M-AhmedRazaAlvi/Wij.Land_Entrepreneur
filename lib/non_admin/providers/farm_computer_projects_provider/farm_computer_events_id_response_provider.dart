import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:wij_land/non_admin/api_clients/farm_computer_project_clients.dart';
import 'package:wij_land/non_admin/models/farm_computer_events/computer_events_id/response/farm_computer_events_id_resppnse.dart';
import 'package:latlong2/latlong.dart' as latLng;

import '../../../utils/styles.dart';

class CreateFarmComputerEventsIdProvider extends ChangeNotifier {
  GetFarmComputerEventsIdResponse? _farmComputerEventsIdResponsceModels;

  GetFarmComputerEventsIdResponse get farmComputerEventsIdResponseModel => _farmComputerEventsIdResponsceModels!;
  bool _isLoading = false;

  get isLoading => _isLoading;
  List<Marker> mMarkersList = [];
  var listofLatLng = LatLngBounds();

  Future<bool> getFarmComputerEventId({required int eventId}) async {
    listofLatLng = LatLngBounds();
    _farmComputerEventsIdResponsceModels = await FarmComputerProjectClients.getFarmComputerEventsId(eventsId: eventId);

    if (_farmComputerEventsIdResponsceModels!.error?.status == 404) {
      //print('lat is 1==========${_farmComputerEventsIdResponsceModels!.data!.latitude}');
      listofLatLng.extend(latLng.LatLng(62.0, 32.0));
      mMarkersList.add(
        Marker(
          point: latLng.LatLng(
              62.0 ,
              32.0 ),
          height: 80,
          width: 80,
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.location_on_rounded, color: darkGreen, size: 40),
              tooltip: "",
              onPressed: () {},
            );
          },
        ),
      );
    } else {
      if (_farmComputerEventsIdResponsceModels!.data!.longitude == null) {
        if (_farmComputerEventsIdResponsceModels!.data!.address != null) {
          GeoData data = await Geocoder2.getDataFromAddress(
              address: "${_farmComputerEventsIdResponsceModels!.data!.address}",
              googleMapApiKey: "AIzaSyBNPqaEb4zwyD5DjJ8RRZ6srgO8_k5wJx0");

          _farmComputerEventsIdResponsceModels!.data!.longitude =
              data.longitude;
          _farmComputerEventsIdResponsceModels!.data!.latitude = data.latitude;
        }
      }
      print('lat is ${_farmComputerEventsIdResponsceModels!.data!.latitude}');
      listofLatLng.extend(latLng.LatLng(
        _farmComputerEventsIdResponsceModels!.data!.latitude == null ? 62.0 : _farmComputerEventsIdResponsceModels!.data!.latitude!,
        _farmComputerEventsIdResponsceModels!.data!.longitude == null ? 32.0 : _farmComputerEventsIdResponsceModels!.data!.longitude!,
      ));

      mMarkersList.add(
        Marker(
          point: latLng.LatLng(
            _farmComputerEventsIdResponsceModels!.data!.latitude == null ? 62.0 : _farmComputerEventsIdResponsceModels!.data!.latitude!,
            _farmComputerEventsIdResponsceModels!.data!.longitude == null ? 32.0 : _farmComputerEventsIdResponsceModels!.data!.longitude!,
          ),
          height: 80,
          width: 80,
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.location_on_rounded, color: darkGreen, size: 40),
              tooltip: _farmComputerEventsIdResponsceModels!.data!.eventName,
              onPressed: () {},
            );
          },
        ),
      );
    }

    notifyListeners();
    return true;
  }
}
