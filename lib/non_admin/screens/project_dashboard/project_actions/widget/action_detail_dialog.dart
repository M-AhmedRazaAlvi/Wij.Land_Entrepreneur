import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_map/flutter_map.dart';

// import 'package:flutter_widget_from_html/flutter_widget_from_dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_editor_enhanced/utils/shims/dart_ui_fake.dart';
import 'package:latlong2/latlong.dart' as latLng;

// import 'package:universal_html/dartart' as html;
import 'package:url_launcher/url_launcher.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/hex_color.dart';
import 'package:wij_land/utils/responsive.dart';

import '../../../../../utils/styles.dart';
import '../../../../app_common_widgets/MapWithPolygon.dart';
import '../../../../models/farm_computer_actions/response/get_farm_computer_action_detail_response.dart';

class ActionDetailDialog extends StatelessWidget {
  final ActionDetailResponse farmComputerActionDetailResponse;
  final bool mShowLatLngAddress;
  final String mLatLngAddress;
  final double latitude, longitude;

  const ActionDetailDialog({
    Key? key,
    required this.farmComputerActionDetailResponse,
    required this.mShowLatLngAddress,
    required this.mLatLngAddress,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.7,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: Responsive.isMobile(context) ? 0 : 22,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ///     Map visible on Mobile view /////////////////////////////////////////
                        Visibility(
                          visible: Responsive.isMobile(context) ? true : false,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Container(
                              // color: Colors.red,
                              height: 255,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: mShowLatLngAddress
                                  ? longitude == 0
                                      ? Container(
                                          height: 255,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 1,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "No Parcels data!".tr(),
                                              style: TextStyle(fontFamily: Montserrat_Medium),
                                            ),
                                          ),
                                        )
                                      : FlutterMap(
                                          // mapController: MapController(),
                                          options: MapOptions(
                                            boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(20.0)),
                                            interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                                            minZoom: 3.0,
                                            zoom: 9.2,
                                            center: latLng.LatLng(12.0, 22),
                                          ),
                                          children: [
                                            TileLayer(
                                              urlTemplate: "https://api.mapbox.com/styles/v1/mapbox/satellite-v9/tiles/"
                                                  "{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw",
                                              subdomains: ['0', '1', '2', '3'],
                                              retinaMode: true,
                                              maxZoom: 13,
                                            ),
                                            MarkerLayer(
                                              markers: [
                                                Marker(
                                                  point: latLng.LatLng(
                                                    latitude,
                                                    longitude,
                                                  ),
                                                  height: 80,
                                                  width: 80,
                                                  builder: (context) {
                                                    return Icon(
                                                      Icons.location_on_rounded,
                                                      color: Colors.red,
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                  : farmComputerActionDetailResponse.listOfParcelData == [] ||
                                          farmComputerActionDetailResponse.listOfParcelData == null
                                      ? SizedBox()
                                      : Builder(
                                          builder: (context) {
                                            print('Data : ${farmComputerActionDetailResponse.listOfParcelData}');
                                            if (farmComputerActionDetailResponse.listOfParcelData!.isEmpty) {
                                              return Container(
                                                height: 255,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "No Parcels data!".tr(),
                                                    style: TextStyle(fontFamily: Montserrat_Medium),
                                                  ),
                                                ),
                                              );
                                            } else {
                                              List<List<latLng.LatLng>>? listOfPolygon = [];
                                              List<String> labelList = [];
                                              List<int> indexList = [];
                                              for (var i in farmComputerActionDetailResponse.listOfParcelData!) {
                                                if (i.listOfLatLng.isNotEmpty) {
                                                  int index = farmComputerActionDetailResponse.listOfParcelData!.indexOf(i);
                                                  indexList.add(index);
                                                  labelList.add('${i.farmName}');
                                                  listOfPolygon.add(i.listOfLatLng);
                                                }
                                              }
                                              return MapWithPolygon(
                                                listOfPolygon: listOfPolygon,
                                                indexList: indexList,
                                                labelList: labelList,
                                                selectedParcel: '',
                                                showgreen: true,
                                                showCenter: true,
                                                outerPadding: 100,
                                              );
                                            }
                                          },
                                        ),
                            ),
                          ]),
                        ),
                        SizedBox(height: 20),
                        CustomText(text: "Location".tr(), size: Responsive.isMobile(context) ? 14 : 18, weight: FontWeight.w700),
                        SizedBox(height: 10),
                        Wrap(
                          spacing: 2,
                          runSpacing: 2,
                          children: [
                            CustomText(
                                text: mShowLatLngAddress ? mLatLngAddress : setLocation(farmComputerActionDetailResponse.parcels ?? []),
                                size: Responsive.isMobile(context) ? 10 : 14,
                                weight: FontWeight.w400,
                                lines: 20),
                          ],
                        ),
                        SizedBox(height: 20),
                        CustomText(text: "General Information".tr(), size: Responsive.isMobile(context) ? 14 : 18, weight: FontWeight.w700),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: CustomText(text: "Done by:".tr(), size: Responsive.isMobile(context) ? 10 : 14, weight: FontWeight.w400),
                            ),
                            Expanded(
                              flex: 2,
                              child: farmComputerActionDetailResponse.doneBy!.isEmpty
                                  ? CustomText(text: "-")
                                  : Wrap( spacing: 5,
                                      children: farmComputerActionDetailResponse.doneBy!.map((e) {
                                      return CustomText(
                                        text: e.name ?? "-",
                                        size: Responsive.isMobile(context) ? 10 : 14,
                                        weight: FontWeight.w400,
                                      );
                                    }).toList()),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: CustomText(text: "Done on date:".tr(), size: Responsive.isMobile(context) ? 10 : 14, weight: FontWeight.w400),
                            ),
                            Expanded(
                              flex: 2,
                              child: CustomText(
                                  text: farmComputerActionDetailResponse.doneOnDate ?? "-",
                                  size: Responsive.isMobile(context) ? 10 : 14,
                                  weight: FontWeight.w400),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: CustomText(text: "Done in season:".tr(), size: Responsive.isMobile(context) ? 10 : 14, weight: FontWeight.w400),
                            ),
                            Expanded(
                              flex: 2,
                              child: CustomText(
                                  text: farmComputerActionDetailResponse.doneInSession == null || farmComputerActionDetailResponse.doneInSession == []
                                      ? "-"
                                      : farmComputerActionDetailResponse.doneInSession![0],
                                  size: Responsive.isMobile(context) ? 10 : 14,
                                  weight: FontWeight.w400,
                                  overflows: TextOverflow.ellipsis),
                            )
                          ],
                        ),
                        SizedBox(height: 13),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child:
                                  CustomText(text: "Method description:".tr(), size: Responsive.isMobile(context) ? 10 : 14, weight: FontWeight.w400),
                            ),
                            Expanded(
                              flex: 2,
                              child: _HtmlTextWidget(
                                mText: farmComputerActionDetailResponse.methodDescription ?? "-",
                                textLine: 25,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: CustomText(text: "Comments:".tr(), size: Responsive.isMobile(context) ? 10 : 14, weight: FontWeight.w400),
                            ),
                            Expanded(
                              flex: 2,
                              child: _HtmlTextWidget(
                                mText: farmComputerActionDetailResponse.comment ?? "-",
                                textLine: 25,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        CustomText(text: "Additional Information".tr(), size: Responsive.isMobile(context) ? 14 : 18, weight: FontWeight.w700),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: CustomText(
                                  text: "Code as sent to lab:".tr(), size: Responsive.isMobile(context) ? 10 : 14, weight: FontWeight.w400),
                            ),
                            Expanded(
                              flex: 2,
                              child: _HtmlTextWidget(
                                mText: farmComputerActionDetailResponse.samplingCodeAsSentToLab ?? "-",
                                textLine: 5,
                              ),
                            ),
                            Visibility(
                              visible: Responsive.isDesktop(context) ? true : false,
                              child: Expanded(
                                flex: 2,
                                child: CustomText(text: "pH soil:".tr(), size: Responsive.isMobile(context) ? 10 : 14, weight: FontWeight.w400),
                              ),
                            ),
                            Visibility(
                              visible: Responsive.isDesktop(context) ? true : false,
                              child: Expanded(
                                flex: 2,
                                child: _HtmlTextWidget(

                                  mText: farmComputerActionDetailResponse.samplingConditionPhKcl ?? "-",
                                  textLine: 5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: !Responsive.isDesktop(context) ? true : false,
                              child: Expanded(
                                flex: 2,
                                child: CustomText(text: "pH soil:".tr(), size: Responsive.isMobile(context) ? 10 : 14, weight: FontWeight.w400),
                              ),
                            ),
                            Visibility(
                              visible: !Responsive.isDesktop(context) ? true : false,
                              child: Expanded(
                                flex: 2,
                                child: _HtmlTextWidget(
                                  mText: farmComputerActionDetailResponse.samplingConditionPhKcl ?? "-",
                                  textLine: 5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),

                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                            Expanded(
                              flex: 2,
                              child: CustomText(text: "Date sent:".tr(), size: Responsive.isMobile(context) ? 10 : 14, weight: FontWeight.w400),
                            ),
                            Expanded(
                              flex: 2,
                              child: _HtmlTextWidget(
                                mText: farmComputerActionDetailResponse.sendDate ?? "-",
                                textLine: 5,
                              ),
                            ),
                            // HtmlWidget(
                            //   farmComputerActionDetailResponse.methodDescription ?? "",
                            //   textStyle: GoogleFonts.montserrat(
                            //     fontSize: 14.0,
                            //     color: Colors.black,
                            //     fontWeight: FontWeight.w400,
                            //   ),
                            // ),
                            Visibility(
                              visible: Responsive.isDesktop(context) ? true : false,
                              child: Expanded(
                                flex: 2,
                                child: CustomText(
                                    text: "Soil Temperature (°C):".tr(), size: Responsive.isMobile(context) ? 10 : 14, weight: FontWeight.w400),
                              ),
                            ),
                            Visibility(
                              visible: Responsive.isDesktop(context) ? true : false,
                              child: Expanded(
                                flex: 2,
                                child: _HtmlTextWidget(
                                  mText: farmComputerActionDetailResponse.samplingConditionSoilTemperature ?? "-",
                                  textLine: 5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                            Visibility(
                              visible: !Responsive.isDesktop(context) ? true : false,
                              child: Expanded(
                                flex: 2,
                                child: CustomText(
                                    text: "Soil Temperature (°C):".tr(), size: Responsive.isMobile(context) ? 10 : 14, weight: FontWeight.w400),
                              ),
                            ),
                            Visibility(
                              visible: !Responsive.isDesktop(context) ? true : false,
                              child: Expanded(
                                flex: 2,
                                child: _HtmlTextWidget(
                                  mText: farmComputerActionDetailResponse.samplingConditionSoilTemperature ?? "-",
                                  textLine: 5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                            Expanded(
                              flex: Responsive.isMobile(context) ? 2 : 1,
                              child: CustomText(text: "Analysis file:".tr(), size: Responsive.isMobile(context) ? 10 : 14, weight: FontWeight.w400),
                            ),
                            Expanded(
                              flex: Responsive.isMobile(context) ? 2 : 3,
                              child: farmComputerActionDetailResponse
                                      .analysisResults!.isEmpty //== null || farmComputerActionDetailResponse.analysisResults == []
                                  ? CustomText(text: "-")
                                  : Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: InkWell(
                                        onTap: () {
                                          window.open(farmComputerActionDetailResponse.analysisResults![0].filePath!.path!, "pdf");
                                        },
                                        child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Icon(Icons.picture_as_pdf)
                                            // ClipRRect(
                                            //   borderRadius: BorderRadius.circular(12),
                                            //   child: Image.network(
                                            //     farmComputerActionDetailResponse.analysisResults![0].filePath!.path!,
                                            //     fit: BoxFit.cover,
                                            //     loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                            //       if (loadingProgress == null) {
                                            //         return child;
                                            //       }
                                            //       return SizedBox(
                                            //         child: Center(
                                            //           child: CircularProgressIndicator(
                                            //             value: loadingProgress.expectedTotalBytes != null
                                            //                 ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                            //                 : null,
                                            //             strokeWidth: 1,
                                            //           ),
                                            //         ),
                                            //       );
                                            //     },
                                            //   ),
                                            // ),
                                            ),
                                      ),
                                    ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Visibility(
                          visible: Responsive.isMobile(context) ? true : false,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Pictures".tr(),
                                size: Responsive.isMobile(context) ? 14 : 18,
                                weight: FontWeight.w700,
                              ),
                              SizedBox(height: 2),
                              Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                spacing: 4,
                                runSpacing: 5,
                                children: farmComputerActionDetailResponse.files == null || farmComputerActionDetailResponse.files == []
                                    ? []
                                    : farmComputerActionDetailResponse.files!
                                        .map(
                                          (e) => Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: SizedBox(
                                              height: 91,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      String urlpath = e.path!;
                                                      if (await canLaunchUrl(Uri.parse(urlpath))) {
                                                        await launch(e.path!);
                                                      }
                                                    },
                                                    child: Container(
                                                      height: 50,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(12),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(12),
                                                        child: Image.network(
                                                          e.path!,
                                                          fit: BoxFit.cover,
                                                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                            if (loadingProgress == null) {
                                                              return child;
                                                            }
                                                            return SizedBox(
                                                              child: Center(
                                                                child: CircularProgressIndicator(
                                                                  value: loadingProgress.expectedTotalBytes != null
                                                                      ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                                                      : null,
                                                                  strokeWidth: 1,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: !Responsive.isMobile(context) ? true : false,
                    child: Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // color: Colors.red,
                            height: 255,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: mShowLatLngAddress
                                ? longitude == 0
                                    ? Container(
                                        height: 255,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "No Parcels data!".tr(),
                                            style: TextStyle(fontFamily: Montserrat_Medium),
                                          ),
                                        ),
                                      )
                                    : FlutterMap(
                                        // mapController: MapController(),
                                        options: MapOptions(
                                          boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(20.0)),
                                          interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                                          minZoom: 3.0,
                                          zoom: 9.2,
                                          center: latLng.LatLng(12.0, 22),
                                        ),
                                        children: [
                                          TileLayer(
                                            urlTemplate: "https://api.mapbox.com/styles/v1/mapbox/satellite-v9/tiles/"
                                                "{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw",
                                            subdomains: ['0', '1', '2', '3'],
                                            retinaMode: true,
                                            maxZoom: 13,
                                          ),
                                          MarkerLayer(
                                            markers: [
                                              Marker(
                                                point: latLng.LatLng(
                                                  latitude,
                                                  longitude,
                                                ),
                                                height: 80,
                                                width: 80,
                                                builder: (context) {
                                                  return Icon(
                                                    Icons.location_on_rounded,
                                                    color: Colors.red,
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                : farmComputerActionDetailResponse.listOfParcelData == [] || farmComputerActionDetailResponse.listOfParcelData == null
                                    ? SizedBox()
                                    : Builder(
                                        builder: (context) {
                                          print('Data : ${farmComputerActionDetailResponse.listOfParcelData}');
                                          if (farmComputerActionDetailResponse.listOfParcelData!.isEmpty) {
                                            return Container(
                                              height: 255,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                border: Border.all(
                                                  color: Colors.grey,
                                                  width: 1,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "No Parcels data!".tr(),
                                                  style: TextStyle(fontFamily: Montserrat_Medium),
                                                ),
                                              ),
                                            );
                                          } else {
                                            List<List<latLng.LatLng>>? listOfPolygon = [];
                                            List<String> labelList = [];
                                            List<int> indexList = [];
                                            for (var i in farmComputerActionDetailResponse.listOfParcelData!) {
                                              if (i.listOfLatLng.isNotEmpty) {
                                                int index = farmComputerActionDetailResponse.listOfParcelData!.indexOf(i);
                                                indexList.add(index);
                                                labelList.add('${i.farmName}');
                                                listOfPolygon.add(i.listOfLatLng);
                                              }
                                            }
                                            return MapWithPolygon(
                                              listOfPolygon: listOfPolygon,
                                              indexList: indexList,
                                              labelList: labelList,
                                              selectedParcel: '',
                                              showgreen: true,
                                              showCenter: true,
                                              outerPadding: 100,
                                            );
                                          }
                                        },
                                      ),
                          ),
                          SizedBox(height: 39),
                          CustomText(
                            text: "Pictures".tr(),
                            size: Responsive.isMobile(context) ? 14 : 18,
                            weight: FontWeight.w700,
                          ),
                          SizedBox(height: 9),
                          Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 4,
                            runSpacing: 5,
                            children: farmComputerActionDetailResponse.files == null || farmComputerActionDetailResponse.files == []
                                ? []
                                : farmComputerActionDetailResponse.files!
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: SizedBox(
                                          height: 91,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  String urlpath = e.path!;
                                                  if (await canLaunchUrl(Uri.parse(urlpath))) {
                                                    await launch(e.path!);
                                                  }
                                                },
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(12),
                                                    child: Image.network(
                                                      e.path!,
                                                      fit: BoxFit.cover,
                                                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                        if (loadingProgress == null) {
                                                          return child;
                                                        }
                                                        return SizedBox(
                                                          child: Center(
                                                            child: CircularProgressIndicator(
                                                              value: loadingProgress.expectedTotalBytes != null
                                                                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                                                  : null,
                                                              strokeWidth: 1,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _HtmlTextWidget extends StatelessWidget {
  final String mText;
  final dynamic textLine;

  const _HtmlTextWidget({
    Key? key,
    required this.mText,
    this.textLine = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Html(
      data: mText,
      shrinkWrap: true,
      style: {
        "#": Style(padding: EdgeInsets.zero, margin: EdgeInsets.zero),
        "body": Style(
            fontWeight: FontWeight.normal,
            fontSize: Responsive.isDesktop(context)
                ? FontSize.medium
                : Responsive.isTablet(context)
                    ? FontSize.small
                    : FontSize.xSmall,
            textAlign: TextAlign.start,
            textOverflow: TextOverflow.ellipsis,
            maxLines: textLine,
            fontFamily: Montserrat_Medium,
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero),
        "span ": Style(
            fontWeight: FontWeight.normal,
            fontSize: Responsive.isDesktop(context)
                ? FontSize.medium
                : Responsive.isTablet(context)
                    ? FontSize.small
                    : FontSize.xSmall,
            textAlign: TextAlign.start,
            textOverflow: TextOverflow.ellipsis,
            maxLines: textLine,
            fontFamily: Montserrat_Medium,
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero),
      },
    );
  }
}

String setLocation(List<Parcels> list) {
  List<String> mNamesList = [];

  if (list.isNotEmpty) {
    for (var i = 0; i < list.length; i++) {
      mNamesList.add(list[i].parcelName ?? "");
    }
  }
  String locations = "";
  if (mNamesList.isNotEmpty) {
    locations = mNamesList.join(', ');
  }
  return locations;
}
