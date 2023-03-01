import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:provider/provider.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/overview/widgets/overview_address_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/overview/widgets/overview_head_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/overview/widgets/overview_main_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/overview/widgets/overview_title_widget.dart';

import '../../../../../providers/entrepreneur/entrepreneur_retailer_provider.dart';
import '../../../../../providers/entrepreneur/entrepreneur_screen_overview_provider.dart';
import '../../../../../providers/entrepreneur/entrepreneur_supplier_provider.dart';
import '../../../../../utils/functions.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/styles.dart';
import '../../contacts/entreprenuer_contact_screen.dart';
import '../../retailers/retailer_screen.dart';
import '../../suppliers/supplier_screen.dart';

var selected_mapInddex = ''.obs;

class OverviewSmallScreenWidget extends StatefulWidget {
  final int id;

  const OverviewSmallScreenWidget({Key? key, required this.id}) : super(key: key);

  @override
  State<OverviewSmallScreenWidget> createState() => _OverviewSmallScreenWidgetState();
}

class _OverviewSmallScreenWidgetState extends State<OverviewSmallScreenWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<EntrepreneurOverviewScreenProvider, CreateNewEntreprenuerSupplierProvider, EntrepreneurRetailerProvider>(
      builder: (context, _provider, _supplier, _retailer, child) {
        return Stack(
          children: [
            SingleChildScrollView(
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
                                mEntrepreneurID: widget.id,
                              ),
                            )
                          : _provider.mSelectedIndex == 1
                              ? Expanded(
                                  child: EntrepreneursContactScreen(
                                    id: widget.id,
                                    entrepreneurName: _provider.detailsResponse.data!.entrepreneurName,
                                  ),
                                )
                              : _provider.mSelectedIndex == 2
                                  ? Expanded(
                                      child: SupplierScreen(
                                        arguments: widget.id,
                                      ),
                                    )
                                  : Expanded(
                                      child: RetailerScreen(
                                        id: widget.id,
                                      ),
                                    ),
                    ],
                  )),
                ],
              ),
            ),
            Positioned(
              top: _provider.mapOpened ? 0 : 30,
              right: _provider.mapOpened ? 0 : 12,
              child: Transform.scale(
                scale: _provider.mapOpened ? 1.2 : 1,
                child: SizedBox(
                  height: _provider.mapOpened ? getHeight(context) : 70,
                  width: _provider.mapOpened ? getWidth(context) : 80,
                  child: InkWell(
                    child: ClipRRect(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(8),
                      ),
                      child: _provider.mapOpened
                          ? FlutterMap(
                              options: MapOptions(
                                zoom: 7,
                                center: _provider.mSelectedIndex == 0
                                    ? latLng.LatLng(
                                        _provider.mOverviewData.data!.entrepreneur!.latitude == null
                                            ? 51.849942
                                            : _provider.mOverviewData.data!.entrepreneur!.latitude!,
                                        _provider.mOverviewData.data!.entrepreneur!.longitude == null
                                            ? 5.773051
                                            : _provider.mOverviewData.data!.entrepreneur!.longitude!)
                                    : _provider.mSelectedIndex == 1
                                        ? latLng.LatLng(
                                            _provider.mOverviewData.data!.entrepreneur!.latitude == null
                                                ? 51.849942
                                                : _provider.mOverviewData.data!.entrepreneur!.latitude!,
                                            _provider.mOverviewData.data!.entrepreneur!.longitude == null
                                                ? 5.773051
                                                : _provider.mOverviewData.data!.entrepreneur!.longitude!)
                                        : _provider.mSelectedIndex == 2
                                            ? latLng.LatLng(_supplier.latLngValue.isEmpty ? 51.849942 : _supplier.latLngValue[0].lat ?? 51.849942,
                                                _supplier.latLngValue.isEmpty ? 5.773051 : _supplier.latLngValue[0].lng ?? 5.773051)
                                            : latLng.LatLng(
                                                _retailer.latLngRetailer.isEmpty ? 51.849942 : _retailer.latLngRetailer[0].lat ?? 51.849942,
                                                _retailer.latLngRetailer.isEmpty ? 5.773051 : _retailer.latLngRetailer[0].lng ?? 5.773051),
                                /*   bounds: _provider.mSelectedIndex == 0
                                    ? LatLngBounds(latLng.LatLng(_provider.mOverviewData.data!.entrepreneur!.latitude!,
                                        _provider.mOverviewData.data!.entrepreneur!.longitude!))
                                    : _provider.mSelectedIndex == 1
                                        ? LatLngBounds(latLng.LatLng(_provider.mOverviewData.data!.entrepreneur!.latitude!,
                                            _provider.mOverviewData.data!.entrepreneur!.longitude!))
                                        : _provider.mSelectedIndex == 2
                                            ? Provider.of<CreateNewEntreprenuerSupplier>(context).listOfSupplierBounds
                                            : Provider.of<EntrepreneurRetailerProvider>(context).listOfRRetailerBounds,*/
                                boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(20.0)),
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                  retinaMode: true,
                                  maxZoom: 22,
                                ),
                                _provider.mSelectedIndex == 0
                                    ? MarkerLayer(
                                        markers: [
                                          Marker(
                                            width: 80.0,
                                            height: 80.0,
                                            point: latLng.LatLng(_provider.mOverviewData.data!.entrepreneur!.latitude!,
                                                _provider.mOverviewData.data!.entrepreneur!.longitude!),
                                            builder: (ctx) => Icon(
                                              Icons.location_on_rounded,
                                              color: darkGreen,
                                              size: 40,
                                            ),
                                          ),
                                        ],
                                      )
                                    : _provider.mSelectedIndex == 1
                                        ? MarkerLayer(
                                            markers: [
                                              Marker(
                                                width: 80.0,
                                                height: 80.0,
                                                point: latLng.LatLng(_provider.mOverviewData.data!.entrepreneur!.latitude!,
                                                    _provider.mOverviewData.data!.entrepreneur!.longitude!),
                                                builder: (ctx) => Icon(
                                                  Icons.location_on_rounded,
                                                  color: darkGreen,
                                                  size: 40,
                                                ),
                                              ),
                                            ],
                                          )
                                        : _provider.mSelectedIndex == 2
                                            ? MarkerLayer(
                                                markers: [
                                                  /*Marker(
                                                    width: 80.0,
                                                    height: 80.0,
                                                    point:latLng.LatLng(_supplier.latLngValue[0].lat?? 52.1504805,
                                                       _supplier.latLngValue[0].lng??5.773051),
                                                    builder: (ctx) => Icon(
                                                      Icons.location_on_rounded,
                                                      color: darkGreen,
                                                      size: 40,
                                                    ),
                                                  ),*/
                                                  for (int i = 0; i < _supplier.latLngValue.length; i++)
                                                    Marker(
                                                      width: 80.0,
                                                      height: 80.0,
                                                      point: latLng.LatLng(
                                                        _supplier.latLngValue[i].lat ?? 51.849942,
                                                        _supplier.latLngValue[i].lng ?? 5.773051,
                                                      ),
                                                      builder: (ctx) => Obx(
                                                        () => selected_mapInddex.value == '$i'
                                                            ? Bounce(
                                                                child: Icon(
                                                                  Icons.edit_location_outlined,
                                                                  color: darkyellow,
                                                                  size: 60,
                                                                ),
                                                              )
                                                            : Icon(
                                                                Icons.location_on_rounded,
                                                                color: darkyellow,
                                                                size: 40,
                                                              ),
                                                      ),
                                                    ),
                                                ],
                                              )
                                            : MarkerLayer(
                                                markers: [
                                                  /*Marker(
                                                    width: 80.0,
                                                    height: 80.0,
                                                    point: latLng.LatLng( _retailer.latLngRetailer[0].lat ??
                                                        52.1534110,
                                                        _retailer.latLngRetailer[0].lng ??
                                                            4.813204),
                                                    builder: (ctx) => Icon(
                                                      Icons.location_on_rounded,
                                                      color: darkGreen,
                                                      size: 40,
                                                    ),
                                                  ),*/
                                                  for (int i = 0; i < _retailer.latLngRetailer.length; i++)
                                                    Marker(
                                                      width: 80.0,
                                                      height: 80.0,
                                                      point: latLng.LatLng(
                                                          _retailer.latLngRetailer[i].lat ?? 51.849942, _retailer.latLngRetailer[i].lng ?? 5.773051),
                                                      builder: (ctx) => Obx(
                                                        () => selected_mapInddex.value == '$i'
                                                            ? Bounce(
                                                                child: Icon(
                                                                  Icons.edit_location_outlined,
                                                                  color: Colors.red,
                                                                  size: 60,
                                                                ),
                                                              )
                                                            : Icon(
                                                                Icons.location_on_rounded,
                                                                color: Colors.red,
                                                                size: 40,
                                                              ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                              ],
                            )
                          : Image.asset(
                              Images.mapImage,
                              fit: BoxFit.cover,
                            ),
                    ),
                    onTap: () {
                      setState(
                        () {
                          _provider.mapOpened = !_provider.mapOpened;
                          //  _provider.isClicked = !_provider.isClicked;
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            if (_provider.mapOpened)
              Positioned(
                top: 30,
                right: 25,
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
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.times,
                              color: Colors.black,
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: Colors.white,
                      ),
                      child: IconButton(
                        color: Colors.black,
                        icon: FaIcon(
                          FontAwesomeIcons.layerGroup,
                          size: 12,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: () {
                        _provider.mapOpened = true;
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.square,
                            color: Colors.black,
                            size: 12,
                          ),
                          onPressed: () {},
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

  @override
  void deactivate() {
    // TODO: implement deactivate
    Provider.of<EntrepreneurOverviewScreenProvider>(context).mSelectedIndex = 0;
    Provider.of<EntrepreneurOverviewScreenProvider>(context).mapOpened = false;

    super.deactivate();
  }
}
