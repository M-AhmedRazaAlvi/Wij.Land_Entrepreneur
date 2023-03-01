import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/models/entrepreneur/response/get_entrepreneur_detail_response.dart';
import 'package:wij_land/models/entrepreneur/response/get_entrepreneur_overview.dart';
import 'package:wij_land/providers/entrepreneur/entrepreneur_screen_overview_provider.dart';

import '../../../../../providers/GlobalProvider/navigation/navigation_provider.dart';
import '../../../../../utils/functions.dart';
import '../../../../../utils/styles.dart';

class OverviewAddressWidget extends StatelessWidget {
  final List<String> addressList;
  final bool isOpen;
  final GetEntrepreneurOverviewResponse model;
  final GetEntrepreneurDetailsResponse detailsResponse;

  const OverviewAddressWidget({
    Key? key,
    required this.addressList,
    required this.isOpen,
    required this.model,
    required this.detailsResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurOverviewScreenProvider>(
      builder: (BuildContext context, _provider, Widget? child) {
        return Container(
          width: isOpen ? getWidth(context) / 2.5 : getWidth(context),
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: isOpen
              ? Wrap(
                  alignment: WrapAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i < 2; i++)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      CupertinoIcons.location_solid,
                                      size: 12,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Expanded(
                                      child: Text(
                                        i == 0 ? "Postal Address".tr() : "Visiting Address".tr(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                            fontFamily: Montserrat_Medium,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Expanded(
                                child: Text(
                                  i == 0 ? detailsResponse.data?.postalAddress ?? "" : detailsResponse.data?.visitingAddress ?? "",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                      fontFamily: Montserrat_Medium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 2; i < 5; i++)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  addressList[i],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                      fontFamily: Montserrat_Medium
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Expanded(
                                child: Text(
                                  i == 2
                                      ? detailsResponse.data?.connectedToWijlandSince ?? ""
                                      : i == 3
                                          ? detailsResponse.data?.focusArea ?? ""
                                          : detailsResponse.data?.legalStructure ?? "",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                      fontFamily: Montserrat_Medium
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 5; i < 9; i++)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  setKeyText(addressList, i),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                      fontFamily: Montserrat_Medium
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Expanded(
                                child: Text(
                                  setValueText(addressList, i, _provider.mSelectedRelationToWijLandList) == "null"
                                      ? ""
                                      : setValueText(addressList, i, _provider.mSelectedRelationToWijLandList),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                      fontFamily: Montserrat_Medium
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 160,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 12,
                        ),
                        CustomText(
                          text: "Products".tr(),
                          textAligns: TextAlign.start,
                          size: 12,
                        ),
                        SizedBox(
                          width: getWidth(context) * 0.11,
                        ),
                        for (int i = 0; i < _provider.comingProductsList.length; i++)
                          Image.network(
                            'https://$gloal_base_path${_provider.comingProductsList[i].icon}',
                            width: 40,
                            height: 40,
                          ),
                        SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int i = 0; i < 2; i++)
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            CupertinoIcons.location_solid,
                                            size: 12,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              i == 0 ? "Postal Address".tr() : "Visiting Address".tr(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                  fontFamily: Montserrat_Medium
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 24,
                                      height: 12,
                                    ),
                                    Expanded(
                                      child: Text(
                                        i == 0 ? detailsResponse.data?.postalAddress ?? "" : detailsResponse.data?.visitingAddress ?? "",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                            fontFamily: Montserrat_Medium
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int i = 2; i < 5; i++)
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        addressList[i],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                            fontFamily: Montserrat_Medium
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 24,
                                      height: 12,
                                    ),
                                    Expanded(
                                      child: Text(
                                        i == 2
                                            ? '${detailsResponse.data?.connectedToWijlandSince!.split('-')[2]}-${detailsResponse.data?.connectedToWijlandSince!.split('-')[1]}-${detailsResponse.data?.connectedToWijlandSince!.split('-')[0]}'
                                            : i == 3
                                                ? detailsResponse.data?.focusArea ?? ""
                                                : detailsResponse.data?.legalStructure ?? "",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                            fontFamily: Montserrat_Medium
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int i = 5; i < 9; i++)
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        setKeyText(addressList, i),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                            fontFamily: Montserrat_Medium
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 24,
                                      height: 12,
                                    ),
                                    Expanded(
                                      child: Text(
                                        setValueText(addressList, i, _provider.mSelectedRelationToWijLandList) == "null"
                                            ? ""
                                            : setValueText(addressList, i, _provider.mSelectedRelationToWijLandList),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                            fontFamily: Montserrat_Medium
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 12,
                        ),
                        CustomText(
                          text: "Products".tr(),
                          textAligns: TextAlign.start,
                          size: 12,
                        ),
                        SizedBox(
                          width: getWidth(context) * 0.11,
                        ),
                        for (int i = 0; i < _provider.comingProductsList.length; i++)
                          Image.network(
                            'https://$gloal_base_path${_provider.comingProductsList[i].icon}',
                            width: 40,
                            height: 40,
                          ),
                        SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
        );
      },
    );
  }

  String relationToWijLandList(List<String> list) {
    String s = "";
    s = list.join(', ');
    return s;
  }

  String setKeyText(List<String> addressList, int i) {
    String mKeyText = "";
    if (i == 5) {
      mKeyText = addressList[5];
    } else if (detailsResponse.data!.entrepreneurInfo!.relationToWijLand!.contains("Netwerk")) {
      mKeyText = "";
    } else if (detailsResponse.data!.entrepreneurInfo!.relationToWijLand!.contains("Innovatieprijs")) {
      if (i == 6 || i == 7) {
        mKeyText = addressList[i];
      }
    } else if (detailsResponse.data!.entrepreneurInfo!.relationToWijLand!.contains("Projectpartner")) {
      mKeyText = addressList[8];
    } else if (detailsResponse.data!.entrepreneurInfo!.relationToWijLand!.contains("Financiële ondersteuning")) {
      mKeyText = addressList[6];
    }
    return mKeyText;
  }

  String setValueText(List<String> addressList, int i, List<String> rtwlList) {
    String mValueText = "";
    if (i == 5) {
      mValueText = relationToWijLandList(rtwlList);
    } else if (detailsResponse.data!.entrepreneurInfo!.relationToWijLand!.contains("Netwerk")) {
      mValueText = "";
    } else if (detailsResponse.data!.entrepreneurInfo!.relationToWijLand!.contains("Innovatieprijs")) {
      if (i == 6) {
        mValueText = detailsResponse.data!.entrepreneurInfo?.amount ?? "";
      }
      if (i == 7) {
        mValueText = detailsResponse.data!.entrepreneurInfo?.year ?? "";
      }
    } else if (detailsResponse.data!.entrepreneurInfo!.relationToWijLand!.contains("Projectpartner")) {
      mValueText = detailsResponse.data!.project?.name ?? "";
    } else if (detailsResponse.data!.entrepreneurInfo!.relationToWijLand!.contains("Financiële ondersteuning")) {
      mValueText = detailsResponse.data!.entrepreneurInfo?.amount ?? "";
    }
    return mValueText;
  }
}
