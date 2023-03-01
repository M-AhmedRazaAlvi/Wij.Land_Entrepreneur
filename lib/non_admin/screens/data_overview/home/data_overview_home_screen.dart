import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/utils/hex_color.dart';
import 'package:wij_land/utils/styles.dart';
import '../../../providers/data_overview_provider/data_overview_screen_provider.dart';

class DataOverViewHomeScreen extends StatefulWidget {
  const DataOverViewHomeScreen({Key? key}) : super(key: key);

  @override
  State<DataOverViewHomeScreen> createState() => _DataOverViewHomeScreenState();
}

class _DataOverViewHomeScreenState extends State<DataOverViewHomeScreen> {
  @override
  void initState() {
    super.initState();

    var provider = Provider.of<DataOverViewProvider>(context, listen: false);
    provider.getDataOverViewDataByComponent(tag: provider.mCategoriesList[0]);
    provider.selIndex = 0;
    provider.mSelectedInnerList = provider.mLeftMenuLists[0];

    if (mounted) {
      provider.mSearchController.addListener(() {
        if (provider.mSearchController.text.isNotEmpty) {
          provider.searchData(
            mCategoryName: provider.mSelectedInnerList,
            mSearchedText: provider.mSearchController.text,
          );
          setState(() {
            provider.mShowSearchedListWidget = true;
          });
        } else {
          setState(() {
            provider.mShowSearchedListWidget = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F5F5F5"),
      body: Consumer<DataOverViewProvider>(
        builder: (context, _provider, widget) {
          return Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, top: 15),
                  child: Row(
                    children: [
                      Text(
                        "Farm Data".tr(),
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                            color: HexColor("#892913"),
                            fontSize: 22.0,
                            fontWeight: FontWeight.w800,
                            textStyle:
                                TextStyle(fontFamily: Montserrat_Medium)),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 14,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      child: Container(
                        width: 259,
                        color: Colors.white,
                        child: ListView.builder(
                          itemCount: _provider.mLeftMenuLists.length,
                          itemBuilder: (context, index) {
                            return ExpansionTile(
                              title: Padding(
                                padding: EdgeInsets.only(
                                    top: _provider.selectedIndex == 0 ? 0 : 10),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  child: Text(
                                    _provider.mLeftMenuLists[index].tabTitle
                                        .tr(),
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.montserrat(
                                        color: HexColor("#000000"),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w700,
                                        textStyle: TextStyle(
                                            fontFamily: Montserrat_Medium)),
                                  ),
                                ),
                              ),
                              iconColor: Colors.transparent,
                              collapsedIconColor: Colors.transparent,
                              collapsedBackgroundColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              initiallyExpanded: index == 0 ? true : false,
                              onExpansionChanged: (value) async {
                                if (value) {
                                  _provider.selIndex = index;

                                  _provider.getDataOverViewDataByComponent(
                                      tag: _provider.mCategoriesList[index]);
                                  setState(() {
                                    _provider.mSelectedInnerList =
                                        _provider.mLeftMenuLists[index];
                                  });
                                }
                                print("Clicked On : $value");
                              },
                              children: _provider
                                  .mLeftMenuLists[index].listProduct
                                  .map(
                                    (e) => ListTile(
                                      onTap: () async {
                                        _provider.selIndex = index;
                                        _provider
                                            .getDataOverViewDataByComponent(
                                                tag: _provider
                                                    .mCategoriesList[index]);
                                        setState(() {
                                          _provider.mSelectedInnerList =
                                              _provider.mLeftMenuLists[index];
                                        });
                                      },
                                      title: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Text(e.title.tr(),
                                          // capitalizeAllSentence(e.title
                                          //     .replaceAll("a_", "")
                                          //     .replaceAll("b_", "")
                                          //     .replaceAll("c_", "")
                                          //     .replaceAll("d_", "")
                                          //     .replaceAll("e_", "")
                                          //     .replaceAll("f_", "")
                                          //     .replaceAll("g_", "")
                                          //     .replaceAll("h_", "")
                                          //     .replaceAll("i_", "")
                                          //     .replaceAll("j_", "")
                                          //     .replaceAll("k_", "")
                                          //     .replaceAll("_", " ")),
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.montserrat(
                                              color: HexColor("#000000"),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              textStyle: TextStyle(
                                                  fontFamily:
                                                      Montserrat_Medium)),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 13),
                    _provider.mShowLoading
                        ? Expanded(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 13),
                              child: Container(
                                color: Colors.white,
                                child: CustomScrollView(
                                  slivers: [
                                    SliverToBoxAdapter(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 28, vertical: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                _provider
                                                    .mSelectedInnerList.tabTitle
                                                    .tr(),
                                                style: GoogleFonts.montserrat(
                                                    color: HexColor("#379C08"),
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.w700,
                                                    textStyle: TextStyle(
                                                        fontFamily:
                                                            Montserrat_Medium)),
                                              ),
                                            ),
                                            _provider.mShowSearchBar
                                                ? Expanded(
                                                    child: Container(
                                                      color: Colors.grey[200],
                                                      width: 200,
                                                      height: 45,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 10),
                                                        child: TextFormField(
                                                          controller: _provider
                                                              .mSearchController,
                                                          decoration:
                                                              InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            suffixIcon:
                                                                IconButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  _provider
                                                                          .mShowSearchBar =
                                                                      false;
                                                                  _provider
                                                                      .mSearchController
                                                                      .clear();
                                                                });
                                                              },
                                                              icon: Icon(
                                                                CupertinoIcons
                                                                    .clear,
                                                                size: 18,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : SizedBox.shrink(),
                                            _provider.mShowSearchBar
                                                ? SizedBox.shrink()
                                                : IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        _provider
                                                                .mShowSearchBar =
                                                            true;
                                                      });
                                                    },
                                                    icon: Icon(
                                                      CupertinoIcons.search,
                                                      size: 18,
                                                    ),
                                                  )
                                          ],
                                        ),
                                      ),
                                    ),
                                    _provider.mShowSearchedListWidget
                                        ? SliverList(
                                            delegate:
                                                SliverChildBuilderDelegate(
                                                    (context, index) {
                                              return Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 28,
                                                        vertical: 15),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            _provider.searchedList[
                                                                    index][3] ??
                                                                "",
                                                            style: GoogleFonts
                                                                .montserrat(
                                                              color: HexColor(
                                                                  "#000000"),
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            _provider.searchedList[
                                                                            index]
                                                                        [1] ==
                                                                    null
                                                                ? ""
                                                                : _provider
                                                                    .searchedList[
                                                                        index]
                                                                        [1]
                                                                    .toString(),
                                                            style: GoogleFonts
                                                                .montserrat(
                                                              color: HexColor(
                                                                  "#000000"),
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            _provider.searchedList[
                                                                            index]
                                                                        [2] ==
                                                                    null
                                                                ? ""
                                                                : DateFormat(
                                                                        'dd.MM.yyyy')
                                                                    .format(DateTime.parse(
                                                                        _provider.searchedList[index]
                                                                            [
                                                                            2]))
                                                                    .toString(),
                                                            style: GoogleFonts
                                                                .montserrat(
                                                              color: HexColor(
                                                                  "#000000"),
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            _provider.searchedList[
                                                                            index]
                                                                        [6] ==
                                                                    "null"
                                                                ? ""
                                                                : _provider.searchedList[
                                                                            index]
                                                                        [6] ??
                                                                    "",
                                                            style: GoogleFonts
                                                                .montserrat(
                                                              color: HexColor(
                                                                  "#000000"),
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 10),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 10),
                                                          child: InkWell(
                                                            onTap: () {
                                                              _provider.getOverviewHistory(
                                                                  mKeyName: _provider
                                                                      .searchedList[
                                                                          index]
                                                                          [0]
                                                                      .toString(),
                                                                  context:
                                                                      context,
                                                                  mName: _provider
                                                                          .searchedList[
                                                                      index][3]);
                                                            },
                                                            child: Icon(
                                                              Icons.history,
                                                              size: 18,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),

                                                  // AccordionSection(
                                                  //   isOpen: _provider.expandedListForSearch[index],
                                                  //   index: index,
                                                  //   headerBackgroundColor: Colors.white,
                                                  //   headerBackgroundColorOpened: Colors.white,
                                                  //   contentBorderWidth: 0,
                                                  //   contentBorderColor: Colors.transparent,
                                                  //   contentBackgroundColor: Colors.transparent,
                                                  //   header: Padding(
                                                  //     padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 15),
                                                  //     child: Row(
                                                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  //       children: [
                                                  //         Expanded(
                                                  //           child: Text(
                                                  //             _provider.searchedList[index][3] ?? "",
                                                  //             style: GoogleFonts.montserrat(
                                                  //               color: HexColor("#000000"),
                                                  //               fontSize: 14.0,
                                                  //               fontWeight: FontWeight.w400,
                                                  //             ),
                                                  //           ),
                                                  //         ),
                                                  //         Expanded(
                                                  //           child: Text(
                                                  //             _provider.searchedList[index][1] == null
                                                  //                 ? ""
                                                  //                 : _provider.searchedList[index][1].toString(),
                                                  //             style: GoogleFonts.montserrat(
                                                  //               color: HexColor("#000000"),
                                                  //               fontSize: 14.0,
                                                  //               fontWeight: FontWeight.w400,
                                                  //             ),
                                                  //           ),
                                                  //         ),
                                                  //         Expanded(
                                                  //           child: Text(
                                                  //             _provider.searchedList[index][2] == null
                                                  //                 ? ""
                                                  //                 : DateFormat('dd.MM.yyyy')
                                                  //                     .format(DateTime.parse(_provider.searchedList[index][2]))
                                                  //                     .toString(),
                                                  //             style: GoogleFonts.montserrat(
                                                  //               color: HexColor("#000000"),
                                                  //               fontSize: 14.0,
                                                  //               fontWeight: FontWeight.w400,
                                                  //             ),
                                                  //           ),
                                                  //         ),
                                                  //         SizedBox(width: 30),
                                                  //         Padding(
                                                  //           padding: const EdgeInsets.only(right: 10),
                                                  //           child: Icon(
                                                  //             Icons.history,
                                                  //             size: 18,
                                                  //           ),
                                                  //         )
                                                  //       ],
                                                  //     ),
                                                  //   ),
                                                  //   content: SizedBox.shrink(),
                                                  //   //
                                                  //   // content: Column(
                                                  //   //   children: _provider.showLoadingForHistory
                                                  //   //       ? [
                                                  //   //           Center(
                                                  //   //             child: CircularProgressIndicator(),
                                                  //   //           )
                                                  //   //         ]
                                                  //   //       : _provider.historyList
                                                  //   //           .map(
                                                  //   //             (e) => ListTile(
                                                  //   //               title: Padding(
                                                  //   //                 padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 15),
                                                  //   //                 child: Row(
                                                  //   //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  //   //                   children: [
                                                  //   //                     Expanded(
                                                  //   //                       child: Text(
                                                  //   //                         "",
                                                  //   //                         style: GoogleFonts.montserrat(
                                                  //   //                           color: HexColor("#000000"),
                                                  //   //                           fontSize: 14.0,
                                                  //   //                           fontWeight: FontWeight.w400,
                                                  //   //                         ),
                                                  //   //                       ),
                                                  //   //                     ),
                                                  //   //                     Expanded(
                                                  //   //                       child: Text(
                                                  //   //                         e.value == null ? "" : e.value.toString(),
                                                  //   //                         style: GoogleFonts.montserrat(
                                                  //   //                           color: HexColor("#000000"),
                                                  //   //                           fontSize: 14.0,
                                                  //   //                           fontWeight: FontWeight.w400,
                                                  //   //                         ),
                                                  //   //                       ),
                                                  //   //                     ),
                                                  //   //                     Expanded(
                                                  //   //                       child: Text(
                                                  //   //                         e.dateChanged == null
                                                  //   //                             ? ""
                                                  //   //                             : DateFormat('dd.MM.yyyy')
                                                  //   //                                 .format(DateTime.parse(e.dateChanged!))
                                                  //   //                                 .toString(),
                                                  //   //                         style: GoogleFonts.montserrat(
                                                  //   //                           color: HexColor("#000000"),
                                                  //   //                           fontSize: 14.0,
                                                  //   //                           fontWeight: FontWeight.w400,
                                                  //   //                         ),
                                                  //   //                       ),
                                                  //   //                     ),
                                                  //   //                   ],
                                                  //   //                 ),
                                                  //   //               ),
                                                  //   //               trailing: Padding(
                                                  //   //                 padding: const EdgeInsets.only(right: 20),
                                                  //   //                 child: Icon(
                                                  //   //                   Icons.history,
                                                  //   //                   size: 18,
                                                  //   //                   color: Colors.transparent,
                                                  //   //                 ),
                                                  //   //               ),
                                                  //   //             ),
                                                  //   //           )
                                                  //   //           .toList(),
                                                  //   // ),
                                                  //   contentHorizontalPadding: 20,
                                                  //   onOpenSection: () {
                                                  //     for (var i = 0; i < _provider.expandedListForSearch.length; i++) {
                                                  //       _provider.expandedListForSearch[i] = false;
                                                  //     }
                                                  //     _provider.expandedListForSearch[index] = true;
                                                  //     setState(() {});
                                                  //     _provider.getOverviewHistory(
                                                  //         mKeyName: _provider.searchedList[index][0].toString(),
                                                  //         context: context,
                                                  //         mName: _provider.searchedList[index][3]);
                                                  //     //  print("Expanded List : $_provider.expandedListForSearch}");
                                                  //   },
                                                  //   // onOpenSection: () => print('onOpenSection ...'),
                                                  //   // onCloseSection: () => print('onCloseSection ...'),
                                                  // ),
                                                  Divider(
                                                    color: HexColor("#E5E5E5"),
                                                    height: 1,
                                                    endIndent: 20,
                                                    indent: 20,
                                                  )
                                                ],
                                              );
                                            },
                                                    childCount: _provider
                                                        .searchedList.length),
                                          )
                                        : SliverList(
                                            delegate:
                                                SliverChildBuilderDelegate(
                                              (context, index) {
                                                return Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 18),
                                                      child: Container(
                                                        height: 38,
                                                        color:
                                                            HexColor('#F5F5F5'),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title.tr(),
                                                                // capitalizeAllSentence(_provider
                                                                //     .mSelectedInnerList
                                                                //     .listProduct[
                                                                //         index]
                                                                //     .title
                                                                //     .replaceAll(
                                                                //         "a_",
                                                                //         "")
                                                                //     .replaceAll(
                                                                //         "b_",
                                                                //         "")
                                                                //     .replaceAll(
                                                                //         "c_",
                                                                //         "")
                                                                //     .replaceAll(
                                                                //         "d_",
                                                                //         "")
                                                                //     .replaceAll(
                                                                //         "e_",
                                                                //         "")
                                                                //     .replaceAll(
                                                                //         "f_",
                                                                //         "")
                                                                //     .replaceAll(
                                                                //         "g_",
                                                                //         "")
                                                                //     .replaceAll(
                                                                //         "h_",
                                                                //         "")
                                                                //     .replaceAll(
                                                                //         "i_",
                                                                //         "")
                                                                //     .replaceAll(
                                                                //         "j_",
                                                                //         "")
                                                                //     .replaceAll(
                                                                //         "k_",
                                                                //         "")
                                                                //     .replaceAll(
                                                                //         "_",
                                                                //         " ")),
                                                                style: GoogleFonts.montserrat(
                                                                    color: HexColor(
                                                                        "#000000"),
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    textStyle: TextStyle(
                                                                        fontFamily:
                                                                            Montserrat_Medium)),
                                                              ),
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.3,
                                                                child: Row(
                                                                  children: [
                                                                    _provider
                                                                            .mSelectedInnerList
                                                                            .listProduct[
                                                                                index]
                                                                            .showSeeMore
                                                                        ? TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              setState(() {
                                                                                _provider.mSelectedInnerList.listProduct[index].showSeeMore = !_provider.mSelectedInnerList.listProduct[index].showSeeMore;
                                                                              });
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              "See more".tr(),
                                                                              style: TextStyle(fontFamily: Montserrat_Medium),
                                                                            ),
                                                                          )
                                                                        : SizedBox
                                                                            .shrink(),
                                                                    _provider
                                                                            .mSelectedInnerList
                                                                            .listProduct[index]
                                                                            .isEditable
                                                                        ? TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              for (var i = 0; i < _provider.mSelectedInnerList.listProduct.length; i++) {
                                                                                setState(() {
                                                                                  _provider.mSelectedInnerList.listProduct[i].isEditable = false;
                                                                                });
                                                                              }
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              "CANCEL".tr(),
                                                                              style: TextStyle(color: HexColor("#000000"), fontSize: 14.0, fontWeight: FontWeight.bold, fontFamily: Montserrat_Medium),
                                                                            ),
                                                                          )
                                                                        : IconButton(
                                                                            onPressed:
                                                                                () {
                                                                              _provider.multiActivities.clear();
                                                                              _provider.multiAlternativeBusiness.clear();
                                                                              _provider.multiFertilizerType.clear();
                                                                              _provider.multiByProductsList.clear();
                                                                              _provider.multiSocialMedia.clear();
                                                                              _provider.editList.clear();
                                                                              for (int i = 0; i < _provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title].length; i++) {
                                                                                if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2] != null) {
                                                                                  if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2] == true || _provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2] == "true") {
                                                                                    _provider.editList.add("Yes");
                                                                                  } else if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2] == false || _provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2] == "false") {
                                                                                    _provider.editList.add("No");
                                                                                  } else if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][5].contains("multiple_select")) {
                                                                                    if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][5] == "multiple_select_activities") {
                                                                                      for (int x = 0; x < _provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2].split(",").length; x++) {
                                                                                        _provider.multiActivities.add('"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2].split(",")[x].replaceAll(" ", "").toString()}"');
                                                                                      }
                                                                                      _provider.editList.add([
                                                                                        _provider.multiActivities
                                                                                      ]);
                                                                                    }
                                                                                    if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][5] == "multiple_select_alternative_business") {
                                                                                      for (int x = 0; x < _provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2].split(",").length; x++) {
                                                                                        _provider.multiAlternativeBusiness.add('"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2].split(",")[x].replaceAll(" ", "").toString()}"');
                                                                                      }
                                                                                      _provider.editList.add([
                                                                                        _provider.multiAlternativeBusiness
                                                                                      ]);
                                                                                    }
                                                                                    if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][5] == "multiple_select_fertilizer_type") {
                                                                                      for (int x = 0; x < _provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2].split(",").length; x++) {
                                                                                        _provider.multiFertilizerType.add('"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2].split(",")[x].replaceAll(" ", "").toString()}"');
                                                                                      }
                                                                                      _provider.editList.add([
                                                                                        _provider.multiFertilizerType
                                                                                      ]);
                                                                                    }
                                                                                    if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][5] == "multiple_select_by_products_list") {
                                                                                      for (int x = 0; x < _provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2].split(",").length; x++) {
                                                                                        _provider.multiByProductsList.add('"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2].split(",")[x].replaceAll(" ", "").toString()}"');
                                                                                      }
                                                                                      _provider.editList.add([
                                                                                        _provider.multiByProductsList
                                                                                      ]);
                                                                                    }
                                                                                    if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][5] == "multiple_select_social_media") {
                                                                                      for (int x = 0; x < _provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2].split(",").length; x++) {
                                                                                        _provider.multiSocialMedia.add('"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2].split(",")[x].replaceAll(" ", "").toString()}"');
                                                                                      }
                                                                                      _provider.editList.add([
                                                                                        _provider.multiSocialMedia
                                                                                      ]);
                                                                                    }
                                                                                  } else {
                                                                                    _provider.editList.add("${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2]}");
                                                                                  }
                                                                                } else {
                                                                                  _provider.editList.add(null);
                                                                                }
                                                                              }
                                                                              debugPrint("object${_provider.editList}");
                                                                              print(_provider.multiSocialMedia);
                                                                              for (var i = 0; i < _provider.mSelectedInnerList.listProduct.length; i++) {
                                                                                setState(() {
                                                                                  _provider.mSelectedInnerList.listProduct[i].isEditable = false;
                                                                                });
                                                                              }
                                                                              setState(() {
                                                                                _provider.mSelectedInnerList.listProduct[index].isEditable = !_provider.mSelectedInnerList.listProduct[index].isEditable;
                                                                              });
                                                                            },
                                                                            icon:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.edit,
                                                                              size: 15,
                                                                            ),
                                                                          ),
                                                                    _provider
                                                                            .mSelectedInnerList
                                                                            .listProduct[
                                                                                index]
                                                                            .isEditable
                                                                        ? Container(
                                                                            color:
                                                                                HexColor("#F9ED32"),
                                                                            child:
                                                                                IconButton(
                                                                              onPressed: () async {
                                                                                _provider.parList.clear();
                                                                                for (int i = 0; i < _provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title].length; i++) {
                                                                                  _provider.parList.add("${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][6]}");
                                                                                }
                                                                                String parentData = "";
                                                                                Map<String, dynamic> responseData;
                                                                                for (int y = 0; y < _provider.parList.toSet().toList().length; y++) {
                                                                                  String childData = "";
                                                                                  for (int i = 0; i < _provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title].length; i++) {
                                                                                    if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][6] == _provider.parList.toSet().toList()[y]) {
                                                                                      if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][5] == "number_input") {
                                                                                        if (_provider.editList[i] == null) {
                                                                                          if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2] != null) {
                                                                                            childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2]}",';
                                                                                          } else {
                                                                                            childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":${_provider.editList[i]},';
                                                                                          }
                                                                                        } else {
                                                                                          childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":"${_provider.editList[i]}",';
                                                                                        }
                                                                                      } else if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][5] == "text_input") {
                                                                                        if (_provider.editList[i] == null) {
                                                                                          if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2] != null) {
                                                                                            childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2]}",';
                                                                                          } else {
                                                                                            childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":${_provider.editList[i]},';
                                                                                          }
                                                                                        } else {
                                                                                          childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":"${_provider.editList[i]}",';
                                                                                        }
                                                                                      } else if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][5] == "html_text_field") {
                                                                                        if (_provider.editList[i] == null) {
                                                                                          if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2] != null) {
                                                                                            childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2]}",';
                                                                                          } else {
                                                                                            childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":${_provider.editList[i]},';
                                                                                          }
                                                                                        } else {
                                                                                          childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":"${_provider.editList[i]}",';
                                                                                        }
                                                                                      } else if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][5].contains("select_dropdown_")) {
                                                                                        if (_provider.editList[i] == null) {
                                                                                          if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2] != null) {
                                                                                            childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":["${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2]}"],';
                                                                                          } else {
                                                                                            childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":${_provider.editList[i]},';
                                                                                          }
                                                                                        } else {
                                                                                          childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":["${_provider.editList[i]}"],';
                                                                                        }
                                                                                      } else if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][5].contains("multiple_select")) {
                                                                                        if (_provider.editList[i] == null) {
                                                                                          if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2] != null) {
                                                                                            childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2]}",';
                                                                                          } else {
                                                                                            childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":${_provider.editList[i]},';
                                                                                          }
                                                                                        } else {
                                                                                          if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][5] == "multiple_select_by_products_list") {
                                                                                            childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":${_provider.multiByProductsList},';
                                                                                          }
                                                                                          if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][5] == "multiple_select_fertilizer_type") {
                                                                                            childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":${_provider.multiFertilizerType},';
                                                                                          }
                                                                                          if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][5] == "multiple_select_alternative_business") {
                                                                                            childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":${_provider.multiAlternativeBusiness},';
                                                                                          }
                                                                                          if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][5] == "multiple_select_activities") {
                                                                                            childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":${_provider.multiActivities},';
                                                                                          }
                                                                                          if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][5] == "multiple_select_social_media") {
                                                                                            childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":${_provider.multiSocialMedia},';
                                                                                          }
                                                                                        }
                                                                                      } else if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][5] == "bool_dropdown") {
                                                                                        if (_provider.editList[i] == null) {
                                                                                          if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2] != null) {
                                                                                            childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2]},';
                                                                                          } else {
                                                                                            childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":${_provider.editList[i]},';
                                                                                          }
                                                                                        } else {
                                                                                          if (_provider.editList[i] == "Yes") {
                                                                                            childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":"true",';
                                                                                          } else {
                                                                                            childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":"false",';
                                                                                          }
                                                                                        }
                                                                                      } else if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][5] == "date_input") {
                                                                                        if (_provider.editList[i] == null) {
                                                                                          if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2] != null) {
                                                                                            childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2]}",';
                                                                                          } else {
                                                                                            childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":${_provider.editList[i]},';
                                                                                          }
                                                                                        } else {
                                                                                          childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":"${_provider.editList[i]}",';
                                                                                        }
                                                                                      } else {
                                                                                        if (_provider.editList[i] == null) {
                                                                                          if (_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2] != null) {
                                                                                            childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][2]}",';
                                                                                          } else {
                                                                                            childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":${_provider.editList[i]},';
                                                                                          }
                                                                                        } else {
                                                                                          childData = childData + '"${_provider.mDataOverViewData[_provider.mSelectedInnerList.listProduct[index].title][i][1]}":"${_provider.editList[i]}",';
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                  parentData = _provider.parList.toSet().toList().length != y + 1 ? parentData + '"${_provider.parList.toSet().toList()[y]}":{${childData.substring(0, childData.length - 1)}},' : parentData + '"${_provider.parList.toSet().toList()[y]}":{${childData.substring(0, childData.length - 1)}}';
                                                                                }
                                                                                print(parentData.toString());
                                                                                responseData = json.decode("{$parentData}");
                                                                                await _provider.updateDataOverViewRecords(requestObject: responseData);
                                                                                _provider.mSelectedInnerList.listProduct[index].isEditable = false;
                                                                              },
                                                                              icon: Icon(
                                                                                Icons.save,
                                                                                color: Colors.black,
                                                                                size: 18,
                                                                              ),
                                                                            ),
                                                                          )
                                                                        : SizedBox
                                                                            .shrink()
                                                                  ],
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      children: listWidget(
                                                        provider: _provider,
                                                        mDataOverviewResponse:
                                                            _provider
                                                                .mDataOverViewData,
                                                        isGeneralCategoryOne: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "d_company_basics"
                                                            ? true
                                                            : false,
                                                        isGeneralCategoryTwo: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "b_country"
                                                            ? true
                                                            : false,
                                                        isGeneralCategoryThree: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "a_farm_basics"
                                                            ? true
                                                            : false,
                                                        isGeneralCategoryFour: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "c_soil_type"
                                                            ? true
                                                            : false,
                                                        isFloraCategoryOne: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "b_erfinrichting"
                                                            ? true
                                                            : false,
                                                        isFloraCategoryTwo: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "e_kruidenrijk"
                                                            ? true
                                                            : false,
                                                        isFloraCategoryThree: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "a_landschapselementen"
                                                            ? true
                                                            : false,
                                                        isFloraCategoryFour: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "d_pesticides"
                                                            ? true
                                                            : false,
                                                        isFloraCategoryFive: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "c_weidevogels"
                                                            ? true
                                                            : false,
                                                        isWaterCategoryOne: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "a_water_component"
                                                            ? true
                                                            : false,
                                                        isBottomsCategoryOne: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "d_application"
                                                            ? true
                                                            : false,
                                                        isBottomsCategoryFive: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "f_method"
                                                            ? true
                                                            : false,
                                                        isBottomsCategoryEleven: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "b_permanent_grassland"
                                                            ? true
                                                            : false,
                                                        isBottomsCategoryEight: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "i_soilbalance"
                                                            ? true
                                                            : false,
                                                        isBottomsCategoryFour: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "e_fertilizer_on_silage_maize"
                                                            ? true
                                                            : false,
                                                        isBottomsCategoryNine: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "j_soilimprovement"
                                                            ? true
                                                            : false,
                                                        isBottomsCategorySeven: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "h_phosphate"
                                                            ? true
                                                            : false,
                                                        isBottomsCategorySix: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "c_nitrogen"
                                                            ? true
                                                            : false,
                                                        isBottomsCategoryTen: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "k_soilstructure"
                                                            ? true
                                                            : false,
                                                        isBottomsCategoryThree: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "g_fertilizer"
                                                            ? true
                                                            : false,
                                                        isBottomsCategoryTwo: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "a_fertilization"
                                                            ? true
                                                            : false,
                                                        isDierVoerCategoryFive: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "e_milk"
                                                            ? true
                                                            : false,
                                                        isDierVoerCategoryFour: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "b_grazing"
                                                            ? true
                                                            : false,
                                                        isDierVoerCategoryOne: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "d_animal_health_welfare"
                                                            ? true
                                                            : false,
                                                        isDierVoerCategoryThree: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "c_food"
                                                            ? true
                                                            : false,
                                                        isDierVoerCategoryTwo: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "a_animals"
                                                            ? true
                                                            : false,
                                                        isKlimateEnergyCategoryOne: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "b_broeikasgassen"
                                                            ? true
                                                            : false,
                                                        isKlimateEnergyCategoryTwo: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "a_energie"
                                                            ? true
                                                            : false,
                                                        isOperationCategoryFive: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "e_side_branches"
                                                            ? true
                                                            : false,
                                                        isOperationCategoryFour: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "d_regulations"
                                                            ? true
                                                            : false,
                                                        isOperationCategoryOne: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "a_chain_relationships"
                                                            ? true
                                                            : false,
                                                        isOperationCategoryThree: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "c_land"
                                                            ? true
                                                            : false,
                                                        isOperationCategoryTwo: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "b_labour"
                                                            ? true
                                                            : false,
                                                        isSocietyCategoryFive: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "e_knowledge_development"
                                                            ? true
                                                            : false,
                                                        isSocietyCategoryFour: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "d_job_satisfaction"
                                                            ? true
                                                            : false,
                                                        isSocietyCategoryOne: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "a_culture_identity"
                                                            ? true
                                                            : false,
                                                        isSocietyCategorySix: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "f_visibility"
                                                            ? true
                                                            : false,
                                                        isSocietyCategoryThree: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "c_involvement"
                                                            ? true
                                                            : false,
                                                        isSocietyCategoryTwo: _provider
                                                                    .mSelectedInnerList
                                                                    .listProduct[
                                                                        index]
                                                                    .title ==
                                                                "b_future_proof"
                                                            ? true
                                                            : false,
                                                        mShowTwoRecordsOfGeneralCategoryOne:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfBottomsCategoryEight:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfBottomsCategoryFive:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfBottomsCategoryFour:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfBottomsCategoryNine:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfBottomsCategoryOne:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfBottomsCategorySeven:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfBottomsCategorySix:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfBottomsCategoryTen:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfBottomsCategoryThree:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfBottomsCategoryTwo:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfDierVoerCategoryFive:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfDierVoerCategoryFour:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfDierVoerCategoryOne:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfDierVoerCategoryThree:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfDierVoerCategoryTwo:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfBottomsCategoryEleven:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfFloraCategoryFive:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfFloraCategoryFour:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfFloraCategoryOne:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfFloraCategoryThree:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfFloraCategoryTwo:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfGeneralCategoryFour:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfGeneralCategoryThree:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfGeneralCategoryTwo:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfKlimateEnergyCategoryOne:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfKlimateEnergyCategoryTwo:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfOperationCategoryFive:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfOperationCategoryFour:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfOperationCategoryOne:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfOperationCategoryThree:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfOperationCategoryTwo:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfSocietyCategoryFive:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfSocietyCategoryFour:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfSocietyCategoryOne:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfSocietyCategorySix:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfSocietyCategoryThree:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfSocietyCategoryTwo:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        mShowTwoRecordsOfWaterCategoryOne:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .showSeeMore,
                                                        isEditableGCOne: _provider
                                                            .mSelectedInnerList
                                                            .listProduct[index]
                                                            .isEditable,
                                                        isEditableGCTwo: _provider
                                                            .mSelectedInnerList
                                                            .listProduct[index]
                                                            .isEditable,
                                                        isEditableGCThree:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableBottomsCEight:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableBottomsCFive:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableBottomsCFour:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableBottomsCNine:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableBottomsCOne:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableBottomsCSeven:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableBottomsCSix:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableBottomsCTen:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableBottomsCThree:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableBottomsCTwo:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableDAVCFive:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableDAVCFour:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableDAVCOne:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableDAVCThree:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableDAVCTwo:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableFloraCFive:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableFloraCFour:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableFloraCOne:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableFloraCThree:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableFloraCTwo:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableGCFour: _provider
                                                            .mSelectedInnerList
                                                            .listProduct[index]
                                                            .isEditable,
                                                        isEditableKECOne: _provider
                                                            .mSelectedInnerList
                                                            .listProduct[index]
                                                            .isEditable,
                                                        isEditableKECTwo: _provider
                                                            .mSelectedInnerList
                                                            .listProduct[index]
                                                            .isEditable,
                                                        isEditableOperationsCFive:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableOperationsCOne:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableOperationsCTFour:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableOperationsCThree:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableOperationsCTwo:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableSocietyCFive:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableSocietyCFour:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableSocietyCOne:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableSocietyCSix:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableSocietyCThree:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableBottomsCEleven:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableSocietyCTwo:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                        isEditableWaterCOne:
                                                            _provider
                                                                .mSelectedInnerList
                                                                .listProduct[
                                                                    index]
                                                                .isEditable,
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                              childCount: _provider
                                                  .mSelectedInnerList
                                                  .listProduct
                                                  .length,
                                            ),
                                          )
                                  ],
                                ),
                              ),
                            ),
                          )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  listWidget({
    var provider,
    var mDataOverviewResponse,
    required bool isGeneralCategoryOne,
    required bool mShowTwoRecordsOfGeneralCategoryOne,
    required bool isEditableGCOne,
    required bool isGeneralCategoryTwo,
    required bool mShowTwoRecordsOfGeneralCategoryTwo,
    required bool isEditableGCTwo,
    required bool isGeneralCategoryThree,
    required bool mShowTwoRecordsOfGeneralCategoryThree,
    required bool isEditableGCThree,
    required bool isGeneralCategoryFour,
    required bool mShowTwoRecordsOfGeneralCategoryFour,
    required bool isEditableGCFour,
    required bool isFloraCategoryOne,
    required bool mShowTwoRecordsOfFloraCategoryOne,
    required bool isEditableFloraCOne,
    required bool isFloraCategoryTwo,
    required bool mShowTwoRecordsOfFloraCategoryTwo,
    required bool isEditableFloraCTwo,
    required bool isFloraCategoryThree,
    required bool mShowTwoRecordsOfFloraCategoryThree,
    required bool isEditableFloraCThree,
    required bool isFloraCategoryFour,
    required bool mShowTwoRecordsOfFloraCategoryFour,
    required bool isEditableFloraCFour,
    required bool isFloraCategoryFive,
    required bool mShowTwoRecordsOfFloraCategoryFive,
    required bool isEditableFloraCFive,
    required bool isWaterCategoryOne,
    required bool mShowTwoRecordsOfWaterCategoryOne,
    required bool isEditableWaterCOne,
    required bool isDierVoerCategoryOne,
    required bool mShowTwoRecordsOfDierVoerCategoryOne,
    required bool isEditableDAVCOne,
    required bool isDierVoerCategoryTwo,
    required bool mShowTwoRecordsOfDierVoerCategoryTwo,
    required bool isEditableDAVCTwo,
    required bool isDierVoerCategoryThree,
    required bool mShowTwoRecordsOfDierVoerCategoryThree,
    required bool isEditableDAVCThree,
    required bool isDierVoerCategoryFour,
    required bool mShowTwoRecordsOfDierVoerCategoryFour,
    required bool isEditableDAVCFour,
    required bool isDierVoerCategoryFive,
    required bool mShowTwoRecordsOfDierVoerCategoryFive,
    required bool isEditableDAVCFive,
    required bool isKlimateEnergyCategoryOne,
    required bool mShowTwoRecordsOfKlimateEnergyCategoryOne,
    required bool isEditableKECOne,
    required bool isKlimateEnergyCategoryTwo,
    required bool mShowTwoRecordsOfKlimateEnergyCategoryTwo,
    required bool isEditableKECTwo,
    required bool isBottomsCategoryOne,
    required bool mShowTwoRecordsOfBottomsCategoryOne,
    required bool isEditableBottomsCOne,
    required bool isBottomsCategoryTwo,
    required bool mShowTwoRecordsOfBottomsCategoryTwo,
    required bool isEditableBottomsCTwo,
    required bool isBottomsCategoryThree,
    required bool mShowTwoRecordsOfBottomsCategoryThree,
    required bool isEditableBottomsCThree,
    required bool isBottomsCategoryFour,
    required bool mShowTwoRecordsOfBottomsCategoryFour,
    required bool isEditableBottomsCFour,
    required bool isBottomsCategoryFive,
    required bool mShowTwoRecordsOfBottomsCategoryFive,
    required bool isEditableBottomsCFive,
    required bool isBottomsCategorySix,
    required bool mShowTwoRecordsOfBottomsCategorySix,
    required bool isEditableBottomsCSix,
    required bool isBottomsCategoryEleven,
    required bool mShowTwoRecordsOfBottomsCategoryEleven,
    required bool isEditableBottomsCEleven,
    required bool isBottomsCategorySeven,
    required bool mShowTwoRecordsOfBottomsCategorySeven,
    required bool isEditableBottomsCSeven,
    required bool isBottomsCategoryEight,
    required bool mShowTwoRecordsOfBottomsCategoryEight,
    required bool isEditableBottomsCEight,
    required bool isBottomsCategoryNine,
    required bool mShowTwoRecordsOfBottomsCategoryNine,
    required bool isEditableBottomsCNine,
    required bool isBottomsCategoryTen,
    required bool mShowTwoRecordsOfBottomsCategoryTen,
    required bool isEditableBottomsCTen,
    required bool isOperationCategoryOne,
    required bool mShowTwoRecordsOfOperationCategoryOne,
    required bool isEditableOperationsCOne,
    required bool isOperationCategoryTwo,
    required bool mShowTwoRecordsOfOperationCategoryTwo,
    required bool isEditableOperationsCTwo,
    required bool isOperationCategoryThree,
    required bool mShowTwoRecordsOfOperationCategoryThree,
    required bool isEditableOperationsCThree,
    required bool isOperationCategoryFour,
    required bool mShowTwoRecordsOfOperationCategoryFour,
    required bool isEditableOperationsCTFour,
    required bool isOperationCategoryFive,
    required bool mShowTwoRecordsOfOperationCategoryFive,
    required bool isEditableOperationsCFive,
    required bool isSocietyCategoryOne,
    required bool mShowTwoRecordsOfSocietyCategoryOne,
    required bool isEditableSocietyCOne,
    required bool isSocietyCategoryTwo,
    required bool mShowTwoRecordsOfSocietyCategoryTwo,
    required bool isEditableSocietyCTwo,
    required bool isSocietyCategoryThree,
    required bool mShowTwoRecordsOfSocietyCategoryThree,
    required bool isEditableSocietyCThree,
    required bool isSocietyCategoryFour,
    required bool mShowTwoRecordsOfSocietyCategoryFour,
    required bool isEditableSocietyCFour,
    required bool isSocietyCategoryFive,
    required bool mShowTwoRecordsOfSocietyCategoryFive,
    required bool isEditableSocietyCFive,
    required bool isSocietyCategorySix,
    required bool mShowTwoRecordsOfSocietyCategorySix,
    required bool isEditableSocietyCSix,
  }) {
    late Map<String, dynamic> response;
    var mList = [];

    var emptyReturn = [1];

    /// General Categories Data Set
    if (isGeneralCategoryOne) {
      if (mShowTwoRecordsOfGeneralCategoryOne) {
        var list = mDataOverviewResponse["d_company_basics"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableGCOne, "mList": mList};
      } else {
        mList = mDataOverviewResponse["d_company_basics"];
        response = {"isEditable": isEditableGCOne, "mList": mList};
      }
    }
    if (isGeneralCategoryTwo) {
      if (mShowTwoRecordsOfGeneralCategoryTwo) {
        var list = mDataOverviewResponse["b_country"];
        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableGCTwo, "mList": mList};
      } else {
        mList = mDataOverviewResponse["b_country"];
        response = {"isEditable": isEditableGCTwo, "mList": mList};
      }
    }
    if (isGeneralCategoryThree) {
      if (mShowTwoRecordsOfGeneralCategoryThree) {
        var list = mDataOverviewResponse["a_farm_basics"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableGCThree, "mList": mList};
      } else {
        mList = mDataOverviewResponse["a_farm_basics"];
        response = {"isEditable": isEditableGCThree, "mList": mList};
      }
    }
    if (isGeneralCategoryFour) {
      if (mShowTwoRecordsOfGeneralCategoryFour) {
        var list = mDataOverviewResponse["c_soil_type"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableGCFour, "mList": mList};
      } else {
        mList = mDataOverviewResponse["c_soil_type"];
        response = {"isEditable": isEditableGCFour, "mList": mList};
      }
    }

    /// FLora Categories Data Set
    if (isFloraCategoryOne) {
      if (mShowTwoRecordsOfFloraCategoryOne) {
        var list = mDataOverviewResponse["b_erfinrichting"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableFloraCOne, "mList": mList};
      } else {
        mList = mDataOverviewResponse["b_erfinrichting"];
        response = {"isEditable": isEditableFloraCOne, "mList": mList};
      }
    }
    if (isFloraCategoryTwo) {
      if (mShowTwoRecordsOfFloraCategoryTwo) {
        var list = mDataOverviewResponse["e_kruidenrijk"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableFloraCTwo, "mList": mList};
      } else {
        mList = mDataOverviewResponse["e_kruidenrijk"];
        response = {"isEditable": isEditableFloraCTwo, "mList": mList};
      }
    }
    if (isFloraCategoryThree) {
      if (mShowTwoRecordsOfFloraCategoryThree) {
        var list = mDataOverviewResponse["a_landschapselementen"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableFloraCThree, "mList": mList};
      } else {
        mList = mDataOverviewResponse["a_landschapselementen"];
        response = {"isEditable": isEditableFloraCThree, "mList": mList};
      }
    }
    if (isFloraCategoryFour) {
      if (mShowTwoRecordsOfFloraCategoryFour) {
        var list = mDataOverviewResponse["d_pesticides"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableFloraCFour, "mList": mList};
      } else {
        mList = mDataOverviewResponse["d_pesticides"];
        response = {"isEditable": isEditableFloraCFour, "mList": mList};
      }
    }
    if (isFloraCategoryFive) {
      if (mShowTwoRecordsOfFloraCategoryFive) {
        var list = mDataOverviewResponse["c_weidevogels"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableFloraCFive, "mList": mList};
      } else {
        mList = mDataOverviewResponse["c_weidevogels"];
        response = {"isEditable": isEditableFloraCFive, "mList": mList};
      }
    }

    /// Water Categories Data Set
    if (isWaterCategoryOne) {
      if (mShowTwoRecordsOfWaterCategoryOne) {
        var list = mDataOverviewResponse["a_water_component"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableWaterCOne, "mList": mList};
      } else {
        mList = mDataOverviewResponse["a_water_component"];
        response = {"isEditable": isEditableWaterCOne, "mList": mList};
      }
    }

    /// Dier And Voer Categories Data Set

    if (isDierVoerCategoryOne) {
      if (mShowTwoRecordsOfDierVoerCategoryOne) {
        var list = mDataOverviewResponse["d_animal_health_welfare"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableDAVCOne, "mList": mList};
      } else {
        mList = mDataOverviewResponse["d_animal_health_welfare"];
        response = {"isEditable": isEditableDAVCOne, "mList": mList};
      }
    }
    if (isDierVoerCategoryTwo) {
      if (mShowTwoRecordsOfDierVoerCategoryTwo) {
        var list = mDataOverviewResponse["a_animals"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableDAVCTwo, "mList": mList};
      } else {
        mList = mDataOverviewResponse["a_animals"];
        response = {"isEditable": isEditableDAVCTwo, "mList": mList};
      }
    }
    if (isDierVoerCategoryThree) {
      if (mShowTwoRecordsOfDierVoerCategoryThree) {
        var list = mDataOverviewResponse["c_food"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableDAVCThree, "mList": mList};
      } else {
        mList = mDataOverviewResponse["c_food"];
        response = {"isEditable": isEditableDAVCThree, "mList": mList};
      }
    }
    if (isDierVoerCategoryFour) {
      if (mShowTwoRecordsOfDierVoerCategoryFour) {
        var list = mDataOverviewResponse["b_grazing"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableDAVCFour, "mList": mList};
      } else {
        mList = mDataOverviewResponse["b_grazing"];
        response = {"isEditable": isEditableDAVCFour, "mList": mList};
      }
    }
    if (isDierVoerCategoryFive) {
      if (mShowTwoRecordsOfDierVoerCategoryFive) {
        var list = mDataOverviewResponse["e_milk"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableDAVCFive, "mList": mList};
      } else {
        mList = mDataOverviewResponse["e_milk"];
        response = {"isEditable": isEditableDAVCFive, "mList": mList};
      }
    }

    /// Klimate Energy Categories Data Set
    if (isKlimateEnergyCategoryOne) {
      if (mShowTwoRecordsOfKlimateEnergyCategoryOne) {
        var list = mDataOverviewResponse["b_broeikasgassen"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableKECOne, "mList": mList};
      } else {
        mList = mDataOverviewResponse["b_broeikasgassen"];
        response = {"isEditable": isEditableKECOne, "mList": mList};
      }
    }

    if (isKlimateEnergyCategoryTwo) {
      if (mShowTwoRecordsOfKlimateEnergyCategoryTwo) {
        var list = mDataOverviewResponse["a_energie"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableKECTwo, "mList": mList};
      } else {
        mList = mDataOverviewResponse["a_energie"];
        response = {"isEditable": isEditableKECTwo, "mList": mList};
      }
    }

    /// Bottoms Categories Data Set
    if (isBottomsCategoryOne) {
      if (mShowTwoRecordsOfBottomsCategoryOne) {
        var list = mDataOverviewResponse["d_application"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableBottomsCOne, "mList": mList};
      } else {
        mList = mDataOverviewResponse["d_application"];
        response = {"isEditable": isEditableBottomsCOne, "mList": mList};
      }
    }
    if (isBottomsCategoryTwo) {
      if (mShowTwoRecordsOfBottomsCategoryTwo) {
        var list = mDataOverviewResponse["a_fertilization"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableBottomsCTwo, "mList": mList};
      } else {
        mList = mDataOverviewResponse["a_fertilization"];
        response = {"isEditable": isEditableBottomsCTwo, "mList": mList};
      }
    }
    if (isBottomsCategoryThree) {
      if (mShowTwoRecordsOfBottomsCategoryThree) {
        var list = mDataOverviewResponse["g_fertilizer"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableBottomsCThree, "mList": mList};
      } else {
        mList = mDataOverviewResponse["g_fertilizer"];
        response = {"isEditable": isEditableBottomsCThree, "mList": mList};
      }
    }

    if (isBottomsCategoryFour) {
      if (mShowTwoRecordsOfBottomsCategoryFour) {
        var list = mDataOverviewResponse["e_fertilizer_on_silage_maize"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableBottomsCFour, "mList": mList};
      } else {
        mList = mDataOverviewResponse["e_fertilizer_on_silage_maize"];
        response = {"isEditable": isEditableBottomsCFour, "mList": mList};
      }
    }
    if (isBottomsCategoryFive) {
      if (mShowTwoRecordsOfBottomsCategoryFive) {
        var list = mDataOverviewResponse["f_method"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableBottomsCFive, "mList": mList};
      } else {
        mList = mDataOverviewResponse["f_method"];
        response = {"isEditable": isEditableBottomsCFive, "mList": mList};
      }
    }
    if (isBottomsCategorySix) {
      if (mShowTwoRecordsOfBottomsCategorySix) {
        var list = mDataOverviewResponse["c_nitrogen"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableBottomsCSix, "mList": mList};
      } else {
        mList = mDataOverviewResponse["c_nitrogen"];
        response = {"isEditable": isEditableBottomsCSix, "mList": mList};
      }
    }
    if (isBottomsCategorySeven) {
      if (mShowTwoRecordsOfBottomsCategorySeven) {
        var list = mDataOverviewResponse["h_phosphate"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableBottomsCSeven, "mList": mList};
      } else {
        mList = mDataOverviewResponse["h_phosphate"];
        response = {"isEditable": isEditableBottomsCSeven, "mList": mList};
      }
    }
    if (isBottomsCategoryEight) {
      if (mShowTwoRecordsOfBottomsCategoryEight) {
        var list = mDataOverviewResponse["i_soilbalance"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableBottomsCEight, "mList": mList};
      } else {
        mList = mDataOverviewResponse["i_soilbalance"];
        response = {"isEditable": isEditableBottomsCEight, "mList": mList};
      }
    }
    if (isBottomsCategoryEleven) {
      if (mShowTwoRecordsOfBottomsCategoryEleven) {
        var list = mDataOverviewResponse["b_permanent_grassland"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableBottomsCEleven, "mList": mList};
      } else {
        mList = mDataOverviewResponse["b_permanent_grassland"];
        response = {"isEditable": isEditableBottomsCEleven, "mList": mList};
      }
    }
    if (isBottomsCategoryNine) {
      if (mShowTwoRecordsOfBottomsCategoryNine) {
        var list = mDataOverviewResponse["j_soilimprovement"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableBottomsCNine, "mList": mList};
      } else {
        mList = mDataOverviewResponse["j_soilimprovement"];
        response = {"isEditable": isEditableBottomsCNine, "mList": mList};
      }
    }
    if (isBottomsCategoryTen) {
      if (mShowTwoRecordsOfBottomsCategoryTen) {
        var list = mDataOverviewResponse["k_soilstructure"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableBottomsCTen, "mList": mList};
      } else {
        mList = mDataOverviewResponse["k_soilstructure"];
        response = {"isEditable": isEditableBottomsCTen, "mList": mList};
      }
    }

    /// Operations Categories Data Set
    if (isOperationCategoryOne) {
      if (mShowTwoRecordsOfOperationCategoryOne) {
        var list = mDataOverviewResponse["a_chain_relationships"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableOperationsCOne, "mList": mList};
      } else {
        mList = mDataOverviewResponse["a_chain_relationships"];
        response = {"isEditable": isEditableOperationsCOne, "mList": mList};
      }
    }
    if (isOperationCategoryTwo) {
      if (mShowTwoRecordsOfOperationCategoryTwo) {
        var list = mDataOverviewResponse["b_labour"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableOperationsCTwo, "mList": mList};
      } else {
        mList = mDataOverviewResponse["b_labour"];
        response = {"isEditable": isEditableOperationsCTwo, "mList": mList};
      }
    }
    if (isOperationCategoryThree) {
      if (mShowTwoRecordsOfOperationCategoryThree) {
        var list = mDataOverviewResponse["c_land"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableOperationsCThree, "mList": mList};
      } else {
        mList = mDataOverviewResponse["c_land"];
        response = {"isEditable": isEditableOperationsCThree, "mList": mList};
      }
    }
    if (isOperationCategoryFour) {
      if (mShowTwoRecordsOfOperationCategoryFour) {
        var list = mDataOverviewResponse["d_regulations"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableOperationsCTFour, "mList": mList};
      } else {
        mList = mDataOverviewResponse["d_regulations"];
        response = {"isEditable": isEditableOperationsCTFour, "mList": mList};
      }
    }
    if (isOperationCategoryFive) {
      if (mShowTwoRecordsOfOperationCategoryFive) {
        var list = mDataOverviewResponse["e_side_branches"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableOperationsCFive, "mList": mList};
      } else {
        mList = mDataOverviewResponse["e_side_branches"];
        response = {"isEditable": isEditableOperationsCFive, "mList": mList};
      }
    }

    /// Society Categories Data Set
    if (isSocietyCategoryOne) {
      if (mShowTwoRecordsOfSocietyCategoryOne) {
        var list = mDataOverviewResponse["a_culture_identity"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableSocietyCOne, "mList": mList};
      } else {
        mList = mDataOverviewResponse["a_culture_identity"];
        response = {"isEditable": isEditableSocietyCOne, "mList": mList};
      }
    }
    if (isSocietyCategoryTwo) {
      if (mShowTwoRecordsOfSocietyCategoryTwo) {
        var list = mDataOverviewResponse["b_future_proof"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableSocietyCTwo, "mList": mList};
      } else {
        mList = mDataOverviewResponse["b_future_proof"];
        response = {"isEditable": isEditableSocietyCTwo, "mList": mList};
      }
    }
    if (isSocietyCategoryThree) {
      if (mShowTwoRecordsOfSocietyCategoryThree) {
        var list = mDataOverviewResponse["c_involvement"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableSocietyCThree, "mList": mList};
      } else {
        mList = mDataOverviewResponse["c_involvement"];
        response = {"isEditable": isEditableSocietyCThree, "mList": mList};
      }
    }
    if (isSocietyCategoryFour) {
      if (mShowTwoRecordsOfSocietyCategoryFour) {
        var list = mDataOverviewResponse["d_job_satisfaction"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableSocietyCFour, "mList": mList};
      } else {
        mList = mDataOverviewResponse["d_job_satisfaction"];
        response = {"isEditable": isEditableSocietyCFour, "mList": mList};
      }
    }
    if (isSocietyCategoryFive) {
      if (mShowTwoRecordsOfSocietyCategoryFive) {
        var list = mDataOverviewResponse["e_knowledge_development"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableSocietyCFive, "mList": mList};
      } else {
        mList = mDataOverviewResponse["e_knowledge_development"];
        response = {"isEditable": isEditableSocietyCFive, "mList": mList};
      }
    }
    if (isSocietyCategorySix) {
      if (mShowTwoRecordsOfSocietyCategorySix) {
        var list = mDataOverviewResponse["f_visibility"];

        for (var i = 0; i < list.length; i++) {
          if (mList.isEmpty || mList.length <= 1) {
            mList.add(list[i]);
          }
        }
        response = {"isEditable": isEditableSocietyCSix, "mList": mList};
      } else {
        mList = mDataOverviewResponse["f_visibility"];
        response = {"isEditable": isEditableSocietyCSix, "mList": mList};
      }
    }

    if (mList.isEmpty) {
      return emptyReturn.map((e) => SizedBox.shrink()).toList();
    } else {
      List<bool> expandedList = [];
      for (var i = 0; i < mList.length; i++) {
        expandedList.add(false);
      }
      var provider = Provider.of<DataOverViewProvider>(context, listen: false);

      return mList.map((e) {
        // int index = mList.indexOf(e);

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      e[4].toString(),
                      style: GoogleFonts.montserrat(
                        color: HexColor("#000000"),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Expanded(
                    child: response["isEditable"]
                        ? editableWidget(
                            editKey: e[5], data: e[2], index: mList.indexOf(e))
                        : Text(
                            e[2] == null ? "" : e[2].toString(),
                            style: GoogleFonts.montserrat(
                              color: HexColor("#000000"),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                  ),
                  Expanded(
                    child: Text(
                      e[3] == null
                          ? ""
                          : DateFormat('dd.MM.yyyy')
                              .format(DateTime.parse(e[3]))
                              .toString(),
                      style: GoogleFonts.montserrat(
                        color: HexColor("#000000"),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: Text(
                  //     e[5] == "null" ? "" : e[5] ?? "",
                  //     style: GoogleFonts.montserrat(
                  //       color: HexColor("#000000"),
                  //       fontSize: 14.0,
                  //       fontWeight: FontWeight.w400,
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    child: Text(
                      e[7] == "null" ? "" : e[7] ?? "",
                      style: GoogleFonts.montserrat(
                        color: HexColor("#000000"),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {
                        provider.getOverviewHistory(
                          mKeyName: e[1].toString(),
                          context: context,
                          mName: e[4].toString(),
                        );
                      },
                      child: Icon(
                        Icons.history,
                        size: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: HexColor("#E5E5E5"),
              height: 1,
              endIndent: 20,
              indent: 20,
            )
          ],
        );
      }).toList();
    }
  }

  Widget editableWidget({required String editKey, data, index}) {
    var provider = Provider.of<DataOverViewProvider>(context, listen: false);
    if (editKey.isEmpty) {
      return Text(
        "Not available",
        style: TextStyle(fontFamily: Montserrat_Medium),
      );
    } else if (editKey.toString() == "text_input") {
      TextEditingController controller =
          TextEditingController(text: provider.editList[index]);
      return Row(
        children: [
          Expanded(
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: HexColor("#EEEEEE"), width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
                    controller: controller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(border: InputBorder.none),
                    onChanged: ((value) {
                      provider.editList.replaceRange(index, index + 1, [value]);
                      provider.editList[index] = value;
                    })),
              ),
            ),
          ),
          SizedBox(width: 8),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: HexColor("#EEEEEE"),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 15,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
        ],
      );
    } else if (editKey.toString() == "number_input") {
      TextEditingController controller =
          TextEditingController(text: provider.editList[index]);
      return Row(
        children: [
          Expanded(
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: HexColor("#EEEEEE"), width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: InputBorder.none),
                  onChanged: ((value) {
                    provider.editList.replaceRange(index, index + 1, [value]);
                    provider.editList[index] = value;
                  }),
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: HexColor("#EEEEEE"),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 15,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
        ],
      );
    } else if (editKey.toString() == "html_text_field") {
      var controller = HtmlEditorController();
      // controller = controller.insertText(data.toString());

      return Row(
        children: [
          Expanded(
              child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor("#EEEEEE"), width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: HtmlEditor(
                      controller: controller,
                      htmlEditorOptions: HtmlEditorOptions(
                        hint: provider.editList[index],
                        // initalText: "text content initial, if any",
                      ),
                      htmlToolbarOptions: HtmlToolbarOptions(
                        toolbarPosition:
                            ToolbarPosition.aboveEditor, //by default
                        toolbarType: ToolbarType.nativeScrollable, //by default
                        onDropdownChanged: (DropdownType type, dynamic changed,
                            Function(dynamic)? updateSelectedItem) {
                          provider.editList[index] = changed;
                          return true;
                        },
                      ),
                      callbacks: Callbacks(
                        onBeforeCommand: (String? currentHtml) {},
                        onChangeContent: (String? changed) {},
                        onChangeCodeview: (String? changed) {
                          provider.editList
                              .replaceRange(index, index + 1, [changed]);
                        },
                        onChangeSelection: (EditorSettings settings) {},
                        onDialogShown: () {},
                        onEnter: () {},
                        onFocus: () {},
                        onBlur: () {},
                        onBlurCodeview: () {},
                        onInit: () {},
                      ),
                    ),
                  ))),
          SizedBox(width: 8),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: HexColor("#EEEEEE"),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 15,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
        ],
      );
    } else if (editKey.toString() == "date_input") {
      String date = data == null ? 'Date' : provider.editList[index];

      return Row(
        children: [
          Expanded(
            child: Container(
              height: 45,
              margin: EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                child: InkWell(
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now())
                          .then((d) {
                        debugPrint("$d");
                        if (d != null) {
                          setState(() {
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                            date = d.toString().split(" ")[0];
                          });
                        }
                      });
                    },
                    child: Container(
                      child: Text(date),
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: HexColor("#EEEEEE"), width: 1),
                      ),
                    )),
              ),
            ),
          ),
          SizedBox(width: 8),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: HexColor("#EEEEEE"),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 15,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
        ],
      );
    } else if (editKey.toString() == "bool_dropdown") {
      String dropDownValue = "Select";
      return Row(
        children: [
          Expanded(
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: HexColor("#EEEEEE"), width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: DropdownButton<String>(
                  items: <String>['Select', 'Yes', 'No'].map(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontFamily: provider.editList[index] == value
                                ? Montserrat_Medium
                                : Montserrat_Light,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  value: dropDownValue,
                  onChanged: (String? value) {
                    setState(() {});
                    provider.editList.replaceRange(index, index + 1, [value]);
                    provider.editList[index] = value;
                    dropDownValue = value!;
                    print("BOOL Yes/NO:::::::::::::$dropDownValue");
                    ("Value : $dropDownValue");
                  },
                  style: TextStyle(color: Colors.black),
                  isExpanded: true,
                  underline: SizedBox.shrink(),
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: HexColor("#EEEEEE"),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 15,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
        ],
      );
    } else if (editKey.toString().contains("select_dropdown_")) {
      List<String> dropDownList = provider.dropDownByKey(dropDownKey: editKey);
      String selectedValue = dropDownList[0];
      return Row(
        children: [
          Expanded(
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: HexColor("#EEEEEE"), width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: DropdownButton<String>(
                  items: dropDownList.map(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            style: TextStyle(
                              fontFamily: provider.editList[index] == value
                                  ? Montserrat_Medium
                                  : Montserrat_Light,
                            )),
                      );
                    },
                  ).toList(),
                  value: selectedValue,
                  onChanged: (String? value) {
                    provider.editList.replaceRange(index, index + 1, [value]);
                    provider.editList[index] = value;
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                  style: TextStyle(color: Colors.black),
                  isExpanded: true,
                  underline: SizedBox.shrink(),
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: HexColor("#EEEEEE"),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 15,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
        ],
      );
    } else if (editKey.toString().contains("multiple_select")) {
      List<String> dropDownList = provider.dropDownByKey(dropDownKey: editKey);
      String selectedValue = dropDownList[0];

      return Row(
        children: [
          Expanded(
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: HexColor("#EEEEEE"), width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: DropdownButton<String>(
                  items: dropDownList.map(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            style: TextStyle(
                                fontFamily: editKey ==
                                            "multiple_select_activities" &&
                                        provider.multiActivities
                                            .contains('"$value"')
                                    ? Montserrat_Medium
                                    : editKey ==
                                                "multiple_select_alternative_business" &&
                                            provider.multiAlternativeBusiness
                                                .contains('"$value"')
                                        ? Montserrat_Medium
                                        : editKey ==
                                                    "multiple_select_fertilizer_type" &&
                                                provider.multiFertilizerType
                                                    .contains('"$value"')
                                            ? Montserrat_Medium
                                            : editKey ==
                                                        "multiple_select_by_products_list" &&
                                                    provider.multiByProductsList
                                                        .contains('"$value"')
                                                ? Montserrat_Medium
                                                : editKey ==
                                                            "multiple_select_social_media" &&
                                                        provider
                                                            .multiSocialMedia
                                                            .contains(
                                                                '"$value"')
                                                    ? Montserrat_Medium
                                                    : Montserrat_Light,
                               )),
                      );
                    },
                  ).toList(),
                  value: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      if (editKey == "multiple_select_activities") {
                        if (provider.multiActivities.contains('"$value"')) {
                          provider.multiActivities.remove('"$value"');
                        } else {
                          provider.multiActivities.add('"$value"');
                        }
                        provider.editList.replaceRange(
                            index, index + 1, provider.multiByProductsList);
                      }
                      if (editKey == "multiple_select_alternative_business") {
                        if (provider.multiAlternativeBusiness
                            .contains('"$value"')) {
                          provider.multiAlternativeBusiness.remove('"$value"');
                        } else {
                          provider.multiAlternativeBusiness.add('"$value"');
                        }
                        provider.editList.replaceRange(index, index + 1,
                            provider.multiAlternativeBusiness);
                      }
                      if (editKey == "multiple_select_fertilizer_type") {
                        if (provider.multiFertilizerType.contains('"$value"')) {
                          provider.multiFertilizerType.remove('"$value"');
                        } else {
                          provider.multiFertilizerType.add('"$value"');
                        }
                        provider.editList.replaceRange(
                            index, index + 1, provider.multiFertilizerType);
                      }
                      if (editKey == "multiple_select_by_products_list") {
                        if (provider.multiByProductsList.contains('"$value"')) {
                          provider.multiByProductsList.remove('"$value"');
                        } else {
                          provider.multiByProductsList.add('"$value"');
                        }
                        provider.editList.replaceRange(
                            index, index + 1, provider.multiByProductsList);
                      }
                      if (editKey == "multiple_select_social_media") {
                        if (provider.multiSocialMedia.contains('"$value"')) {
                          provider.multiSocialMedia.remove('"$value"');
                        } else {
                          provider.multiSocialMedia.add('"$value"');
                        }
                        provider.editList.replaceRange(
                            index, index + 1, [provider.multiSocialMedia]);
                      }
                    });
                  },
                  style: TextStyle(color: Colors.black),
                  isExpanded: true,
                  underline: SizedBox.shrink(),
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: HexColor("#EEEEEE"),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 15,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
        ],
      );
    } else {
      return Text("Not available",
          style: TextStyle(fontFamily: Montserrat_Medium));
    }
  }
}

class InnerListModel {
  String title;
  bool showSeeMore;
  bool isEditable;

  InnerListModel(
      {required this.title,
      required this.showSeeMore,
      required this.isEditable});
}

class OuterListModel {
  String tabTitle;
  List<InnerListModel> listProduct;

  OuterListModel({required this.tabTitle, required this.listProduct});
}

String capitalizeAllSentence(String value) {
  var result = value[0].toUpperCase();
  bool caps = false;
  bool start = true;

  for (int i = 1; i < value.length; i++) {
    if (start == true) {
      if (value[i - 1] == " " && value[i] != " ") {
        result = result + value[i].toUpperCase();
        start = false;
      } else {
        result = result + value[i];
      }
    } else {
      if (value[i - 1] == " " && caps == true) {
        result = result + value[i].toUpperCase();
        caps = false;
      } else {
        if (caps && value[i] != " ") {
          result = result + value[i].toUpperCase();
          caps = false;
        } else {
          result = result + value[i];
        }
      }
    }
  }
  return result;
}
