import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:provider/provider.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../../models/entrepreneur/response/get_entrepreneur_response.dart';
import '../../../../providers/entrepreneur/entrepreneur_screen_provider.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/controller.dart';
import '../../../../utils/functions.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  MapController? controller;
  bool steliteView = true;
  final PopupController _popupLayerController = PopupController();
  MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    if (steliteView) {
      return Consumer<EntrepreneurScreenProvider>(
          builder: (context, _provider, widget) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  // center: latLng.LatLng(
                  //   52.874385,
                  //   5.773051,
                  // ),
                  bounds: LatLngBounds.fromPoints([
                    latLng.LatLng(
                      52.874385,
                      5.773051,
                    ),
                    latLng.LatLng(
                      51.849942,
                      3.903331,
                    )
                  ]),
                  boundsOptions:
                      FitBoundsOptions(padding: EdgeInsets.all(100.0)),
                  interactiveFlags:
                      InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                  onTap: (_, __) => _popupLayerController.hideAllPopups(),
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://api.mapbox.com/styles/v1/mapbox/satellite-v9/tiles/"
                        "{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw",
                  ),
                  PopupMarkerLayerWidget(
                    options: PopupMarkerLayerOptions(
                      popupController: _popupLayerController,
                      markers: _provider.mMarkersList,
                      markerRotateAlignment:
                          PopupMarkerLayerOptions.rotationAlignmentFor(
                              AnchorAlign.top),
                      popupBuilder: (BuildContext context, Marker marker) {
                        int index = _provider.mMarkersList.indexOf(marker);
                        return ExamplePopup(
                          _provider.mEntrepreneurData.data![index],
                          closePopup: () {
                            _popupLayerController.hideAllPopups();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        steliteView = !steliteView;
                      });
                    },
                    child: Container(
                      height: getHeight(context) * 0.050,
                      width: getHeight(context) * 0.050,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(5),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.layerGroup,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      });
    }
    return Consumer<EntrepreneurScreenProvider>(
        builder: (context, _provider, widget) {
      return Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: FlutterMap(
              mapController: mapController,
              options: MapOptions(
                center: latLng.LatLng(
                  52.874385,
                  5.773051,
                ),
                // bounds: LatLngBounds(
                //     latLng.LatLng(
                //       52.874385,
                //       5.773051,
                //     ),
                //     latLng.LatLng(
                //       51.849942,
                //       3.903331,
                //     )),
                boundsOptions: FitBoundsOptions(
                  padding: EdgeInsets.all(100.0),
                ),
                interactiveFlags:
                    InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                onTap: (_, __) => _popupLayerController
                    .hideAllPopups(), // Hide popup when the map is tapped.
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  retinaMode: true,
                  maxZoom: 22,
                ),
                PopupMarkerLayerWidget(
                  options: PopupMarkerLayerOptions(
                    popupController: _popupLayerController,
                    markers: _provider.mMarkersList,
                    markerRotateAlignment:
                        PopupMarkerLayerOptions.rotationAlignmentFor(
                            AnchorAlign.top),
                    popupBuilder: (BuildContext context, Marker marker) {
                      int index = _provider.mMarkersList.indexOf(marker);
                      return ExamplePopup(
                        _provider.mEntrepreneurData.data![index],
                        closePopup: () {
                          _popupLayerController.hideAllPopups();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      steliteView = !steliteView;
                    });
                  },
                  child: Container(
                    height: getHeight(context) * 0.050,
                    width: getHeight(context) * 0.050,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(5),
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.layerGroup,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class ExamplePopup extends StatefulWidget {
  final Function()? closePopup;
  final GetEntrepreneurResponseData? model;

  const ExamplePopup(this.model, {Key? key, this.closePopup}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExamplePopupState();
}

class _ExamplePopupState extends State<ExamplePopup> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _cardDescription(context),
          IconButton(onPressed: widget.closePopup, icon: Icon(Icons.close))
        ],
      ),
    );
  }

  Widget _cardDescription(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        constraints: BoxConstraints(minWidth: 200, maxWidth: 220),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InkWell(
              onTap: () {
                navigationController.navigateToWithArguments(
                  arguments: {"id": widget.model!.id},
                  routeName: entreprenuersOverviewPageRoute,
                ).then((value) {
                  if (value != null) {
                    Provider.of<EntrepreneurScreenProvider>(context,
                            listen: false)
                        .getEntrepreneur(false);
                  }
                });
              },
              child: Text(
                '${widget.model!.name}',
                overflow: TextOverflow.fade,
                softWrap: false,
                style: TextStyle(
                    fontFamily: Montserrat_Medium,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: darkGreen),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Text(
                    '#Suppliers'.tr(),
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: TextStyle(
                      fontFamily: Montserrat_Medium,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                      color: yellow,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    '#Retailers'.tr(),
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: TextStyle(
                        fontFamily: Montserrat_Medium,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        color: newRed),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
