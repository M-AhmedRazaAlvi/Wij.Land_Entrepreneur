import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/non_admin/routes/routes.dart';
import 'package:wij_land/non_admin/screens/dashboard/dashboard_screen.dart';
import 'package:wij_land/screens/Map/map_screen.dart';
import 'package:wij_land/screens/communications/anecdotes/ancedotes_details_screen.dart';
import 'package:wij_land/screens/communications/anecdotes/anecdotes_screen.dart';
import 'package:wij_land/screens/communications/anecdotes/widgets/anecdotes_add_widget.dart';
import 'package:wij_land/screens/communications/anecdotes/widgets/anecdotes_edit_widget.dart';
import 'package:wij_land/screens/communications/events/events_details_screen.dart';
import 'package:wij_land/screens/communications/events/events_screen.dart';
import 'package:wij_land/screens/communications/media/media_details_screen.dart';
import 'package:wij_land/screens/communications/media/media_screen.dart';
import 'package:wij_land/screens/communications/media/widgets/media-add_widget.dart';
import 'package:wij_land/screens/communications/media/widgets/media-edit_widget.dart';
import 'package:wij_land/screens/communications/social_media/social_media_screen.dart';
import 'package:wij_land/screens/dynamic_filters/dynamic_filters_screen.dart';
import 'package:wij_land/screens/entrepreneur_network/farm_supplier/farm_supplier_screen.dart';
import 'package:wij_land/screens/reporting/kpi/kpi_details_screen.dart';
import 'package:wij_land/screens/reporting/kpi/kpi_screen.dart';
import 'package:wij_land/screens/settings/roles/roles_screen.dart';
import 'package:wij_land/screens/settings/tickets/ticket_screen.dart';
import 'package:wij_land/screens/settings/users/users_screen.dart';
import 'package:wij_land/screens/site_layout.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/contacts/add_contact_moment_screen.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/entreprenuers_screen.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/overview/overview_screen.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/suppliers/supplier_screen.dart';

import '../api_clients/BaseClass.dart';
//import 'package:wij_land/routes/routes.dart' as routes;
import '../app_common_widgets/RefreshRoutePage.dart';
import '../non_admin/providers/global_provider/side_menu_provider.dart';
import '../non_admin/screens/site_layout.dart';
import '../providers/GlobalProvider/auth/auth_screen_provider.dart';
import '../providers/GlobalProvider/navigation/navigation_provider.dart';
import '../providers/GlobalProvider/side_menu/side_menu_provider.dart';
import '../routes/routes.dart';
import '../utils/styles.dart';
import 'auth/authentication_page.dart';
import 'farm_networks/farms/farm_profile.dart';
import 'home/home_page.dart';
import 'sustainable_finance/entrepreneurs/contacts/entreprenuer_contact_screen.dart';
import 'sustainable_finance/entrepreneurs/retailers/retailer_screen.dart';

class MyApp extends StatefulWidget {
  final String? token;

  const MyApp({Key? key, this.token}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();

}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    Get.put<SideMenuProvider>(SideMenuProvider());
    Get.put<SideMenuFarmerProvider>(SideMenuFarmerProvider());
    Get.put<NavigationProvider>(NavigationProvider());
    Get.put<AuthScreenProvider>(AuthScreenProvider());
    // Get.put<AuthApiController>(AuthApiController());
    Get.testMode = true;
    if (widget.token!.isNotEmpty) {
      header = {"Authorization": "Bearer ${widget.token!}", "Content-type": "application/json"};
    }
  }



  Locale? _locale;

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {

    if (widget.token!.isNotEmpty) {
      return GetMaterialApp(
        //locale: _locale,

        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        unknownRoute: GetPage(name: authPageRoute, page: () => AuthenticationPage()),
        defaultTransition: Transition.fadeIn,
        // home: PrivacySettingsScreen(),
        getPages: [
          GetPage(name: rootRoute, page: () => const SiteLayout()),
          GetPage(name: authPageRoute, page: () => AuthenticationPage()),
          GetPage(name: homePageRoute, page: () => const HomePage()),

          //REPORTING
          GetPage(name: kpisDetailsPageRoute, page: () => KpiDetailsScreen()),
          GetPage(name: kpisPageRoute, page: () => KpiScreen()),

          //SETTING
          GetPage(name: usersPageRoute, page: () => UserScreen()),
          GetPage(name: rolesPageRoute, page: () => RolesScreen()),
          GetPage(name: ticketsPageRoute, page: () => TicketScreen()),

          //COMMUNICATION
          GetPage(name: mediaPageRoute, page: () => MediaScreen()),
          GetPage(name: mediaDetailPageRoute, page: () => MediaDetailScreen()),
          GetPage(name: mediaEditPageRoute, page: () => EditMediaWidget()),
          GetPage(name: mediaAddPageRoute, page: () => AddMediaWidget()),
          GetPage(name: anecdotesPageRoute, page: () => AnecdotesScreen()),
          GetPage(name: anecdotesDetailPageRoute, page: () => AnecdotesDetailScreen()),
          GetPage(name: anecdotesEditPageRoute, page: () => EditAnecdotesWidget()),
          GetPage(name: anecdotesAddPageRoute, page: () => AddAnecdotesWidget()),
          GetPage(name: eventsPageRoute, page: () => EventsScreen()),
          GetPage(name: socialMediaPageRoute, page: () => SocialMediaScreen()),
          GetPage(name: eventsDetailPageRoute, page: () => EventsDetailScreen()),

          //ENTREPRENUERS
          GetPage(name: entreprenuersContactPageRoute, page: () => EntrepreneursContactScreen()),
          GetPage(
            name: entreprenuersAddContactPageRoute,
            page: () => AddContactMomentScreen(),
          ),
          GetPage(name: entreprenuersRetailersPageRoute, page: () => RetailerScreen()),
          GetPage(name: entreprenuersSuppliersPageRoute, page: () => SupplierScreen()),
          GetPage(name: entreprenuersOverviewPageRoute, page: () => OverviewScreen()),
          GetPage(name: entreprenuersScreenPageRoute, page: () => EntrepreneurScreen()),

          //FARM SUPPLIER
          GetPage(name: farmSupplierPageRoute, page: () => FarmSupplierScreen()),

          //MAP
          GetPage(name: mapPageRoute, page: () => MapScreen()),

          //DYNAMIC FILTERS
          GetPage(name: dynamicFilterPageRoute, page: () => DynamicFilterScreen()),
          GetPage(name: farmProfileRoute, page: () => FarmProfileScreens()),

          ///Farmer Admin/Non Admin
          GetPage(name: farmerRoute, page: () => const SiteFarmerLayout()),

          GetPage(name: farmerRoute, page: () => DashboardScreen()),
//GetPage(name: farmComputerFileScreensPageRoute, page: () => ProjectFileScreens()),
          GetPage(name: emptyRoute, page: () => RefreshPageRoute()),
        ],
        // title: "Home",
        theme: ThemeData(
            scaffoldBackgroundColor: light,
            checkboxTheme: CheckboxThemeData(
              splashRadius: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              side: BorderSide(
                color: dimMetalic2,
                width: 0,
              ),
              // MaterialStateBorderSide.resolveWith(
              //     (_) => const BorderSide(width: 1, color: Colors.blue)),
              fillColor: MaterialStateProperty.all(Colors.green),
              checkColor: MaterialStateProperty.all(Colors.white),
            ),
            textTheme: GoogleFonts.muliTextTheme(Theme.of(context).textTheme).apply(bodyColor: Colors.black),
            pageTransitionsTheme: const PageTransitionsTheme(
                builders: {TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(), TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()}),
            primaryColor: Colors.blue),
        //home: EditDashboardDialogWidget(),
      );
    }
    return GetMaterialApp(
      //locale: _locale,

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
     locale: context.locale,
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      unknownRoute: GetPage(name: authPageRoute, page: () => AuthenticationPage()),
      defaultTransition: Transition.fadeIn,
      getPages: [
        GetPage(name: rootRoute, page: () => const SiteLayout()),
        GetPage(name: authPageRoute, page: () => AuthenticationPage()),
        GetPage(name: homePageRoute, page: () => const HomePage()),
        GetPage(name: farmProfileRoute, page: () => FarmProfileScreens()),
        //REPORTING
        GetPage(name: kpisDetailsPageRoute, page: () => KpiDetailsScreen()),
        GetPage(name: kpisPageRoute, page: () => KpiScreen()),
        // GetPage(name: farmComputerDataOverviewRoute, page: () => DataOverViewHomeScreen()),

        //SETTING
        GetPage(name: usersPageRoute, page: () => UserScreen()),
        GetPage(name: rolesPageRoute, page: () => RolesScreen()),
        GetPage(name: ticketsPageRoute, page: () => TicketScreen()),

        //COMMUNICATION
        GetPage(name: mediaPageRoute, page: () => MediaScreen()),
        GetPage(name: mediaDetailPageRoute, page: () => MediaDetailScreen()),
        GetPage(name: mediaEditPageRoute, page: () => EditMediaWidget()),
        GetPage(name: mediaAddPageRoute, page: () => AddMediaWidget()),
        GetPage(name: anecdotesPageRoute, page: () => AnecdotesScreen()),
        GetPage(name: anecdotesDetailPageRoute, page: () => AnecdotesDetailScreen()),
        GetPage(name: anecdotesEditPageRoute, page: () => EditAnecdotesWidget()),
        GetPage(name: anecdotesAddPageRoute, page: () => AddAnecdotesWidget()),
        GetPage(name: eventsPageRoute, page: () => EventsScreen()),
        GetPage(name: socialMediaPageRoute, page: () => SocialMediaScreen()),
        GetPage(name: eventsDetailPageRoute, page: () => EventsDetailScreen()),

        //ENTREPRENUERS
        GetPage(name: entreprenuersContactPageRoute, page: () => EntrepreneursContactScreen()),
        GetPage(
          name: entreprenuersAddContactPageRoute,
          page: () => AddContactMomentScreen(),
        ),
        GetPage(name: entreprenuersRetailersPageRoute, page: () => RetailerScreen()),
        GetPage(name: entreprenuersSuppliersPageRoute, page: () => SupplierScreen()),
        GetPage(name: entreprenuersOverviewPageRoute, page: () => OverviewScreen()),
        GetPage(name: entreprenuersScreenPageRoute, page: () => EntrepreneurScreen()),

        //FARM SUPPLIER
        GetPage(name: farmSupplierPageRoute, page: () => FarmSupplierScreen()),

        //MAP
        GetPage(name: mapPageRoute, page: () => MapScreen()),

        //DYNAMIC FILTERS
        GetPage(name: dynamicFilterPageRoute, page: () => DynamicFilterScreen()),

        ///Farmer Admin/Non Admin
        GetPage(name: farmerRoute, page: () => const SiteFarmerLayout()),

        GetPage(name: farmerRoute, page: () => DashboardScreen()),
        GetPage(name: emptyRoute, page: () => RefreshPageRoute()),
      ],
      title: "Home",
      theme: ThemeData(
          scaffoldBackgroundColor: light,
          checkboxTheme: CheckboxThemeData(
            splashRadius: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            side: BorderSide(
              color: dimMetalic2,
              width: 0,
            ),
            // MaterialStateBorderSide.resolveWith(
            //     (_) => const BorderSide(width: 1, color: Colors.blue)),
            fillColor: MaterialStateProperty.all(Colors.green),
            checkColor: MaterialStateProperty.all(Colors.white),
          ),
          textTheme: GoogleFonts.muliTextTheme(Theme.of(context).textTheme).apply(bodyColor: Colors.black),
          pageTransitionsTheme: const PageTransitionsTheme(
              builders: {TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(), TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()}),
          primaryColor: Colors.blue),
      //  home: DataOverViewHomeScreen(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
