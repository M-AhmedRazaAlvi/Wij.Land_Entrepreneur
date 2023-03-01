import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/anacdots_mobile/app_common_widgets/click_icon_widget.dart';
import 'package:wij_land/anacdots_mobile/app_common_widgets/selectable_dropdown_widget.dart';
import 'package:wij_land/anacdots_mobile/providers/anecdotes_directory_providers/anecdotes_file_provider.dart';
import 'package:wij_land/anacdots_mobile/screens/dashboard/anacdot_directory/report/widget/report_screen.dart';
import 'package:wij_land/anacdots_mobile/utils/NotificationKeys.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/utils/styles.dart';
import '../../../../../utils/functions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../app_common_widgets/add_text_widget_button.dart';
import '../../../../app_common_widgets/styles.dart';
import '../../../../models/anecdotes_model/get_my_anecdotes_response.dart';
import '../AddNewAnacdot.dart';

class MyAnecdotesScreen extends StatefulWidget {
  const MyAnecdotesScreen({Key? key}) : super(key: key);

  @override
  _MyAnecdotesScreenState createState() => _MyAnecdotesScreenState();
}

class _MyAnecdotesScreenState extends State<MyAnecdotesScreen> {
  TextEditingController dateCtl = TextEditingController();
  bool showAll = false;
  bool addImage = false;
  DateTime? date;
  List<String> itemsList = [
    "Inspiration",
    "Natural Capital",
    "Social Capital",
    "Financial Capital"
  ];
  String selectedItem = "Inspiration";
  List<String> selectedItemsList = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  bool isLoading = true;

  getData() async {
    var provider =
        Provider.of<CreateMyAnecdotesFileProvider>(context, listen: false);
    provider.searchTapped = false;
    provider.showFilters = false;

    await provider.getAnacdotsProjectDropdownData();
    await provider.getAnacdotsOrganizationsDropdownData();
    await provider.getAnacdotsPersonsDropdownData();
    //  await provider.getAnacdotsLocationsDropdownData();
    await provider.getAnecdotesFiles();

    provider.mSearchController.addListener(() {
      if (provider.mSearchController.text.isEmpty) {
      } else {
        provider.getAnecdotesFiles();
      }
    });
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CreateMyAnecdotesFileProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.white,
                elevation: 1,
                title: CustomText(
                    text: PrefernceKey.myAnecdotes, weight: FontWeight.bold),
                leading: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back, color: darkBlack, size: 20)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AnimatedContainer(
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 400),
                      height: 45,
                      width: provider.searchTapped ? 200 : 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: greenColor, width: 2)),
                      child: Center(
                        child: Row(
                          children: [
                            if (provider.searchTapped)
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: greenColor,
                                      size: 18,
                                    ),
                                    contentPadding: EdgeInsets.only(top: 5),
                                  ),
                                  onSubmitted: (v) async {
                                    await provider.getAnecdotesFiles();
                                  },
                                  controller: provider.mSearchController,
                                  autofocus: true,
                                ),
                              ),
                            SizedBox(
                              height: 45,
                              width: 45,
                              child: InkWell(
                                onTap: () {
                                  if (provider
                                          .mSearchController.text.isNotEmpty &&
                                      provider.searchTapped) {
                                    provider.mSearchController.clear();
                                    provider.getAnecdotesFiles();
                                  }
                                  setState(() {
                                    //  provider.mSearchController.clear();
                                    provider.searchTapped =
                                        !provider.searchTapped;
                                    provider.showFilters = false;
                                  });
                                },
                                hoverColor: Colors.transparent,
                                child: Icon(
                                  provider.searchTapped
                                      ? Icons.close
                                      : Icons.search,
                                  color: greenColor,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // ClickIconWidget(icon: Icons.search),
                    SizedBox(width: 6),
                    InkWell(
                        onTap: () {
                          setState(() {
                            //  provider.searchTapped = false;
                            FocusManager.instance.primaryFocus?.unfocus();
                            provider.showFilters = true;
                          });
                        },
                        child:
                            ClickIconWidget(icon: Icons.filter_alt_outlined)),
                    SizedBox(width: 6),
                    SizedBox(
                      height: 45,
                      child: AddTextWidgetButton(
                        text: PrefernceKey.addNew,
                        backgrundColor: greenColor,
                        onPress: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    CreateAnacdoteScreen() // DailyReportsScreen(),
                                ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              provider.showFilters
                  ? SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: SizedBox(
                              width: getHeight(context) / 0.45,
                              child: SelectableDropdownWidget(
                                items: provider.personsItemList,
                                title: PrefernceKey.people,
                                mSelectedValue:
                                    provider.anacdotsPersonsDropDownName,
                                mSelectedItemsList: provider
                                    .selectedAnacdotsPersonsDropDownList,
                                mOnDropDownChange: (value) {
                                  setState(
                                    () {
                                      provider.anacdotsPersonsDropDownName =
                                          value as String;
                                      if (!provider
                                          .selectedAnacdotsPersonsDropDownList
                                          .contains(provider
                                              .anacdotsPersonsDropDownName)) {
                                        var index = provider.personsItemList
                                            .indexOf(provider
                                                .anacdotsPersonsDropDownName);
                                        provider.mSelectedPersonsIdsList.add(
                                            provider
                                                .anacdotsPersonsDropDownsResponse!
                                                .data![index]
                                                .id!);
                                        provider
                                            .selectedAnacdotsPersonsDropDownList
                                            .add(provider
                                                .anacdotsPersonsDropDownName);
                                      }
                                      print(
                                          "LIst === ${provider.mSelectedPersonsIdsList}");
                                      //  print("selected ${provider.selectedAnacdotsPersonsDropDownList}");
                                      // _provider.mShowFilterActions = true;
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: SizedBox(
                              width: getHeight(context) / 0.45,
                              child: SelectableDropdownWidget(
                                items: provider.organizationsItemList,
                                title: PrefernceKey.organization,
                                mSelectedValue:
                                    provider.anacdotsOrganizationsDropDownName,
                                mSelectedItemsList: provider
                                    .selectedAnacdotsOrganizationstDropDownList,
                                mOnDropDownChange: (value) {
                                  setState(
                                    () {
                                      provider.anacdotsOrganizationsDropDownName =
                                          value as String;
                                      if (!provider
                                          .selectedAnacdotsOrganizationstDropDownList
                                          .contains(provider
                                              .anacdotsOrganizationsDropDownName)) {
                                        var index = provider
                                            .organizationsItemList
                                            .indexOf(provider
                                                .anacdotsOrganizationsDropDownName);
                                        provider.mSelectedOrganizationsIdsList
                                            .add(provider
                                                .anacdotsOrganizationsDropDownsResponse!
                                                .data![index]
                                                .id!);
                                        provider
                                            .selectedAnacdotsOrganizationstDropDownList
                                            .add(provider
                                                .anacdotsOrganizationsDropDownName);
                                      }
                                      print(
                                          "selected ${provider.selectedAnacdotsOrganizationstDropDownList}");
                                      // _provider.mShowFilterActions = true;
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(left: 10, right: 10),
                          //   child: SizedBox(
                          //     width: getHeight(context) / 0.45,
                          //     child: SelectableDropdownWidget(
                          //       items: itemsList,
                          //       title: PrefernceKey.tags,
                          //       mSelectedValue: selectedItem,
                          //       mSelectedItemsList: selectedItemsList,
                          //       mOnDropDownChange: (value) {
                          //         setState(
                          //           () {
                          //             selectedItem = value as String;
                          //             if (!selectedItemsList
                          //                 .contains(selectedItem)) {
                          //               selectedItemsList.add(selectedItem);
                          //             }
                          //             print("selected $selectedItemsList");
                          //             // _provider.mShowFilterActions = true;
                          //           },
                          //         );
                          //       },
                          //     ),
                          //   ),
                          // ),
                          Container(
                            height: 80,
                            margin: EdgeInsets.only(left: 17, right: 17),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Date"),
                                InkWell(
                                  onTap: () async {
                                    var mSelectedDateTime =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime.now(),
                                    );
                                    print("Selected Date : $mSelectedDateTime");
                                    if (mSelectedDateTime != null) {
                                      provider.selectedDateTime =
                                          DateFormat('yyyy-MM-dd')
                                              .format(mSelectedDateTime)
                                              .toString();
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: lightGrey, width: 1),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 30,
                                            ),
                                            SizedBox(
                                              width: getWidth(context) * 0.78,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    provider.selectedDateTime,
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFF008055),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.date_range,
                                                    color: lightGrey,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: SizedBox(
                              width: getHeight(context) / 0.45,
                              child: SelectableDropdownWidget(
                                items: provider.projectsItemList,
                                title: PrefernceKey.project,
                                mSelectedValue:
                                    provider.anacdotsProjectDropDownName,
                                mSelectedItemsList: provider
                                    .selectedAnacdotsProjectDropDownList,
                                mOnDropDownChange: (value) {
                                  setState(
                                    () {
                                      provider.anacdotsProjectDropDownName =
                                          value as String;
                                      if (!provider
                                          .selectedAnacdotsProjectDropDownList
                                          .contains(provider
                                              .anacdotsProjectDropDownName)) {
                                        var index = provider.projectsItemList
                                            .indexOf(provider
                                                .anacdotsProjectDropDownName);
                                        provider.mSelectedProjectsIdsList.add(
                                            provider
                                                .anacdotsProjectDropDownsResponse!
                                                .data![index]
                                                .id!);

                                        provider
                                            .selectedAnacdotsProjectDropDownList
                                            .add(provider
                                                .anacdotsProjectDropDownName);
                                      }
                                      print(
                                          "selected ${provider.selectedAnacdotsProjectDropDownList}");
                                      // _provider.mShowFilterActions = true;
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(left: 10, right: 10),
                          //   child: SizedBox(
                          //     width: getHeight(context) / 0.45,
                          //     child: SelectableDropdownWidget(
                          //       items: provider.locationsItemList,
                          //       title: PrefernceKey.location,
                          //       mSelectedValue:
                          //           provider.anacdotsLoctionsDropDownName,
                          //       mSelectedItemsList: provider
                          //           .selectedAnacdotsLocationsDropDownList,
                          //       mOnDropDownChange: (value) {
                          //         setState(
                          //           () {
                          //             provider.anacdotsLoctionsDropDownName =
                          //                 value as String;
                          //             if (!provider
                          //                 .selectedAnacdotsProjectDropDownList
                          //                 .contains(provider
                          //                     .anacdotsLoctionsDropDownName)) {
                          //               provider
                          //                   .selectedAnacdotsLocationsDropDownList
                          //                   .add(provider
                          //                       .anacdotsLoctionsDropDownName);
                          //             }
                          //             print(
                          //                 "selected ${provider.selectedAnacdotsLocationsDropDownList}");
                          //             // _provider.mShowFilterActions = true;
                          //           },
                          //         );
                          //       },
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    )
                  : SizedBox.shrink(),
              provider.showFilters
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                                selectedItem = "Inspiration";
                                selectedItemsList.clear();
                                provider.selectedAnacdotsPersonsDropDownList
                                    .clear();

                                provider
                                    .selectedAnacdotsOrganizationstDropDownList
                                    .clear();

                                provider.selectedAnacdotsProjectDropDownList
                                    .clear();
                                provider.selectedAnacdotsLocationsDropDownList
                                    .clear();
                                provider.mPersonsIdsString = "";
                                provider.mProjectsIdsString = "";
                                provider.mOrganizationsIdsString = "";
                                provider.selectedDateTime = "";
                                provider.mSelectedPersonsIdsList.clear();
                                provider.mSelectedProjectsIdsList.clear();
                                provider.mSelectedOrganizationsIdsList.clear();
                                provider.showFilters = false;
                              });
                              await provider.getAnecdotesFiles();

                              setState(() {
                                isLoading = false;
                              });
                            },
                            child: Text(
                              "CLEAR ALL",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              setState(() {
                                provider.showFilters = false;
                                isLoading = true;
                              });
                              await provider.getAnecdotesFiles();

                              setState(() {
                                isLoading = false;
                              });
                            },
                            child: Text(
                              "APPLY",
                              style: TextStyle(color: greenColor),
                            ),
                          )
                        ],
                      ),
                    )
                  : SizedBox.shrink(),
              SizedBox(height: 10),
            ],
          ),
        ),
        preferredSize: Size.fromHeight(provider.showFilters ? 660 : 130),
      ),
      body: isLoading
          ? Center(
              child: Center(child: SpinKitCircle(color: APPColor.darkGreen)))
          : CustomScrollView(slivers: [
              isLoading ||
                      provider.anecdotesFileResponseModels!.status == 404 ||
                      provider.anecdotesFileResponseModels!.data == [] ||
                      provider.anecdotesFileResponseModels!.data!.isEmpty
                  ? SliverToBoxAdapter(
                      child: SizedBox.shrink(),
                    )
                  : SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CustomText(
                          text: "January",
                          weight: FontWeight.w900,
                          size: 18,
                        ),
                      ),
                    ),
              SliverToBoxAdapter(child: SizedBox(height: 10)),
              provider.anecdotesFileResponseModels!.status == 404
                  ? SliverToBoxAdapter(
                      child: Container(
                        height: getHeight(context),
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.all(20),
                        child: CustomText(
                          text: "No data found",
                          color: Colors.red,
                          weight: FontWeight.w700,
                          size: 20,
                        ),
                      ),
                    )
                  : provider.anecdotesFileResponseModels!.data == [] ||
                          provider.anecdotesFileResponseModels!.data!.isEmpty
                      ? SliverToBoxAdapter(
                          child: Container(
                            height: getHeight(context),
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.all(20),
                            child: CustomText(
                              text: "No data found",
                              color: Colors.red,
                              weight: FontWeight.w700,
                              size: 20,
                            ),
                          ),
                        )
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => CalendarDetailsWidget(
                              response: provider
                                  .anecdotesFileResponseModels!.data![index],
                              anecdotID: provider.anecdotesFileResponseModels!
                                  .data![index].id!,
                              title: provider.anecdotesFileResponseModels!
                                  .data![index].title
                                  .toString(),
                              subtitle: provider.anecdotesFileResponseModels!
                                  .data![index].description
                                  .toString(),
                              date: provider.anecdotesFileResponseModels!
                                      .data![index].date ??
                                  "-",
                              fileNum: provider.anecdotesFileResponseModels!
                                  .data![index].anecdoteFiles!.length
                                  .toString(),
                            ),
                            childCount: provider
                                .anecdotesFileResponseModels!.data!.length,
                          ),
                        )
            ]),
    );
  }
}

class CalendarDetailsWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final String date;
  final String fileNum;
  final int anecdotID;
  DataModel? response;

  CalendarDetailsWidget(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.date,
      required this.fileNum,
      required this.anecdotID,
      required this.response})
      : super(key: key);

  @override
  State<CalendarDetailsWidget> createState() => _CalendarDetailsWidgetState();
}

class _CalendarDetailsWidgetState extends State<CalendarDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReportScreen(
                          anecdoteID: widget.anecdotID,
                          model: widget.response!)));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: widget.title,
                          size: 15,
                          lines: 1,
                          color: darkBlueAnec,
                          overflows: TextOverflow.ellipsis,
                          textAligns: TextAlign.start,
                          weight: FontWeight.w900,
                        ),
                        SizedBox(height: 4),
                        Container(
                          constraints:
                              BoxConstraints(maxHeight: 55, minHeight: 20),
                          child: ClipRect(
                            child: HtmlWidget(
                              widget.subtitle,
                              textStyle: TextStyle(
                                  //  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.black,
                                  overflow: TextOverflow.ellipsis

                                  // textStyle: TextStyle(
                                  //   fontFamily: Montserrat_Medium,
                                  // ),
                                  ),
                            ),
                          ),
                        )
                        // Html(
                        //   shrinkWrap: true,
                        //   data: widget.subtitle,
                        //   style: {
                        //     "#": Style(
                        //         padding: EdgeInsets.zero,
                        //         margin: EdgeInsets.zero),
                        //     "body": Style(
                        //         fontWeight: FontWeight.w300,
                        //         fontSize: FontSize.smaller,
                        //         textAlign: TextAlign.start,
                        //         textOverflow: TextOverflow.ellipsis,
                        //         maxLines: 1,
                        //         padding: EdgeInsets.zero,
                        //         margin: EdgeInsets.zero),
                        //     "span ": Style(
                        //         fontWeight: FontWeight.w300,
                        //         fontSize: FontSize.smaller,
                        //         textAlign: TextAlign.start,
                        //         textOverflow: TextOverflow.ellipsis,
                        //         maxLines: 1,
                        //         padding: EdgeInsets.zero,
                        //         margin: EdgeInsets.zero),
                        //   },
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.calendar_today, size: 15),
                            SizedBox(width: 5),
                            CustomText(
                              text: widget.date,
                              size: 12,
                              lines: 1,
                              overflows: TextOverflow.ellipsis,
                              textAligns: TextAlign.start,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.calendar_today, size: 15),
                            SizedBox(width: 5),
                            CustomText(
                              text: widget.fileNum,
                              size: 12,
                              lines: 1,
                              overflows: TextOverflow.ellipsis,
                              textAligns: TextAlign.start,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.arrow_forward_ios_outlined, size: 10),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.black12,
            thickness: 0.5,
          )
        ],
      ),
    );
  }
}
