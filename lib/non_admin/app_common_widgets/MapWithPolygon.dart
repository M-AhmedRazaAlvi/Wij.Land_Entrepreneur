import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart' as latLng;
import '../../utils/functions.dart';

bool firstAttempt = false;

class MapWithPolygon extends StatefulWidget {
  final List<List<latLng.LatLng>>? listOfPolygon;
  final List<String>? labelList;
  final List<int>? indexList;
  final Function(int)? selectedIndex;
  final String? selectedParcel;
  final bool? hasSingleItem;
  final double? outerPadding;
  final bool? showgreen;
  final bool? showCenter;
  final bool? isDashboardMap;
  final List<bool>? activeParcel;

  const MapWithPolygon({
    Key? key,
    this.listOfPolygon = const [],
    this.labelList,
    this.indexList,
    this.selectedIndex,
    this.selectedParcel,
    this.hasSingleItem = false,
    this.outerPadding = 150,
    this.showgreen = false,
    this.showCenter = false,
    this.activeParcel = const [],
    this.isDashboardMap = false,
  }) : super(key: key);

  @override
  State<MapWithPolygon> createState() => _MapWithPolygonState();
}

class _MapWithPolygonState extends State<MapWithPolygon> {
  bool steliteView = true;
  var listofBounds = LatLngBounds();
  double currentZoom = 17.0;
  MapController mapController = MapController();
  latLng.LatLng? currentCenter;
  void min_zoom() {
    currentZoom = currentZoom - 0.5;
    mapController.move(currentCenter!, currentZoom);
  }

  void max_zoom() {
    currentZoom = currentZoom + 0.5;
    mapController.move(currentCenter!, currentZoom);
  }

  @override
  void initState() {
    print("parcels active parcel ${widget.activeParcel} ${widget.listOfPolygon!.length}");
    if (widget.hasSingleItem!) {
      List<latLng.LatLng> list = widget.listOfPolygon![0];
      for (var i in list) {
        listofBounds.extend(latLng.LatLng(
          i.latitude,
          i.longitude,
        ));
        currentCenter = latLng.LatLng(
          i.latitude,
          i.longitude,
        );
      }
    } else {
      print('listOfPolygon = ${widget.listOfPolygon!.length}');
      for (var i in widget.listOfPolygon!) {
        listofBounds.extend(latLng.LatLng(
          i[0].latitude,
          i[0].longitude,
        ));
        currentCenter = latLng.LatLng(
          i[0].latitude,
          i[0].longitude,
        );
      }
    }
    print('bounds is = ${listofBounds}');

    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      if (!firstAttempt) {
        firstAttempt = true;

      }
      mapController.move(currentCenter!, currentZoom);

    });
  }
//late MapZoomPanBehavior _zoomPanBehavior;

  @override
  Widget build(BuildContext context) {
    if (widget.listOfPolygon!.isEmpty) {
      return Stack(
        children: [
          steliteView
              ? SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                        boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(widget.hasSingleItem! ? 50 : widget.outerPadding!)),
                        interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                        zoom: currentZoom),
                    children: [
                      TileLayer(
                        urlTemplate: "https://api.mapbox.com/styles/v1/mapbox/satellite-v9/tiles/"
                            "{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw",
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                        boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(widget.hasSingleItem! ? 50 : widget.outerPadding!)),
                        interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                        zoom: currentZoom),
                    // layers: <LayerOptions>[
                    //   TileLayerOptions(
                    //     urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    //     subdomains: ['0', '1', '2', '3'],
                    //     retinaMode: true,
                    //     maxZoom: 22,
                    //   ),
                    // ],
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
          mapZoomContrroller()
        ],
      );
    }
    return Stack(
      children: [
        steliteView
            ? SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: FlutterMap(
                  mapController: mapController,
                  options: widget.showCenter!
                      ? MapOptions(
                          center: latLng.LatLng(
                            widget.listOfPolygon![0][0].latitude,
                            widget.listOfPolygon![0][0].longitude,
                          ),
                          zoom: currentZoom,
                          boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(widget.hasSingleItem! ? 50 : widget.outerPadding!)),
                          interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                        )
                      : MapOptions(
                          bounds: listofBounds,
                          zoom: currentZoom,
                          boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(widget.hasSingleItem! ? 50 : widget.outerPadding!)),
                          interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                        ),
                  children: [
                    TileLayer(
                      urlTemplate: "https://api.mapbox.com/styles/v1/mapbox/satellite-v9/tiles/"
                          "{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw",
                    ),
                    PolygonLayer(
                      polygons: widget.listOfPolygon!.map((e) {
                        int index = widget.listOfPolygon!.indexOf(e);
                        return Polygon(
                            points: e,
                            color: widget.activeParcel!.isNotEmpty
                                ? widget.activeParcel![index] == true
                                    ? Color(0Xff63C055)
                                    : Color.fromARGB(255, 224, 224, 224)
                                : (!firstAttempt || widget.labelList![index] == widget.selectedParcel || widget.hasSingleItem! || widget.showgreen!)
                                    ? Color(0Xff63C055)
                                    : Color(0XffE0E0E0),
                            isFilled: true,
                            label: widget.labelList![index],
                            labelPlacement: PolygonLabelPlacement.polylabel,
                            labelStyle: TextStyle(color: Colors.white, fontSize: 13));
                      }).toList(),
                    ),
                  ],
                ),
              )
            : SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: FlutterMap(
                  mapController: mapController,
                  options: widget.showCenter!
                      ? MapOptions(
                          center: latLng.LatLng(
                            widget.listOfPolygon![0][0].latitude,
                            widget.listOfPolygon![0][0].longitude,
                          ),
                          zoom: currentZoom,
                          boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(widget.hasSingleItem! ? 50 : widget.outerPadding!)),
                          interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                        )
                      : MapOptions(
                          bounds: listofBounds,
                          zoom: currentZoom,
                          boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(widget.hasSingleItem! ? 50 : widget.outerPadding!)),
                          interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                        ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['0', '1', '2', '3'],
                      retinaMode: false,
                      maxZoom: 22,
                    ),
                    PolygonLayer(
                      polygonCulling: true,
                      polygons: widget.listOfPolygon!.map((e) {
                        int index = widget.listOfPolygon!.indexOf(e);
                        return Polygon(
                            points: e,
                            color: (!firstAttempt || widget.labelList![index] == widget.selectedParcel || widget.hasSingleItem! || widget.showgreen!)
                                ? Color(0Xff63C055)
                                : Color(0XffE0E0E0),
                            isFilled: true,
                            label: widget.labelList![index],
                            labelPlacement: PolygonLabelPlacement.polylabel,
                            labelStyle: TextStyle(color: Colors.black, fontSize: 13));
                      }).toList(),
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
        mapZoomContrroller()
      ],
    );
  }

  Widget mapZoomContrroller() {
    return Positioned(
      child: Container(
        color: Colors.white,
        child: Column(children: [
          IconButton(
              onPressed: () {
                max_zoom();
              },
              icon: Icon(Icons.add_box)),
          IconButton(
              onPressed: () {
                min_zoom();
              },
              icon: Icon(Icons.indeterminate_check_box)),
        ]),
      ),
      bottom: 10,
      right: 10,
    );
  }
}
