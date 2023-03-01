import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/anacdots_mobile/providers/anecdots_search_provider/anecdots_search_provider.dart';
import 'package:wij_land/anacdots_mobile/providers/anacdots_dropdowns_provider/anacdots_dropdowns_provider.dart';
import 'package:wij_land/anacdots_mobile/providers/anecdotes_directory_providers/get_anacdots_by_id_provider.dart';
import 'package:wij_land/anacdots_mobile/screens/authentication/login_page.dart';

import '../Router/router.dart';
import '../providers/anecdotes_directory_providers/anecdotes_file_provider.dart';
import '../providers/auth_provider/auth_provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<AnecdotSearchProvider>(
          create: (context) => AnecdotSearchProvider(),),
        ChangeNotifierProvider<AnacdotsDropDownsProvider>(
          create: (context) => AnacdotsDropDownsProvider(),
        ),
        ChangeNotifierProvider<CreateMyAnecdotesFileProvider>(
          create: (context) => CreateMyAnecdotesFileProvider(),
        ),
        ChangeNotifierProvider<GetAnacdotsByIdProvider>(
          create: (context) => GetAnacdotsByIdProvider(),
        ),
        
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fade,
        getPages: AppPages.pages,
        home: LoginPage(),
        theme: ThemeData(
            pageTransitionsTheme: PageTransitionsTheme(builders: const {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        })),
        // routerDelegate: AppRouterDelegate(),
      ),
    );
  }
}

class AppRouterDelegate extends GetDelegate {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) => route.didPop(result),
      pages: currentConfiguration != null
          ? [currentConfiguration!.currentPage!]
          : [GetNavConfig.fromRoute(Routes.myAnecdotesScreen)!.currentPage!],
    );
  }
}
