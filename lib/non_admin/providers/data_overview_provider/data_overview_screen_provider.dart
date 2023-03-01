import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wij_land/anacdots_mobile/app_common_widgets/ancadots_toast_widget.dart';
import 'package:wij_land/api_clients/BaseClass.dart';
import 'package:wij_land/non_admin/api_clients/farm_computer_project_clients.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:http/http.dart' as http;

import '../../../utils/hex_color.dart';
import '../../models/data_overview/farm_computer_data_overview_history.dart';
import '../../screens/data_overview/home/data_overview_home_screen.dart';

class DataOverViewProvider extends ChangeNotifier {
  int selIndex = 0;
  bool mShowLoading = false;
  bool mShowSearchBar = false;
  bool mShowSearchedListWidget = false;
  TextEditingController mSearchController = TextEditingController();
  int selectedIndex = 0;
  String mSelectedListMainTitle = "General";
  late OuterListModel mSelectedInnerList;
  List parList = [];
  List editList = [];

  List multiActivities = [];
  List multiAlternativeBusiness = [];
  List multiFertilizerType = [];
  List multiByProductsList = [];
  List multiSocialMedia = [];

  List<OuterListModel> mLeftMenuLists = [
    OuterListModel(tabTitle: "General", listProduct: [
      InnerListModel(
          title: "a_farm_basics", showSeeMore: true, isEditable: false),
      InnerListModel(title: "b_country", showSeeMore: true, isEditable: false),
      InnerListModel(
          title: "c_soil_type", showSeeMore: false, isEditable: false),
      InnerListModel(
          title: "d_company_basics", showSeeMore: true, isEditable: false),
    ]),
    OuterListModel(tabTitle: "Flora Fauna", listProduct: [
      InnerListModel(
          title: "a_landschapselementen",
          showSeeMore: false,
          isEditable: false),
      InnerListModel(
          title: "b_erfinrichting", showSeeMore: true, isEditable: false),
      InnerListModel(
          title: "c_weidevogels", showSeeMore: true, isEditable: false),
      InnerListModel(
          title: "d_pesticides", showSeeMore: true, isEditable: false),
      InnerListModel(
          title: "e_kruidenrijk", showSeeMore: true, isEditable: false),
    ]),
    OuterListModel(tabTitle: "Water", listProduct: [
      InnerListModel(
          title: "a_water_component", showSeeMore: true, isEditable: false)
    ]),
    // TODO : For This Dier Category need to check api
    OuterListModel(tabTitle: "Dier Voer", listProduct: [
      InnerListModel(title: "a_animals", showSeeMore: true, isEditable: false),
      InnerListModel(title: "b_grazing", showSeeMore: true, isEditable: false),
      InnerListModel(title: "c_food", showSeeMore: true, isEditable: false),
      InnerListModel(
          title: "d_animal_health_welfare",
          showSeeMore: true,
          isEditable: false),
      InnerListModel(title: "e_milk", showSeeMore: true, isEditable: false),
    ]),
    // TODO : For This Klimate Category need to check api
    OuterListModel(tabTitle: "Klimate Energy", listProduct: [
      InnerListModel(title: "a_energie", showSeeMore: true, isEditable: false),
      InnerListModel(
          title: "b_broeikasgassen", showSeeMore: true, isEditable: false),
    ]),
    OuterListModel(tabTitle: "Bottoms", listProduct: [
      InnerListModel(
          title: "a_fertilization", showSeeMore: true, isEditable: false),
      InnerListModel(
          title: "b_permanent_grassland", showSeeMore: true, isEditable: false),
      InnerListModel(title: "c_nitrogen", showSeeMore: true, isEditable: false),
      InnerListModel(
          title: "d_application", showSeeMore: true, isEditable: false),
      InnerListModel(
          title: "e_fertilizer_on_silage_maize",
          showSeeMore: false,
          isEditable: false),
      InnerListModel(title: "f_method", showSeeMore: false, isEditable: false),
      InnerListModel(
          title: "g_fertilizer", showSeeMore: true, isEditable: false),
      InnerListModel(
          title: "h_phosphate", showSeeMore: true, isEditable: false),
      InnerListModel(
          title: "i_soilbalance", showSeeMore: true, isEditable: false),
      InnerListModel(
          title: "j_soilimprovement", showSeeMore: true, isEditable: false),
      InnerListModel(
          title: "k_soilstructure", showSeeMore: false, isEditable: false),
    ]),
    OuterListModel(tabTitle: "Operation", listProduct: [
      InnerListModel(
          title: "a_chain_relationships", showSeeMore: true, isEditable: false),
      InnerListModel(title: "b_labour", showSeeMore: true, isEditable: false),
      InnerListModel(title: "c_land", showSeeMore: true, isEditable: false),
      InnerListModel(
          title: "d_regulations", showSeeMore: true, isEditable: false),
      InnerListModel(
          title: "e_side_branches", showSeeMore: true, isEditable: false),
    ]),
    OuterListModel(tabTitle: "Society", listProduct: [
      InnerListModel(
          title: "a_culture_identity", showSeeMore: true, isEditable: false),
      InnerListModel(
          title: "b_future_proof", showSeeMore: false, isEditable: false),
      InnerListModel(
          title: "c_involvement", showSeeMore: true, isEditable: false),
      InnerListModel(
          title: "d_job_satisfaction", showSeeMore: false, isEditable: false),
      InnerListModel(
          title: "e_knowledge_development",
          showSeeMore: true,
          isEditable: false),
      InnerListModel(
          title: "f_visibility", showSeeMore: true, isEditable: false),
    ]),
  ];

  List<String> mCategoriesList = [
    "general",
    "flora_fauna",
    "water",
    "dier_voer",
    "klimate_energy",
    "bottoms",
    "operation",
    "society",
  ];

  var mDataOverViewGeneralCategoryResponse;
  var mDataOverViewFloraAndFaunaResponse;
  var mDataOverViewWaterResponse;
  var mDataOverViewDierAndVoerResponse;
  var mDataOverViewKlimateEnergyResponse;
  var mDataOverViewBottomsResponse;
  var mDataOverViewOperationsResponse;
  var mDataOverViewSocietyResponse;

  var mDataOverViewData;

  dynamic updateDataOverViewRecords(
      {required Map<String, dynamic> requestObject}) async {
    var url = "$baseURL/farm/data_overview";
    var uri = Uri.parse(url);
    var response = await http.post(
      uri,
      headers: header,
      body: jsonEncode(requestObject),
    );

//    print('DATA OVERVIEW RESPONSE : ${response.body}');

    if (response.statusCode == 200) {
      print('DATA OVERVIEW RESPONSE : ${response.body}');
      showAnacdotsToast("Saved Successfully");
      getDataOverViewDataByComponent(tag: mCategoriesList[selIndex]);
      return jsonDecode(response.body);
    } else {
      print('DATA OVERVIEW RESPONSE : ${response.body}');
      return jsonDecode(response.body);
    }
  }

  Future getDataOverViewDataByComponent({required String tag}) async {
    mShowLoading = true;
    notifyListeners();
    var response = await FarmComputerProjectClients.getDataOverViewByComponent(
        mComponentName: tag);

    if (response["status"] == 200) {
      mDataOverViewData = response["data"];

      print("Data :::::::::::::: $mDataOverViewData");
      // if (tag == "general") {
      //   mDataOverViewGeneralCategoryResponse = response["data"];
      // }
      // if (tag == "flora_fauna") {
      //   mDataOverViewFloraAndFaunaResponse = response["data"];
      // }
      // if (tag == "water") {
      //   mDataOverViewWaterResponse = response["data"];
      // }
      // if (tag == "dier_voer") {
      //   mDataOverViewDierAndVoerResponse = response["data"];
      // }
      // if (tag == "klimate_energy") {
      //   mDataOverViewKlimateEnergyResponse = response["data"];
      // }
      // if (tag == "bottoms") {
      //   mDataOverViewBottomsResponse = response["data"];
      // }
      // if (tag == "operation") {
      //   mDataOverViewOperationsResponse = response["data"];
      // }
      // if (tag == "society") {
      //   mDataOverViewSocietyResponse = response["data"];
      // }
    }

    mShowLoading = false;
    notifyListeners();
  }

  /// Search Work

  List searchedList = [];
  List<bool> expandedListForSearch = [];

  searchData(
      {required OuterListModel mCategoryName, required String mSearchedText}) {
    print("Category name : ${mCategoryName.tabTitle}");
    print("Category name : $mSearchedText");

    searchedList.clear();
    expandedListForSearch.clear();
    notifyListeners();

    for (var i = 0; i < mLeftMenuLists.length; i++) {
      if (mCategoryName.tabTitle == mLeftMenuLists[i].tabTitle) {
        for (var j = 0; j < mLeftMenuLists[i].listProduct.length; j++) {
          var dataList = [];
          print(
              "SUb Category TITLE : ${mLeftMenuLists[i].listProduct[j].title}");
          dataList = mDataOverViewData[mLeftMenuLists[i].listProduct[j].title];
          for (var k = 0; k < dataList.length; k++) {
            if (dataList[k].toString().contains(mSearchedText)) {
              searchedList.add(dataList[k]);
            }
          }

          // if(mDataOverViewData[mLeftMenuLists[i].listProduct[j].title]){}
          // searchedList.add(mDataOverViewData[mLeftMenuLists[i].listProduct[j].title]);
          // print("Sub Category Name : ${mLeftMenuLists[i].listProduct[j].title}");
        }
      }
    }

    for (var i = 0; i < searchedList.length; i++) {
      expandedListForSearch.add(false);
    }

    print("Searched List : $searchedList");
  }

  DataOverviewFarmHistory overviewFarmHistory = DataOverviewFarmHistory();
  List<DataOverViewHistoryData> historyList = [];

  bool showLoadingForHistory = false;

  getOverviewHistory(
      {required String mKeyName,
      required BuildContext context,
      required String mName}) async {
    showLoadingForHistory = true;
    historyList.clear();
    notifyListeners();

    overviewFarmHistory =
        await FarmComputerProjectClients.getFarmComputerDataOverviewHistory(
      keyName: mKeyName,
    );

    bool seeMoreData = false;

    if (overviewFarmHistory.status == 200) {
      if (overviewFarmHistory.data != null || overviewFarmHistory.data != []) {
        historyList = overviewFarmHistory.data!;

        List<DataOverViewHistoryData> showAllHistory = historyList;
        List<DataOverViewHistoryData> showLessHistory = [];
        if (historyList.length > 10) {
          for (var i = 0; i < 10; i++) {
            showLessHistory.add(historyList[i]);
          }
        }

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return StatefulBuilder(
                builder: (BuildContext context, StateSetter dialogState) {
              return AlertDialog(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      mName,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                    )
                  ],
                ),
                content: SingleChildScrollView(
                  child: SizedBox(
                    width: getWidth(context) * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: seeMoreData == false &&
                                historyList.length < 10
                            ? showAllHistory.map((e) {
                                var index = showAllHistory.indexOf(e);
                                print("Index of hostory : $index");
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Column(
                                    children: [
                                      index == 0
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Value",
                                                  style: GoogleFonts.montserrat(
                                                    color: HexColor("#000000"),
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "Date",
                                                  style: GoogleFonts.montserrat(
                                                    color: HexColor("#000000"),
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "Updated By",
                                                  style: GoogleFonts.montserrat(
                                                    color: HexColor("#000000"),
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            )
                                          : SizedBox.shrink(),
                                      index == 0
                                          ? Divider()
                                          : SizedBox.shrink(),
                                      SizedBox(
                                        height: index == 0 ? 20 : 0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              e.value == null
                                                  ? ""
                                                  : e.value.toString(),
                                              textAlign: TextAlign.start,
                                              style: GoogleFonts.montserrat(
                                                color: HexColor("#000000"),
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              e.dateChanged == null
                                                  ? ""
                                                  : DateFormat('dd.MM.yyyy')
                                                      .format(DateTime.parse(
                                                          e.dateChanged!))
                                                      .toString(),
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.montserrat(
                                                color: HexColor("#000000"),
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              e.editor == null
                                                  ? ""
                                                  : e.editor.toString(),
                                              textAlign: TextAlign.end,
                                              style: GoogleFonts.montserrat(
                                                color: HexColor("#000000"),
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }).toList()
                            : seeMoreData == false
                                ? showLessHistory.map((e) {
                                    var index = showAllHistory.indexOf(e);
                                    print("Index of hostory : $index");
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      child: Column(
                                        children: [
                                          index == 0
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Value",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        color:
                                                            HexColor("#000000"),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Date",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        color:
                                                            HexColor("#000000"),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Updated By",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        color:
                                                            HexColor("#000000"),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : SizedBox.shrink(),
                                          index == 0
                                              ? Divider()
                                              : SizedBox.shrink(),
                                          SizedBox(
                                            height: index == 0 ? 20 : 0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  e.value == null
                                                      ? ""
                                                      : e.value.toString(),
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts.montserrat(
                                                    color: HexColor("#000000"),
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  e.dateChanged == null
                                                      ? ""
                                                      : DateFormat('dd.MM.yyyy')
                                                          .format(DateTime.parse(
                                                              e.dateChanged!))
                                                          .toString(),
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.montserrat(
                                                    color: HexColor("#000000"),
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  e.editor == null
                                                      ? ""
                                                      : e.editor.toString(),
                                                  textAlign: TextAlign.end,
                                                  style: GoogleFonts.montserrat(
                                                    color: HexColor("#000000"),
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList()
                                : historyList.map((e) {
                                    var index = showAllHistory.indexOf(e);
                                    print("Index of hostory : $index");
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      child: Column(
                                        children: [
                                          index == 0
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Value",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        color:
                                                            HexColor("#000000"),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Date",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        color:
                                                            HexColor("#000000"),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Updated By",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        color:
                                                            HexColor("#000000"),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : SizedBox.shrink(),
                                          index == 0
                                              ? Divider()
                                              : SizedBox.shrink(),
                                          SizedBox(
                                            height: index == 0 ? 20 : 0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  e.value == null
                                                      ? ""
                                                      : e.value.toString(),
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts.montserrat(
                                                    color: HexColor("#000000"),
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  e.dateChanged == null
                                                      ? ""
                                                      : DateFormat('dd.MM.yyyy')
                                                          .format(DateTime.parse(
                                                              e.dateChanged!))
                                                          .toString(),
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.montserrat(
                                                    color: HexColor("#000000"),
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  e.editor == null
                                                      ? ""
                                                      : e.editor.toString(),
                                                  textAlign: TextAlign.end,
                                                  style: GoogleFonts.montserrat(
                                                    color: HexColor("#000000"),
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                      ),
                    ),
                  ),
                ),
                actions: [
                  historyList.length > 10 && seeMoreData == false
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 20, left: 80),
                          child: TextButton(
                            onPressed: () {
                              dialogState(() {
                                seeMoreData = true;
                              });
                            },
                            child: Text(
                              "See More",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: HexColor("#892913"),
                                  fontSize: 16),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
                actionsAlignment: MainAxisAlignment.start,
              );
            });
          },
        );
      }
    }

    showLoadingForHistory = false;
    notifyListeners();
  }

  List<String> dropDownByKey({required String dropDownKey}) {
    List<String> keysArray = [];
    if (dropDownKey.contains("select_dropdown_")) {
      keysArray = dropDownKey.split("select_dropdown_");
      print("Keys : $keysArray");
    } else {
      keysArray = dropDownKey.split("multiple_select_");
    }
    String mDropDownKey = keysArray[1];
    List<String> dropDownList = [];

    //General Category Dropdowns

    if (mDropDownKey == "ditch_clean_approach") {
      dropDownList = ["Geen slootschonen", "Baggerspuit", "Anders"];
    }
    if (mDropDownKey == "main_type_cattle_farm") {
      dropDownList = [
        "Dairy",
        "Meat",
        "Double-purpose cattle",
        "Arable",
        "Mixed"
      ];
    }
    if (mDropDownKey == "milk_supplied_to_whom") {
      dropDownList = [
        "Ekoholland",
        "A-ware",
        "Cono",
        "Graafstroom",
        "RFC",
        "other"
      ];
    }

    // Flora category dropdowns

    if (mDropDownKey == "propertyscan_elements") {
      dropDownList = [
        "Bloementuin",
        "Bijenkorf",
        "Erfscan-elementen",
        "Vruchtdragende bomen",
        "Overige bomen en struiken",
        "Insectenhotels/ Schuil -en Overwinterplaatsen",
        "Nestkasten",
        "Broedplaatsen voor vogels",
        "Voedselhagen",
        "Houtwallen",
        "Takkenrillen",
        "Amfibieënpoel"
      ];
    }

    if (mDropDownKey == "nest_protection") {
      dropDownList = [
        "Geen nestbescherming",
        "Mozaikbeheer",
        "Voorbeweiden",
        "Uitgesteld maaien",
        "Legselbeheer"
      ];
    }
    if (mDropDownKey == "pesticides_cropland") {
      dropDownList = [
        "Nee",
        "Alleen op grasland",
        "Alleen op akkerland",
        "Op grasland en akkerland"
      ];
    }
    if (mDropDownKey == "pesticides_grassland") {
      dropDownList = [
        "Nee",
        "Alleen op grasland",
        "Alleen op akkerland",
        "Op grasland en akkerland"
      ];
    }
    if (mDropDownKey == "unwanted_plants") {
      dropDownList = ["a lot of nuisance", "little nuisance", "no nuisance"];
    }
    if (mDropDownKey == "stall_type") {
      dropDownList = [
        "Cubicles",
        "Cubicles extra comfort",
        "Potting stable",
        "Bedded pack barn"
      ];
    }
    if (mDropDownKey == "litter_type") {
      dropDownList = [
        "(Nature) cuttings ",
        "Straw",
        "Sawdust",
        "Woodchips",
        "other"
      ];
    }
    if (mDropDownKey == "type_grazing") {
      dropDownList = [
        "extensive grazing",
        "nature grazing",
        "new dutch grazing",
        "stand grazing",
        "strip grazing",
        "other"
      ];
    }
    if (mDropDownKey == "compostnatuur_ton") {
      dropDownList = [
        "Above ground",
        "Injection with spray hose",
        "Trailinghose",
        "Drag foot"
      ];
    }
    if (mDropDownKey == "way") {
      dropDownList = [
        "Above ground",
        "Injection with spray hose",
        "Trailinghose",
        "Drag foot"
      ];
    }
    if (mDropDownKey == "fertilizer_type") {
      dropDownList = ["Kas", "Amine", "Anders", "Urenum"];
    }
    if (mDropDownKey == "enrichment_separate") {
      dropDownList = ["Carbon", "Sea salt", "Bacteria", "Other"];
    }
    if (mDropDownKey == "water_management") {
      dropDownList = ["A lot", "A little", "None"];
    }
    if (mDropDownKey == "supply_meat_whom") {
      dropDownList = ["Grutto", "Other"];
    }
    if (mDropDownKey == "where_products_sold") {
      dropDownList = [
        ">50 % buiten Europa",
        ">50% binnen Europa",
        ">50% binnen Nederland",
        ">50% lokaal"
      ];
    }

    if (mDropDownKey == "catering_intensity_on_farm") {
      dropDownList = ["None", "Occasional", "Structural", "Professional"];
    }
    if (mDropDownKey == "care_facilities_intensity") {
      dropDownList = ["None", "Occasional", "Structural", "Professional"];
    }
    if (mDropDownKey == "recreation_intensity_on_farm") {
      dropDownList = ["None", "Occasional", "Structural", "Professional"];
    }
    if (mDropDownKey == "education_intensity_on_farm") {
      dropDownList = ["None", "Occasional", "Structural", "Professional"];
    }
    if (mDropDownKey == "shop_intensity_on_farm") {
      dropDownList = ["None", "Occasional", "Structural", "Professional"];
    }
    if (mDropDownKey == "shop_intensity_on_farm") {
      dropDownList = ["None", "Occasional", "Structural", "Professional"];
    }
    if (mDropDownKey == "advisor_occasional_structural") {
      dropDownList = ["Occasional", "Structural"];
    }

    if (mDropDownKey == "farm_tours_occasional_structural") {
      dropDownList = ["Occasional", "Structural"];
    }

    if (mDropDownKey == "yield_production_land") {
      dropDownList = [
        "in tonnes dry matter: >10",
        "11",
        "8 - 10",
        "9",
        "<8",
        "7"
      ];
    }
    if (mDropDownKey == "protein") {
      dropDownList = [
        "125 - 175g/kg protein in dry matter",
        "<125g/kg protein in dry matter",
        ">175g/kg protein in dry matter"
      ];
    }

    if (mDropDownKey == "social_media") {
      dropDownList = [
        "Facebook",
        "Twitter",
        "Instagram",
        "Linkedin",
        "Youtube"
      ];
    }

    if (mDropDownKey == "by_products_list") {
      dropDownList = [
        "Snijmais",
        "Restromen",
        "Lokaal gras",
        "Kuilgras",
        "Krachtvoer"
      ];
    }

    if (mDropDownKey == "fertilizer_type") {
      dropDownList = ["Kas", "Amine", "Anders", "Urenum"];
    }

    if (mDropDownKey == "alternative_business") {
      dropDownList = [
        "Care facility",
        "Cheese",
        "Shop",
        "No sidebranch",
        "Other"
      ];
    }

    if (mDropDownKey == "activities") {
      dropDownList = [
        "Recreatie",
        "Natuursubsidies",
        "Horeca",
        "Overnachting",
        "Zaalverhuur",
        "Educatie",
        "Melktap",
        "Eieren verkoop",
        "Kaas verkoop",
        "Groente verkoop",
        "Winkel"
      ];
    }

    return dropDownList;
  }
}
