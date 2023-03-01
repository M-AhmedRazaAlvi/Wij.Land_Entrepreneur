import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/non_admin/providers/dashobard_provider/main_dashboard_provider.dart';

class ParcelFCMapWidget extends StatefulWidget {
  const ParcelFCMapWidget({Key? key}) : super(key: key);

  @override
  State<ParcelFCMapWidget> createState() => _ParcelFCMapWidgetState();
}

class _ParcelFCMapWidgetState extends State<ParcelFCMapWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainFCDashboardProvider>(builder: (context, _provider, widget) {
      return FlutterMap(
        options: MapOptions(
          //   bounds: _provider.listLatLng,
          enableScrollWheel: false,
          boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(20.0)),
          //interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
          minZoom: 3.0,
        ),
        children: [
            TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
              // attributionBuilder: (_) {
              //   return Text("© OpenStreetMap contributors",style: TextStyle(fontSize: 12),);
              // },
            ),
            /* MarkerLayerOptions(
              markers: _provider.mMarkerList,
            ),*/
        ],
      );
    });
  }
}
