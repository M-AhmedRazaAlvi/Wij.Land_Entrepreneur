import '../non_admin/providers/global_provider/side_menu_provider.dart';
import '../providers/GlobalProvider/auth/auth_screen_provider.dart';
import '../providers/GlobalProvider/navigation/navigation_provider.dart';
import '../providers/GlobalProvider/side_menu/side_menu_provider.dart';

SideMenuProvider menuController = SideMenuProvider.instance;
SideMenuFarmerProvider menuFarmerController = SideMenuFarmerProvider.instance;
NavigationProvider navigationController = NavigationProvider.instance;
AuthScreenProvider authController = AuthScreenProvider.instance;

const String USER = "user";
const String REMEMBER = "remember";
const String EMAIL = "email";
const String PASSWORD = "password";
const String FARM_COMPUTER = "farm_computer";

int routeStateofWijLand=0;
