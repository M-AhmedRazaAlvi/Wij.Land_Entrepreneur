import 'package:flutter/material.dart';
import 'package:wij_land/non_admin/routes/routes.dart';
import 'package:wij_land/non_admin/screens/computer_events/farm_computer_event_main_screen.dart';
import 'package:wij_land/non_admin/screens/computer_events/farm_computer_events_id_media_file_screen.dart';
import 'package:wij_land/non_admin/screens/contact_moments/farm_computer_contact_moments.dart';
import 'package:wij_land/non_admin/screens/dashboard/dashboard_screen.dart';
import 'package:wij_land/non_admin/screens/data_overview/home/data_overview_home_screen.dart';
import 'package:wij_land/non_admin/screens/member_directory/farm_computer_members_screens.dart';
import 'package:wij_land/non_admin/screens/parcel_data/parcel_data_screen.dart';
import 'package:wij_land/non_admin/screens/permissions/permission_detail_screen.dart';
import 'package:wij_land/non_admin/screens/permissions/permssion_screen.dart';
import 'package:wij_land/non_admin/screens/project_dashboard/Project_files/farm_project_file.dart';
import 'package:wij_land/non_admin/screens/project_dashboard/project_actions/project_actions_screen.dart';
import 'package:wij_land/non_admin/screens/project_dashboard/project_dashboard_screen.dart';
import 'package:wij_land/non_admin/screens/project_directory/project_directory_screen.dart';

import '../../screens/settings/privacy/privacy_settings_screen.dart';
import '../screens/action_directory/farm_computer_actions_screen.dart';
import '../screens/computer_file/farm_computer_file_screens.dart';
import '../screens/parcels_directory/parcels_directory_screen.dart';
import '../screens/profile/view/profile_page.dart';
import '../screens/project_dashboard/project_contact/farm_project_contact_moments.dart';

Route<dynamic> generateFarmerRoute(RouteSettings settings) {
  // debug debugPrint" THIS ${settings.arguments.toString()}");
  var args = settings.arguments;
  switch (settings.name) {
    //HOME
    case farmerRoute:
      return _getPageRoute(const DashboardScreen());

    //PROJECT DIRECTORY
    case farmComputerProjectDashboardPageRoute:
      return _getPageRoute(ProjectDashboardScreen(
        aurguments: args,
      ));

    // farm Computer Network events

    case farmComputerProjectDirectoryPageRoute:
      return _getPageRoute(ProjectDirectoryScreen(argument: args));

    case eventsFileScreenPageRoute:
      return _getPageRoute(FarmComputerEventsIdMediaFileScreens(
        eventId: args,
      ));
    case eventsCalenderListPageRoute:
      return _getPageRoute(FarmComputerEventsMainScreens(
        arguments: args,
      ));
    case farmProjectFileScreenPageRoute:
      return _getPageRoute(FarmComputerProjectFileScreens(prjoectId: args));

    case farmComputerFileScreensPageRoute:
      return _getPageRoute(FarmComputerFilesScreens(
        arguments: args,
      ));
    case projectContactMomentScreensPageRoute:
      return _getPageRoute(FramComputerProjectContactMomentScreens());

    case farmComputerParcelRoute:
      return _getPageRoute(ParcelsDirectoryScreen(
        arguments: args,
      ));

    case farmComputerProjectActionRoute:
      return _getPageRoute(ProjectActionsScreen());

    case farmComputerProfileRoute:
      return _getPageRoute(ProfilePage());

    case farmComputerActionRoute:
      return _getPageRoute(FarmComputerActionsScreen(
        arguments: args,
      ));

    case farmComputerParcelDataRoute:
      return _getPageRoute(ParcelDataScreen(arguments: args));

    case farmComputerContactMomentName:
      return _getPageRoute(FramComputerContactMomentScreens(
        arguments: args,
      ));

    case farmComputerPrivacySettingsRoute:
      return _getPageRoute(PrivacySettingsScreen());

    case farmComputerDataOverviewRoute:
      return _getPageRoute(DataOverViewHomeScreen());
    case farmerComputerMemberScreenRoute:
      return _getPageRoute(FarmComputerMemberScreen());
    case farmerComputerPermissionsRoute:
      return _getPageRoute(PermissionsScreen());

    case farmerComputerPermissionsPendingRoute:
      return _getPageRoute(PermissionRequestDetail(
        aurguments: args,
      ));

    default:
      return _getPageRoute(const DashboardScreen());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

Map<String, WidgetBuilder> routes() {
  return {
    //HOME
    farmerRoute: (context) => const DashboardScreen(),

    // farm Events
    eventsFileScreenPageRoute: (context) =>
        FarmComputerEventsIdMediaFileScreens(),
    //FARM COMPUTER NETWORK
    eventsCalenderListPageRoute: (context) => FarmComputerEventsMainScreens(),
    farmComputerProjectDashboardPageRoute: (context) =>
        ProjectDashboardScreen(),

    farmProjectFileScreenPageRoute: (context) =>
        FarmComputerProjectFileScreens(),
    projectContactMomentScreensPageRoute: (context) =>
        FramComputerProjectContactMomentScreens(),
    farmComputerFileScreensPageRoute: (context) => FarmComputerFilesScreens(),

    //FARM COMPUTER NETWORK Contact Moments

    farmComputerContactMomentName: (context) =>
        FramComputerContactMomentScreens(),

    farmerComputerPermissionsPendingRoute: ((context) =>
        PermissionRequestDetail()),

    // farmProfileRoute: (context) => FarmProfileScreens(),
    //projectContactMomentScreensPageRoute: (context) => ProjectContactMomentScreens(),

    farmComputerParcelRoute: (context) => ParcelsDirectoryScreen(),

    farmComputerProjectActionRoute: (context) => const ProjectActionsScreen(),
    farmerComputerMemberScreenRoute: (context) =>
        const FarmComputerMemberScreen(),
    farmComputerActionRoute: (context) => const FarmComputerActionsScreen(),

    farmComputerParcelDataRoute: (context) => const ParcelDataScreen(),
    farmComputerDataOverviewRoute: (context) => DataOverViewHomeScreen(),
    farmComputerPrivacySettingsRoute: (context) =>
        const PrivacySettingsScreen(),
  };
}
