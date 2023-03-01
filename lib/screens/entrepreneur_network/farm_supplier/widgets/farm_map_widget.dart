import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/providers/entrepreneur/farm_supplier_provider.dart';

import '../../../../utils/functions.dart';

class FarmMapWidget extends StatefulWidget {
  const FarmMapWidget({Key? key}) : super(key: key);

  @override
  State<FarmMapWidget> createState() => _FarmMapWidgetState();
}

class _FarmMapWidgetState extends State<FarmMapWidget> {
  MapController? controller;
  bool steliteView = true;
  double zoom = -3.0;
  @override
  Widget build(BuildContext context) {
    if (steliteView) {
      return Consumer<GetFarmSupplier>(builder: (context, _provider, widget) {
        return Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: FlutterMap(
                options: MapOptions(
                  bounds: _provider.listLatLng,
                  boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(20.0)),
                  // interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                  minZoom: 3.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate: "https://api.mapbox.com/styles/v1/mapbox/satellite-v9/tiles/"
                        "{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw",
                  ),
                  MarkerLayer(
                    markers: _provider.mMarkerList,
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
    } else {
      return Consumer<GetFarmSupplier>(builder: (context, _provider, widget) {
        return Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: FlutterMap(
                options: MapOptions(
                  bounds: _provider.listLatLng,
                  boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(20.0)),
                  // interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                  minZoom: 3.0,
                ),
               children: [
                   TileLayer(
                     urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                     retinaMode: true,
                     maxZoom: 22,
                   ),
                   MarkerLayer(
                     markers: _provider.mMarkerList,
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
}
