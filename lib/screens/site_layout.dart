// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wij_land/models/user/user_model.dart';

import '../app_common_widgets/large_screen.dart';
import '../app_common_widgets/side_menu.dart';
import '../app_common_widgets/small_screen.dart';
import '../main.dart';
import '../non_admin/routes/routes.dart';
import '../non_admin/screens/site_layout.dart';
import '../providers/GlobalProvider/navigation/navigation_provider.dart';
import '../routes/routes.dart';
import '../utils/controller.dart';
import '../utils/responsive.dart';
import '../utils/styles.dart';
import 'auth/authentication_page.dart';

class SiteLayout extends StatefulWidget {
  const SiteLayout({Key? key}) : super(key: key);

  @override
  State<SiteLayout> createState() => _SiteLayoutState();
}

class _SiteLayoutState extends State<SiteLayout> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey(debugLabel: 'site_layout');
  final GlobalKey<NavigatorState> navKeyGlobal = GlobalKey<NavigatorState>(debugLabel: 'globally');

  bool isLoading=true;
  late List<String> navOptions;
  @override
  void initState() {
    super.initState();
    // authController.loginViaToken();

    currentUser();
  }
  currentUser()async{
    print('user login click');
      MyUser response =  await authController.loginViaToken();
      print('response is  $response');
      if(response.id!=null){
        authController.myUser.value=response;
      setState(() {
        isLoading=false;
      });
    }else{
      setState(() {
        isLoading=false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('reesult = $hasToken ${authController.loggedIn.value} $hasAdmin');
    if (!hasToken) {
      return authController.loggedIn.value || hasToken
          ? !hasAdmin
              ? SiteFarmerLayout()
              : WillPopScope(
                  onWillPop: () async {
                    print('route name = ${NavigationProvider.instance.navigatorKey.currentState!}');
                    if (routeStateofWijLand != 1) {
                      navigationController.goBack();
                    }
                    return false;
                  },
                  child: Scaffold(
                    key: scaffoldKey,
                    drawer: Responsive.isMobile(context)
                        ? SizedBox(
                            child: SideMenu(
                              isexpand: true,
                            ),
                            width: 220)
                        : null,
                    body:isLoading?Center(child: CircularProgressIndicator(),): Navigator(
                      key: navKeyGlobal,
                      onGenerateRoute: (_) => MaterialPageRoute(
                        builder: (_) => Responsive(
                          desktop: LargeScreen(),
                          mobile: SmallScreen(scaffoldKey: scaffoldKey),
                          tablet: LargeScreen(),
                        ),
                      ),
                    ),
                  ),
                )
          : AuthenticationPage();
    }
    return authController.loggedIn.value || hasToken
        ? WillPopScope(
            onWillPop: () async {
              print('route name = ${NavigationProvider.instance.navigatorKey.currentState!}');
              if (routeStateofWijLand != 1) {
                navigationController.goBack();
              }
              return false;
            },
            child: Scaffold(
              key: scaffoldKey,
              drawer: Responsive.isMobile(context)
                  ? SizedBox(
                      child: SideMenu(
                        isexpand: true,
                      ),
                      width: 220)
                  : null,
              body: Navigator(
                key: navKeyGlobal,
                onGenerateRoute: (_) => MaterialPageRoute(
                  builder: (_) => Responsive(
                    desktop: LargeScreen(),
                    mobile: SmallScreen(scaffoldKey: scaffoldKey),
                    tablet: LargeScreen(),
                  ),
                ),
              ),
            ),
          )
        : AuthenticationPage();
  }
}
