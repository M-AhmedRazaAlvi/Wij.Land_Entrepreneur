import 'package:get/get.dart';
import '../screens/authentication/reset_password_page.dart';
import '../screens/authentication/widgets/forgot_password_page.dart';
import '../screens/dashboard/anacdot_directory/report/my_anecdotes_screen.dart';
import '../screens/dashboard/home/meeting/meeting_screen.dart';
import '../screens/dashboard/main_dashboard.dart';
import '../screens/dashboard/settings/widgets/profile_screen_widget.dart';

abstract class Routes {
  static const home = '/';
  static const login = '/login';
  static const forgetPassword = '/forgetPassword';
  static const resetPassword = '/resetPassword';
  static const signUp = '/signup';
  static const dashboard = '/main_dashboard';
  static const profile = '/profile';
  static const dailyReportsScreen = '/DailyReportsScreen';
  static const myAnecdotesScreen = '/MyAnecdotesScreen';
  static const picImageWidget = '/PicImageWidget';
  static const meetings = '/meetings';
}

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: Routes.dashboard,
      page: () => MainDashboard(),
    ),

    // GetPage(
    //   name: Routes.mainHomeScreen,
    //   page: () => MainHomeScreen(),
    // ),
    GetPage(
      name: Routes.myAnecdotesScreen,
      page: () => MyAnecdotesScreen(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => ProfileScreenWidget(),
    ),
    GetPage(
      name: Routes.meetings,
      page: () => MeetingScreen(),
    ),
    GetPage(
      name: Routes.resetPassword,
      page: () => ResetPasswordPage(),
    ),
    GetPage(
      name: Routes.forgetPassword,
      page: () => ForgotPasswordPage(),
    ),
    // GetPage(
    //   name: Routes.mainHomeScreen,
    //   page: () => PicImageWidget(),
    // ),
    // GetPage(
    //   name: Routes.LOGIN,
    //   page: () => Login(),
    // ),
  ];
}
