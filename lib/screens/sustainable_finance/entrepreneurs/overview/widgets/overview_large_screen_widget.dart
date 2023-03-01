import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:provider/provider.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/overview/widgets/overview_address_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/overview/widgets/overview_head_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/overview/widgets/overview_main_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/overview/widgets/overview_small_screen_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/overview/widgets/overview_title_widget.dart';
import 'package:wij_land/utils/styles.dart';
import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../providers/entrepreneur/entrepreneur_retailer_provider.dart';
import '../../../../../providers/entrepreneur/entrepreneur_screen_overview_provider.dart';
import '../../../../../providers/entrepreneur/entrepreneur_supplier_provider.dart';
import '../../../../../utils/functions.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/responsive.dart';
import '../../contacts/entreprenuer_contact_screen.dart';
import '../../retailers/retailer_screen.dart';
import '../../suppliers/supplier_screen.dart';

class OverviewLargeScreenWidget extends StatefulWidget {
  final int id;

  const OverviewLargeScreenWidget({Key? key, required this.id}) : super(key: key);

  @override
  State<OverviewLargeScreenWidget> createState() => _OverviewLargeScreenWidgetState();
}

class _OverviewLargeScreenWidgetState extends State<OverviewLargeScreenWidget> {
  bool activeMap = false;
  bool isFilter = false;
  bool steliteView = true;
  final PopupController _popupLayerController = PopupController();

  @override
  Widget build(BuildContext context) {
    return Consumer3<EntrepreneurOverviewScreenProvider, CreateNewEntreprenuerSupplierProvider, EntrepreneurRetailerProvider>(
      builder: (context, _provider, _supplier, _retailer, child) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: getHeight(context),
                width: getWidth(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OverviewHeadWidget(
                            onClick: _provider.isClicked,
                            model: _provider.mOverviewData,
                            mEntrepreneurID: widget.id,
                            detailsResponse: _provider.detailsResponse,
                            isClicked: () {
                              setState(
                                () {
                                  _provider.isClicked = !_provider.isClicked;
                                },
                              );
                            },
                          ),
                          _provider.isClicked
                              ? OverviewAddressWidget(
                                  isOpen: _provider.mapOpened,
                                  model: _provider.mOverviewData,
                                  detailsResponse: _provider.detailsResponse,
                                  addressList: _provider.addressList,
                                )
                              : SizedBox.shrink(),
                          OverviewTitlesWidget(
                            titleClicked: _provider.titleClicked,
                            model: _provider.mOverviewData,
                            detailsResponse: _provider.detailsResponse,
                            selectedIndex: (i) {
                              setState(
                                () {
                                  _provider.mSelectedIndex = i;
                                },
                              );
                            },
                            select: _provider.mSelectedIndex,
                            titleList: _provider.titleList,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        _provider.mSelectedIndex == 0
                            ? Expanded(
                                child: OverviewMainWidget(
                                  icon: _provider.icon,
                                  description: _provider.description,
                                  model: _provider.mOverviewData.data!.entrepreneur!,
                                  sideColor: _provider.sideColor,
                                  isSocial: _provider.socialList,
                                  personModel: _provider.mOverviewData.data?.persons,
                                  mEntrepreneurID: this.widget.id,
                                ),
                              )
                            : _provider.mSelectedIndex == 1
                                ? Expanded(
                                    child: EntrepreneursContactScreen(
                                      id: this.widget.id,
                                      entrepreneurName: _provider.detailsResponse.data!.entrepreneurName,
                                    ),
                                  )
                                : _provider.mSelectedIndex == 2
                                    ? Expanded(
                                        child: SupplierScreen(
                                          arguments: this.widget.id,
                                        ),
                                      )
                                    : Expanded(
                                        child: RetailerScreen(
                                          id: this.widget.id,
                                        ),
                                      ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
            Positioned(
              top: _provider.mapOpened ? 0 : 30,
              right: _provider.mapOpened ? 0 : 12,
              child: SizedBox(
                height: _provider.mapOpened ? getHeight(context) : 70,
                width: _provider.mapOpened
                    ? !Responsive.isMobile(context)
                        ? getWidth(context) * 0.45
                        : getWidth(context)
                    : 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(8),
                  ),
                  child: _provider.mapOpened
                      ? SlideInRight(
                          duration: Duration(seconds: 1),
                          child: Row(
                            children: [
                              Responsive.isMobile(context)
                                  ? SizedBox()
                                  : InkWell(
                                      onTap: () {
                                        setState(
                                          () {
                                            _provider.mapOpened = !_provider.mapOpened;
                                            //_provider.isClicked = !_provider.isClicked;
                                          },
                                        );
                                      },
                                      child: Container(
                                          width: 45,
                                          height: 60,
                                          child: Center(
                                              child: Icon(
                                            Icons.clear,
                                            color: Colors.white,
                                          )),
                                          decoration: BoxDecoration(
                                              color: Colors.blue.withOpacity(0.5),
                                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), topLeft: Radius.circular(50)))),
                                    ),
                              Expanded(
                                child: FlutterMap(
                                  options: MapOptions(
                                    zoom: 8,
                                    center: latLng.LatLng(52.413960, 4.972374),
                                    // center: _provider.mSelectedIndex == 0
                                    //     ? latLng.LatLng(
                                    //         _provider.mOverviewData.data!.entrepreneur!.latitude == null
                                    //             ? 51.849942
                                    //             : _provider.mOverviewData.data!
                                    //                 .entrepreneur!.latitude!,
                                    //         _provider.mOverviewData.data!.entrepreneur!.longitude == null
                                    //             ? 5.773051
                                    //             : _provider.mOverviewData.data!
                                    //                 .entrepreneur!.longitude!)
                                    //     : _provider.mSelectedIndex == 1
                                    //         ? latLng.LatLng(
                                    //             _provider.mOverviewData.data!.entrepreneur!.latitude == null
                                    //                 ? 51.849942
                                    //                 : _provider
                                    //                     .mOverviewData
                                    //                     .data!
                                    //                     .entrepreneur!
                                    //                     .latitude!,
                                    //             _provider.mOverviewData.data!.entrepreneur!.longitude == null
                                    //                 ? 5.773051
                                    //                 : _provider
                                    //                     .mOverviewData
                                    //                     .data!
                                    //                     .entrepreneur!
                                    //                     .longitude!)
                                    //         : _provider.mSelectedIndex == 2
                                    //             ? latLng.LatLng(
                                    //                 _supplier.latLngValue.isEmpty ? 51.849942 : _supplier.latLngValue[0].lat ?? 51.849942,
                                    //                 _supplier.latLngValue.isEmpty ? 5.773051 : _supplier.latLngValue[0].lng ?? 5.773051)
                                    //             : latLng.LatLng(_retailer.latLngRetailer.isEmpty ? 51.849942 : _retailer.latLngRetailer[0].lat ?? 51.849942, _retailer.latLngRetailer.isEmpty ? 5.773051 : _retailer.latLngRetailer[0].lng ?? 5.773051),
                                    // bounds: _provider.mSelectedIndex == 0
                                    //     ? null
                                    //     : _provider.mSelectedIndex == 1
                                    //         ? null
                                    //         : _provider.mSelectedIndex == 2
                                    //             ? _supplier.listOfSupplierBounds
                                    //             : _retailer
                                    //                 .listOfRRetailerBounds,
                                    boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(100.0)),
                                    interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                                    onTap: (_, __) => _popupLayerController.hideAllPopups(),
                                  ),
                                  children: [
                                    steliteView
                                        ? TileLayer(
                                            urlTemplate: "https://api.mapbox.com/styles/v1/mapbox/satellite-v9/tiles/"
                                                "{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw",
                                          )
                                        : TileLayer(
                                            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                            retinaMode: true,
                                            maxZoom: 22,
                                          ),
                                    _provider.mSelectedIndex == 0
                                        ? PopupMarkerLayerWidget(
                                            options: PopupMarkerLayerOptions(
                                              popupController: _popupLayerController,
                                              markers: [
                                                Marker(
                                                  width: 80.0,
                                                  height: 80.0,
                                                  point: latLng.LatLng(_provider.mOverviewData.data!.entrepreneur!.latitude!,
                                                      _provider.mOverviewData.data!.entrepreneur!.longitude!),
                                                  builder: (ctx) => Tooltip(
                                                    message: '${_provider.detailsResponse.data!.entrepreneurName}',
                                                    decoration:
                                                        BoxDecoration(color: Colors.white.withOpacity(0.7), borderRadius: BorderRadius.circular(3)),
                                                    child: Icon(
                                                      Icons.location_on_rounded,
                                                      color: darkGreen,
                                                      size: 40,
                                                    ),
                                                    textStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 12,
                                                        fontFamily: Montserrat_Medium),
                                                  ),
                                                ),
                                              ],
                                              markerRotateAlignment: PopupMarkerLayerOptions.rotationAlignmentFor(AnchorAlign.top),
                                              popupBuilder: (BuildContext context, Marker marker) {
                                                return Card(
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(0),
                                                        child: Container(
                                                          constraints: BoxConstraints(minWidth: 100, maxWidth: 220),
                                                          color: Colors.white,
                                                          padding: EdgeInsets.all(5),
                                                          child: Text(
                                                            '${_provider.detailsResponse.data!.entrepreneurName}',
                                                            overflow: TextOverflow.fade,
                                                            softWrap: false,
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 16.0,
                                                              color: darkGreen,
                                                              fontFamily: Montserrat_Medium,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            _popupLayerController.hideAllPopups();
                                                          },
                                                          icon: Icon(Icons.close))
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        : _provider.mSelectedIndex == 1
                                            ? PopupMarkerLayerWidget(
                                                options: PopupMarkerLayerOptions(
                                                  popupController: _popupLayerController,
                                                  markers: [
                                                    Marker(
                                                      width: 80.0,
                                                      height: 80.0,
                                                      point: latLng.LatLng(_provider.mOverviewData.data!.entrepreneur!.latitude!,
                                                          _provider.mOverviewData.data!.entrepreneur!.longitude!),
                                                      builder: (ctx) => Tooltip(
                                                        message: '${_provider.detailsResponse.data!.entrepreneurName}',
                                                        decoration: BoxDecoration(
                                                            color: Colors.white.withOpacity(0.7), borderRadius: BorderRadius.circular(3)),
                                                        child: Icon(
                                                          Icons.location_on_rounded,
                                                          color: darkGreen,
                                                          size: 40,
                                                        ),
                                                        textStyle: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 12,
                                                            fontFamily: Montserrat_Medium),
                                                      ),
                                                    ),
                                                  ],
                                                  markerRotateAlignment: PopupMarkerLayerOptions.rotationAlignmentFor(AnchorAlign.top),
                                                  popupBuilder: (BuildContext context, Marker marker) {
                                                    return Card(
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsets.all(0),
                                                            child: Container(
                                                              constraints: BoxConstraints(minWidth: 100, maxWidth: 220),
                                                              color: Colors.white,
                                                              padding: EdgeInsets.all(5),
                                                              child: Text(
                                                                '${_provider.detailsResponse.data!.entrepreneurName}',
                                                                overflow: TextOverflow.fade,
                                                                softWrap: false,
                                                                style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 16.0,
                                                                    color: darkGreen,
                                                                    fontFamily: Montserrat_Medium),
                                                              ),
                                                            ),
                                                          ),
                                                          IconButton(
                                                              onPressed: () {
                                                                _popupLayerController.hideAllPopups();
                                                              },
                                                              icon: Icon(Icons.close))
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              )
                                            : _provider.mSelectedIndex == 2
                                                ? PopupMarkerLayerWidget(
                                                    options: PopupMarkerLayerOptions(
                                                      popupController: _popupLayerController,
                                                      markers: _supplier.listOfSupplierMarker,
                                                      markerRotateAlignment: PopupMarkerLayerOptions.rotationAlignmentFor(AnchorAlign.top),
                                                      popupBuilder: (BuildContext context, Marker marker) {
                                                        int index = _supplier.listOfSupplierMarker.indexOf(marker);
                                                        return Container(
                                                          constraints: BoxConstraints(maxWidth: 450, maxHeight: 100),
                                                          child: Card(
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.min,
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.all(0),
                                                                      child: Container(
                                                                        constraints: BoxConstraints(minWidth: 100, maxWidth: 220),
                                                                        color: Colors.white,
                                                                        padding: EdgeInsets.all(5),
                                                                        child: Text(
                                                                          '${_supplier.getSupplierResponse!.data![index].farmAutoName}',
                                                                          overflow: TextOverflow.fade,
                                                                          softWrap: false,
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 13.0,
                                                                              color: darkGreen,
                                                                              fontFamily: Montserrat_Medium),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsets.all(0),
                                                                      child: Container(
                                                                        constraints: BoxConstraints(minWidth: 100, maxWidth: 220),
                                                                        color: Colors.white,
                                                                        padding: EdgeInsets.all(5),
                                                                        child: Text(
                                                                          '${_supplier.getSupplierResponse!.data![index].farmRepresentativeName}',
                                                                          overflow: TextOverflow.fade,
                                                                          softWrap: false,
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 13.0,
                                                                              color: darkGreen,
                                                                              fontFamily: Montserrat_Medium),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                ),
                                                                IconButton(
                                                                    onPressed: () {
                                                                      _popupLayerController.hideAllPopups();
                                                                    },
                                                                    icon: Icon(Icons.close))
                                                              ],
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                : PopupMarkerLayerWidget(
                                                    options: PopupMarkerLayerOptions(
                                                      popupController: _popupLayerController,
                                                      markers: _retailer.listOfMarkerRetailser,
                                                      popupSnap: PopupSnap.mapCenter,
                                                      markerRotateAlignment: PopupMarkerLayerOptions.rotationAlignmentFor(AnchorAlign.top),
                                                      popupBuilder: (BuildContext context, Marker marker) {
                                                        int index = _retailer.listOfMarkerRetailser.indexOf(marker);
                                                        print(
                                                            '${_retailer.listOfMarkerRetailser.length} and ${_retailer.entrepreneurModel!.data!.length}');
                                                        return Container(
                                                          constraints: BoxConstraints(maxWidth: 250, maxHeight: 350),
                                                          child: Card(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize: MainAxisSize.min,
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      color: Colors.white,
                                                                      margin: EdgeInsets.only(left: 12),
                                                                      padding: EdgeInsets.only(left: 8, top: 8),
                                                                      child: CustomText(
                                                                          text: '${_retailer.entrepreneurModel!.data![index].retailerName}',
                                                                          overflows: TextOverflow.visible,
                                                                          lines: 3,
                                                                          weight: FontWeight.bold,
                                                                          size: 16.0,
                                                                          color: darkGreen),
                                                                    ),
                                                                    IconButton(
                                                                        onPressed: () {
                                                                          _popupLayerController.hideAllPopups();
                                                                        },
                                                                        icon: Icon(
                                                                          Icons.close,
                                                                          size: 16,
                                                                        )),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 8,
                                                                ),
                                                                Row(
                                                                  mainAxisSize: MainAxisSize.min,
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(top: 4.0, left: 12),
                                                                      child: Icon(
                                                                        CupertinoIcons.location_solid,
                                                                        size: 20,
                                                                        color: dimMetalic2,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 20,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsets.all(0),
                                                                      child: Container(
                                                                        constraints: BoxConstraints(minWidth: 100, maxWidth: 180),
                                                                        color: Colors.white,
                                                                        padding: EdgeInsets.all(5),
                                                                        child: CustomText(
                                                                            text: '${_retailer.entrepreneurModel!.data![index].address}',
                                                                            overflows: TextOverflow.visible,
                                                                            lines: 2,
                                                                            weight: FontWeight.normal,
                                                                            size: 12.0,
                                                                            color: Colors.black),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 8,
                                                                ),
                                                                Row(
                                                                  mainAxisSize: MainAxisSize.min,
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(top: 4.0, left: 12),
                                                                      child: Icon(
                                                                        CupertinoIcons.phone,
                                                                        size: 20,
                                                                        color: dimMetalic2,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 20,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsets.all(0),
                                                                      child: Container(
                                                                        constraints: BoxConstraints(minWidth: 100, maxWidth: 180),
                                                                        color: Colors.white,
                                                                        padding: EdgeInsets.all(5),
                                                                        child: CustomText(
                                                                            text: '${_retailer.entrepreneurModel!.data![index].phoneNumber}',
                                                                            overflows: TextOverflow.visible,
                                                                            lines: 2,
                                                                            weight: FontWeight.normal,
                                                                            size: 12.0,
                                                                            color: Colors.black),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 8,
                                                                ),
                                                                Row(
                                                                  mainAxisSize: MainAxisSize.min,
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(top: 4.0, left: 12),
                                                                      child: Icon(
                                                                        CupertinoIcons.globe,
                                                                        size: 20,
                                                                        color: dimMetalic2,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 20,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsets.all(0),
                                                                      child: Container(
                                                                        constraints: BoxConstraints(minWidth: 100, maxWidth: 180),
                                                                        color: Colors.white,
                                                                        padding: EdgeInsets.all(5),
                                                                        child: CustomText(
                                                                            text: '${_retailer.entrepreneurModel!.data![index].website}',
                                                                            overflows: TextOverflow.visible,
                                                                            lines: 2,
                                                                            weight: FontWeight.normal,
                                                                            size: 12.0,
                                                                            color: Colors.black),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 8,
                                                                ),
                                                                Row(
                                                                  mainAxisSize: MainAxisSize.min,
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(top: 4.0, left: 12),
                                                                      child: Icon(
                                                                        CupertinoIcons.clock,
                                                                        size: 20,
                                                                        color: dimMetalic2,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 20,
                                                                    ),
                                                                    Column(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Container(
                                                                          constraints: BoxConstraints(minWidth: 100, maxWidth: 180),
                                                                          color: Colors.white,
                                                                          padding: EdgeInsets.all(5),
                                                                          child: CustomText(
                                                                              text:
                                                                                  'Mon     ${_retailer.entrepreneurModel!.data![index].openingHours!.mondayOpen}  -  ${_retailer.entrepreneurModel!.data![index].openingHours!.mondayClose}',
                                                                              overflows: TextOverflow.visible,
                                                                              lines: 2,
                                                                              weight: FontWeight.normal,
                                                                              size: 12.0,
                                                                              color: Colors.black),
                                                                        ),
                                                                        Container(
                                                                          constraints: BoxConstraints(minWidth: 100, maxWidth: 180),
                                                                          color: Colors.white,
                                                                          padding: EdgeInsets.all(5),
                                                                          child: CustomText(
                                                                              text:
                                                                                  'Tue      ${_retailer.entrepreneurModel!.data![index].openingHours!.tuesdayOpen}  -  ${_retailer.entrepreneurModel!.data![index].openingHours!.tuesdayClose}',
                                                                              overflows: TextOverflow.visible,
                                                                              lines: 2,
                                                                              weight: FontWeight.normal,
                                                                              size: 12.0,
                                                                              color: Colors.black),
                                                                        ),
                                                                        Container(
                                                                          constraints: BoxConstraints(minWidth: 100, maxWidth: 180),
                                                                          color: Colors.white,
                                                                          padding: EdgeInsets.all(5),
                                                                          child: CustomText(
                                                                              text:
                                                                                  'Wed    ${_retailer.entrepreneurModel!.data![index].openingHours!.wednesdayOpen}  -  ${_retailer.entrepreneurModel!.data![index].openingHours!.wednesdayClose}',
                                                                              overflows: TextOverflow.visible,
                                                                              lines: 2,
                                                                              weight: FontWeight.normal,
                                                                              size: 12.0,
                                                                              color: Colors.black),
                                                                        ),
                                                                        Container(
                                                                          constraints: BoxConstraints(minWidth: 100, maxWidth: 180),
                                                                          color: Colors.white,
                                                                          padding: EdgeInsets.all(5),
                                                                          child: CustomText(
                                                                              text:
                                                                                  'Thurs   ${_retailer.entrepreneurModel!.data![index].openingHours!.thursdayOpen}  -  ${_retailer.entrepreneurModel!.data![index].openingHours!.thursdayClose}',
                                                                              overflows: TextOverflow.visible,
                                                                              lines: 2,
                                                                              weight: FontWeight.normal,
                                                                              size: 12.0,
                                                                              color: Colors.black),
                                                                        ),
                                                                        Container(
                                                                          constraints: BoxConstraints(minWidth: 100, maxWidth: 180),
                                                                          color: Colors.white,
                                                                          padding: EdgeInsets.all(5),
                                                                          child: CustomText(
                                                                              text:
                                                                                  'Fri         ${_retailer.entrepreneurModel!.data![index].openingHours!.fridayOpen}  -  ${_retailer.entrepreneurModel!.data![index].openingHours!.fridayClose}',
                                                                              overflows: TextOverflow.visible,
                                                                              lines: 2,
                                                                              weight: FontWeight.normal,
                                                                              size: 12.0,
                                                                              color: Colors.black),
                                                                        ),
                                                                        Container(
                                                                          constraints: BoxConstraints(minWidth: 100, maxWidth: 180),
                                                                          color: Colors.white,
                                                                          padding: EdgeInsets.all(5),
                                                                          child: CustomText(
                                                                              text:
                                                                                  'Sat        ${_retailer.entrepreneurModel!.data![index].openingHours!.saturdayOpen}  -  ${_retailer.entrepreneurModel!.data![index].openingHours!.saturdayClose}',
                                                                              overflows: TextOverflow.visible,
                                                                              lines: 2,
                                                                              weight: FontWeight.normal,
                                                                              size: 12.0,
                                                                              color: Colors.black),
                                                                        ),
                                                                        Container(
                                                                          constraints: BoxConstraints(minWidth: 100, maxWidth: 180),
                                                                          color: Colors.white,
                                                                          padding: EdgeInsets.all(5),
                                                                          child: CustomText(
                                                                              text:
                                                                                  'Sun       ${_retailer.entrepreneurModel!.data![index].openingHours!.sundayOpen}  -  ${_retailer.entrepreneurModel!.data![index].openingHours!.sundayClose}',
                                                                              overflows: TextOverflow.visible,
                                                                              lines: 2,
                                                                              weight: FontWeight.normal,
                                                                              size: 12.0,
                                                                              color: Colors.black),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                  ],
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), topLeft: Radius.circular(50)),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.5),
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), topLeft: Radius.circular(50))),
                            padding: EdgeInsets.all(7),
                            child: InkWell(
                                onTap: () {
                                  setState(
                                    () {
                                      _provider.mapOpened = !_provider.mapOpened;
                                      //_provider.isClicked = !_provider.isClicked;
                                    },
                                  );
                                },
                                child: Icon(FontAwesomeIcons.map, color: Colors.white, size: 24)),
                          ),
                        ),
                ),
              ),
            ),
            if (_provider.mapOpened)
              Positioned(
                top: 20,
                right: 15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        _provider.mapOpened = false;
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(7),
                        child: Icon(Icons.clear, size: 20),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    InkWell(
                      // onTap: () {
                      //   _provider.mapOpened = true;
                      //   setState(() {});
                      // },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.zoom_out_map,
                          color: Colors.black,
                          size: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: () {
                        steliteView = !steliteView;
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(10),
                        child: FaIcon(
                          FontAwesomeIcons.layerGroup,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }

  void deactivate() {
    // TODO: implement deactivate
    Provider.of<EntrepreneurOverviewScreenProvider>(context).mSelectedIndex = 0;

    super.deactivate();
  }
}

class OverViewPopUp extends StatefulWidget {
  final Widget? child;

  const OverViewPopUp({Key? key, this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OverViewPopUpState();
}

class _OverViewPopUpState extends State<OverViewPopUp> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: widget.child,
    );
  }
}
