import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:wij_land/non_admin/api_clients/farm_computer_project_clients.dart';
import 'package:wij_land/non_admin/models/farm_computer_events/computer_event_file/response/computer_events_file_response.dart';
import 'package:wij_land/non_admin/models/farm_computer_events/farm_computer_event_file_media/response/get_farm_computer_events_file_media_response.dart';
import 'package:latlong2/latlong.dart' as latLng;

import '../../../utils/styles.dart';

class CreateFarmComputerEventsFileProvider extends ChangeNotifier {
  GetFarmComputerEventsFileResponse? _farmComputerEventsFileResponsceModels;

  GetFarmComputerEventsFileResponse get farmComputerEventsFileResponseModel =>
      _farmComputerEventsFileResponsceModels!;
  bool _isLoading = false;

  get isLoading => _isLoading;

  ////

  ///
  /// ///
  /// ///
  ///
  ///

  List<Marker> mMarkersList = [];
  var listofLatLng = LatLngBounds();

  Future getFarmComputerEventFile({required int? eventId}) async {
    // debugprint"get values of events id ${farmComputerEventsFileResponseModel}");

    listofLatLng = LatLngBounds();
    _farmComputerEventsFileResponsceModels =
        await FarmComputerProjectClients.getFarmComputerEventsFile(
            eventsId: eventId!);
    if (_farmComputerEventsFileResponsceModels!.error?.status == 404) {
      listofLatLng.extend(latLng.LatLng(62.0, 32.0));
      mMarkersList.add(
        Marker(
          point: latLng.LatLng(62.0, 32.0),
          height: 80,
          width: 80,
          builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.location_on_rounded,
                color: darkGreen,
                size: 40,
              ),
              tooltip: _farmComputerEventsFileResponsceModels!.data!.eventName,
              onPressed: () {},
            );
          },
        ),
      );
    } else {
      listofLatLng.extend(latLng.LatLng(
        _farmComputerEventsFileResponsceModels!.data!.latitude == null
            ? 62.0
            : _farmComputerEventsFileResponsceModels!.data!.latitude!,
        _farmComputerEventsFileResponsceModels!.data!.longitude == null
            ? 32.0
            : _farmComputerEventsFileResponsceModels!.data!.longitude!,
      ));
      mMarkersList.add(
        Marker(
          point: latLng.LatLng(
            _farmComputerEventsFileResponsceModels!.data!.latitude == null
                ? 62.0
                : _farmComputerEventsFileResponsceModels!.data!.latitude!,
            _farmComputerEventsFileResponsceModels!.data!.longitude == null
                ? 32.0
                : _farmComputerEventsFileResponsceModels!.data!.longitude!,
          ),
          height: 80,
          width: 80,
          builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.location_on_rounded,
                color: darkGreen,
                size: 40,
              ),
              tooltip: _farmComputerEventsFileResponsceModels!.data!.eventName,
              onPressed: () {},
            );
          },
        ),
      );
    }
    notifyListeners();
  }

  GetFarmComputerEventsFileMediaResponse?
      _farmComputerEventsFileMediaResponseModels;

  GetFarmComputerEventsFileMediaResponse
      get farmComputerEventsFileMediaResponseModel =>
          _farmComputerEventsFileMediaResponseModels!;
  bool hasData = false;
  List<bool> mediaBool = <bool>[];
  List<bool> documentBool = <bool>[];
  List<int> docxLength = [];
  Future getFarmComputerEventFileMedia({required int eventId}) async {
    mediaBool = <bool>[];
    documentBool = <bool>[];
    docxLength = <int>[];

    _farmComputerEventsFileMediaResponseModels =
        await FarmComputerProjectClients.getFarmComputerEventsFileMedia(
            eventsId: eventId);

    if (farmComputerEventsFileMediaResponseModel.error?.status != 404) {
      for (int i = 0;
          i < farmComputerEventsFileMediaResponseModel.data!.length;
          i++) {
        if (farmComputerEventsFileMediaResponseModel.data![i].type == "Media") {
          mediaBool.add(true);
        } else {
          documentBool.add(true);
        }
      }
      if (_farmComputerEventsFileMediaResponseModels!.status != 400) {
        hasData = true;
        notifyListeners();
      }
      notifyListeners();
    }
  }
}
