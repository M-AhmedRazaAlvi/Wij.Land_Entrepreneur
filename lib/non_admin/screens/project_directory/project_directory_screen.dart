import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:wij_land/non_admin/screens/project_directory/widgets/not_participating_screen.dart';
import 'package:wij_land/non_admin/screens/project_directory/widgets/participating_screen.dart';
import 'package:wij_land/utils/functions.dart';
import '../../../app_common_widgets/custom_text.dart';
import '../../../utils/responsive.dart';
import '../../../utils/styles.dart';
import '../../app_common_widgets/large_screen.dart';
import '../../providers/farm_computer_projects_provider/farm_computer_project_directory_screen_provider.dart';
import 'package:flutter/src/widgets/framework.dart';
class ProjectDirectoryScreen extends StatefulWidget {
  final argument;
  const ProjectDirectoryScreen({Key? key,this.argument}) : super(key: key);

  @override
  State<ProjectDirectoryScreen> createState() => _ProjectDirectoryScreenState();
}

class _ProjectDirectoryScreenState extends State<ProjectDirectoryScreen> {
  @override
  void initState() {
    var _provider = Provider.of<FarmComputerProjectDirectoryScreenProvider>(context, listen: false);
    _provider.getProjectsData(mSearchString: '', mStatus: 'active_participation').then((value) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Title(
          title: 'Projects',
          color: Colors.black,
          child: VisibilityDetector(
            key:  Key('ProjectScreen-key'),
            onVisibilityChanged: (visibilityInfo) {
              var visiblePercentage = visibilityInfo.visibleFraction * 100;
              if (visiblePercentage > 50) {
                if(widget.argument!=null) {
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
                      'Projects',
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
                    Text(
                      'Projects'.tr(),
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: darkRed),
                    ),
                  ];
                }
              }
            },
            child:  Consumer<FarmComputerProjectDirectoryScreenProvider>(
                builder: (context, _provider, widget) {
                return DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomText(
                              text: "Projects".tr(), // widget.detailsResponse.data?.entrepreneurName ?? "",
                              color: Color(0xffA71832),
                              size: Responsive.isDesktop(context) ? 20 : 16,
                              weight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            TabBar(
                                padding: EdgeInsets.zero,
                                isScrollable: true,
                                indicatorPadding: EdgeInsets.only(right: 20),
                                labelPadding: EdgeInsets.only(bottom: 10, right: 20),
                                indicatorColor: darkGreen,
                                onTap: (value) async {
                                  setState(() {
                                    _provider.mTabPosition = value;
                                  });
                                  if (value == 0) {
                                    await _provider.getProjectsData(mSearchString: '', mStatus: 'active_participation');
                                  } else {
                                    await _provider.getProjectsData(mSearchString: '', mStatus: 'not_participation');
                                  }
                                  setState(() {});
                                },
                                tabs: [
                                  CustomText(
                                    text: "Participating".tr(),
                                    color: _provider.mTabPosition == 0 ? darkGreen : Colors.black,
                                    size: 12,
                                  ),
                                  CustomText(
                                    size: 12,
                                    text: "Not Participating".tr(),
                                    color: _provider.mTabPosition == 1 ? darkGreen : Colors.black,
                                  ),
                                ]),
                            SizedBox(
                              height: 12,
                            ),
                            _provider.mShowLoading
                                ? Container(
                                    height: getHeight(context) * 0.7,
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      enabled: true,
                                      child: GridView.builder(
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10,
                                        ),
                                        itemBuilder: (c, index) {
                                          return Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: getHeight(context) * 0.2,
                                                color: Colors.white,
                                                width: getWidth(context) * 0.15,
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                              ),
                                              Container(
                                                width: getWidth(context) * 0.15,
                                                height: 12.0,
                                                color: Colors.white,
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(vertical: 2.0),
                                              ),
                                              Container(
                                                width: getWidth(context) * 0.1,
                                                height: 8.0,
                                                color: Colors.white,
                                                margin: EdgeInsets.only(left: 29),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(vertical: 2.0),
                                              ),
                                              Container(
                                                width: getWidth(context) * 0.1,
                                                height: 8.0,
                                                color: Colors.white,
                                                margin: EdgeInsets.only(left: 29),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                : _provider.mTabPosition == 0
                                    ? Card(child: ParticipatingScreen(arguments: this.widget.argument,))
                                    : Card(child: NotParticipatingScreen()),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
            ),
          ),
        );
  }
}
