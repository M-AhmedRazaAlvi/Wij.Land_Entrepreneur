import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:wij_land/api_clients/entrepreneur_client.dart';
import 'package:wij_land/models/entrepreneur/response/farm_supplier_response.dart';
import 'package:wij_land/routes/routes.dart';
import '../../utils/controller.dart';
import '../../utils/styles.dart';
import '../../utils/url_scheme.dart';
import '../GlobalProvider/navigation/navigation_provider.dart';

var showLoading = false.obs;

class GetFarmSupplier extends ChangeNotifier{

  GetFarmSupplierResponse? farmSupplierResponse;
  TextEditingController fromCount=TextEditingController(),toCount =TextEditingController();

  bool isFilter = false;
  bool searchTapped = false;
  bool isMapDisplay = false;
  List<bool> selected=[];
  List<Marker> mMarkerList = [];
  var listLatLng = LatLngBounds();

  Future getFarmSupplier({String? search,String? from,String? to})async{
    showLoading.value=true;
    mMarkerList.clear();
    farmSupplierResponse = await EntrepreneurClients.getFarmSupplierData(searchQuote: search, from:from,to:to);
    if (farmSupplierResponse!.data != null && farmSupplierResponse!.data!.isNotEmpty) {
      for (var i = 0; i < farmSupplierResponse!.data!.length; i++) {
        listLatLng.extend(latLng.LatLng(
          farmSupplierResponse!.data![i].farmLatitude == null ? 51.849942 : farmSupplierResponse!.data![i].farmLatitude!,
          farmSupplierResponse!.data![i].farmLongitude == null ? 5.773051 : farmSupplierResponse!.data![i].farmLongitude!,
        ));
        mMarkerList.add(
          Marker(
            point: latLng.LatLng(
              farmSupplierResponse!.data![i].farmLatitude == null ? 51.849942 : farmSupplierResponse!.data![i].farmLatitude!,
              farmSupplierResponse!.data![i].farmLongitude == null ? 5.773051 : farmSupplierResponse!.data![i].farmLongitude!,
            ),
            height: 80,
            width: 80,
            builder: (context) {
              return IconButton(
                icon: Icon(
                  Icons.location_on_rounded,
                  color: yellowishGreen,
                  size: 40,
                ),
                tooltip: farmSupplierResponse!.data![i].farmAutoName,
                onPressed: () {
                  launchUrl('https://$gloal_base_path/farms/${farmSupplierResponse!.data![i].farmId}');
                },
              );
            },
          ),
        );
      }
    }

    showLoading.value=false;
    selected =List.filled(farmSupplierResponse!.data!.length, false);
    notifyListeners();
  }

  updateMap(bool isDisplay){

    isMapDisplay=isDisplay;

    notifyListeners();
  }

}