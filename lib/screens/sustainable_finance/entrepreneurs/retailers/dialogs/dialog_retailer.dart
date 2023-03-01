import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/retailers/dialogs/opening_time_info.dart';
import 'package:wij_land/utils/styles.dart';
import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../app_common_widgets/text_widget.dart';
import '../../../../../models/entrepreneur/request/add_entrepreneur_retailer.dart';
import '../../../../../providers/entrepreneur/entrepreneur_retailer_provider.dart';
import '../../../../../utils/functions.dart';
import '../../../../../utils/googleAutoCompleteSearch.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/responsive.dart';
import '../../../../office/widgets/add_text_button_widget.dart';

class RetailerDialog extends StatefulWidget {
  final int? entrepreneurId;
  final AddEntrepreneurRetailer? entrepreneurRetailer;
  final bool? isAddEntrepreneurRetailer;
  final int? retailerEntrepreneurId;

  const RetailerDialog({
    Key? key,
    this.entrepreneurId,
    this.entrepreneurRetailer,
    this.isAddEntrepreneurRetailer = true,
    this.retailerEntrepreneurId,
  }) : super(key: key);

  @override
  State<RetailerDialog> createState() => _RetailerDialogState();
}

class _RetailerDialogState extends State<RetailerDialog> {
  final TextEditingController fName = TextEditingController(),
      retailername = TextEditingController(),
      website = TextEditingController(),
      address = TextEditingController();
  String phoneNumber = '';
  String rName = '';

  @override
  void dispose() {
    super.dispose();
    retailername.dispose();
    website.dispose();
    address.dispose();
  }

  String? lati, longi;
  List<TimeOfDay> _timeBegin = [];
  List<TimeOfDay> _timeEnd = [];
  List<String> _timeStart = [];
  List<String> _timeFinish = [];

  void _selectBeginTime(int i) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _timeBegin[i],
    );
    if (newTime != null) {
      setState(() {
        _timeStart[i] = newTime.format(context);
      });
    }
  }

  void _selectEndTime(int i) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _timeEnd[i],
    );
    if (newTime != null) {
      setState(() {
        _timeFinish[i] = newTime.format(context);
      });
    }
  }

  @override
  void initState() {
    // To assign saved values of our model class to our controllers when click on update
    retailername.text = widget.entrepreneurRetailer!.retailerName!;
    address.text = widget.entrepreneurRetailer!.address!;
    website.text = widget.entrepreneurRetailer!.website!;
    phoneNumber = widget.entrepreneurRetailer!.phoneNumber!.isEmpty ||
            widget.entrepreneurRetailer!.phoneNumber!.length < 3
        ? ''
        : widget.entrepreneurRetailer!.phoneNumber!
            .substring(3, widget.entrepreneurRetailer!.phoneNumber!.length);

    if (widget.isAddEntrepreneurRetailer!) {
      for (int i = 0; i < 7; i++) {
        _timeBegin.add(TimeOfDay(hour: 09, minute: 00));
        _timeEnd.add(TimeOfDay(hour: 09, minute: 00));
      }
      _timeStart = List.filled(7, '');
      _timeFinish = List.filled(7, '');
    } else {
      _timeStart = List.filled(7, '');
      _timeFinish = List.filled(7, '');
      _timeBegin.add(TimeOfDay(
          hour: widget.entrepreneurRetailer!.openingHours!.mondayOpen!
                  .contains("PM")
              ? int.parse(widget.entrepreneurRetailer!.openingHours!.mondayOpen!
                      .split(' ')[0]
                      .split(':')[0]) +
                  12
              : widget.entrepreneurRetailer!.openingHours!.mondayOpen!
                          .split(' ')[0]
                          .split(':')[0] ==
                      "12"
                  ? int.parse(widget.entrepreneurRetailer!.openingHours!.mondayOpen!
                          .split(' ')[0]
                          .split(':')[0]) -
                      12
                  : int.parse(widget.entrepreneurRetailer!.openingHours!.mondayOpen!
                      .split(' ')[0]
                      .split(':')[0]),
          minute: int.parse(widget.entrepreneurRetailer!.openingHours!.mondayOpen!.split(' ')[0].split(':')[1])));
      _timeEnd.add(TimeOfDay(
          hour: widget.entrepreneurRetailer!.openingHours!.mondayClose!
                  .contains("PM")
              ? int.parse(widget.entrepreneurRetailer!.openingHours!.mondayClose!.split(' ')[0].split(':')[0]) +
                  12
              : widget.entrepreneurRetailer!.openingHours!.mondayClose!
                          .split(' ')[0]
                          .split(':')[0] ==
                      "12"
                  ? int.parse(widget.entrepreneurRetailer!.openingHours!.mondayClose!
                          .split(' ')[0]
                          .split(':')[0]) -
                      12
                  : int.parse(widget
                      .entrepreneurRetailer!.openingHours!.mondayClose!
                      .split(' ')[0]
                      .split(':')[0]),
          minute: int.parse(
              widget.entrepreneurRetailer!.openingHours!.mondayClose!.split(' ')[0].split(':')[1])));

      _timeBegin.add(TimeOfDay(
          hour: widget.entrepreneurRetailer!.openingHours!.tuesdayOpen!
                  .contains("PM")
              ? int.parse(widget.entrepreneurRetailer!.openingHours!.tuesdayOpen!.split(' ')[0].split(':')[0]) +
                  12
              : widget.entrepreneurRetailer!.openingHours!.tuesdayOpen!
                          .split(' ')[0]
                          .split(':')[0] ==
                      "12"
                  ? int.parse(widget.entrepreneurRetailer!.openingHours!.tuesdayOpen!
                          .split(' ')[0]
                          .split(':')[0]) -
                      12
                  : int.parse(widget
                      .entrepreneurRetailer!.openingHours!.tuesdayOpen!
                      .split(' ')[0]
                      .split(':')[0]),
          minute: int.parse(
              widget.entrepreneurRetailer!.openingHours!.tuesdayOpen!.split(' ')[0].split(':')[1])));
      _timeEnd.add(TimeOfDay(
          hour: widget.entrepreneurRetailer!.openingHours!.tuesdayClose!
                  .contains("PM")
              ? int.parse(widget.entrepreneurRetailer!.openingHours!.tuesdayClose!.split(' ')[0].split(':')[0]) +
                  12
              : widget.entrepreneurRetailer!.openingHours!.tuesdayClose!
                          .split(' ')[0]
                          .split(':')[0] ==
                      "12"
                  ? int.parse(widget.entrepreneurRetailer!.openingHours!.tuesdayClose!
                          .split(' ')[0]
                          .split(':')[0]) -
                      12
                  : int.parse(widget
                      .entrepreneurRetailer!.openingHours!.tuesdayClose!
                      .split(' ')[0]
                      .split(':')[0]),
          minute: int.parse(
              widget.entrepreneurRetailer!.openingHours!.tuesdayClose!.split(' ')[0].split(':')[1])));

      _timeBegin.add(TimeOfDay(
          hour: widget.entrepreneurRetailer!.openingHours!.wednesdayOpen!
                  .contains("PM")
              ? int.parse(widget.entrepreneurRetailer!.openingHours!.wednesdayOpen!.split(' ')[0].split(':')[0]) +
                  12
              : widget.entrepreneurRetailer!.openingHours!.wednesdayOpen!
                          .split(' ')[0]
                          .split(':')[0] ==
                      "12"
                  ? int.parse(widget
                          .entrepreneurRetailer!.openingHours!.wednesdayOpen!
                          .split(' ')[0]
                          .split(':')[0]) -
                      12
                  : int.parse(widget
                      .entrepreneurRetailer!.openingHours!.wednesdayOpen!
                      .split(' ')[0]
                      .split(':')[0]),
          minute:
              int.parse(widget.entrepreneurRetailer!.openingHours!.wednesdayOpen!.split(' ')[0].split(':')[1])));
      _timeEnd.add(TimeOfDay(
          hour: widget.entrepreneurRetailer!.openingHours!.wednesdayClose!
                  .contains("PM")
              ? int.parse(widget.entrepreneurRetailer!.openingHours!.wednesdayClose!.split(' ')[0].split(':')[0]) +
                  12
              : widget.entrepreneurRetailer!.openingHours!.wednesdayClose!
                          .split(' ')[0]
                          .split(':')[0] ==
                      "12"
                  ? int.parse(widget.entrepreneurRetailer!.openingHours!.wednesdayClose!
                          .split(' ')[0]
                          .split(':')[0]) -
                      12
                  : int.parse(widget
                      .entrepreneurRetailer!.openingHours!.wednesdayClose!
                      .split(' ')[0]
                      .split(':')[0]),
          minute: int.parse(
              widget.entrepreneurRetailer!.openingHours!.wednesdayClose!.split(' ')[0].split(':')[1])));

      _timeBegin.add(TimeOfDay(
          hour: widget.entrepreneurRetailer!.openingHours!.thursdayOpen!
                  .contains("PM")
              ? int.parse(widget.entrepreneurRetailer!.openingHours!.thursdayOpen!.split(' ')[0].split(':')[0]) +
                  12
              : widget.entrepreneurRetailer!.openingHours!.thursdayOpen!
                          .split(' ')[0]
                          .split(':')[0] ==
                      "12"
                  ? int.parse(widget.entrepreneurRetailer!.openingHours!.thursdayOpen!
                          .split(' ')[0]
                          .split(':')[0]) -
                      12
                  : int.parse(widget
                      .entrepreneurRetailer!.openingHours!.thursdayOpen!
                      .split(' ')[0]
                      .split(':')[0]),
          minute: int.parse(
              widget.entrepreneurRetailer!.openingHours!.thursdayOpen!.split(' ')[0].split(':')[1])));
      _timeEnd.add(TimeOfDay(
          hour: widget.entrepreneurRetailer!.openingHours!.thursdayClose!
                  .contains("PM")
              ? int.parse(widget.entrepreneurRetailer!.openingHours!.thursdayClose!.split(' ')[0].split(':')[0]) +
                  12
              : widget.entrepreneurRetailer!.openingHours!.thursdayClose!
                          .split(' ')[0]
                          .split(':')[0] ==
                      "12"
                  ? int.parse(widget
                          .entrepreneurRetailer!.openingHours!.thursdayClose!
                          .split(' ')[0]
                          .split(':')[0]) -
                      12
                  : int.parse(widget
                      .entrepreneurRetailer!.openingHours!.thursdayClose!
                      .split(' ')[0]
                      .split(':')[0]),
          minute:
              int.parse(widget.entrepreneurRetailer!.openingHours!.thursdayClose!.split(' ')[0].split(':')[1])));

      _timeBegin.add(TimeOfDay(
          hour: widget.entrepreneurRetailer!.openingHours!.fridayOpen!
                  .contains("PM")
              ? int.parse(widget.entrepreneurRetailer!.openingHours!.fridayOpen!
                      .split(' ')[0]
                      .split(':')[0]) +
                  12
              : widget.entrepreneurRetailer!.openingHours!.fridayOpen!
                          .split(' ')[0]
                          .split(':')[0] ==
                      "12"
                  ? int.parse(widget.entrepreneurRetailer!.openingHours!.fridayOpen!
                          .split(' ')[0]
                          .split(':')[0]) -
                      12
                  : int.parse(widget.entrepreneurRetailer!.openingHours!.fridayOpen!
                      .split(' ')[0]
                      .split(':')[0]),
          minute: int.parse(widget.entrepreneurRetailer!.openingHours!.fridayOpen!.split(' ')[0].split(':')[1])));
      _timeEnd.add(TimeOfDay(
          hour: widget.entrepreneurRetailer!.openingHours!.fridayClose!
                  .contains("PM")
              ? int.parse(widget.entrepreneurRetailer!.openingHours!.fridayClose!.split(' ')[0].split(':')[0]) +
                  12
              : widget.entrepreneurRetailer!.openingHours!.fridayClose!
                          .split(' ')[0]
                          .split(':')[0] ==
                      "12"
                  ? int.parse(widget.entrepreneurRetailer!.openingHours!.fridayClose!
                          .split(' ')[0]
                          .split(':')[0]) -
                      12
                  : int.parse(widget
                      .entrepreneurRetailer!.openingHours!.fridayClose!
                      .split(' ')[0]
                      .split(':')[0]),
          minute: int.parse(
              widget.entrepreneurRetailer!.openingHours!.fridayClose!.split(' ')[0].split(':')[1])));

      _timeBegin.add(TimeOfDay(
          hour: widget.entrepreneurRetailer!.openingHours!.saturdayOpen!
                  .contains("PM")
              ? int.parse(widget.entrepreneurRetailer!.openingHours!.saturdayOpen!.split(' ')[0].split(':')[0]) +
                  12
              : widget.entrepreneurRetailer!.openingHours!.saturdayOpen!
                          .split(' ')[0]
                          .split(':')[0] ==
                      "12"
                  ? int.parse(widget.entrepreneurRetailer!.openingHours!.saturdayOpen!
                          .split(' ')[0]
                          .split(':')[0]) -
                      12
                  : int.parse(widget
                      .entrepreneurRetailer!.openingHours!.saturdayOpen!
                      .split(' ')[0]
                      .split(':')[0]),
          minute: int.parse(
              widget.entrepreneurRetailer!.openingHours!.saturdayOpen!.split(' ')[0].split(':')[1])));
      _timeEnd.add(TimeOfDay(
          hour: widget.entrepreneurRetailer!.openingHours!.saturdayClose!
                  .contains("PM")
              ? int.parse(widget.entrepreneurRetailer!.openingHours!.saturdayClose!.split(' ')[0].split(':')[0]) +
                  12
              : widget.entrepreneurRetailer!.openingHours!.saturdayClose!
                          .split(' ')[0]
                          .split(':')[0] ==
                      "12"
                  ? int.parse(widget
                          .entrepreneurRetailer!.openingHours!.saturdayClose!
                          .split(' ')[0]
                          .split(':')[0]) -
                      12
                  : int.parse(widget
                      .entrepreneurRetailer!.openingHours!.saturdayClose!
                      .split(' ')[0]
                      .split(':')[0]),
          minute:
              int.parse(widget.entrepreneurRetailer!.openingHours!.saturdayClose!.split(' ')[0].split(':')[1])));

      _timeBegin.add(TimeOfDay(
          hour: widget.entrepreneurRetailer!.openingHours!.sundayOpen!
                  .contains("PM")
              ? int.parse(widget.entrepreneurRetailer!.openingHours!.sundayOpen!
                      .split(' ')[0]
                      .split(':')[0]) +
                  12
              : widget.entrepreneurRetailer!.openingHours!.sundayOpen!
                          .split(' ')[0]
                          .split(':')[0] ==
                      "12"
                  ? int.parse(widget.entrepreneurRetailer!.openingHours!.sundayOpen!
                          .split(' ')[0]
                          .split(':')[0]) -
                      12
                  : int.parse(widget.entrepreneurRetailer!.openingHours!.sundayOpen!
                      .split(' ')[0]
                      .split(':')[0]),
          minute: int.parse(widget.entrepreneurRetailer!.openingHours!.sundayOpen!.split(' ')[0].split(':')[1])));
      _timeEnd.add(TimeOfDay(
          hour: widget.entrepreneurRetailer!.openingHours!.sundayClose!
                  .contains("PM")
              ? int.parse(widget.entrepreneurRetailer!.openingHours!.sundayClose!.split(' ')[0].split(':')[0]) +
                  12
              : widget.entrepreneurRetailer!.openingHours!.sundayClose!
                          .split(' ')[0]
                          .split(':')[0] ==
                      "12"
                  ? int.parse(widget.entrepreneurRetailer!.openingHours!.sundayClose!
                          .split(' ')[0]
                          .split(':')[0]) -
                      12
                  : int.parse(widget
                      .entrepreneurRetailer!.openingHours!.sundayClose!
                      .split(' ')[0]
                      .split(':')[0]),
          minute: int.parse(
              widget.entrepreneurRetailer!.openingHours!.sundayClose!.split(' ')[0].split(':')[1])));
    }
    super.initState();
  }

  bool loading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (int i = 0; i < 7; i++) {
      _timeStart[i] = _timeBegin[i].format(context);
      _timeFinish[i] = _timeEnd[i].format(context);
    }
  }

  int selected_tab = 0;
  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EntrepreneurRetailerProvider>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: getHeight(context),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: AlertDialog(
              title: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomText(
                            text: "Add Retailer".tr(),
                            size: 20,
                            weight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              content: Container(
                width: MediaQuery.of(context).size.width * 0.35,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: !Responsive.isDesktop(context)
                          ? EdgeInsets.symmetric(vertical: 10)
                          : EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              selected_tab = 0;
                              setState(() {});
                            },
                            child: WebShopContainer(
                              icons: IconImages.homeIcon,
                              text: "Physical Store ".tr(),
                              active: selected_tab == 0 ? true : false,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // showDialog(
                              //     context: context,
                              //     builder: (BuildContext context) {
                              //       return WebShopRetailerDialog();
                              //     });
                              selected_tab = 1;
                              setState(() {});
                            },
                            child: WebShopContainer(
                              icons: IconImages.earthIcon,
                              text: "Webshop".tr(),
                              active: selected_tab == 1 ? true : false,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              selected_tab = 2;
                              setState(() {});
                            },
                            child: WebShopContainer(
                              icons: IconImages.buyIcon,
                              text: "Store & Webshop".tr(),
                              active: selected_tab == 2 ? true : false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomText(
                      text: "Retailer Name".tr(),
                      size: 13,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextWidgetField(
                      controller: retailername,
                      enabled: true,
                      onChange: (value) {
                        rName = value;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    isEmpty && retailername.text.isEmpty
                        ? CustomText(
                            text: "Name can't be empty".tr(),
                            size: 11,
                            color: Colors.red,
                          )
                        : SizedBox.shrink(),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomText(
                      text: "Address".tr(),
                      size: 13,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                child: Container(
                                  height: 450,
                                  width: 400,
                                  padding: EdgeInsets.all(10),
                                  child: GoogleSearchWidget(
                                    adddress: (String detail) {
                                      setState(() {
                                        address.text = detail;
                                      });
                                    },
                                    lat: (double lat) {
                                      setState(() {
                                        lati = lat.toString();
                                      });
                                    },
                                    lng: (double lng) {
                                      setState(() {
                                        longi = lng.toString();
                                      });
                                    },
                                  ),
                                ),
                              );
                            });
                      },
                      child: TextWidgetField(
                        controller: address,
                        enabled: false,
                        suffixIcon: const Icon(Icons.search),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                     CustomText(
                      text: "Website".tr(),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {},
                      child: TextWidgetField(
                        controller: website,
                        enabled: true,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Visibility(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             CustomText(text: "Phone number".tr()),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 70,
                              child: IntlPhoneField(
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.start,
                                initialValue: phoneNumber,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  // contentPadding: EdgeInsets.only(top: 15),
                                  labelText: 'Phone Number'.tr(),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                initialCountryCode: 'PK',
                                onCountryChanged: (value) {
                                  setState(() {
                                    phoneNumber = '';
                                  });
                                },
                                onChanged: (phone) {
                                  setState(() {
                                    phoneNumber = phone.completeNumber;
                                  });
                                  print(phoneNumber);
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: !Responsive.isDesktop(context)
                                  ? getWidth(context)
                                  : getWidth(context) / 2,
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: CustomText(
                                          text: "Opening Hours".tr(),
                                          size: 16,
                                          weight: FontWeight.bold,
                                        ),
                                      ),
                                      Expanded(
                                          child: CustomText(
                                        text: "Open".tr(),
                                        textAligns: TextAlign.center,
                                      )),
                                      SizedBox(
                                        width: !Responsive.isDesktop(context)
                                            ? 10
                                            : 20,
                                      ),
                                      Expanded(
                                          child: CustomText(
                                              text: "Close".tr(),
                                              textAligns: TextAlign.center)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            OpeningTimeInfo(
                              dayText: "Monday".tr(),
                              onTapStart: () {
                                _selectBeginTime(0);
                              },
                              textStart: " ${_timeStart[0]}",
                              onTapEnd: () {
                                _selectEndTime(0);
                              },
                              textEnd: " ${_timeFinish[0]}",
                            ),
                            SizedBox(height: 10),
                            OpeningTimeInfo(
                              dayText: "Tuesday",
                              onTapStart: () {
                                _selectBeginTime(1);
                              },
                              textStart: " ${_timeStart[1]}",
                              onTapEnd: () {
                                _selectEndTime(1);
                              },
                              textEnd: " ${_timeFinish[1]}",
                            ),
                            SizedBox(height: 10),
                            OpeningTimeInfo(
                              dayText: "Wednesday".tr(),
                              onTapStart: () {
                                _selectBeginTime(2);
                              },
                              textStart: " ${_timeStart[2]}",
                              onTapEnd: () {
                                _selectEndTime(2);
                              },
                              textEnd: " ${_timeFinish[2]}",
                            ),
                            SizedBox(height: 10),
                            OpeningTimeInfo(
                              dayText: "Thursday".tr(),
                              onTapStart: () {
                                _selectBeginTime(3);
                              },
                              textStart: " ${_timeStart[3]}",
                              onTapEnd: () {
                                _selectEndTime(3);
                              },
                              textEnd: " ${_timeFinish[3]}",
                            ),
                            SizedBox(height: 10),
                            OpeningTimeInfo(
                              dayText: "Friday",
                              onTapStart: () {
                                _selectBeginTime(4);
                              },
                              textStart: " ${_timeStart[4]}",
                              onTapEnd: () {
                                _selectEndTime(4);
                              },
                              textEnd: " ${_timeFinish[4]}",
                            ),
                            SizedBox(height: 10),
                            OpeningTimeInfo(
                              dayText: "Saturday",
                              onTapStart: () {
                                _selectBeginTime(5);
                              },
                              textStart: " ${_timeStart[5]}",
                              onTapEnd: () {
                                _selectEndTime(5);
                              },
                              textEnd: " ${_timeFinish[5]}",
                            ),
                            SizedBox(height: 10),
                            OpeningTimeInfo(
                              dayText: "Sunday",
                              onTapStart: () {
                                _selectBeginTime(6);
                              },
                              textStart: " ${_timeStart[6]}",
                              onTapEnd: () {
                                _selectEndTime(6);
                              },
                              textEnd: " ${_timeFinish[6]}",
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                        visible: selected_tab == 1 ? false : true),
                  ],
                ),
              ),
              actions: [
                Container(
                  padding: const EdgeInsets.only(bottom: 40, right: 40),
                  child: AddTextButtonWidget(
                      text: widget.isAddEntrepreneurRetailer!
                          ? "Add Retailer"
                         .tr() : 'Update Retailer'.tr(),
                      colors: yellowishGreen,
                      onPress: retailername.text.isEmpty
                          ? () {
                              // showSnack( 'Retailer name is required');
                              isEmpty = true;
                              setState(() {});
                            }
                          : () async {
                              if (widget.isAddEntrepreneurRetailer!) {
                                Map<String, dynamic> object = {
                                  "address": address.text,
                                  "opening_hours": {
                                    "friday_close": _timeFinish[4],
                                    "friday_open": _timeStart[4],
                                    "monday_close": _timeFinish[0],
                                    "monday_open": _timeStart[0],
                                    "saturday_close": _timeFinish[5],
                                    "saturday_open": _timeStart[5],
                                    "sunday_close": _timeFinish[6],
                                    "sunday_open": _timeStart[6],
                                    "thursday_close": _timeFinish[3],
                                    "thursday_open": _timeStart[3],
                                    "tuesday_close": _timeFinish[1],
                                    "tuesday_open": _timeStart[1],
                                    "wednesday_close": _timeFinish[2],
                                    "wednesday_open": _timeStart[2]
                                  },
                                  "phone_number": phoneNumber,
                                  "retailer_name": retailername.text,
                                  "latitude": lati,
                                  "longitude": longi,
                                  "shop": selected_tab == 0
                                      ? "Physical location"
                                      : selected_tab == 1
                                          ? 'Online location'
                                          : 'Hybrid location',
                                  "website": website.text
                                };

                                setState(() {
                                  loading = true;
                                });
                                await provider.postEntrepreneurRetailerData(
                                    entrepreneurId: widget.entrepreneurId,
                                    requestBody: object);
                              } else {
                                Map<String, dynamic> object = {
                                  "address": address.text,
                                  "opening_hours": {
                                    "friday_close": _timeFinish[4],
                                    "friday_open": _timeStart[4],
                                    "monday_close": _timeFinish[0],
                                    "monday_open": _timeStart[0],
                                    "saturday_close": _timeFinish[5],
                                    "saturday_open": _timeStart[5],
                                    "sunday_close": _timeFinish[6],
                                    "sunday_open": _timeStart[6],
                                    "thursday_close": _timeFinish[3],
                                    "thursday_open": _timeStart[3],
                                    "tuesday_close": _timeFinish[1],
                                    "tuesday_open": _timeStart[1],
                                    "wednesday_close": _timeFinish[2],
                                    "wednesday_open": _timeStart[2]
                                  },
                                  "phone_number": phoneNumber,
                                  "latitude": lati,
                                  "longitude": longi,
                                  "retailer_name": retailername.text,
                                  "shop": selected_tab == 0
                                      ? "Physical location"
                                      : selected_tab == 1
                                          ? 'Online location'
                                          : 'Hybrid location',
                                  "website": website.text
                                };
                                setState(() {
                                  loading = true;
                                });

                                await provider.updateEntrepreneurRetailerData(
                                    entrepreneurId: widget.entrepreneurId,
                                    retailEntrepreneurID:
                                        widget.retailerEntrepreneurId,
                                    requestBody: object);
                              }

                              Navigator.of(context).pop();
                            }),
                ),
              ],
            ),
          ),
          Visibility(
            child: Container(
              height: getHeight(context),
              width: getWidth(context),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
              child: Center(child: CircularProgressIndicator()),
            ),
            visible: loading,
          )
        ],
      ),
    );
  }
}

class WebShopContainer extends StatelessWidget {
  final icons;
  final String text;
  final bool active;

  const WebShopContainer({
    Key? key,
    required this.icons,
    required this.text,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: !Responsive.isDesktop(context)
          ? EdgeInsets.all(5)
          : EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: !Responsive.isDesktop(context)
                ? EdgeInsets.all(10)
                : EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black26)),
            child: Image.asset(
              icons,
              height: !Responsive.isDesktop(context) ? 25 : 35,
              width: !Responsive.isDesktop(context) ? 25 : 35,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(text: text)
        ],
      ),
      decoration: BoxDecoration(
          color: !active ? Colors.transparent : Colors.black.withOpacity(0.070),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
