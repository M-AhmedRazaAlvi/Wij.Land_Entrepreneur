import 'package:flutter/cupertino.dart';
import 'package:wij_land/routes/routes.dart';
import 'package:wij_land/utils/controller.dart';

import '../routes/router.dart';
import '../routes/routes.dart';

Navigator localFarmerNavigator() => Navigator(
      key: navigationController.navigatorKey,
      onGenerateRoute: generateFarmerRoute,
      initialRoute:
          authController.loggedIn.value ? farmerRoute : authPageRoute,
    );
