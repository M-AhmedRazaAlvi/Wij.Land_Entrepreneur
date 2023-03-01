import 'package:flutter/cupertino.dart';
import 'package:wij_land/routes/router.dart';
import 'package:wij_land/routes/routes.dart';
import 'package:wij_land/utils/controller.dart';

import '../main.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: initial_route_global,
    );
