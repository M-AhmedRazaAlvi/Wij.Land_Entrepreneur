import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/models/entrepreneur/response/get_entrepreneur_response.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/widgets/entreprenuer_data_table_card.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/widgets/map_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/widgets/organization_selection_dialog_widget.dart';
import 'package:wij_land/utils/functions.dart';
import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../../app_common_widgets/on_hover.dart';
import '../../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../../providers/entrepreneur/entrepreneur_screen_provider.dart';
import '../../../../utils/ShimmerEffect.dart';
import '../../../../utils/hex_color.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../../office/widgets/add_button.dart';

class EntrepreneurLargeScreenWidget extends StatefulWidget {
  final GetEntrepreneurResponse model;
  final bool? loadWidget;

  const EntrepreneurLargeScreenWidget(
      {Key? key, required this.model, this.loadWidget})
      : super(key: key);

  @override
  State<EntrepreneurLargeScreenWidget> createState() =>
      _EntrepreneurLargeScreenWidgetState();
}

class _EntrepreneurLargeScreenWidgetState
    extends State<EntrepreneurLargeScreenWidget> {
  var focusNode = FocusNode();

  @override
  void initState() {
    var mEntrepreneurScreenProvider =
        Provider.of<EntrepreneurScreenProvider>(context, listen: false);
    mEntrepreneurScreenProvider.mSearchController.addListener(() {
      if (mEntrepreneurScreenProvider.mSearchController.text.isNotEmpty) {
        mEntrepreneurScreenProvider.updateFilterActions(value: true);
      } else if (mEntrepreneurScreenProvider.mSearchController.text.isEmpty &&
          mEntrepreneurScreenProvider.mSelectedFocusAreaList.isEmpty &&
          mEntrepreneurScreenProvider.mSelectedConnectionTypesList.isEmpty &&
          mEntrepreneurScreenProvider
              .mSellingLocationsController.text.isEmpty &&
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
          mEntrepreneurScreenProvider
              .mSellingLocationsController.text.isEmpty &&
          mEntrepreneurScreenProvider.mSuppliersController.text.isEmpty) {
        mEntrepreneurScreenProvider.updateFilterActions(value: false);
      }
    });
    mEntrepreneurScreenProvider.mSellingLocationsController.addListener(() {
      if (mEntrepreneurScreenProvider
          .mSellingLocationsController.text.isNotEmpty) {
        mEntrepreneurScreenProvider.updateFilterActions(value: true);
      } else if (mEntrepreneurScreenProvider.mSearchController.text.isEmpty &&
          mEntrepreneurScreenProvider.mSelectedFocusAreaList.isEmpty &&
          mEntrepreneurScreenProvider.mSelectedConnectionTypesList.isEmpty &&
          mEntrepreneurScreenProvider
              .mSellingLocationsController.text.isEmpty &&
          mEntrepreneurScreenProvider.mSuppliersController.text.isEmpty) {
        mEntrepreneurScreenProvider.updateFilterActions(value: false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool? load = widget.loadWidget;
    return Consumer<EntrepreneurScreenProvider>(
      builder: (context, _provider, widget) {
        return Obx(
          () => Column(
            children: [
              Responsive.isDesktop(context) || Responsive.isTablet(context)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: 'Entrepreneurs'.tr(),
                              color: newRed,
                              size: 35,
                              weight: FontWeight.bold,
                            ),
                            SizedBox(
                              width: getWidth(context) * 0.03,
                            ),
                            OnHover(
                              builder: (hover) => InkWell(
                                onTap: () {
                                  _provider.updateDisplayWidget(
                                      mIsShowMapWidget: true);
                                  setState(() {});
                                },
                                hoverColor:
                                    hover ? hoverColor : Colors.transparent,
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: _provider.isMapDisplay
                                        ? lightGreen
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: FaIcon(
                                      Icons.location_on_rounded,
                                      color: _provider.isMapDisplay
                                          ? Colors.white
                                          : Color(0xff333333),
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: getWidth(context) * 0.005,
                            ),
                            InkWell(
                              onTap: () {
                                _provider.updateDisplayWidget(
                                    mIsShowMapWidget: false);
                                setState(() {});
                              },
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: _provider.isMapDisplay
                                      ? Colors.white
                                      : lightGreen,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.04),
                                        offset: Offset(0, 15),
                                        blurRadius: 25),
                                  ],
                                ),
                                child: Center(
                                  child: FaIcon(
                                    Icons.view_list,
                                    color: _provider.isMapDisplay
                                        ? Color(0xff333333)
                                        : Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OnHover(
                              builder: (hover) {
                                return AnimatedContainer(
                                  alignment: Alignment.center,
                                  duration: const Duration(milliseconds: 400),
                                  height: 45,
                                  width: _provider.searchTapped ? 200 : 45,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: _provider.searchTapped
                                        ? HexColor('#FFFFFF')
                                        : hover
                                            ? lightGreen
                                            : HexColor('#FFFFFF'),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.04),
                                        offset: Offset(0, 15),
                                        blurRadius: 25,
                                      )
                                    ],
                                  ),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        if (_provider.searchTapped)
                                          Expanded(
                                            child: TextField(
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                contentPadding: EdgeInsets.only(
                                                    left: 10, bottom: 5),
                                              ),
                                              onSubmitted: (v) async {
                                                setState(
                                                  () {
                                                    _provider
                                                        .mSuppliersController
                                                        .clear();
                                                    _provider
                                                        .mSellingLocationsController
                                                        .clear();
                                                    _provider
                                                        .mSelectedFocusAreaList
                                                        .clear();
                                                    _provider
                                                        .mSelectedConnectionTypesList
                                                        .clear();
                                                  },
                                                );
                                                await _provider
                                                    .getEntrepreneur(false);
                                                setState(() {});
                                              },
                                              controller:
                                                  _provider.mSearchController,
                                              autofocus: true,
                                            ),
                                          ),
                                        SizedBox(
                                          height: 45,
                                          width: 45,
                                          child: OnHover(
                                            builder: (hover) => InkWell(
                                              onTap: () async {
                                                if (_provider.mSearchController
                                                    .text.isEmpty) {
                                                  if (_provider.searchTapped) {
                                                    setState(
                                                      () {
                                                        _provider.searchTapped =
                                                            !_provider
                                                                .searchTapped;
                                                      },
                                                    );
                                                    setState(
                                                      () {
                                                        _provider
                                                            .mSearchController
                                                            .clear();
                                                        _provider
                                                            .mSuppliersController
                                                            .clear();
                                                        _provider
                                                            .mSellingLocationsController
                                                            .clear();
                                                        _provider
                                                            .mSelectedFocusAreaList
                                                            .clear();
                                                        _provider
                                                            .mSelectedConnectionTypesList
                                                            .clear();
                                                      },
                                                    );
                                                    await _provider
                                                        .getEntrepreneur(false)
                                                        .then((value) {
                                                      setState(() {});
                                                    });
                                                  } else {
                                                    setState(
                                                      () {
                                                        _provider.searchTapped =
                                                            !_provider
                                                                .searchTapped;
                                                      },
                                                    );
                                                  }
                                                } else {
                                                  setState(
                                                    () {
                                                      _provider
                                                          .mSuppliersController
                                                          .clear();
                                                      _provider
                                                          .mSellingLocationsController
                                                          .clear();
                                                      _provider
                                                          .mSelectedFocusAreaList
                                                          .clear();
                                                      _provider
                                                          .mSelectedConnectionTypesList
                                                          .clear();
                                                    },
                                                  );
                                                  await _provider
                                                      .getEntrepreneur(false)
                                                      .then((value) {
                                                    setState(() {});
                                                  });
                                                }
                                              },
                                              hoverColor: Colors.transparent,
                                              child: Icon(
                                                Icons.search,
                                                color: _provider.searchTapped
                                                    ? secondary
                                                    : hover
                                                        ? Colors.white
                                                        : secondary,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              width: 11,
                            ),
                            IconHoverButton(
                              icons: FontAwesomeIcons.filter,
                              isClick: _provider.isFilter,
                              widthSize: 63,
                              onPress: () {
                                setState(
                                  () {
                                    _provider.isFilter = !_provider.isFilter;
                                  },
                                );
                              },
                            ),
                            SizedBox(width: 11),
                            ButtonWithAddIcon(
                              text: 'Entrepreneurs'.tr(),
                              onPressed: () {
                                setState(() {
                                  _provider.clearAllFields();
                                });
                                showDialog(
                                  context: context,
                                  builder: (c) {
                                    return AlertDialog(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Add Entrepreneurs".tr(),
                                            style: TextStyle(
                                              fontFamily: Montserrat_Medium,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  Responsive.isDesktop(context)
                                                      ? 18
                                                      : 14,
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
                                      content:
                                          OrganizationSelectionDialogWidget(),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: 'Entrepreneurs'.tr(),
                              color: newRed,
                              size: 35,
                              weight: FontWeight.bold,
                            ),
                            SizedBox(
                              width: getWidth(context) * 0.03,
                            ),
                            OnHover(
                              builder: (hover) => InkWell(
                                onTap: () {
                                  _provider.updateDisplayWidget(
                                      mIsShowMapWidget: true);
                                  setState(() {});
                                },
                                hoverColor:
                                    hover ? hoverColor : Colors.transparent,
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: _provider.isMapDisplay
                                        ? lightGreen
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: FaIcon(
                                      Icons.location_on_rounded,
                                      color: _provider.isMapDisplay
                                          ? Colors.white
                                          : Color(0xff333333),
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: getWidth(context) * 0.005,
                            ),
                            InkWell(
                              onTap: () {
                                _provider.updateDisplayWidget(
                                    mIsShowMapWidget: false);
                                setState(() {});
                              },
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: _provider.isMapDisplay
                                      ? Colors.white
                                      : lightGreen,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.04),
                                        offset: Offset(0, 15),
                                        blurRadius: 25),
                                  ],
                                ),
                                child: Center(
                                  child: FaIcon(
                                    Icons.view_list,
                                    color: _provider.isMapDisplay
                                        ? Color(0xff333333)
                                        : Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OnHover(
                              builder: (hover) {
                                return AnimatedContainer(
                                  alignment: Alignment.center,
                                  duration: const Duration(milliseconds: 400),
                                  height: 45,
                                  width: _provider.searchTapped ? 200 : 45,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: _provider.searchTapped
                                        ? HexColor('#FFFFFF')
                                        : hover
                                            ? lightGreen
                                            : HexColor('#FFFFFF'),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.04),
                                        offset: Offset(0, 15),
                                        blurRadius: 25,
                                      )
                                    ],
                                  ),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        if (_provider.searchTapped)
                                          Expanded(
                                            child: TextField(
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                contentPadding: EdgeInsets.only(
                                                    left: 10, bottom: 5),
                                              ),
                                              onSubmitted: (v) async {
                                                setState(
                                                  () {
                                                    _provider
                                                        .mSuppliersController
                                                        .clear();
                                                    _provider
                                                        .mSellingLocationsController
                                                        .clear();
                                                    _provider
                                                        .mSelectedFocusAreaList
                                                        .clear();
                                                    _provider
                                                        .mSelectedConnectionTypesList
                                                        .clear();
                                                  },
                                                );
                                                await _provider
                                                    .getEntrepreneur(false);
                                                setState(() {});
                                              },
                                              controller:
                                                  _provider.mSearchController,
                                              autofocus: true,
                                            ),
                                          ),
                                        SizedBox(
                                          height: 45,
                                          width: 45,
                                          child: OnHover(
                                            builder: (hover) => InkWell(
                                              onTap: () async {
                                                if (_provider.mSearchController
                                                    .text.isEmpty) {
                                                  if (_provider.searchTapped) {
                                                    setState(
                                                      () {
                                                        _provider.searchTapped =
                                                            !_provider
                                                                .searchTapped;
                                                      },
                                                    );
                                                    setState(
                                                      () {
                                                        _provider
                                                            .mSearchController
                                                            .clear();
                                                        _provider
                                                            .mSuppliersController
                                                            .clear();
                                                        _provider
                                                            .mSellingLocationsController
                                                            .clear();
                                                        _provider
                                                            .mSelectedFocusAreaList
                                                            .clear();
                                                        _provider
                                                            .mSelectedConnectionTypesList
                                                            .clear();
                                                      },
                                                    );
                                                    await _provider
                                                        .getEntrepreneur(false)
                                                        .then((value) {
                                                      setState(() {});
                                                    });
                                                  } else {
                                                    setState(
                                                      () {
                                                        _provider.searchTapped =
                                                            !_provider
                                                                .searchTapped;
                                                      },
                                                    );
                                                  }
                                                } else {
                                                  setState(
                                                    () {
                                                      _provider
                                                          .mSuppliersController
                                                          .clear();
                                                      _provider
                                                          .mSellingLocationsController
                                                          .clear();
                                                      _provider
                                                          .mSelectedFocusAreaList
                                                          .clear();
                                                      _provider
                                                          .mSelectedConnectionTypesList
                                                          .clear();
                                                    },
                                                  );
                                                  await _provider
                                                      .getEntrepreneur(false)
                                                      .then((value) {
                                                    setState(() {});
                                                  });
                                                }
                                              },
                                              hoverColor: Colors.transparent,
                                              child: Icon(
                                                Icons.search,
                                                color: _provider.searchTapped
                                                    ? secondary
                                                    : hover
                                                        ? Colors.white
                                                        : secondary,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              width: 11,
                            ),
                            IconHoverButton(
                              icons: FontAwesomeIcons.filter,
                              isClick: _provider.isFilter,
                              widthSize: 63,
                              onPress: () {
                                setState(
                                  () {
                                    _provider.isFilter = !_provider.isFilter;
                                  },
                                );
                              },
                            ),
                            SizedBox(width: 11),
                            ButtonWithAddIcon(
                              text: 'Entrepreneurs'.tr(),
                              onPressed: () {
                                setState(() {
                                  _provider.clearAllFields();
                                });
                                showDialog(
                                  context: context,
                                  builder: (c) {
                                    return AlertDialog(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Add Entrepreneurs".tr(),
                                            style: TextStyle(
                                              fontFamily: Montserrat_Medium,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  Responsive.isDesktop(context)
                                                      ? 18
                                                      : 14,
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
                                      content:
                                          OrganizationSelectionDialogWidget(),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
              SizedBox(
                height: 20,
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
                        child: Wrap(
                          spacing: 12.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            SelectableDropdownWidget(
                              items: _provider
                                  .relationToWijLandDropDownModel.data!,
                              title: "Connection Type".tr(),
                              mSelectedValue:
                                  _provider.mSelectedRelationToWijLandType,
                              mSelectedItemsList:
                                  _provider.mSelectedConnectionTypesList,
                              mOnDropDownChange: (value) {
                                setState(
                                  () {
                                    _provider.mSelectedRelationToWijLandType =
                                        value as String;
                                    if (!_provider.mSelectedConnectionTypesList
                                        .contains(_provider
                                            .mSelectedRelationToWijLandType)) {
                                      _provider.mSelectedConnectionTypesList
                                          .add(_provider
                                              .mSelectedRelationToWijLandType);
                                    }
                                    _provider.mShowFilterActions = true;
                                  },
                                );
                              },
                            ),
                            SelectableDropdownWidget(
                              items: _provider.focusAreaDropDownModel.data!,
                              title: "Focus Area".tr(),
                              mSelectedValue: _provider.mSelectedFocusAreaType,
                              mSelectedItemsList:
                                  _provider.mSelectedFocusAreaList,
                              mOnDropDownChange: (value) {
                                setState(
                                  () {
                                    _provider.mSelectedFocusAreaType =
                                        value as String;
                                    if (!_provider.mSelectedFocusAreaList
                                        .contains(
                                            _provider.mSelectedFocusAreaType)) {
                                      _provider.mSelectedFocusAreaList.add(
                                          _provider.mSelectedFocusAreaType);
                                    }
                                    _provider.mShowFilterActions = true;
                                  },
                                );
                              },
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Suppliers".tr(),style: TextStyle(
                                    fontFamily: Montserrat_Medium
                                ),),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: SizedBox(
                                    width: getWidth(context) * 0.15,
                                    height: 50,
                                    child: TextFormField(
                                      controller:
                                          _provider.mSuppliersController,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Selling Locations".tr(),style: TextStyle(fontFamily: Montserrat_Medium),),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: SizedBox(
                                    width: getWidth(context) * 0.15,
                                    height: 50,
                                    child: TextFormField(
                                      controller:
                                          _provider.mSellingLocationsController,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                            _provider.mShowFilterActions
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () async {
                                          showLoadingWidget.value = true;
                                          await _provider
                                              .getEntrepreneur(false);
                                          setState(() {});
                                          showLoadingWidget.value = false;
                                        },
                                        child: Text("Apply".tr(),style: TextStyle(fontFamily: Montserrat_Medium),),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          showLoadingWidget.value = true;
                                          setState(
                                            () {
                                              _provider.mSearchController
                                                  .clear();
                                              _provider.mSuppliersController
                                                  .clear();
                                              _provider
                                                  .mSellingLocationsController
                                                  .clear();
                                              _provider.mSelectedFocusAreaList
                                                  .clear();
                                              _provider
                                                  .mSelectedConnectionTypesList
                                                  .clear();
                                            },
                                          );
                                          await _provider
                                              .getEntrepreneur(false);
                                          setState(() {});
                                          showLoadingWidget.value = false;
                                        },
                                        child: Text("Clear Filters".tr(),style: TextStyle(fontFamily: Montserrat_Medium),),
                                      ),
                                    ],
                                  )
                                : SizedBox()
                          ],
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              showLoadingWidget.value || !load!
                  ? Expanded(
                      child: ListView.builder(
                        controller: ScrollController(),
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
                        itemCount: 50,
                      ),
                      // height: getHeight(context),
                      // width: getWidth(context),
                    )
                  : _provider.mEntrepreneurData.data == null ||
                          _provider.mEntrepreneurData.data!.isEmpty
                      ? SizedBox(
                          child: Center(child: Text("No Data Found".tr(),style: TextStyle(fontFamily: Montserrat_Medium),)),
                          height: getHeight(context) / 2,
                        )
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
          ),
        );
      },
    );
  }
}
