import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:wij_land/non_admin/providers/dashobard_provider/main_dashboard_provider.dart';
import 'package:wij_land/non_admin/screens/dashboard/widgets/dashboard_large_screen_widget.dart';
import '../../../utils/controller.dart';
import '../../../utils/styles.dart';
import '../../app_common_widgets/large_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var uniqueKey = Key('nonAdmin-key');
  bool isLoading=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiDashboardCalls();
  }

  apiDashboardCalls() async {
    var provider = Provider.of<MainFCDashboardProvider>(context, listen: false);
    await provider.getBasicInfo();
    // await provider.getParcelData();
    await provider.getFarmFiles();
    await provider.getFarmProjects();
    await provider.getFarmEvents();
    await provider.getFarmContactMoments();
    await provider.getFarmBoerenwijzer();
    await provider.getFarmAction();
    isLoading=false;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainFCDashboardProvider>(
        builder: (context, _basicInfo, child) {
      return VisibilityDetector(
        key:  Key('HomeScreen-key'),
        onVisibilityChanged: (VisibilityInfo visibilityInfo) {
          var visiblePercentage = visibilityInfo.visibleFraction * 100;
          if (visiblePercentage > 50) {
            global_farmer_entitiy.value = [
              Text(
                'Home'.tr(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: darkRed),
              ),
            ];
          }
        },
        child: Scaffold(
            body: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : DashboardLargeScreenWidget(
                    basicInfo: _basicInfo.info,
                    files: _basicInfo.files,
                    projects: _basicInfo.projects,
                    events: _basicInfo.events,
                    moments: _basicInfo.contactMoments,
                    boerenwijzer: _basicInfo.boerenwijzer,
                    action: _basicInfo.fcAction!)),
      );
    });
  }
}
