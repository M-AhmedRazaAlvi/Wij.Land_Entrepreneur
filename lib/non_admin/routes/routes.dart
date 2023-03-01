//HOME
const farmerRoute = "/farmer_dashboard";
const nHomePageDisplayName = "Home";

//PROJECT DIRECTORY

const farmComputerProjectName = 'Projects';
const farmComputerProjectDashboardPageRoute = '/farm_project_dashboard';
const farmComputerProjectDirectoryPageRoute = '/farm_project_directory';

//Parcel directory

const farmComputerParcelRoute = '/farm_computer_parcel_screen';
const farmComputerParcelName = 'Parcels';
//Project Action directory

const farmComputerProjectActionRoute = '/farm_computer_project_action_screen';
const farmComputerProjectsActionName = 'Project Actions';

// Action directory
const farmComputerActionRoute = '/farm_computer_action_screen';
const farmComputerActionName = 'Actions';

// Profile
const farmComputerProfileRoute = "/farmProfile";

// Profile
const farmComputerPrivacySettingsRoute = "/farmPrivacySettings";

// const farmComputerProfileName = '/Profile';
//const farmComputerPofileRoute = '/farm_computer_profile_screen';

// Parcel data
const farmComputerParcelDataRoute = '/parcel_data_screen';
const farmComputerParcelDataName = 'Parcel Data';

// Permissions data
const farmerComputerPermissionsRoute = '/permissions_data_screen';
const farmerComputerPermissionsName = 'Permissions';

//Members Data
const farmerComputerMemberScreenRoute = '/Members';
const farmerComputerMemberScreenName = 'Members';

const farmerComputerPermissionsPendingRoute = '/permissions_pending_screen';
const farmerComputerPermissionsPendingName = 'Pending Permissions';

// Data OverView
const farmComputerDataOverviewRoute = '/farm_computer_data_overview_screen';
const farmComputerDataOverviewName = 'Data Overview';

//////////////////    FARM COMPUTER  ////////////////////

// Farm computer events

const eventsFileScreenPageRoute = "event_file";
const eventsCalenderListPageRoute = "/events_calender_list";
const farmComputerEventsName = "Events";
// Farm computer files
const farmProjectFileScreenPageRoute = "/farm_file";
const farmComputerFileName = "Files";
const farmComputerFileScreensPageRoute = "/Files";
//const farmComputerFileScreensPageRoute = "/files";
// Farm computer contact moments

const farmComputerContactMomentName = "Contact";
const projectContactMomentScreensPageRoute = "/contact_moments";

const farmerAuthPageDisplayName = "Logout";
const farmerAuthPageRoute = "/farmer_auth";

class MenuFarmerItem {
  final String name, route;
  final bool isExpandable;
  final List<MenuFarmerItem>? innerMenu;
  MenuFarmerItem(this.name, this.route,
      {required this.isExpandable, this.innerMenu});
}

List<MenuFarmerItem> sideMenuFarmerItems = [
  MenuFarmerItem(nHomePageDisplayName, farmerRoute, isExpandable: false),
  MenuFarmerItem(farmComputerProjectName, farmComputerProjectDirectoryPageRoute,
      isExpandable: false),
  MenuFarmerItem(farmComputerEventsName, eventsCalenderListPageRoute,
      isExpandable: false),
  MenuFarmerItem(farmComputerDataOverviewName, farmComputerDataOverviewRoute,
      isExpandable: false),
  MenuFarmerItem(farmComputerActionName, farmComputerActionRoute,
      isExpandable: false),
  // MenuFarmerItem(farmComputerParcelDataName, farmComputerParcelDataRoute,
  //     isExpandable: false),
  MenuFarmerItem(farmComputerParcelName, farmComputerParcelRoute,
      isExpandable: false),
  MenuFarmerItem(farmComputerFileName, farmComputerFileScreensPageRoute,
      isExpandable: false),
  MenuFarmerItem(farmComputerContactMomentName, farmComputerContactMomentName,
      isExpandable: false),
  MenuFarmerItem(farmerComputerPermissionsName, farmerComputerPermissionsRoute,
      isExpandable: false),
  MenuFarmerItem(farmerComputerMemberScreenName, farmerComputerMemberScreenRoute,
      isExpandable: false),
  MenuFarmerItem(farmerAuthPageDisplayName, farmerAuthPageRoute,
      isExpandable: false),
];
