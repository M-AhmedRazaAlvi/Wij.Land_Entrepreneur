import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wij_land/main.dart';
import 'package:wij_land/utils/url_scheme.dart';

import '../../../routes/routes.dart';

// String gloal_base_path = 'mijn.wij.land';
String gloal_base_path='staging-wij.land.landscape.computer';

//staging-wij.land.landscape.computer
//mijn.wij.land

class NavigationProvider extends GetxController {
  static NavigationProvider instance = Get.find();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: 'navigate_provider');
  String path = 'https://$gloal_base_path';
  navigateTo(String routeName) async {
    final prefs = await SharedPreferences.getInstance();
    bool? isAdmin = prefs.getBool('admin_login');
    print("Route Name : $routeName");

    if (isAdmin ?? false || hasToken) {
      if (routeName == homePageRoute) {
        launchUrl('$path/home');
      } else if (routeName == contactMomentRoute) {
        launchUrl('$path/people/10042/contact_moment#');
      } else if (routeName == updateBoerenwijzerRoute) {
        launchUrl('$path/boerenwijzer/update');
      } else if (routeName == themePageRoute) {
        launchUrl('$path/themes');
      } else if (routeName == mainProjectPageRoute) {
        launchUrl('$path/main_projects');
      } else if (routeName == projectPageRoute) {
        launchUrl('$path/sub_projects');
      } else if (routeName == reviewRequestRoute) {
        // launchUrl('$path/home');
      } else if (routeName == funderPageRoute) {
        launchUrl('$path/funders');
      } else if (routeName == permissionsPageRoute) {
        launchUrl('$path/permissions');
      } else if (routeName == wijLandTeamsRoute) {
        launchUrl('$path/wij.land_team');
      } else if (routeName == programmesRoute) {
        launchUrl('$path/programme');
      } else if (routeName == contactsPageRoute) {
        launchUrl('$path/people');
      } else if (routeName == farmersPageRoute) {
        launchUrl('$path/farmers');
      } else if (routeName == organizationsPageRoute) {
        launchUrl('$path/organizations');
      } else if (routeName == farmsPageRoute) {
        launchUrl('$path/farms');
      } else if (routeName == projectsPageRoute) {
        launchUrl('$path/projects');
      } else if (routeName == actionsPageRoute) {
        launchUrl('$path/actions');
      } else if (routeName == pilotContractsPageRoute) {
        launchUrl('$path/contracts');
      } else if (routeName == biomassMapPageRoute) {
        launchUrl('$path/bokasi_heap');
      } else if (routeName == visualizationPageRoute) {
        launchUrl('$path/boerenwijzer');
      } else if (routeName == socialMediaPageRoute) {
        launchUrl('$path/social_media');
      } else if (routeName == mediaPageRoute) {
        launchUrl('$path/media');
      } else if (routeName == anecdotesPageRoute) {
        launchUrl('$path/anecdotes');
      } else if (routeName == eventsPageRoute) {
        launchUrl('$path/events');
      } else if (routeName == mapPageRoute) {
        launchUrl('$path/map');
      } else if (routeName == dynamicFilterPageRoute) {
        launchUrl('$path/dynamic_filters');
      } else if (routeName == kpisPageRoute) {
        launchUrl('$path/kpis');
      } else if (routeName == melPortalPageRoute) {
        launchUrl('$path/kpis#');
      } else if (routeName == usersPageRoute) {
        launchUrl('$path/users');
      } else if (routeName == rolesPageRoute) {
        launchUrl('$path/roles');
      } else if (routeName == ticketsPageRoute) {
        launchUrl('$path/tickets');
      } else if (routeName == requestPageRoute) {
        launchUrl('$path/permissions');
      } else if (routeName == dynamicKpiPageRoute) {
        launchUrl('$path/dynamic_kpis');
      } else if (routeName == liveViewLogin) {
        launchUrl('$path/login');
      } else {
        print("coming here");
        return navigatorKey.currentState!.pushNamed(routeName);
      }
    } else {
      print("Coming here>>>");
      /* if (routeName == farmerRoute) {
      launchUrl('$path/farmer_home');
    } else if (routeName == farmComputerProjectDirectoryPageRoute) {
      launchUrl('$path/projects_directory');
    } else if (routeName == farmComputerParcelRoute) {
      launchUrl('$path/parcels');
    } else if (routeName == farmComputerActionRoute) {
      launchUrl('$path/action');
    } else if (routeName == eventsFileScreenPageRoute) {
      launchUrl('$path/events_file');
    } else if (routeName == eventsCalenderListPageRoute) {
      launchUrl('$path/events_calendar_list');
    } else if (routeName == farmProjectFileScreenPageRoute) {
      launchUrl('$path/project_file');
    } else if (routeName == farmComputerFileScreensPageRoute) {
      launchUrl('$path/file');
    } else if (routeName == projectContactMomentScreensPageRoute) {
      launchUrl('$path/contact_moment');
    } else if (routeName == farmComputerParcelDataRoute) {
      launchUrl('$path/parcel_data_screen');
    } else if (routeName == farmComputerProjectDashboardPageRoute) {
      launchUrl('$path/project_dashboard');
    }*/
      return navigatorKey.currentState!.pushNamed(routeName);
    }
  }

  Future<dynamic> navigateToWithArguments({String? routeName = '', dynamic arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName!, arguments: arguments);
  }

// Future<dynamic> navigateTo(context,String routeName) {
//     return Navigator.of(context).pushNamed(routeName);
//   }
  goBack() => navigatorKey.currentState!.pop();
}
