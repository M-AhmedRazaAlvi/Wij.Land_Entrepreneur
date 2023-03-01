import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import "package:flutter/material.dart";
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wij_land/non_admin/providers/dashobard_provider/main_dashboard_provider.dart';
import 'package:wij_land/non_admin/providers/data_overview_provider/data_overview_screen_provider.dart';
import 'package:wij_land/non_admin/providers/farm_computer_actions_provider/farm_computer_actions_provider.dart';
import 'package:wij_land/non_admin/providers/farm_computer_parcels_provider/farm_computer_parcels_provider.dart';
import 'package:wij_land/non_admin/providers/farm_computer_projects_provider/farm_computer_contact_moments_provider.dart';
import 'package:wij_land/non_admin/providers/farm_computer_projects_provider/farm_computer_event_participating_provider.dart';
import 'package:wij_land/non_admin/providers/farm_computer_projects_provider/farm_computer_events_file_provider.dart';
import 'package:wij_land/non_admin/providers/farm_computer_projects_provider/farm_computer_events_id_response_provider.dart';
import 'package:wij_land/non_admin/providers/farm_computer_projects_provider/farm_computer_events_provider.dart';
import 'package:wij_land/non_admin/providers/farm_computer_projects_provider/farm_computer_my_project_file_provider.dart';
import 'package:wij_land/non_admin/providers/farm_computer_projects_provider/farm_computer_proj_participant_provider.dart';
import 'package:wij_land/non_admin/providers/farm_computer_projects_provider/farm_computer_project_contact_moments_provider.dart';
import 'package:wij_land/non_admin/providers/farm_computer_projects_provider/farm_computer_project_events_provider.dart';
import 'package:wij_land/non_admin/providers/permissions_providers/permission_screen_provider.dart';
import 'package:wij_land/providers/entrepreneur/entrepreneur_contact_moment_provider.dart';
import 'package:wij_land/providers/entrepreneur/entrepreneur_screen_overview_provider.dart';
import 'package:wij_land/providers/entrepreneur/entrepreneur_screen_provider.dart';
import 'package:wij_land/providers/entrepreneur/entrepreneur_supplier_provider.dart';
import 'package:wij_land/providers/entrepreneur/farm_supplier_provider.dart';
import 'package:wij_land/screens/app.dart';
import 'package:window_location_href/window_location_href.dart';

import 'anacdots_mobile/screens/splash_page.dart';
import 'non_admin/providers/farm_computer_file_provider/farm_computer_files_provider.dart';
import 'non_admin/providers/farm_computer_member_provider/farm_computer_members_provider.dart';
import 'non_admin/providers/farm_computer_projects_provider/farm_computer_project_actions_provider.dart';
import 'non_admin/providers/farm_computer_projects_provider/farm_computer_project_details_dashboard_screen_provider.dart';
import 'non_admin/providers/farm_computer_projects_provider/farm_computer_project_directory_screen_provider.dart';
import 'non_admin/providers/farm_computer_projects_provider/farm_computer_project_file_provider.dart';
import 'non_admin/providers/fc_files_provider/main_files_provider.dart';
import 'non_admin/providers/permissions_providers/permission_detail_screen_provider.dart';
import 'non_admin/providers/person_profile_provider.dart';
import 'non_admin/providers/privacy_settings_screen_provider.dart';
import 'providers/GlobalProvider/auth/auth_provider.dart';
import 'providers/entrepreneur/entrepreneur_retailer_provider.dart';

bool hasToken = false;
bool hasAdmin = false;
String initial_route_global = "";
void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EasyLocalization.ensureInitialized();

  if (!kIsWeb) {
    runApp(SplashPage());
  } else {
    // if (defaultTargetPlatform == TargetPlatform.android) {
    //   AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    // }
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await EasyLocalization.ensureInitialized();
    final url = href;
    //var url = window.location.href;
    String token = '';
    if (url!.contains('token')) {
      hasToken = true;
      if (url.contains('entrepreneurs')) {
        token = url.split('=')[1].toString().replaceAll('&page', '').trim();
        initial_route_global = '/entreprenuers_screen';
      } else {
        token = url.split('=')[1].toString().replaceAll('&page', '').trim();
        initial_route_global = '/farm_supplier_screen';
      }
    } else {
      initial_route_global = '/entreprenuers_screen';
    }
    final prefs = await SharedPreferences.getInstance();
    var isAdmin = prefs.get('admin_login');
    debugPrint('has admin = ${isAdmin}');
    if (isAdmin != true) {
      hasAdmin = false;
    } else {
      hasAdmin = true;
    }
    runApp(
      EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('nl')],
        path: 'assets/translation',
        startLocale: Locale('en'),
        fallbackLocale: Locale('en'),
        child: MultiProvider(
            providers: [
              ChangeNotifierProvider<EntrepreneurContactMomentScreenProvider>(
                create: (context) => EntrepreneurContactMomentScreenProvider(),
              ),
              ChangeNotifierProvider<CreateNewEntreprenuerSupplierProvider>(
                  create: (_) => CreateNewEntreprenuerSupplierProvider()),
              ChangeNotifierProvider<CreateNewEntreprenuerSupplierProvider>(
                  create: (_) => CreateNewEntreprenuerSupplierProvider()),
              ChangeNotifierProvider<EntrepreneurRetailerProvider>(
                  create: (_) => EntrepreneurRetailerProvider()),
              ChangeNotifierProvider<EntrepreneurScreenProvider>(
                  create: (context) => EntrepreneurScreenProvider()),
              ChangeNotifierProvider<EntrepreneurOverviewScreenProvider>(
                  create: (context) => EntrepreneurOverviewScreenProvider()),
              // Farm Computer Provider
              ChangeNotifierProvider<CreateFarmComputerEventsIdProvider>(
                  create: (context) => CreateFarmComputerEventsIdProvider()),
              ChangeNotifierProvider<FarmComputerProjectParticipantProvider>(
                  create: (context) =>
                      FarmComputerProjectParticipantProvider()),
              ChangeNotifierProvider<FarmComputerParcelsProvider>(
                  create: (context) => FarmComputerParcelsProvider()),
              ChangeNotifierProvider<CreateFarmComputerEventsFileProvider>(
                  create: (context) => CreateFarmComputerEventsFileProvider()),
              ChangeNotifierProvider<FarmComputerActionProvider>(
                  create: (context) => FarmComputerActionProvider()),
              // ChangeNotifierProvider<FarmComputerDropDownProvider>(
              //   create: (context) => FarmComputerDropDownProvider(),
              // ),
              ChangeNotifierProvider<CreateNewEntreprenuerSupplierProvider>(
                  create: (_) => CreateNewEntreprenuerSupplierProvider()),
              ChangeNotifierProvider<CreateNewEntreprenuerSupplierProvider>(
                  create: (_) => CreateNewEntreprenuerSupplierProvider()),
              ChangeNotifierProvider<EntrepreneurRetailerProvider>(
                  create: (_) => EntrepreneurRetailerProvider()),
              ChangeNotifierProvider<EntrepreneurScreenProvider>(
                  create: (context) => EntrepreneurScreenProvider()),
              ChangeNotifierProvider<EntrepreneurOverviewScreenProvider>(
                  create: (context) => EntrepreneurOverviewScreenProvider()),
              // Farm Computer Provider
              ChangeNotifierProvider<CreateFarmComputerProjectEventsProvider>(
                create: (context) => CreateFarmComputerProjectEventsProvider(),
              ),
              ChangeNotifierProvider<CreateFarmComputerEventsListProvider>(
                create: (context) => CreateFarmComputerEventsListProvider(),
              ),
              ChangeNotifierProvider<ForGotProvider>(
                create: (context) => ForGotProvider(),
              ),
//// FC projects
              ChangeNotifierProvider<
                  FarmComputerProjectDirectoryScreenProvider>(
                create: (context) =>
                    FarmComputerProjectDirectoryScreenProvider(),
              ),
              ChangeNotifierProvider<
                  FarmComputerProjectDetailsDashboardScreenProvider>(
                create: (context) =>
                    FarmComputerProjectDetailsDashboardScreenProvider(),
              ),
              ChangeNotifierProvider<
                  CreateFarmComputerEventsParicipatingProvider>(
                create: (context) =>
                    CreateFarmComputerEventsParicipatingProvider(),
              ),
              // ChangeNotifierProvider<FarmComputerDropDownProvider>(c
              //   create: (context) => FarmComputerDropDownProvider(),
              // ),
              ChangeNotifierProvider<GetFarmSupplier>(
                  create: (context) => GetFarmSupplier()),
              // Farm Computer Provider
              ChangeNotifierProvider<FarmComputerProjectActionProvider>(
                create: (context) => FarmComputerProjectActionProvider(),
              ),
              ChangeNotifierProvider<CreateFarmComputerContactMomentsProvider>(
                create: (context) => CreateFarmComputerContactMomentsProvider(),
              ),
              ChangeNotifierProvider<CreateFarmComputerProjectFilesProvider>(
                create: (context) => CreateFarmComputerProjectFilesProvider(),
              ),
              ChangeNotifierProvider<CreateFarmComputerMyProjectFileProvider>(
                create: (context) => CreateFarmComputerMyProjectFileProvider(),
              ),
              ChangeNotifierProvider<CreateFarmComputerFilesProvider>(
                create: (context) => CreateFarmComputerFilesProvider(),
              ),
              ChangeNotifierProvider<PermissionScreenProvider>(
                create: (context) => PermissionScreenProvider(),
              ),
              ChangeNotifierProvider<PermissionDetailScreenProvider>(
                create: (context) => PermissionDetailScreenProvider(),
              ),
              ChangeNotifierProvider<
                      CreateFarmComputerProjectContactMomentsProvider>(
                  create: (context) =>
                      CreateFarmComputerProjectContactMomentsProvider()),
              ChangeNotifierProvider<MainFCDashboardProvider>(
                create: (context) => MainFCDashboardProvider(),
              ),
              ChangeNotifierProvider<PersonProfileProvider>(
                create: (context) => PersonProfileProvider(),
              ),
              ChangeNotifierProvider<MainFilesProvider>(
                create: (context) => MainFilesProvider(),
              ),
              ChangeNotifierProvider<PrivacySettingsScreenProvider>(
                create: (context) => PrivacySettingsScreenProvider(),
              ),
              ChangeNotifierProvider<DataOverViewProvider>(
                create: (context) => DataOverViewProvider(),
              ),
              ChangeNotifierProvider<ForGotProvider>(
                create: (context) => ForGotProvider(),
              ),
              ChangeNotifierProvider<FarmComputerMembersProvider>(
                create: (context) => FarmComputerMembersProvider(),
              ),
              ChangeNotifierProvider<PermissionDetailScreenProvider>(
                create: (context) => PermissionDetailScreenProvider(),
              ),
            ],
            child: MyApp(
              token: token,
            )),
      ),
    );
  }
}
