import 'dart:convert';
import 'package:universal_html/html.dart' as html;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart' as latLng;
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:wij_land/api_clients/entrepreneur_client.dart';
import 'package:wij_land/models/entrepreneur/latLngClass.dart';
import 'package:wij_land/models/entrepreneur/request/post_entrepreneur_supplier_request.dart';
import 'package:wij_land/models/entrepreneur/request/put_entrepreneur_supplier_request.dart';
import 'package:wij_land/models/entrepreneur/response/delete_entrepreneur_supplier_resoponce.dart';
import 'package:wij_land/models/entrepreneur/response/get_entrepreneur_supplier_response.dart';
import 'package:wij_land/models/entrepreneur/response/put_entrepreneure_supplier_response.dart';

import '../../../models/entrepreneur/response/post_entrepreneur_suppliers_response.dart';
import '../../api_clients/BaseClass.dart';
import '../../api_clients/dropDown_client.dart';
import '../../models/entrepreneur/request/put_entrepreneur_supplier_bulk_request.dart';
import '../../models/entrepreneur/request/supplier_csv_download_request_model.dart';
import '../../models/entrepreneur_dropDown/farm_dropDown.dart';
import '../../utils/styles.dart';

class CreateNewEntreprenuerSupplierProvider with ChangeNotifier {
  PostEntrepreneurSupplierResponse? supplierResponse;
  PutEntrepreneurSupplierResponse? updateSupplierRequest;
  GetEntrepreneurSupplierResponse? getSupplierResponse;
  DeleteEntrepreneurSupplierResponse? deleteSupplierResponse;
  TextEditingController mSupplierFarm = TextEditingController();
  TextEditingController mDateTimeTextController = TextEditingController();
  final TextEditingController startDate = TextEditingController(),
      endDate = TextEditingController();

  ///* CSV DOWNLOAD WORK STARTS *///
  List<int> allCheckedBoxId = [];
  List<int> allCheckedBoxCSVId = [];
  List multipleIndex = [];

  downloadCSV() async {
    var url = "$baseURL/farm_computer/download/suppliers";

    if (allCheckedBoxId.isNotEmpty) {
      var uri = Uri.parse(url);
      SupplierCSVDownloadRequestModel csvRequestModel =
          SupplierCSVDownloadRequestModel(
        prefixEntity: "supplier_",
        property: Property(
          supplierConnectSince: "on",
          supplierFarmAutoName: "on",
          supplierFarmRepresentativeName: "on",
          supplierWiRelationType: "on",
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
        final blob = html.Blob([response.bodyBytes]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.document.createElement('a') as html.AnchorElement
          ..href = url
          ..style.display = 'none'
          ..download = "supplier.csv";
        html.document.body!.children.add(anchor);

        anchor.click();

        html.document.body!.children.remove(anchor);
        html.Url.revokeObjectUrl(url);
      }
    }
  }

  ///* CSV DOWNLOAD WORK ENDS *///

  clearAllFeeilds() {
    mSupplierFarm = TextEditingController();
    mSupplierFarm = TextEditingController();
    mDateTimeTextController = TextEditingController();
  }

  bool _isLoading = false;
  bool _isDataLoading = true;

  bool get isLoading => _isLoading;

  bool get isDataLoadin => _isDataLoading;
  List<bool> _checkedBool = <bool>[];
  List<bool> _isExpand = <bool>[];
  List<LatLngClass> latLngValue = [];
  List<Marker> listOfSupplierMarker = [];

  List<bool> get getcheckedBool => _checkedBool;

  List<bool> get getExpand => _isExpand;

  late FarmDropDown farmDropDown;
  late List<FarmsList> mFarmSearchedList = [];
  bool mShowFarmListWidget = false;

  Future deleteSupplier({int? id, dynamic supplierid}) async {
    deleteSupplierResponse =
        await EntrepreneurClients.deleteEntreprenuerSupplierResponseData(
            id: id, supplierid: supplierid);

    notifyListeners();
  }

  Future updateSupplier(PutEntrepreneurSupplierRequest _request,
      int entreprenuerId, int? supplierid) async {
    updateSupplierRequest =
        await EntrepreneurClients.updateEntreprenuerSupplierResponseData(
            _request, entreprenuerId, supplierid!);
    notifyListeners();
  }

  Future updateBulkSupplier(PutEntrepreneurSupplierBulkRequest _request,
      int entreprenuerId, int? supplierid) async {
    updateSupplierRequest =
        await EntrepreneurClients.updateEntreprenuerSupplierBulkResponseData(
            _request, entreprenuerId, supplierid!);
    notifyListeners();
  }

  var listOfSupplierBounds = LatLngBounds();

  Future getAllSupplier(
      {required int entreprenuerId,
      String searchValue = '',
      String from = '',
      String to = ''}) async {
    getSupplierResponse = await EntrepreneurClients.getEntrepreneurSupplierData(
        mEntrepreneurId: entreprenuerId,
        searchData: searchValue,
        fromDate: from,
        toDate: to);

    _checkedBool = List.filled(getSupplierResponse!.data!.length, false);
    _isExpand = List.filled(getSupplierResponse!.data!.length, false);
    latLngValue.clear();
    listOfSupplierMarker.clear();
    listOfSupplierBounds = LatLngBounds();
    for (int i = 0; i < getSupplierResponse!.data!.length; i++) {
      latLngValue.insert(
          i,
          LatLngClass(
              lat: getSupplierResponse!.data![i].lat,
              lng: getSupplierResponse!.data![i].lng));
      listOfSupplierBounds.extend(latLng.LatLng(
          getSupplierResponse!.data![i].lat ?? 52.1825314,
          getSupplierResponse!.data![i].lng ?? 4.1493511));
      listOfSupplierBounds.extend(latLng.LatLng(
        getSupplierResponse!.data![i].lat ?? 51.849942,
        getSupplierResponse!.data![i].lng ?? 5.773051,
      ));
      listOfSupplierMarker.add(Marker(
        width: 80.0,
        height: 80.0,
        point: latLng.LatLng(
          getSupplierResponse!.data![i].lat ?? 51.849942,
          getSupplierResponse!.data![i].lng ?? 5.773051,
        ),
        builder: (ctx) => Tooltip(
          message: '${getSupplierResponse!.data![i].farmAutoName}',
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(3)),
          child: Icon(
            Icons.location_on_rounded,
            color: yellow,
            size: 40,
          ),
          textStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 12),
        ),
      ));
    }
    notifyListeners();
  }

  Future createNewSupplier(BuildContext context,
      PostEntrepreneurSupplierRequest _request, int entreprenuerId) async {
    _isLoading = true;
    supplierResponse =
        await EntrepreneurClients.postEntreprenuerSupplierResponseData(
            _request, entreprenuerId);
    if (supplierResponse?.status == 200) {
      _isLoading = false;
    }
    notifyListeners();
  }

  late int mSearchFarmId = 0;
  String selectFarmID = '';

  updateFarmID({required int id, required bool isTaskId}) {
    if (isTaskId) {
      mSearchFarmId = id;
      notifyListeners();
    } else {
      selectFarmID = id.toString();
      notifyListeners();
    }
  }

  getFarmsDropDownData() async {
    farmDropDown = await DropDownClients.getFarmDetailData();
  }

  searchFarm({required String value}) {
    mFarmSearchedList.clear();
    notifyListeners();

    for (var i = 0; i < farmDropDown.data!.length; i++) {
      if (farmDropDown.data![i].name!
          .toLowerCase()
          .contains(value.toLowerCase())) {
        mFarmSearchedList.add(farmDropDown.data![i]);
        notifyListeners();
      }
    }
  }

  pickDate({required BuildContext context}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: SizedBox(
              width: 300,
              height: 400,
              child: SfDateRangePicker(
                initialDisplayDate: DateTime.tryParse('yyyy-MM-dd'),
                initialSelectedDate: DateTime.now(),
                onSelectionChanged: (args) {
                  mDateTimeTextController.text =
                      DateFormat('yyyy-MM-dd').format(args.value!);
                  Future.delayed(Duration(milliseconds: 500), () {
                    Navigator.pop(context);
                  });
                  notifyListeners();
                },
                selectionMode: DateRangePickerSelectionMode.single,
              ),
            ),
          );
        });

    //mDateTimeTextController.text = DateFormat('dd-MM-yyyy').format(mSelectedDateTime!);
    // notifyListeners();
  }

  pickStartDate({required BuildContext context}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: SizedBox(
              width: 300,
              height: 400,
              child: SfDateRangePicker(
                initialDisplayDate: DateTime.tryParse('dd-MM-yyyy'),
                initialSelectedDate: DateTime.now(),
                onSelectionChanged: (args) {
                  startDate.text = DateFormat('dd-MM-yyyy').format(args.value!);
                  Future.delayed(Duration(milliseconds: 500), () {
                    Navigator.pop(context);
                  });
                  notifyListeners();
                },
                selectionMode: DateRangePickerSelectionMode.single,
              ),
            ),
          );
        });

    //mDateTimeTextController.text = DateFormat('dd-MM-yyyy').format(mSelectedDateTime!);
    // notifyListeners();
  }

  pickEndDate({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: SizedBox(
            width: 300,
            height: 400,
            child: SfDateRangePicker(
              initialDisplayDate: DateTime.tryParse('dd-MM-yyyy'),
              initialSelectedDate: DateTime.now(),
              onSelectionChanged: (args) {
                endDate.text = DateFormat('dd-MM-yyyy').format(args.value!);
                Future.delayed(Duration(milliseconds: 500), () {
                  Navigator.pop(context);
                });
                notifyListeners();
              },
              selectionMode: DateRangePickerSelectionMode.single,
            ),
          ),
        );
      },
    );

    //mDateTimeTextController.text = DateFormat('dd-MM-yyyy').format(mSelectedDateTime!);
    // notifyListeners();
  }
}
