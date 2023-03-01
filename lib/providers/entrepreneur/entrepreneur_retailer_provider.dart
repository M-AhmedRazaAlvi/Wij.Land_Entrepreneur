import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:universal_html/html.dart';
import '../../../api_clients/entrepreneur_client.dart';
import '../../../models/entrepreneur/response/get_entrepreneur_retailer_response.dart';
import '../../api_clients/BaseClass.dart';
import '../../api_clients/dropDown_client.dart';
import '../../models/entrepreneur/latLngClass.dart';
import '../../models/entrepreneur/request/retailer_csv_download_request_model.dart';
import '../../models/entrepreneur_dropDown/retailer_dropdown.dart';
import '../../screens/sustainable_finance/entrepreneurs/overview/overview_screen.dart';
import 'package:http/http.dart' as http;
import '../../utils/styles.dart';

class EntrepreneurRetailerProvider extends ChangeNotifier {
  GetentrepreneurRetailerResponse? entrepreneurModel;
  List<int> allCheckedBoxId = [];

  TextEditingController mRetailerSearchController = TextEditingController();

  bool _loadRetailerData = true;
  bool mSearchRetailerList = false;
  List<bool> _isExpand = <bool>[];

  bool get loadRetailerData => _loadRetailerData;
  List<bool> _checkedBool = <bool>[];

  List<bool> get getExpand => _isExpand;

  List<bool> get getcheckedBool => _checkedBool;
  List<LatLngClass> latLngRetailer = [];
  List<Marker> listOfMarkerRetailser = [];
  var listOfRRetailerBounds = LatLngBounds();

  RetailerDropDown? retailerDropDown;
  late List<RetailerData> mRetailerSearchList = [];

  clearRecord() {
    _loadRetailerData = true;
  }

  List<bool>? selected;

  Future getEntrepreneurRetailerData({int? entrepreneurId, String? value}) async {
    entrepreneurModel = await EntrepreneurClients.getEntrepreneurRetailerData(mEntrepreneurID: entrepreneurId!, value: value);
    _checkedBool = List.filled(entrepreneurModel!.data!.length, false);
    _isExpand = List.filled(entrepreneurModel!.data!.length, false);

    latLngRetailer.clear();
    listOfRRetailerBounds = LatLngBounds();
    for (int i = 0; i < entrepreneurModel!.data!.length; i++) {
      latLngRetailer.insert(i, LatLngClass(lat: entrepreneurModel!.data![i].lat, lng: entrepreneurModel!.data![i].lng));
      listOfMarkerRetailser.add(Marker(
        width: 80.0,
        height: 80.0,
        point: latLng.LatLng(entrepreneurModel!.data![i].lat ?? 4.1825314, entrepreneurModel!.data![i].lng ?? 52.1493511),
        builder: (ctx) => Tooltip(
          message: '${entrepreneurModel!.data![i].retailerName}',
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.7), borderRadius: BorderRadius.circular(3)),
          child: Icon(
            Icons.location_on_rounded,
            color: orangecolor,
            size: 40,
          ),
          textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 12),
        ),
      ));
      listOfRRetailerBounds.extend(latLng.LatLng(entrepreneurModel!.data![i].lat ?? 4.1825314, entrepreneurModel!.data![i].lng ?? 52.1493511));
    }
    listOfRRetailerBounds.extend(latLng.LatLng(
        overviewScreenProvider!.mOverviewData.data!.entrepreneur!.latitude!, overviewScreenProvider!.mOverviewData.data!.entrepreneur!.longitude!));
    _loadRetailerData = false;
    selected = List<bool>.generate(entrepreneurModel!.data!.length, (int index) => false);
    notifyListeners();
  }

  postEntrepreneurRetailerData({int? entrepreneurId, Map<String, dynamic>? requestBody}) async {
    await EntrepreneurClients.postEntrepreneurRetailerData(mEntrepreneurID: entrepreneurId!, requestBody: requestBody);
    getEntrepreneurRetailerData(entrepreneurId: entrepreneurId);
    notifyListeners();
  }

  updateEntrepreneurRetailerData({int? entrepreneurId, Map<String, dynamic>? requestBody, int? retailEntrepreneurID}) async {
    await EntrepreneurClients.updateEntrepreneurRetailerData(
        mEntrepreneurID: entrepreneurId!, requestBody: requestBody, retailerEntrepreneurID: retailEntrepreneurID);
    getEntrepreneurRetailerData(entrepreneurId: entrepreneurId);
    notifyListeners();
  }

  deleteEntrepreneurRetailerData({int? entrepreneurID, dynamic retailerID}) async {
    await EntrepreneurClients.deleteEntrepreneurRetailer(mEntrepreneurID: entrepreneurID, retailerId: retailerID);
    getEntrepreneurRetailerData(entrepreneurId: entrepreneurID);
  }

  getRetailerData({required int id}) async {
    retailerDropDown = await DropDownClients.getRetailerDetailData(id: id);
  }

  searchRetailer({required String value}) {
    mRetailerSearchList.clear();
    notifyListeners();

    for (var i = 0; i < retailerDropDown!.data!.length; i++) {
      if (retailerDropDown!.data![i].name!.toLowerCase().contains(value.toLowerCase())) {
        mRetailerSearchList.add(retailerDropDown!.data![i]);
        notifyListeners();
      }
    }
  }

  late int mSearchedRetailerId = 0;

  updateRetailerID({required int id}) {
    mSearchedRetailerId = id;
    notifyListeners();
  }

  ///* CSV DOWNLOAD WORK STARTS *///

  downloadCSV() async {
    var url = "$baseURL/farm_computer/download/retailer";

    print('Request Object : ${allCheckedBoxId}');
    if (allCheckedBoxId.isNotEmpty) {
      var uri = Uri.parse(url);
      RetailsCSVDownloadRequestModel csvRequestModel = RetailsCSVDownloadRequestModel(
        prefixEntity: "",
        property: Property(
          retailerAddress: "on",
          retailerPhoneNumber: "on",
          retailerRetailerName: "on",
          retailerShop: "on",
          retailerWebsite: "on",
        ),
        selectedIds: allCheckedBoxId,
      );

      print('Request Object : ${csvRequestModel.toJson()}');

      var response = await http.post(
        uri,
        headers: header,
        body: jsonEncode(
          csvRequestModel,
        ),
      );
      print('Download CSV Response Status Code : ${response.statusCode}');
      print('Download CSV Response : ${response.body}');

      if (response.statusCode == 200) {
        final blob = Blob([response.bodyBytes]);
        final url = Url.createObjectUrlFromBlob(blob);
        final anchor = document.createElement('a') as AnchorElement
          ..href = url
          ..style.display = 'none'
          ..download = "retailer.csv";
        document.body!.children.add(anchor);

        anchor.click();

        document.body!.children.remove(anchor);
        Url.revokeObjectUrl(url);
      }
    }
  }

  ///* CSV DOWNLOAD WORK ENDS *///

}
