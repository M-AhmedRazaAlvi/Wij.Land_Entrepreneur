import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/models/entrepreneur/response/get_entrepreneur_response.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/widgets/entreprenuer_data_table_card.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/widgets/map_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/widgets/organization_selection_dialog_widget.dart';
import 'package:wij_land/utils/ShimmerEffect.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../../providers/entrepreneur/entrepreneur_screen_provider.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/hex_color.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../../office/widgets/add_button.dart';

class EntrepreneurSmallScreenWidget extends StatefulWidget {
  final GetEntrepreneurResponse model;

  const EntrepreneurSmallScreenWidget({Key? key, required this.model}) : super(key: key);

  @override
  State<EntrepreneurSmallScreenWidget> createState() => _EntrepreneurSmallScreenWidgetState();
}

class _EntrepreneurSmallScreenWidgetState extends State<EntrepreneurSmallScreenWidget> {
  @override
  void initState() {
    var mEntrepreneurScreenProvider = Provider.of<EntrepreneurScreenProvider>(context, listen: false);
    mEntrepreneurScreenProvider.mSearchController.addListener(() {
      if (mEntrepreneurScreenProvider.mSearchController.text.isNotEmpty) {
        mEntrepreneurScreenProvider.updateFilterActions(value: true);
      } else if (mEntrepreneurScreenProvider.mSearchController.text.isEmpty &&
          mEntrepreneurScreenProvider.mSelectedFocusAreaList.isEmpty &&
          mEntrepreneurScreenProvider.mSelectedConnectionTypesList.isEmpty &&
          mEntrepreneurScreenProvider.mSellingLocationsController.text.isEmpty &&
          mEntrepreneurScreenProvider.mSuppliersController.text.isEmpty) {
        mEntrepreneurScreenProvider.updateFilterActions(value: false);
      }
    });
    mEntrepreneurScreenProvider.mSuppliersController.addListener(() {
      if (mEntrepreneurScreenProvider.mSuppliersController.text.isNotEmpty) {
        mEntrepreneurScreenProvider.updateFilterActions(value: true);
      } else if (mEntrepreneurScreenProvider.mSearchController.text.isEmpty &&
          mEntrepreneurScreenProvider.mSelectedFocusAreaList.isEmpty &&
          mEntrepreneurScreenProvider.mSelectedConnectionTypesList.isEmpty &&
          mEntrepreneurScreenProvider.mSellingLocationsController.text.isEmpty &&
          mEntrepreneurScreenProvider.mSuppliersController.text.isEmpty) {
        mEntrepreneurScreenProvider.updateFilterActions(value: false);
      }
    });
    mEntrepreneurScreenProvider.mSellingLocationsController.addListener(() {
      if (mEntrepreneurScreenProvider.mSellingLocationsController.text.isNotEmpty) {
        mEntrepreneurScreenProvider.updateFilterActions(value: true);
      } else if (mEntrepreneurScreenProvider.mSearchController.text.isEmpty &&
          mEntrepreneurScreenProvider.mSelectedFocusAreaList.isEmpty &&
          mEntrepreneurScreenProvider.mSelectedConnectionTypesList.isEmpty &&
          mEntrepreneurScreenProvider.mSellingLocationsController.text.isEmpty &&
          mEntrepreneurScreenProvider.mSuppliersController.text.isEmpty) {
        mEntrepreneurScreenProvider.updateFilterActions(value: false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurScreenProvider>(
      builder: (context, _provider, widget) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      CustomText(
                        text: 'Entrepreneurs  '.tr(),
                        color: newRed,
                        size: 16,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                        width: getWidth(context) * 0.025,
                      ),
                      IconHoverButton(
                        icons: Icons.location_on_rounded,
                        iconSize: 15,
                        onPress: () {
                          _provider.updateDisplayWidget(mIsShowMapWidget: true);
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        width: getWidth(context) * 0.005,
                      ),
                      IconHoverButton(
                        icons: Icons.view_list,
                        iconSize: 15,
                        onPress: () {
                          _provider.updateDisplayWidget(mIsShowMapWidget: false);
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: 5),
                      IconHoverButton(
                        icons: FontAwesomeIcons.filter,
                        isClick: _provider.isFilter,
                        widthSize: 45,
                        onPress: () {
                          setState(
                            () {
                              _provider.isFilter = !_provider.isFilter;
                            },
                          );
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      ButtonWithAddIcon(
                        text: 'Entrepreneurs'.tr(),
                        onPressed: () {
                          _provider.clearAllFields();
                          showDialog(
                            context: context,
                            builder: (c) {
                              return AlertDialog(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Add Entrepreneurs".tr(),
                                      style: TextStyle(
                                        fontFamily: Montserrat_Medium,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Responsive.isDesktop(context) ? 18 : 14,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(c);
                                      },
                                      icon: Icon(
                                        Icons.close,
                                      ),
                                    )
                                  ],
                                ),
                                content: OrganizationSelectionDialogWidget(),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    offset: Offset(0, 15),
                    blurRadius: 25,
                  ),
                ],
              ),
              child: Center(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10, top: 10),
                      suffixIcon: Icon(
                        Icons.search,
                        color: secondary,
                      ),
                    ),
                    controller: _provider.mSearchController,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _provider.isFilter && !_provider.isMapDisplay
                ? Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          offset: Offset(0, 15),
                          blurRadius: 25,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 7,
                        right: 8,
                        top: 13,
                        bottom: 11,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: SelectableDropdownWidget(
                                  items: _provider.relationToWijLandDropDownModel.data!,
                                  title: "Connection Type".tr(),
                                  mSelectedValue: _provider.mSelectedRelationToWijLandType,
                                  mSelectedItemsList: _provider.mSelectedConnectionTypesList,
                                  mOnDropDownChange: (value) {
                                    setState(
                                      () {
                                        _provider.mSelectedRelationToWijLandType = value as String;
                                        if (!_provider.mSelectedConnectionTypesList.contains(_provider.mSelectedRelationToWijLandType)) {
                                          _provider.mSelectedConnectionTypesList.add(_provider.mSelectedRelationToWijLandType);
                                        }
                                      },
                                    );
                                    if (_provider.mSearchController.text.isEmpty &&
                                        _provider.mSelectedFocusAreaList.isEmpty &&
                                        _provider.mSelectedConnectionTypesList.isEmpty &&
                                        _provider.mSellingLocationsController.text.isEmpty &&
                                        _provider.mSuppliersController.text.isEmpty) {
                                      _provider.updateFilterActions(value: false);
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: SelectableDropdownWidget(
                                  items: _provider.focusAreaDropDownModel.data!,
                                  title: "Focus Area".tr(),
                                  mSelectedValue: _provider.mSelectedFocusAreaType,
                                  mSelectedItemsList: _provider.mSelectedFocusAreaList,
                                  mOnDropDownChange: (value) {
                                    setState(
                                      () {
                                        _provider.mSelectedFocusAreaType = value as String;
                                        if (!_provider.mSelectedFocusAreaList.contains(_provider.mSelectedFocusAreaType)) {
                                          _provider.mSelectedFocusAreaList.add(_provider.mSelectedFocusAreaType);
                                        }
                                      },
                                    );
                                    if (_provider.mSearchController.text.isEmpty &&
                                        _provider.mSelectedFocusAreaList.isEmpty &&
                                        _provider.mSelectedConnectionTypesList.isEmpty &&
                                        _provider.mSellingLocationsController.text.isEmpty &&
                                        _provider.mSuppliersController.text.isEmpty) {
                                      _provider.updateFilterActions(value: false);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Suppliers".tr()),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      child: SizedBox(
                                          height: 50,
                                          child: TextFormField(
                                            controller: _provider.mSuppliersController,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 0.5,
                                                ),
                                              ),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Selling Locations".tr()),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      child: SizedBox(
                                        height: 50,
                                        child: TextFormField(
                                          controller: _provider.mSellingLocationsController,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 0.5,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              _provider.mShowFilterActions
                                  ? Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              onPressed: () async {
                                                await _provider.getEntrepreneur(false);
                                                setState(() {});
                                              },
                                              child: Text(
                                                "Apply Filters".tr(),
                                                style: TextStyle(
                                                  fontFamily: Montserrat_Medium,
                                                  color: HexColor("#A71832"),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                setState(
                                                  () {
                                                    _provider.mSearchController.clear();
                                                    _provider.mSuppliersController.clear();
                                                    _provider.mSellingLocationsController.clear();
                                                    _provider.mSelectedFocusAreaList.clear();
                                                    _provider.mSelectedConnectionTypesList.clear();
                                                    _provider.getEntrepreneur(false);
                                                    setState(() {});
                                                  },
                                                );
                                              },
                                              child: Text(
                                                "Clear Filters".tr(),
                                                style: TextStyle(
                                                  fontFamily: Montserrat_Medium,
                                                  color: HexColor("#A71832"),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : SizedBox(
                                      width: 0,
                                    )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            showLoadingWidget.value
                ? Expanded(
                    child: ListView.builder(
                      itemBuilder: (c, i) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10),
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
                    // height: getHeight(context),
                    // width: getWidth(context),
                  )
                : _provider.mEntrepreneurData.data == null
                    ? Center(child: Text("No Data Found".tr(),style: TextStyle(fontFamily: Montserrat_Medium),))
                    : _provider.isMapDisplay
                        ? Expanded(
                            child: MapWidget(),
                          )
                        : Expanded(
                            child: EntrepreneurDataTableCard(
                              model: this.widget.model,
                            ),
                          ),
          ],
        );
      },
    );
  }
}
