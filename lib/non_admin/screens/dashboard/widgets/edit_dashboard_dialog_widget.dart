import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/non_admin/models/main_dashboard/put_fc_basic_info.dart';
import 'package:wij_land/non_admin/providers/dashobard_provider/main_dashboard_provider.dart';
import 'package:wij_land/non_admin/screens/dashboard/widgets/search_municipality_widget.dart';
import 'package:wij_land/non_admin/screens/dashboard/widgets/search_waterboard_widget.dart';
import '../../../../app_common_widgets/common_text_form_field_widget.dart';
import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../app_common_widgets/text_widget.dart';
import '../../../../screens/office/widgets/add_text_button_widget.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/googleAutoCompleteSearch.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../../models/main_dashboard/get_fc_basic_info.dart';

class EditDashboardDialogWidget extends StatefulWidget {
  GetFCBasicInfo? basicInfo;

  EditDashboardDialogWidget({Key? key, this.basicInfo}) : super(key: key);

  @override
  State<EditDashboardDialogWidget> createState() => _EditDashboardDialogWidgetState();
}

class _EditDashboardDialogWidgetState extends State<EditDashboardDialogWidget> {
  DateTime fromDate = DateTime.now();
  var format = 'Select Date';
  PutFCBasicInfo? basic;

  @override
  void initState() {
    // TODO: implement initState
    var provider = Provider.of<MainFCDashboardProvider>(context, listen: false);
    setInitial(provider);
    provider.mMunicipalityController.addListener(() {
      if (provider.mMunicipalityController.text.isNotEmpty) {
        provider.searchMunicipality(value: provider.mFarmProvince.text);
        setState(() {
          provider.mMunicipalityWidget = true;
        });
      } else {
        setState(() {
          provider.mMunicipalityWidget = false;
        });
      }
    });
    provider.mWaterBoardController.addListener(() {
      if (provider.mWaterBoardController.text.isNotEmpty) {
        provider.searchWaterBoard(value: provider.mWaterBoardController.text);
        setState(() {
          provider.mWaterBoardWidget = true;
        });
      } else {
        setState(() {
          provider.mWaterBoardWidget = false;
        });
      }
    });
    super.initState();
  }

  void setInitial(_provider) async {
    _provider.mFarmAddress.text = widget.basicInfo!.data!.address ?? "";
    _provider.mWaterBoardController.text = widget.basicInfo!.data!.waterBody ?? "";
    _provider.mMunicipalityController.text = widget.basicInfo!.data!.municipality ?? "";
    _provider.mFarmProvince.text = widget.basicInfo!.data!.province ?? "";
    _provider.mFarmLng.text = widget.basicInfo!.data!.longitude != null ? widget.basicInfo!.data!.longitude.toString() : "";
    _provider.mFarmLat.text = widget.basicInfo!.data!.latitude != null ? widget.basicInfo!.data!.latitude.toString() : "";
    _provider.mBusinessType = widget.basicInfo!.data!.businessType![0] != "" ? widget.basicInfo!.data!.businessType![0] : "Select Business Type";
    widget.basicInfo!.data!.businessType![0] != "" ? _provider.businessTypeDropDown!.data?.insert(0, widget.basicInfo!.data!.businessType![0])
        : _provider.businessTypeDropDown!.data?.insert(0, 'Select Business Type');


    var response = widget.basicInfo!.data!.connectedToWijlandSince!.split('-');
    var newValue = "${response[2]}-${response[1]}-${response[0]}";
    _provider.mDateController.text = newValue;
    _provider.mFarmName.text = widget.basicInfo!.data!.farmName!;

    if (_provider.mFarmProvince.text.isNotEmpty) {
      await _provider.getMunicipalityDropDown(province: _provider.mFarmProvince.text.toLowerCase());
      await _provider.getWaterBoardDropDown(province: _provider.mFarmProvince.text.toLowerCase());

      setState(() {});
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainFCDashboardProvider>(builder: (context, _provider, child) {
      return /*_provider.isShowLoading? Center(
        child: CircularProgressIndicator(),
      ):*/
          SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: AlertDialog(
            title: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Edit Farm Details".tr(),
                        size: 24,
                        weight: FontWeight.bold,
                      ),
                      IconButton(
                        onPressed: () {
                          _provider.mFarmAddress.clear();
                          _provider.mWaterBoardController.clear();
                          _provider.mFarmProvince.clear();
                          _provider.mFarmLng.clear();
                          _provider.mFarmLat.clear();
                          _provider.mBusinessType = 'Select Business Type'.tr();
                          setState(() {});
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.close,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            content: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0, right: 24, top: 12, bottom: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flex(
                                direction: !Responsive.isDesktop(context) ? Axis.vertical : Axis.horizontal,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: !Responsive.isDesktop(context) ? MainAxisAlignment.start : MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          _provider.fileRes?.data!.path != null
                                              ? SizedBox(
                                                  width: 100,
                                                  height: 100,
                                                  child: Image.network(_provider.fileRes!.data!.path!),
                                                )
                                              : widget.basicInfo?.data?.farmPhoto != null
                                                  ? SizedBox(
                                                      width: 100,
                                                      height: 100,
                                                      child: Image.network(widget.basicInfo!.data!.farmPhoto!),
                                                    )
                                                  : SizedBox.shrink(),
                                          SizedBox(
                                            width: 4,
                                            height: 4,
                                          ),
                                          SizedBox(
                                            width: 100,
                                            height: 100,
                                            child: DottedBorder(
                                              borderType: BorderType.RRect,
                                              dashPattern: const [4, 4],
                                              radius: Radius.circular(4),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(Radius.circular(4)),
                                                child: Center(
                                                  child: IconButton(
                                                    onPressed: () async {
                                                      _provider.pickUserImage();
                                                    },
                                                    icon: FaIcon(
                                                      FontAwesomeIcons.plus,
                                                      color: Color(0xff3c4b64),
                                                      size: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                            height: 8,
                                          ),
                                          CustomText(
                                            text: 'Add farm image'.tr(),
                                            color: Colors.black,
                                            weight: FontWeight.w300,
                                            size: 12,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 70),
                                      CustomText(
                                        text: "Farm Name".tr(),
                                        size: 14,
                                        color: Colors.black,
                                        weight: FontWeight.w400,
                                      ),
                                      SizedBox(height: 8),
                                      SizedBox(
                                        width: Responsive.isDesktop(context) ? getWidth(context) * 0.25 : getWidth(context),
                                        child: TextWidgetField(
                                          controller: _provider.mFarmName,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CustomText(
                                        text: "Farm Business Type".tr(),
                                        size: 14,
                                        color: Colors.black,
                                        weight: FontWeight.w400,
                                      ),
                                      SizedBox(height: 8),
                                      SizedBox(
                                        width: Responsive.isDesktop(context) ? getWidth(context) * 0.25 : getWidth(context),
                                        child: RealDropDownWidget(
                                          value: _provider.mBusinessType,
                                          onChanged: (newValue) {
                                            setState(() {
                                              _provider.mBusinessType = newValue;
                                            });
                                          },
                                          items: _provider.businessTypeDropDown!.data!.map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: TextStyle(fontFamily: Montserrat_Medium),
                                                ));
                                          }).toList(),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      CustomText(
                                        text: "Connected to Wij.land Since".tr(),
                                        size: 14,
                                        color: Colors.black,
                                        weight: FontWeight.w400,
                                      ),
                                      SizedBox(height: 8),
                                      SizedBox(
                                        width: Responsive.isDesktop(context) ? getWidth(context) * 0.25 : getWidth(context),
                                        child: Stack(
                                          children: [
                                            TextWidgetField(
                                              controller: _provider.mDateController,
                                              enabled: false,
                                            ),
                                            Positioned(
                                                right: 5,
                                                top: 5,
                                                child: IconButton(
                                                    onPressed: () {
                                                      datePicker(context, _provider.mDateController);
                                                    },
                                                    icon: FaIcon(
                                                      FontAwesomeIcons.calendar,
                                                      color: Colors.black,
                                                      size: 16,
                                                    ))),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 24,
                                    height: 24,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: "Farm Address".tr(),
                                        size: 14,
                                        color: Colors.black,
                                        weight: FontWeight.w400,
                                      ),
                                      SizedBox(height: 8),
                                      SizedBox(
                                        width: !Responsive.isDesktop(context)
                                            ? getWidth(context)
                                            : Responsive.isDesktop(context)
                                                ? getWidth(context) * 0.25
                                                : getWidth(context),
                                        child: CommonTextFormFieldWidget(
                                          mTextEditingController: _provider.mFarmAddress,
                                          isObscureText: false,
                                          mIsEnabled: true,
                                          mOnTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return Dialog(
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                                                    child: Container(
                                                      height: 450,
                                                      width: 400,
                                                      color: Colors.white,
                                                      padding: EdgeInsets.all(10),
                                                      child: GoogleSearchWidget(
                                                        adddress: (String detail) async {
                                                          _provider.mFarmAddress.text = detail;
                                                        },
                                                        lat: (double lat) async {
                                                          setState(() {
                                                            _provider.mFarmLat.text = lat.toString();
                                                          });

                                                          String _host = 'https://maps.google.com/maps/api/geocode/json';
                                                          final url =
                                                              '$_host?key=AIzaSyBNPqaEb4zwyD5DjJ8RRZ6srgO8_k5wJx0&language=en&latlng=${_provider.mFarmLat.text},${_provider.mFarmLng.text}';
                                                          var response = await get(Uri.parse(url));
                                                          if (response.statusCode == 200) {
                                                            Map data = jsonDecode(response.body);
                                                            for (int i = 0; i < data["results"][0]["address_components"].length; i++) {
                                                              if (data["results"][0]["address_components"][i]["types"][0] ==
                                                                  ('administrative_area_level_1')) {
                                                                var _formattedAddress = data["results"][0]["address_components"][i]["long_name"];
                                                                _provider.mFarmProvince.text = _formattedAddress;
                                                                await _provider.getMunicipalityDropDown(
                                                                    province: _provider.mFarmProvince.text.toLowerCase());
                                                                await _provider.getWaterBoardDropDown(
                                                                    province: _provider.mFarmProvince.text.toLowerCase());

                                                                setState(() {});
                                                              }
                                                            }
                                                          }
                                                        },
                                                        lng: (double lng) {
                                                          setState(() {
                                                            _provider.mFarmLng.text = lng.toString();
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                          mPrefixIconWidget: Icon(
                                            Icons.search,
                                            size: 20,
                                            color: Color(0xff768192),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      SizedBox(
                                        width: Responsive.isDesktop(context) ? getWidth(context) * 0.25 : getWidth(context),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: CustomText(
                                                text: "Lat".tr(),
                                                size: 14,
                                                color: Colors.black,
                                                weight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Expanded(
                                              child: CustomText(
                                                text: "Long".tr(),
                                                size: 14,
                                                color: Colors.black,
                                                weight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      SizedBox(
                                        width: Responsive.isDesktop(context) ? getWidth(context) * 0.25 : getWidth(context),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: TextWidgetField(
                                              controller: _provider.mFarmLat,
                                              enabled: false,
                                              textPadding: EdgeInsets.only(left: 12),
                                            )),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Expanded(
                                                child: TextWidgetField(
                                              controller: _provider.mFarmLng,
                                              enabled: false,
                                              textPadding: EdgeInsets.only(left: 12),
                                            )),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      CustomText(
                                        text: "Province".tr(),
                                        size: 14,
                                        color: Colors.black,
                                        weight: FontWeight.w400,
                                      ),
                                      SizedBox(height: 8),
                                      SizedBox(
                                          width: Responsive.isDesktop(context) ? getWidth(context) * 0.25 : getWidth(context),
                                          child: TextWidgetField(
                                            controller: _provider.mFarmProvince,
                                            enabled: false,
                                          )),
                                      SizedBox(height: 20),
                                      CustomText(
                                        text: "Municipality".tr(),
                                        size: 14,
                                        color: Colors.black,
                                        weight: FontWeight.w400,
                                      ),
                                      SizedBox(height: 8),
                                      SizedBox(
                                        width: Responsive.isDesktop(context) ? getWidth(context) * 0.25 : getWidth(context),
                                        child: TextFormField(
                                          controller: _provider.mMunicipalityController,
                                          cursorColor: Colors.black,
                                          cursorWidth: 1,
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.done,
                                          decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color: Colors.black26,
                                                  width: 1,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                  color: Colors.black26,
                                                  width: 0.5,
                                                ),
                                              ),
                                              suffixIcon: Icon(Icons.search)),
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      _provider.municipalityDropDown?.error?.status == 204
                                          ? CustomText(
                                              text:
                                                  "You have chosen an address outside of the Netherlands,\n therefore you cannot select a municipality"
                                                      .tr(),
                                              size: 11,
                                              lines: 2,
                                              color: Colors.red,
                                              weight: FontWeight.normal,
                                            )
                                          : SizedBox.shrink(),
                                      SizedBox(height: 20),
                                      CustomText(
                                        text: "Waterboard".tr(),
                                        size: 14,
                                        color: Colors.black,
                                        weight: FontWeight.w400,
                                      ),
                                      SizedBox(height: 8),
                                      SizedBox(
                                        width: Responsive.isDesktop(context) ? getWidth(context) * 0.25 : getWidth(context),
                                        child: TextFormField(
                                          controller: _provider.mWaterBoardController,
                                          cursorColor: Colors.black,
                                          cursorWidth: 1,
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.done,
                                          decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color: Colors.black26,
                                                  width: 1,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                  color: Colors.black26,
                                                  width: 0.5,
                                                ),
                                              ),
                                              suffixIcon: Icon(Icons.search)),
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      _provider.waterBoardDropDown?.error?.status == 204
                                          ? CustomText(
                                              text:
                                                  "You have chosen an address outside of the Netherlands,\n therefore you cannot select a waterboard"
                                                      .tr(),
                                              size: 11,
                                              lines: 2,
                                              color: Colors.red,
                                              weight: FontWeight.normal,
                                            )
                                          : SizedBox.shrink(),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  _provider.mMunicipalityWidget
                      ? Padding(
                          padding: EdgeInsets.only(top: 360, left: Responsive.isDesktop(context) ? getWidth(context) * 0.311 : 20),
                          child: SearchMunicipalityWidget(),
                        )
                      : SizedBox(),
                  _provider.mWaterBoardWidget
                      ? Padding(
                          padding: EdgeInsets.only(top: 470, left: Responsive.isDesktop(context) ? getWidth(context) * 0.311 : 20),
                          child: SearchWaterBoardWidget(),
                        )
                      : SizedBox(),
                ],
              ),
            ),
            actions: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AddTextButtonWidget(
                      text: "Cancel".tr(),
                      colors: Colors.black12,
                      onPress: () {
                        _provider.mFarmAddress.clear();
                        _provider.mFarmName.clear();
                        _provider.mDateController.clear();
                        _provider.mWaterBoardController.clear();
                        _provider.mFarmProvince.clear();
                        _provider.mMunicipalityController.clear();
                        _provider.mFarmLat.clear();
                        _provider.mFarmLng.clear();
                        _provider.mBusinessType = 'Select Business Type'.tr();
                        setState(() {});
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    AddTextButtonWidget(
                      text: "Add".tr(),
                      colors: yellowishGreen,
                      onPress: () async {
                        String date = _provider.mDateController.text;
                        String newDate = '${date.split('-')[2]}-${date.split('-')[1]}-${date.split('-')[0]}';
                        print('before id top');

                        if (_provider.fileRes?.data?.id != null) {
                          basic = PutFCBasicInfo(
                            farmName: _provider.mFarmName.text,
                            farmPhotoId: _provider.fileRes!.data!.id.toString(),
                            activeInProjectsSince: newDate,
                            address: _provider.mFarmAddress.text,
                            latitude: _provider.mFarmLat.text,
                            longitude: _provider.mFarmLng.text,
                            municipality: _provider.mMunicipalityController.text,
                            province: _provider.mFarmProvince.text,
                            typeBusiness: [_provider.mBusinessType],
                            waterBody: _provider.mWaterBoardController.text,
                          );
                          print('new id ');
                        } else if (widget.basicInfo?.data?.farmPhotoId != null) {
                          basic = PutFCBasicInfo(
                            farmName: _provider.mFarmName.text,
                            farmPhotoId: widget.basicInfo!.data!.farmPhotoId!.toString(),
                            activeInProjectsSince: newDate,
                            address: _provider.mFarmAddress.text,
                            latitude: _provider.mFarmLat.text,
                            longitude: _provider.mFarmLng.text,
                            municipality: _provider.mMunicipalityController.text,
                            province: _provider.mFarmProvince.text,
                            typeBusiness: [_provider.mBusinessType],
                            waterBody: _provider.mWaterBoardController.text,
                          );
                          print('old id ');
                        } else {
                          basic = PutFCBasicInfo(
                            farmName: _provider.mFarmName.text,
                            farmPhotoId: "",
                            activeInProjectsSince: newDate,
                            address: _provider.mFarmAddress.text,
                            latitude: _provider.mFarmLat.text,
                            longitude: _provider.mFarmLng.text,
                            municipality: _provider.mMunicipalityController.text,
                            province: _provider.mFarmProvince.text,
                            typeBusiness: [_provider.mBusinessType],
                            waterBody: _provider.mWaterBoardController.text,
                          );

                          print('no id ');
                        }

                        await _provider.putBasicInfo(info: basic!);
                        if (_provider.responseValue == true) {
                          Navigator.of(context).pop();
                          await _provider.getBasicInfo();
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Future<void> datePicker(BuildContext context, _controller) async {
    final DateTime? picked = await showDatePicker(context: context, initialDate: fromDate, firstDate: DateTime(2021), lastDate: DateTime(2201));
    if (picked != null && picked != fromDate) {
      setState(() {
        var dateString = picked;
        format = Jiffy(dateString).format("dd-MM-yyyy");
        _controller.text = format;
      });
    }
  }
}
