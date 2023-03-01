import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/api_clients/entrepreneur_client.dart';
import 'package:wij_land/app_common_widgets/on_hover.dart';
import 'package:wij_land/providers/entrepreneur/entrepreneur_screen_overview_provider.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/retailers/dialogs/dialog_retailer.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/retailers/dialogs/search_retailer_dialog.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/retailers/retailer_info.dart';
import 'package:wij_land/utils/googleAutoCompleteSearch.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../utils/functions.dart';
import '../../../../../utils/responsive.dart';
import '../../../../app_common_widgets/animated_search.dart';
import '../../../../app_common_widgets/icon_text_container.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../models/entrepreneur/request/add_entrepreneur_retailer.dart';
import '../../../../providers/entrepreneur/entrepreneur_retailer_provider.dart';
import '../../../../utils/ShimmerEffect.dart';
import '../../../../utils/styles.dart';
import '../../../office/office_programes/Widgets/on_hover_button_widget.dart';
import '../../../office/widgets/add_text_button_widget.dart';

EntrepreneurRetailerProvider? retailerProvider;

class RetailerScreen extends StatefulWidget {
  final int? id;

  const RetailerScreen({Key? key, this.id}) : super(key: key);

  @override
  State<RetailerScreen> createState() => _RetailerScreenState();
}

class _RetailerScreenState extends State<RetailerScreen> {
  bool isFilter = false,
      isPhysical = false,
      isWebShop = false,
      isOnlineStore = false,
      allValue = false,
      singleId = false;
  String? textValue;
  List multipleIndex = [];
  late int retailerId;
  late int id;
  String? mAddress,
      mRetailer,
      mPhone,
      mShop,
      mWebsite,
      mFriClose,
      mFriOpen,
      mSatClose,
      mSatOpen,
      mSunClose,
      mSunOpen,
      mMonClose,
      mMonOpen,
      mTueClose,
      mTueOpen,
      mWedClose,
      mWedOpen,
      mThuClose,
      mThuOpen;

  @override
  void initState() {
    callFirstMethod();
    super.initState();
  }

  bool loading = true;

  callFirstMethod() async {
    var provider =
        Provider.of<EntrepreneurRetailerProvider>(context, listen: false);
    mapDisable();
    await Provider.of<EntrepreneurRetailerProvider>(context, listen: false)
        .getEntrepreneurRetailerData(entrepreneurId: widget.id!);
    provider.allCheckedBoxId = [];
    loading = false;
    setState(() {});
  }

  mapDisable() async {
    Provider.of<EntrepreneurOverviewScreenProvider>(context, listen: false)
        .mapOpened = false;

    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var provider =
        Provider.of<EntrepreneurRetailerProvider>(context, listen: false);
    setState(() {
      allValue = false;
      provider.allCheckedBoxId = [];
    });
  }

  @override
  void dispose() {
    Provider.of<EntrepreneurRetailerProvider>(context, listen: false)
        .clearRecord();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurRetailerProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Container(
          margin: EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Card(
              child: Container(
                padding: EdgeInsets.only(
                    right:
                        Provider.of<EntrepreneurOverviewScreenProvider>(context)
                                .mapOpened
                            ? getWidth(context) * 0.470
                            : 0),
                child: Column(
                  children: [
                    SizedBox(
                      width: getWidth(context),
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 20),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 40,
                                  color: newRed,
                                ),
                                CustomText(
                                  text: "Retailer".tr(),
                                  color: darkGreen,
                                  size: 24,
                                  weight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                          !Responsive.isDesktop(context)
                              ? SizedBox(
                                  width: getWidth(context),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Wrap(
                                        spacing: 4,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        alignment: WrapAlignment.end,
                                        children: [
                                          AnimatedSearchWidget(
                                            onChangeValue: (value) {
                                              setState(() {
                                                textValue = value;
                                              });
                                            },
                                            onSubmit: (values) async {
                                              await Provider.of<
                                                          EntrepreneurRetailerProvider>(
                                                      context,
                                                      listen: false)
                                                  .getEntrepreneurRetailerData(
                                                      entrepreneurId:
                                                          widget.id!,
                                                      value: values);
                                            },
                                            onPress: () {
                                              setState(() {
                                                Provider.of<EntrepreneurRetailerProvider>(
                                                        context,
                                                        listen: false)
                                                    .getEntrepreneurRetailerData(
                                                        entrepreneurId:
                                                            widget.id!);
                                              });
                                            },
                                          ),
                                          OnHoverButtonWidget(
                                            icons: Icons.filter_alt,
                                            onTap: () {
                                              isFilter = !isFilter;
                                              if (!isFilter) {
                                                isPhysical = false;
                                                isOnlineStore = false;
                                                isWebShop = false;
                                                Provider.of<EntrepreneurRetailerProvider>(
                                                        context,
                                                        listen: false)
                                                    .getEntrepreneurRetailerData(
                                                        entrepreneurId:
                                                            widget.id!);
                                                setState(() {});
                                              }
                                              setState(() {});
                                            },
                                          ),
                                        ],
                                      ),
                                      Wrap(
                                        spacing: 10,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        alignment: WrapAlignment.end,
                                        children: [
                                          AddTextButtonWidget(
                                            text: "Select existing retailer".tr(),
                                            colors: lightBlack,
                                            onPress: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return SearchRetailerDialogWidget(
                                                      entrepreneurId: widget.id,
                                                    );
                                                  });
                                            },
                                          ),
                                          IconAndTextContainer(
                                            addText: "Retailer".tr(),
                                            onTap: () {
                                              // showDialog(
                                              //     context: context,
                                              //     builder: (BuildContext context) {
                                              //       return GoogleSearchWidget(
                                              //         // placeDetails: (String value) {
                                              //         //   print('$value');
                                              //         // },
                                              //         // lng: (double lat) {
                                              //         //   print('$lat');
                                              //         // },
                                              //         // lat: (double lng) {
                                              //         //   print('$lng');
                                              //         // },
                                              //       );
                                              //     });
                                              // //we have passed these fields empty to our model for assigning new values for add retailer
                                              AddEntrepreneurRetailer
                                                  addEntrepreneurRetailer =
                                                  AddEntrepreneurRetailer(
                                                      address: '',
                                                      phoneNumber: '',
                                                      retailerName: '',
                                                      shop: '',
                                                      website: '',
                                                      openingHours:
                                                          OpeningHours(
                                                              fridayClose: '',
                                                              fridayOpen: '',
                                                              mondayClose: '',
                                                              mondayOpen: '',
                                                              saturdayClose: '',
                                                              saturdayOpen: '',
                                                              sundayClose: '',
                                                              sundayOpen: '',
                                                              thursdayClose: '',
                                                              thursdayOpen: '',
                                                              tuesdayClose: '',
                                                              tuesdayOpen: '',
                                                              wednesdayClose:
                                                                  '',
                                                              wednesdayOpen:
                                                                  ''));
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return RetailerDialog(
                                                      entrepreneurId: widget.id,
                                                      entrepreneurRetailer:
                                                          addEntrepreneurRetailer,
                                                    );
                                                  });
                                            },
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              : Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  alignment: WrapAlignment.end,
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: [
                                    AnimatedSearchWidget(
                                      onChangeValue: (value) {
                                        setState(() {
                                          textValue = value;
                                        });
                                      },
                                      onSubmit: (values) async {
                                        await Provider.of<
                                                    EntrepreneurRetailerProvider>(
                                                context,
                                                listen: false)
                                            .getEntrepreneurRetailerData(
                                                entrepreneurId: widget.id!,
                                                value: values);
                                      },
                                      onPress: () async {
                                        await Provider.of<
                                                    EntrepreneurRetailerProvider>(
                                                context,
                                                listen: false)
                                            .getEntrepreneurRetailerData(
                                                entrepreneurId: widget.id!);
                                        setState(() {});
                                      },
                                    ),
                                    OnHoverButtonWidget(
                                      icons: Icons.filter_alt,
                                      onTap: () {
                                        isFilter = !isFilter;
                                        if (!isFilter) {
                                          isPhysical = false;
                                          isOnlineStore = false;
                                          isWebShop = false;
                                          Provider.of<EntrepreneurRetailerProvider>(
                                                  context,
                                                  listen: false)
                                              .getEntrepreneurRetailerData(
                                                  entrepreneurId: widget.id!);
                                          setState(() {});
                                        }
                                        setState(() {});
                                      },
                                    ),
                                    AddTextButtonWidget(
                                      text: "Select existing retailer".tr(),
                                      colors: lightBlack,
                                      onPress: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return SearchRetailerDialogWidget(
                                                entrepreneurId: widget.id,
                                              );
                                            });
                                      },
                                    ),
                                    IconAndTextContainer(
                                      addText: "Retailer".tr(),
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0)),
                                                child: Container(
                                                  height: 450,
                                                  width: 400,
                                                  padding: EdgeInsets.all(10),
                                                  child: GoogleSearchWidget(
                                                      // placeDeetails: (PlacesDetailsResponse detail) {
                                                      //   print("lat and lng click");
                                                      //   // final lat = detail.result.geometry!.location.lat;
                                                      //   // final lng = detail.result.geometry!.location.lng;
                                                      //  // print("lat and lng =$lat/$lng");
                                                      // },
                                                      // prediction: (Prediction preiction) {
                                                      //   print("description click");
                                                      //  // print("description = ${preiction.description}");
                                                      // },
                                                      ),
                                                ),
                                              );
                                            });

                                        AddEntrepreneurRetailer
                                            addEntrepreneurRetailer =
                                            AddEntrepreneurRetailer(
                                                address: '',
                                                phoneNumber: '',
                                                retailerName: '',
                                                shop: '',
                                                website: '',
                                                openingHours: OpeningHours(
                                                    fridayClose: '',
                                                    fridayOpen: '',
                                                    mondayClose: '',
                                                    mondayOpen: '',
                                                    saturdayClose: '',
                                                    saturdayOpen: '',
                                                    sundayClose: '',
                                                    sundayOpen: '',
                                                    thursdayClose: '',
                                                    thursdayOpen: '',
                                                    tuesdayClose: '',
                                                    tuesdayOpen: '',
                                                    wednesdayClose: '',
                                                    wednesdayOpen: ''));
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return RetailerDialog(
                                                entrepreneurId: widget.id,
                                                entrepreneurRetailer:
                                                    addEntrepreneurRetailer,
                                              );
                                            });
                                      },
                                    )
                                  ],
                                )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    isFilter
                        ? SizedBox(
                            height: 65,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 18.0, right: 18),
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: getWidth(context),
                                    height: 100,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      // alignment: WrapAlignment.spaceBetween,
                                      // runSpacing: 2,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 23, vertical: 12),
                                          decoration: BoxDecoration(
                                              color: isPhysical
                                                  ? yellowishGreen
                                                  : Colors.white,
                                              border: Border.all(
                                                  color: isPhysical
                                                      ? Colors.white
                                                      : darkGreen),
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                isPhysical = true;
                                                isOnlineStore = false;
                                                isWebShop = false;
                                              });
                                            },
                                            child: CustomText(
                                              text: 'Physical Store'.tr(),
                                              color: isPhysical
                                                  ? Colors.white
                                                  : darkGreen,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 23, vertical: 12),
                                          decoration: BoxDecoration(
                                              color: isWebShop
                                                  ? yellowishGreen
                                                  : Colors.white,
                                              border: Border.all(
                                                  color: isWebShop
                                                      ? Colors.white
                                                      : darkGreen),
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                isPhysical = false;
                                                isOnlineStore = false;
                                                isWebShop = true;
                                              });
                                            },
                                            child: CustomText(
                                              text: 'Webshop'.tr(),
                                              color: isWebShop
                                                  ? Colors.white
                                                  : darkGreen,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 23, vertical: 12),
                                          decoration: BoxDecoration(
                                              color: isOnlineStore
                                                  ? yellowishGreen
                                                  : Colors.white,
                                              border: Border.all(
                                                  color: isOnlineStore
                                                      ? Colors.white
                                                      : darkGreen),
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                isPhysical = false;
                                                isOnlineStore = true;
                                                isWebShop = false;
                                              });
                                            },
                                            child: CustomText(
                                              text: 'Store & Webshop'.tr(),
                                              color: isOnlineStore
                                                  ? Colors.white
                                                  : darkGreen,
                                            ),
                                          ),
                                        ),
                                        Expanded(child: SizedBox.shrink()),
                                        AddTextButtonWidget(
                                          text: 'Clear'.tr(),
                                          colors: dimMetalic3,
                                          onPress: () async {
                                            isPhysical = false;
                                            isOnlineStore = false;
                                            isWebShop = false;
                                            await Provider.of<
                                                        EntrepreneurRetailerProvider>(
                                                    context,
                                                    listen: false)
                                                .getEntrepreneurRetailerData(
                                                    entrepreneurId: widget.id!);
                                            setState(() {});
                                          },
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        AddTextButtonWidget(
                                          text: 'Apply'.tr(),
                                          colors: yellow,
                                          onPress: () async {
                                            isPhysical
                                                ? await Provider.of<
                                                            EntrepreneurRetailerProvider>(
                                                        context,
                                                        listen: false)
                                                    .getEntrepreneurRetailerData(
                                                        entrepreneurId:
                                                            widget.id!,
                                                        value:
                                                            'Physical location')
                                                : isWebShop
                                                    ? await Provider.of<
                                                                EntrepreneurRetailerProvider>(
                                                            context,
                                                            listen: false)
                                                        .getEntrepreneurRetailerData(
                                                            entrepreneurId:
                                                                widget.id!,
                                                            value:
                                                                'Online location')
                                                    : await Provider.of<
                                                                EntrepreneurRetailerProvider>(
                                                            context,
                                                            listen: false)
                                                        .getEntrepreneurRetailerData(
                                                            entrepreneurId:
                                                                widget.id!,
                                                            value:
                                                                'Hybrid location');
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RetailerInfoWidget(
                                    onAllChange: (value) {
                                      setState(() {
                                        allValue = !allValue;
                                      });
                                      if (allValue) {
                                        for (var i = 0;
                                            i < provider.getcheckedBool.length;
                                            i++) {
                                          provider.getcheckedBool[i] = allValue;
                                          provider.allCheckedBoxId.insert(
                                              i,
                                              provider.entrepreneurModel!
                                                  .data![i].id!);
                                          multipleIndex.add(i);
                                        }
                                      } else {
                                        for (var i = 0;
                                            i < provider.getcheckedBool.length;
                                            i++) {
                                          provider.getcheckedBool[i] = allValue;
                                          multipleIndex = [];
                                          provider.allCheckedBoxId = [];
                                        }
                                      }
                                      setState(() {});
                                    },
                                    onAllValue:
                                        provider.getcheckedBool.contains(false)
                                            ? allValue = false
                                            : !provider.getcheckedBool
                                                    .contains(false)
                                                ? allValue = true
                                                : allValue,
                                    reName: "Name ".tr(),
                                    reType: "Type".tr(),
                                    isHeader: true,
                                    reAddress: "Address".tr(),
                                    reWebsite: "Website".tr(),
                                    rePhone: "Phone number #".tr(),
                                    size: 14,
                                    weight: FontWeight.bold,
                                    width: !Responsive.isDesktop(context)
                                        ? getWidth(context) / 4
                                        : getWidth(context) * 0.165,
                                  ),
                                  Divider(
                                    color: dimGrey,
                                    thickness: 0.2,
                                  ),
                                  loading == true
                                      ? Container(
                                          child: ListView.builder(
                                            itemBuilder: (c, i) {
                                              return Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 10),
                                                child: ShimmerEffect(
                                                    child: Container(
                                                  height: 80,
                                                  width: double.infinity,
                                                  color: Colors.blue,
                                                )),
                                              );
                                            },
                                            itemCount: 10,
                                          ),
                                          height: getHeight(context),
                                          width: getWidth(context),
                                        )
                                      : provider.entrepreneurModel!.status ==
                                              404
                                          ? SizedBox(
                                              height: getHeight(context),
                                              width: getWidth(context),
                                              child: Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: CustomText(
                                                    text:
                                                        '${provider.entrepreneurModel!.message}',
                                                    color: Colors.red,
                                                    weight: FontWeight.w700,
                                                    size: 20,
                                                  )),
                                            )
                                          : Column(
                                              children: [
                                                for (int i = 0;
                                                    i <
                                                        provider
                                                            .entrepreneurModel!
                                                            .data!
                                                            .length;
                                                    i++)
                                                  RetailerInfoWidget(
                                                    onAllChange: (value) {
                                                      setState(() {
                                                        if (provider.getcheckedBool[
                                                                i] ==
                                                            (true)) {
                                                          provider.getcheckedBool[
                                                              i] = false;
                                                          provider
                                                              .allCheckedBoxId
                                                              .remove(provider
                                                                  .entrepreneurModel!
                                                                  .data![i]
                                                                  .id!);
                                                          multipleIndex
                                                              .remove(i);
                                                        } else {
                                                          provider.getcheckedBool[
                                                              i] = true;
                                                          if (!provider
                                                              .allCheckedBoxId
                                                              .contains(provider
                                                                  .entrepreneurModel!
                                                                  .data![i]
                                                                  .id!)) {
                                                            provider
                                                                .allCheckedBoxId
                                                                .add(provider
                                                                    .entrepreneurModel!
                                                                    .data![i]
                                                                    .id!);
                                                            multipleIndex
                                                                .add(i);
                                                          } /*else {
                                                                  retailerId = provider.entrepreneurModel!.data![i].id!;
                                                                  id = i;
                                                                  singleId = true;
                                                                }*/
                                                        }
                                                        setState(() {});
                                                      });
                                                    },
                                                    isHeader: false,
                                                    onAllValue: provider
                                                        .getcheckedBool[i],
                                                    reName:
                                                        "${provider.entrepreneurModel!.data![i].retailerName}",
                                                    reType:
                                                        "${provider.entrepreneurModel!.data![i].shop}",
                                                    reAddress:
                                                        "${provider.entrepreneurModel!.data![i].address}",
                                                    reWebsite:
                                                        "${provider.entrepreneurModel!.data![i].website}",
                                                    rePhone:
                                                        "${provider.entrepreneurModel!.data![i].phoneNumber}",
                                                    size: 12,
                                                    weight: FontWeight.normal,
                                                    width: !Responsive
                                                            .isDesktop(context)
                                                        ? getWidth(context) / 4
                                                        : getWidth(context) *
                                                            0.165,
                                                  ),
                                              ],
                                            ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          top: 0,
                          right: 15,
                          child: PopupMenuButton(
                            // color: Colors.black,
                            child: OnHover(
                              builder: (hover) => SizedBox(
                                height: 50,
                                width: 50,
                                child: Card(
                                  color:
                                      hover ? Colors.greenAccent : Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.more_vert,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 1,
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.greenAccent,
                                      ),
                                    ),
                                    Text('Delete'.tr(), style: TextStyle(fontFamily: Montserrat_Medium),),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 2,
                                onTap: () {
                                  provider.allCheckedBoxId.clear();
                                  setState(() {});
                                  for (var i = 0;
                                      i <
                                          provider
                                              .entrepreneurModel!.data!.length;
                                      i++) {
                                    if (provider.getcheckedBool[i]) {
                                      provider.allCheckedBoxId.add(provider
                                          .entrepreneurModel!.data![i].id!);
                                    }
                                  }
                                  setState(() {});
                                  print(
                                      "Seleceted : ${provider.getcheckedBool}");
                                  print(
                                      "ALL IDS : ${provider.allCheckedBoxId}");
                                  provider.downloadCSV();
                                },
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                                      child: Icon(
                                        Icons.download,
                                        color: Colors.greenAccent,
                                      ),
                                    ),
                                    Text('Download CSV'.tr(),style: TextStyle(fontFamily: Montserrat_Medium),),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 3,
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.greenAccent,
                                      ),
                                    ),
                                    Text('Edit'.tr(),style: TextStyle(fontFamily: Montserrat_Medium),),
                                  ],
                                ),
                              ),
                            ],
                            onSelected: (value) async {
                              if (value == 1) {
                                if (provider.allCheckedBoxId.isNotEmpty) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 12),
                                        child: Text(
                                            "Are you sure you want to Delete".tr(),style: TextStyle(fontFamily: Montserrat_Medium),),
                                      ),
                                      actions: [
                                        AddTextButtonWidget(
                                          text: "Sure".tr(),
                                          colors: yellowishGreen,
                                          onPress: () async {
                                            if (allValue == false) {
                                              if (singleId == true) {
                                                print(
                                                    "Single Selected======================================");
                                                await EntrepreneurClients
                                                    .deleteEntrepreneurRetailer(
                                                  mEntrepreneurID: widget.id!,
                                                  retailerId: retailerId,
                                                  isBulkDelete: false,
                                                );
                                                provider
                                                    .entrepreneurModel!.data!
                                                    .removeAt(id);
                                                setState(() {
                                                  Provider.of<EntrepreneurRetailerProvider>(
                                                          context,
                                                          listen: false)
                                                      .getEntrepreneurRetailerData(
                                                    entrepreneurId: widget.id!,
                                                  );
                                                });
                                                provider.getcheckedBool[
                                                        multipleIndex.length] =
                                                    false;
                                                Navigator.of(context)
                                                    .pop('yes');
                                              } else {
                                                if (provider.allCheckedBoxId
                                                    .isNotEmpty) {
                                                  print(
                                                      "Multiple selected data======================================");
                                                  await EntrepreneurClients
                                                      .deleteEntrepreneurRetailer(
                                                    mEntrepreneurID: widget.id,
                                                    retailerId: provider
                                                        .allCheckedBoxId,
                                                    isBulkDelete: true,
                                                  );

                                                  Provider.of<EntrepreneurRetailerProvider>(
                                                          context,
                                                          listen: false)
                                                      .getEntrepreneurRetailerData(
                                                          entrepreneurId:
                                                              widget.id!);
                                                  provider.allCheckedBoxId = [];
                                                  provider.getcheckedBool[
                                                      multipleIndex
                                                          .length] = false;
                                                  Navigator.of(context)
                                                      .pop('yes');
                                                }

                                                print(
                                                    "empty  data======================================");
                                              }
                                            } else {
                                              print(
                                                  "All Selected======================================");
                                              await EntrepreneurClients
                                                  .deleteEntrepreneurRetailer(
                                                mEntrepreneurID: widget.id!,
                                                retailerId:
                                                    provider.allCheckedBoxId,
                                                isBulkDelete: true,
                                              );
                                              Navigator.of(context).pop('yes');

                                              setState(() {
                                                Provider.of<EntrepreneurRetailerProvider>(
                                                        context,
                                                        listen: false)
                                                    .getEntrepreneurRetailerData(
                                                  entrepreneurId: widget.id!,
                                                );
                                              });
                                              provider.allCheckedBoxId = [];
                                              setState(() {});
                                              provider.getcheckedBool[
                                                  multipleIndex.length] = false;
                                            }
                                          },
                                        ),
                                        AddTextButtonWidget(
                                          text: "Cancel".tr(),
                                          colors: dimMetalic3,
                                          onPress: () {
                                            Navigator.of(
                                              context,
                                            ).pop('yes');
                                          },
                                        ),
                                        /*  InkWell(
                                            onTap: () async {
                                              if (allValue == false) {
                                                if (singleId == true) {
                                                  print("Single Selected======================================");
                                                  await EntrepreneurClients.deleteEntrepreneurRetailer(
                                                    mEntrepreneurID: widget.id!,
                                                    retailerId: retailerId,
                                                    isBulkDelete: false,
                                                  );
                                                  provider.entrepreneurModel!.data!.removeAt(id);
                                                  setState(() {
                                                    Provider.of<EntrepreneurRetailerProvider>(context, listen: false).getEntrepreneurRetailerData(
                                                      entrepreneurId: widget.id!,
                                                    );
                                                  });
                                                  provider.getcheckedBool[multipleIndex.length] = false;
                                                  Navigator.of(context).pop();
                                                } else {
                                                  print("Multiple selected data======================================");
                                                  await EntrepreneurClients.deleteEntrepreneurRetailer(
                                                    mEntrepreneurID: widget.id,
                                                    retailerId: allCheckedBoxId,
                                                    isBulkDelete: true,
                                                  );

                                                  setState(() {
                                                    Provider.of<EntrepreneurRetailerProvider>(context, listen: false).getEntrepreneurRetailerData(
                                                      entrepreneurId: widget.id!,
                                                    );
                                                  });
                                                  provider.getcheckedBool[multipleIndex.length] = false;
                                                  Navigator.of(context).pop();
                                                }
                                              } else {
                                                print("All Selected======================================");
                                                await EntrepreneurClients.deleteEntrepreneurRetailer(
                                                  mEntrepreneurID: widget.id!,
                                                  retailerId: allCheckedBoxId,
                                                  isBulkDelete: true,
                                                );
                                                Navigator.of(context).pop();

                                                setState(() {
                                                  Provider.of<EntrepreneurRetailerProvider>(context, listen: false).getEntrepreneurRetailerData(
                                                    entrepreneurId: widget.id!,
                                                  );
                                                });
                                                provider.getcheckedBool[multipleIndex.length] = false;
                                              }
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text('Yes'),
                                            ),
                                          )*/
                                      ],
                                    ),
                                  );
                                } else {
                                  showSnack(
                                      'please select any retailer first..'.tr());
                                }
                              }
                              if (value == 2) {}
                              if (value == 3) {
                                if (provider.getcheckedBool.contains(true) &&
                                    multipleIndex.length <= 1 &&
                                    provider.allCheckedBoxId.isNotEmpty) {
                                  mAddress = provider.entrepreneurModel!
                                          .data![multipleIndex[0]].address ??
                                      "";
                                  mRetailer = provider
                                          .entrepreneurModel!
                                          .data![multipleIndex[0]]
                                          .retailerName ??
                                      "";
                                  mPhone = provider
                                          .entrepreneurModel!
                                          .data![multipleIndex[0]]
                                          .phoneNumber ??
                                      "";
                                  mShop = provider.entrepreneurModel!
                                          .data![multipleIndex[0]].shop ??
                                      "";
                                  mWebsite = provider.entrepreneurModel!
                                          .data![multipleIndex[0]].website ??
                                      "";
                                  mFriClose = provider
                                              .entrepreneurModel!
                                              .data![multipleIndex[0]]
                                              .openingHours!
                                              .fridayClose !=
                                          ''
                                      ? provider
                                          .entrepreneurModel!
                                          .data![multipleIndex[0]]
                                          .openingHours!
                                          .fridayClose
                                      : "9:00 AM";
                                  mFriOpen = provider
                                              .entrepreneurModel!
                                              .data![multipleIndex[0]]
                                              .openingHours!
                                              .fridayClose !=
                                          ''
                                      ? provider
                                          .entrepreneurModel!
                                          .data![multipleIndex[0]]
                                          .openingHours!
                                          .fridayOpen
                                      : "9:00 AM";
                                  mSatClose = provider
                                              .entrepreneurModel!
                                              .data![multipleIndex[0]]
                                              .openingHours!
                                              .saturdayClose !=
                                          ''
                                      ? provider
                                          .entrepreneurModel!
                                          .data![multipleIndex[0]]
                                          .openingHours!
                                          .saturdayClose
                                      : "9:00 AM";
                                  mSatOpen = provider
                                              .entrepreneurModel!
                                              .data![multipleIndex[0]]
                                              .openingHours!
                                              .saturdayOpen !=
                                          ''
                                      ? provider
                                          .entrepreneurModel!
                                          .data![multipleIndex[0]]
                                          .openingHours!
                                          .saturdayOpen
                                      : "9:00 AM";
                                  mSunClose = provider
                                              .entrepreneurModel!
                                              .data![multipleIndex[0]]
                                              .openingHours!
                                              .sundayClose !=
                                          ''
                                      ? provider
                                          .entrepreneurModel!
                                          .data![multipleIndex[0]]
                                          .openingHours!
                                          .sundayClose
                                      : "9:00 AM";
                                  mSunOpen = provider
                                              .entrepreneurModel!
                                              .data![multipleIndex[0]]
                                              .openingHours!
                                              .sundayOpen !=
                                          ''
                                      ? provider
                                          .entrepreneurModel!
                                          .data![multipleIndex[0]]
                                          .openingHours!
                                          .sundayOpen
                                      : "9:00 AM";
                                  mMonClose = provider
                                              .entrepreneurModel!
                                              .data![multipleIndex[0]]
                                              .openingHours!
                                              .mondayClose !=
                                          ''
                                      ? provider
                                          .entrepreneurModel!
                                          .data![multipleIndex[0]]
                                          .openingHours!
                                          .mondayClose
                                      : "9:00 AM";
                                  mMonOpen = provider
                                              .entrepreneurModel!
                                              .data![multipleIndex[0]]
                                              .openingHours!
                                              .mondayOpen !=
                                          ''
                                      ? provider
                                          .entrepreneurModel!
                                          .data![multipleIndex[0]]
                                          .openingHours!
                                          .mondayOpen
                                      : "9:00 AM";
                                  mTueClose = provider
                                              .entrepreneurModel!
                                              .data![multipleIndex[0]]
                                              .openingHours!
                                              .tuesdayClose !=
                                          ''
                                      ? provider
                                          .entrepreneurModel!
                                          .data![multipleIndex[0]]
                                          .openingHours!
                                          .tuesdayClose
                                      : "9:00 AM";
                                  mTueOpen = provider
                                              .entrepreneurModel!
                                              .data![multipleIndex[0]]
                                              .openingHours!
                                              .tuesdayOpen !=
                                          ''
                                      ? provider
                                          .entrepreneurModel!
                                          .data![multipleIndex[0]]
                                          .openingHours!
                                          .tuesdayOpen
                                      : "9:00 AM";
                                  mWedClose = provider
                                              .entrepreneurModel!
                                              .data![multipleIndex[0]]
                                              .openingHours!
                                              .wednesdayClose !=
                                          ''
                                      ? provider
                                          .entrepreneurModel!
                                          .data![multipleIndex[0]]
                                          .openingHours!
                                          .wednesdayClose
                                      : "9:00 AM";
                                  mWedOpen = provider
                                              .entrepreneurModel!
                                              .data![multipleIndex[0]]
                                              .openingHours!
                                              .wednesdayOpen !=
                                          ''
                                      ? provider
                                          .entrepreneurModel!
                                          .data![multipleIndex[0]]
                                          .openingHours!
                                          .wednesdayOpen
                                      : "9:00 AM";
                                  mThuClose = provider
                                              .entrepreneurModel!
                                              .data![multipleIndex[0]]
                                              .openingHours!
                                              .thursdayClose !=
                                          ''
                                      ? provider
                                          .entrepreneurModel!
                                          .data![multipleIndex[0]]
                                          .openingHours!
                                          .thursdayClose
                                      : "9:00 AM";
                                  mThuOpen = provider
                                              .entrepreneurModel!
                                              .data![multipleIndex[0]]
                                              .openingHours!
                                              .thursdayOpen !=
                                          ''
                                      ? provider
                                          .entrepreneurModel!
                                          .data![multipleIndex[0]]
                                          .openingHours!
                                          .thursdayOpen
                                      : "9:00 AM";

                                  AddEntrepreneurRetailer
                                      addEntrepreneurRetailer =
                                      AddEntrepreneurRetailer(
                                          address: mAddress,
                                          phoneNumber: mPhone,
                                          retailerName: mRetailer,
                                          shop: mShop,
                                          website: mWebsite,
                                          openingHours: OpeningHours(
                                              fridayClose: mFriClose,
                                              fridayOpen: mFriOpen,
                                              mondayClose: mMonClose,
                                              mondayOpen: mMonOpen,
                                              saturdayClose: mSatClose,
                                              saturdayOpen: mSatOpen,
                                              sundayClose: mSunClose,
                                              sundayOpen: mSunOpen,
                                              thursdayClose: mThuClose,
                                              thursdayOpen: mThuOpen,
                                              tuesdayClose: mTueClose,
                                              tuesdayOpen: mTueOpen,
                                              wednesdayClose: mWedClose,
                                              wednesdayOpen: mWedOpen));
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return RetailerDialog(
                                          entrepreneurId: widget.id,
                                          retailerEntrepreneurId:
                                              provider.allCheckedBoxId[0],
                                          entrepreneurRetailer:
                                              addEntrepreneurRetailer,
                                          isAddEntrepreneurRetailer: false,
                                        );
                                      });
                                } else if (!provider.getcheckedBool
                                        .contains(true) &&
                                    provider.allCheckedBoxId.isEmpty) {
                                  showSnack('Select Retailer first'.tr());
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (c) => AlertDialog(
                                            title: CustomText(
                                              text: 'Warning!!!'.tr(),
                                              weight: FontWeight.bold,
                                            ),
                                            content: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 12),
                                              child: CustomText(
                                                size: 13,
                                                textAligns: TextAlign.start,
                                                overflows: TextOverflow.visible,
                                                lines: 2,
                                                text:
                                                    'You can only edit the one retailer at a time. Please select one retailer and edit it'.tr(),
                                              ),
                                            ),
                                            actions: [
                                              AddTextButtonWidget(
                                                text: "Ok".tr(),
                                                colors: yellowishGreen,
                                                onPress: () {
                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .pop();
                                                },
                                              ),
                                            ],
                                          ));
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class DropDownCustom extends StatefulWidget {
  final EntrepreneurRetailerProvider? provider;
  final int? id;
  final int? i;

  const DropDownCustom({Key? key, this.provider, this.id, this.i})
      : super(key: key);

  @override
  State<DropDownCustom> createState() => _DropDownCustomState();
}

class _DropDownCustomState extends State<DropDownCustom> {
  final List<String> _editDialog = ["Action".tr(), "Edit".tr(), "Delete".tr()];
  String? _selectedIndex = 'Action'.tr();

  @override
  Widget build(BuildContext context) {
    return RealDropDownWidget(
      value: _selectedIndex,
      onChanged: (newValue) {
        print(newValue);
        setState(() {
          _selectedIndex = newValue.toString();
        });
        if (newValue == 'Edit') {
          AddEntrepreneurRetailer addEntrepreneurRetailer = AddEntrepreneurRetailer(
              address:
                  "${widget.provider!.entrepreneurModel!.data![widget.i!].address}",
              phoneNumber:
                  "${widget.provider!.entrepreneurModel!.data![widget.i!].phoneNumber}",
              retailerName:
                  "${widget.provider!.entrepreneurModel!.data![widget.i!].retailerName}",
              shop:
                  "${widget.provider!.entrepreneurModel!.data![widget.i!].shop}",
              website:
                  "${widget.provider!.entrepreneurModel!.data![widget.i!].website}",
              openingHours: OpeningHours(
                  fridayClose:
                      '${widget.provider!.entrepreneurModel!.data![widget.i!].openingHours!.fridayClose}',
                  fridayOpen:
                      '${widget.provider!.entrepreneurModel!.data![widget.i!].openingHours!.fridayOpen}',
                  mondayClose:
                      '${widget.provider!.entrepreneurModel!.data![widget.i!].openingHours!.mondayClose}',
                  mondayOpen:
                      '${widget.provider!.entrepreneurModel!.data![widget.i!].openingHours!.mondayOpen}',
                  saturdayClose:
                      '${widget.provider!.entrepreneurModel!.data![widget.i!].openingHours!.saturdayClose}',
                  saturdayOpen:
                      '${widget.provider!.entrepreneurModel!.data![widget.i!].openingHours!.saturdayOpen}',
                  sundayClose:
                      '${widget.provider!.entrepreneurModel!.data![widget.i!].openingHours!.sundayClose}',
                  sundayOpen:
                      '${widget.provider!.entrepreneurModel!.data![widget.i!].openingHours!.saturdayOpen}',
                  thursdayClose:
                      '${widget.provider!.entrepreneurModel!.data![widget.i!].openingHours!.thursdayClose}',
                  thursdayOpen:
                      '${widget.provider!.entrepreneurModel!.data![widget.i!].openingHours!.thursdayOpen}',
                  tuesdayClose:
                      '${widget.provider!.entrepreneurModel!.data![widget.i!].openingHours!.thursdayClose}',
                  tuesdayOpen:
                      '${widget.provider!.entrepreneurModel!.data![widget.i!].openingHours!.thursdayOpen}',
                  wednesdayClose:
                      '${widget.provider!.entrepreneurModel!.data![widget.i!].openingHours!.wednesdayClose}',
                  wednesdayOpen:
                      '${widget.provider!.entrepreneurModel!.data![widget.i!].openingHours!.wednesdayOpen}'));
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return RetailerDialog(
                  entrepreneurId: widget.id,
                  retailerEntrepreneurId:
                      widget.provider!.entrepreneurModel!.data![widget.i!].id,
                  entrepreneurRetailer: addEntrepreneurRetailer,
                  isAddEntrepreneurRetailer: false,
                );
              });
          Provider.of<EntrepreneurRetailerProvider>(context, listen: false)
              .getEntrepreneurRetailerData(
            entrepreneurId: widget.id,
          );
        } else if (newValue == 'Delete') {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text("Are you sure you want to Delete".tr(),style: TextStyle(fontFamily: Montserrat_Medium),),
                  ),
                  actions: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AddTextButtonWidget(
                            text: "Sure".tr(),
                            colors: yellowishGreen,
                            onPress: () {
                              EntrepreneurClients.deleteEntrepreneurRetailer(
                                  mEntrepreneurID: widget.id,
                                  retailerId: widget.provider!
                                      .entrepreneurModel!.data![widget.i!].id,
                                  isBulkDelete: false);
                              Provider.of<EntrepreneurRetailerProvider>(context,
                                      listen: false)
                                  .getEntrepreneurRetailerData(
                                entrepreneurId: widget.id,
                              );
                              Navigator.of(context).pop('ok');
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          AddTextButtonWidget(
                            text: "Cancel".tr(),
                            colors: dimMetalic3,
                            onPress: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                );
              }).then((value) {
            if (value == 'ok') {
              widget.provider!.entrepreneurModel!.data!.removeAt(widget.i!);
              setState(() {});
            }
          });
        } else {
          print('action clicked');
        }
      },
      items: _editDialog.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
    );
  }
}
