import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hovering/hovering.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:wij_land/non_admin/app_common_widgets/MapWithPolygon.dart';
import 'package:wij_land/non_admin/providers/dashobard_provider/main_dashboard_provider.dart';
import 'package:wij_land/non_admin/screens/project_dashboard/Project_events/farm_computer_project_events_screen.dart';
import 'package:wij_land/non_admin/screens/project_dashboard/Project_files/farm_project_file.dart';
import 'package:wij_land/non_admin/screens/project_dashboard/project_actions/project_actions_screen.dart';
import 'package:wij_land/non_admin/screens/project_dashboard/project_contact/farm_project_contact_moments.dart';
import 'package:wij_land/non_admin/screens/project_dashboard/project_participating/project_participating_screen.dart';
import 'package:wij_land/non_admin/screens/project_dashboard/widgets/project_dashboard_widget.dart';
import 'package:wij_land/utils/styles.dart';
import 'package:latlong2/latlong.dart' as latLng;
import '../../../app_common_widgets/custom_text.dart';
import '../../../utils/functions.dart';
import '../../../utils/images.dart';
import '../../../utils/responsive.dart';
import '../../app_common_widgets/large_screen.dart';
import '../../models/farm_computer_parcels/response/get_farm_computer_parcels_response.dart';
import '../../providers/farm_computer_projects_provider/farm_computer_project_details_dashboard_screen_provider.dart';

class ProjectDashboardScreen extends StatefulWidget {
  final aurguments;

  const ProjectDashboardScreen({Key? key, this.aurguments}) : super(key: key);

  @override
  State<ProjectDashboardScreen> createState() => _ProjectDashboardScreenState();
}

class _ProjectDashboardScreenState extends State<ProjectDashboardScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    print("Arg : ${this.widget.aurguments} ");

    _tabController = TabController(vsync: this, length: 6);
    getData();

    super.initState();
  }

  getData() {
    var _provider = Provider.of<FarmComputerProjectDetailsDashboardScreenProvider>(context, listen: false);
    _provider.mapOpened = false;
    _provider.position = 0;
    _provider.isData = true;
    // await  _provider.getPacelInfo();
    _provider.getProjectDetailsData(id: widget.aurguments['id']);
    _provider.getFarmComputerProjectEvents(projectId: widget.aurguments['id']);
    _provider.getFarmComputerProjectActions(projectID: widget.aurguments['id']);
    _provider.getProjectParcelsData(id: widget.aurguments['id']);
    _provider.getFarmComputerProjectContactMoments(projectID: widget.aurguments['id']);
    hashMap=widget.aurguments;
    _provider.isData = false;
  }

  bool mapOpened = false;
  Map? hashMap;
  @override
  Widget build(BuildContext context) {
    final List<Tab> myTabs = <Tab>[
      Tab(text: "Dashboard".tr()),
      Tab(text: "Participating".tr()),
      Tab(text: "Files".tr()),
      Tab(text: "Actions".tr()),
      Tab(text: "Contact".tr()),
      Tab(text: "Events".tr()),
    ];
    return Consumer2<FarmComputerProjectDetailsDashboardScreenProvider, MainFCDashboardProvider>(builder: (context, _provider, dbProvider, widget) {
      return DefaultTabController(
        length: 6,
        child: Scaffold(
          body:
          _provider.mShowLoading
              ? SizedBox(
            // margin: const EdgeInsets.symmetric(
            //     vertical: 10),
            // padding: const EdgeInsets.all(10),
            height: getHeight(context),
            width: getWidth(context),
            child: Center(child: CircularProgressIndicator()),
          )
              : Title(
             title: '${_provider.farmComputersProjectDetailResponseModel!.data?.projectName}',
              color: Colors.black,
              child: VisibilityDetector(
                key: Key('ProjectDashboardScreen-key'),
                onVisibilityChanged: (visibilityInfo) {
                  var visiblePercentage = visibilityInfo.visibleFraction * 100;
                  if (visiblePercentage > 50) {
                    if(hashMap!.keys.contains('args')){
                       global_farmer_entitiy.value = [
                      HoverWidget(
                        child: Text(
                          'Home / '.tr(),

                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: shineGrey,
                            fontFamily: Montserrat_Medium,
                          ),
                        ),
                        hoverChild: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Home / '.tr(),
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: Montserrat_Medium,

                              fontWeight: FontWeight.bold,
                              color: shineGrey,
                              decoration: TextDecoration.underline,
                              decorationThickness: 2,
                            ),
                          ),
                        ),
                        onHover: (event) {},
                      ),
                      Text(
                        '${_provider.farmComputersProjectDetailResponseModel!.data?.projectName}',
                        style: TextStyle(
                          fontFamily: Montserrat_Medium,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: darkRed,
                        ),
                      ),
                    ];
                    }else if(hashMap!.values.contains(true)){
                      global_farmer_entitiy.value = [
                        Text(
                          'Home / '.tr(),

                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: shineGrey,
                            fontFamily: Montserrat_Medium,
                          ),
                        ),
                        HoverWidget(
                          child: Text(
                            'Projects '.tr(),

                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: shineGrey,
                              fontFamily: Montserrat_Medium,
                            ),
                          ),
                          hoverChild: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Projects '.tr(),
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: Montserrat_Medium,

                                fontWeight: FontWeight.bold,
                                color: shineGrey,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2,
                              ),
                            ),
                          ),
                          onHover: (event) {},
                        ),
                        Text(
                          '/ ${_provider.farmComputersProjectDetailResponseModel!.data?.projectName}',
                          style: TextStyle(
                            fontFamily: Montserrat_Medium,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: darkRed,
                          ),
                        ),
                      ];
                    }else{
                      global_farmer_entitiy.value = [
                        HoverWidget(
                          child: Text(
                            'Projects'.tr(),

                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: shineGrey,
                              fontFamily: Montserrat_Medium,
                            ),
                          ),
                          hoverChild: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Projects'.tr(),
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: Montserrat_Medium,

                                fontWeight: FontWeight.bold,
                                color: shineGrey,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2,
                              ),
                            ),
                          ),
                          onHover: (event) {},
                        ),
                        Text(
                          '/ ${_provider.farmComputersProjectDetailResponseModel!.data?.projectName}',
                          style: TextStyle(
                            fontFamily: Montserrat_Medium,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: darkRed,
                          ),
                        ),
                      ];

                    }
                   /* global_farmer_entitiy.value = [
                      HoverWidget(
                        child: Text(
                          'Home / '.tr(),

                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: shineGrey,
                            fontFamily: Montserrat_Medium,
                          ),
                        ),
                        hoverChild: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Home / '.tr(),
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: Montserrat_Medium,

                              fontWeight: FontWeight.bold,
                              color: shineGrey,
                              decoration: TextDecoration.underline,
                              decorationThickness: 2,
                            ),
                          ),
                        ),
                        onHover: (event) {},
                      ),
                      Text(
                        '${_provider.farmComputersProjectDetailResponseModel!.data?.projectName}',
                        style: TextStyle(
                          fontFamily: Montserrat_Medium,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: darkRed,
                        ),
                      ),
                    ];*/
                  }
                },
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              _provider.mShowLoading
                                  ? Container(
                                      // margin: const EdgeInsets.symmetric(
                                      //     vertical: 10),
                                      // padding: const EdgeInsets.all(10),
                                      height: getHeight(context),
                                      width: getWidth(context),
                                      child: Center(child: CircularProgressIndicator()),
                                    )
                                  : Row(
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.symmetric(vertical: 10),
                                            padding: const EdgeInsets.all(10),
                                            height: 100,
                                            decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
                                            child: _provider.farmComputersProjectDetailResponseModel!.data?.bannerImage?.path != null
                                                ? Image.network(
                                                    _provider.farmComputersProjectDetailResponseModel!.data!.bannerImage!.path!,
                                                    fit: BoxFit.cover,
                                                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                      if (loadingProgress == null) return child;
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
                                                  )
                                                : Image(
                                                    image: AssetImage(Images.wallpaper),
                                                    fit: BoxFit.cover,
                                                  )),
                                        CustomText(
                                          text: _provider.farmComputersProjectDetailResponseModel!.data?.projectName ?? "",
                                          color: Color(0xffA71832),
                                          size: Responsive.isDesktop(context) ? 20 : 16,
                                          weight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                              TabBar(
                                padding: EdgeInsets.zero,
                                isScrollable: true,
                                indicatorPadding: EdgeInsets.only(left: 8, right: 20),
                                labelPadding: EdgeInsets.only(left: 8, right: 20),
                                indicatorColor: darkGreen,
                                controller: _tabController,
                                unselectedLabelColor: Colors.black,
                                labelColor: darkGreen,
                                onTap: (value) {
                                  print('value is $value');
                                  setState(() {
                                    _provider.position = value;
                                  });
                                },
                                tabs: myTabs,
                              ),
                            ]),
                          ),
                          _provider.position == 0
                              ? ProjectDashboardWidget(
                                  openMap: () {
                                    setState(() {
                                      _provider.mapOpened = !_provider.mapOpened;
                                    });
                                  },
                                  mOnActionsTap: () {
                                    setState(() {
                                      _tabController!.animateTo(3);
                                      _provider.position = 3;
                                    });
                                  },
                                  mOnEventsTap: () {
                                    setState(() {
                                      _tabController!.animateTo(5);
                                      _provider.position = 5;
                                    });
                                  },
                                  mOnContactTap: () {
                                    setState(() {
                                      _tabController!.animateTo(4);
                                      _provider.position = 4;
                                    });
                                  },
                                  mOnParticipatingTap: () {
                                    setState(() {
                                      _tabController!.animateTo(1);
                                      _provider.position = 1;
                                    });
                                  },
                                )
                              : _provider.position == 1
                                  ? ProjectPartcipatingScreen(
                                      projectID: this.widget.aurguments,
                                    )
                                  : _provider.position == 2
                                      ? FarmComputerProjectFileScreens(
                                          prjoectId: this.widget.aurguments,
                                        )
                                      : _provider.position == 3
                                          ? ProjectActionsScreen(
                                              projectID: this.widget.aurguments,
                                            )
                                          : _provider.position == 4
                                              ? FramComputerProjectContactMomentScreens(projectId: this.widget.aurguments)
                                              : FarmComputerProjectEventsScreens(projectId: this.widget.aurguments),
                        ],
                      ),
                    ),
                    !_provider.mapOpened
                        ? Positioned(
                            top: _provider.mapOpened ? 70 : 20,
                            right: _provider.mapOpened ? 12 : 4,
                            child: Transform.scale(
                                scale: _provider.mapOpened ? 1.2 : 1,
                                child: Column(children: [
                                  SizedBox(
                                      height: _provider.mapOpened ? getHeight(context) : 60,
                                      width: _provider.mapOpened ? getWidth(context) / 2 : 70,
                                      child: InkWell(
                                          child: ClipRRect(
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), topLeft: Radius.circular(50)),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.blue.withOpacity(0.5),
                                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), topLeft: Radius.circular(50))),
                                          padding: EdgeInsets.all(7),
                                          child: InkWell(
                                              onTap: () {
                                                setState(
                                                  () {
                                                    _provider.mapOpened = !_provider.mapOpened;
                                                    //_provider.isClicked = !_provider.isClicked;
                                                  },
                                                );
                                              },
                                              child: Icon(FontAwesomeIcons.map, color: Colors.white, size: 24)),
                                        ),
                                      )))
                                ])))
                        : Positioned(
                            top: _provider.mapOpened ? 0 : 20,
                            right: _provider.mapOpened ? 5 : 4,
                            child: SizedBox(
                              height: _provider.mapOpened ? getHeight(context) - 60 : 70,
                              width: _provider.mapOpened
                                  ? Responsive.isMobile(context)
                                      ? getWidth(context)
                                      : getWidth(context) / 2
                                  : 80,
                              child: _provider.farmComputerProjectParcelsResponse!.statusCode == 404
                                  ? Container(
                                      // height: _provider.mapOpened
                                      //     ? getHeight(context)
                                      //     : 70,
                                      // width: _provider.mapOpened
                                      //     ? getWidth(context) / 2
                                      //     : 80,
                                      // padding: EdgeInsets.symmetric(horizontal: 15),
                                      color: Color.fromARGB(255, 225, 223, 223),
                                      child: Center(
                                        child: CustomText(
                                          text: "There are no registerd parcels in this project",
                                          color: Colors.red,
                                          weight: FontWeight.w700,
                                          size: 14,
                                          lines: 3,
                                        ),
                                      ),
                                    )
                                  : Builder(builder: (context) {
                                      List<List<latLng.LatLng>>? listOfPolygon = [];
                                      List<String> labelList = [];
                                      List<int> indexList = [];
                                      List<bool> activeAndInActiveParcels = [];
                                      for (var i in dbProvider.listOfPacelData!) {
                                        if (i.listOfLatLng.isNotEmpty) {
                                          int index = dbProvider.listOfPacelData!.indexOf(i);
                                          indexList.add(index);
                                          labelList.add('${i.farmName}');
                                          listOfPolygon.add(i.listOfLatLng);
                                        }
                                      }
                                      print("List of parcels Ids ------${dbProvider.listOfallParcelIDs}");
                                      for (var i in dbProvider.listOfallParcelIDs) {
                                        bool contain =
                                            _provider.farmComputerProjectParcelsResponse!.data!.parcels!.any((element) => element.id.toString() == i);

                                        if (contain) {
                                          activeAndInActiveParcels.add(true);
                                        } else {
                                          activeAndInActiveParcels.add(false);
                                        }
                                      }
                                      return MapWithPolygon(
                                        activeParcel: activeAndInActiveParcels,
                                        listOfPolygon: listOfPolygon,
                                        indexList: indexList,
                                        labelList: labelList,
                                        outerPadding: 150,
                                        selectedParcel: '',
                                        showgreen: true,
                                        showCenter: true,
                                      );
                                    }),
                            ),
                          ),
                    if (_provider.mapOpened)
                      if (Responsive.isMobile(context))
                        Positioned(
                          top: 50,
                          right: 16,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height: 12,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _provider.mapOpened = false;
                                  });
                                },
                                child: Container(
                                  height: getHeight(context) * 0.050,
                                  width: getHeight(context) * 0.050,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(3.5),
                                    ),
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.all(4),
                                  child: Center(
                                    child: Icon(
                                      Icons.clear,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    if (_provider.mapOpened)
                      if (!Responsive.isMobile(context))
                        Positioned(
                          top: 0,
                          right: _provider.mapOpened ? getWidth(context) / 1.99 : 0,
                          child: InkWell(
                            onTap: () {
                              _provider.mapOpened = false;
                              setState(() {});
                            },
                            child: Container(
                                width: 48,
                                height: 48,
                                child: Center(
                                    child: Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                )),
                                decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.5),
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), topLeft: Radius.circular(50)))),
                          ),
                        ),
                  ],
                ),
              ),
            ),
        ),
      );
    });
  }
}
