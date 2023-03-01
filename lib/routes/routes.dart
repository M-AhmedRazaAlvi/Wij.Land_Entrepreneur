//HOME

const rootRoute = "/";
const homePageDisplayName = "Home";
const homePageRoute = "/home";

//OFFICE

const officePageDisplayName = "Office";
const wijLandTeamsDisplayName = "Wij.land Teams";
const programmesDisplayName = "Programmes";
const wijLandTeamsRoute = "Office / WijLand Team";
const programmesRoute = "Office / Programmes";
const wijLandProfileScreenRoute = ".land Team / Person_Profile";
const addContactMomentRoute = "/Contact Moment";
const onContactMomentRoute = "/Contact Moments";

//CONTACTS
const contactsPageRoute = "/contacts";
const contactsPageDisplayName = "Contacts";
const contactsPersonProfileRoute = "Contacts Person_Profile";
//Farmers
const farmersPageRoute = "/farmers";
const farmersPageDisplayName = "Farmers";
const farmerPersonProfileRoute = "Farmers Person_profile";
//Organization
const organizationsPageDisplayName = "Organizations";
const organizationsProfilePageDisplayName = "Organization Profile";
const organizationsPageRoute = "/organizations";
const organizationsProfilePageRoute = "/organizationProfile";
//Pilot Contracts
const pilotContractsPageRoute = "/pilotContracts";
const pilotContractProfileRoute = "Pilot Contract Profile";

//MAP
const mapPageDisplayName = "Map";
const mapPageRoute = "/maps";

//PERMISSION
const permissionsDisplayName = "Permission";
const permissionsPageRoute = "/map";

//THEME
const themeDisplayName = "Themes";
const themePageRoute = "/themes";


//MAIN PROJECTS
const mainProjectDisplayName = "Main Projects";
const mainProjectPageRoute = "/main_projects";

// PROJECTS
const projectDisplayName = "Projects";
const projectPageRoute = "/sub_projects";


// PROJECTS
const funderDisplayName = "Funders";
const funderPageRoute = "/funders";

// REQUEST
const requestPageDisplayName = "Requests";
const requestPageRoute = "/requests";

// REQUEST
const dynamicKpiPageDisplayName = "Dynamic KPIs";
const dynamicKpiPageRoute = "/dynamic_kpis";

//FILTERS
const dynamicFilterPageDisplayName = "Dynamic Filter";
const dynamicFilterPageRoute = "/dynamicFilter";


//QUICK LINKS
const quickLinksPageDisplayName = "Quick Links";
const quickLinksPageRoute = "/quick_links";

//FARM NETWORK
const farmNetworkPageDisplayName = "Farm Network";
const farmsPageDisplayName = "Farms";
const projectsPageDisplayName = "Projects";
const parcelProfileScreenRoute = "/Parcel Profile";
const actionsPageDisplayName = "Actions";
const actionBiomassMakingBokashiRoute = "/Action Making Bokashi";
const actionBiomassBokashiSampleRoute = "/Action Bokashi Sample";
const grazingAdviceScreenRoute = "/Action Grazing Advice";
const sowingHerbsProjectRoute = "/Action Sowing Herbs";
const vegetationScanHerbsRoute = "/Action Vegetation Scan";
const preparingHerbsRoute = "/Action Preparing Herbs";
const propertyScanHerbsRoute = "/Action Property Scan";
const soilSampleScreenRoute = "/Action Soil Sample";
const soilVegetationScanRoute = "/Action Soil Vegetation";
const givingSoilAdviseRoute = "/Action Giving Soil";
const plantJuiceSampleRoute = "/Action Plant Juice Sample";
const amendmentStoneFlourBoxRoute = "/Action Amendment Store Flour Box";
const spreadMaterialAmendmentRoute = "/Action Spread Materail Amendment";
const setVelidationPlotRoute = "/Action Set Velidation Plot";
const farmProjectProfileScreenRoute = "Farm /Project Profile";
const pilotContractsPageDisplayName = "Pilot Contracts";
const biomassMapPageDisplayName = "Biomass Map";
const visualizationPageDisplayName = "BoerenWijzer";
const farmsPageRoute = "/farms";
const farmProfileRoute = "/farmProfile";
const projectsPageRoute = "/projects";
const projectProfilePageRoute = "/projectProfilePageRoute";
const actionsPageRoute = "/actions";
const farmActionProfile = "/farmActions";
const biomassMapPageRoute = "/biomassMap";
const visualizationPageRoute = "/boerenwijzer";
const visualizationGraphPageRoute = "/visualization_graph";

//ENTREPRENEUR NETWORK

//COMMUNICATION
const communicationPageDisplayName = "Communication";
const socialMediaPageDisplayName = "Social Media";
const mediaPageDisplayName = "Media";
const anecdotesPageDisplayName = "Anecdotes";
const eventsPageDisplayName = "Events";
const socialMediaPageRoute = "/socialMedia";
const mediaPageRoute = "/media";
const mediaDetailPageRoute = "/media_details";
const mediaEditPageRoute = "/edit_media";
const mediaAddPageRoute = "/add_media";
const anecdotesPageRoute = "/anecdotes";
const anecdotesDetailPageRoute = "/anecdotes_details";
const anecdotesEditPageRoute = "/edit_anecdotes";
const anecdotesAddPageRoute = "/add_anecdotes";
const eventsPageRoute = "/events";
const eventsDetailPageRoute = "/events_details";

//REPORTING
const reportingPageDisplayName = "Reporting";
const kpisPageDisplayName = "KPIs";
const melPortalPageDisplayName = "MEL Portal";
const kpisPageRoute = "/kpis";
const kpisDetailsPageRoute = "/kpis_details";
const melPortalPageRoute = "/melPortal";

//SETTINGS
const settingsPageDisplayName = "Settings";
const usersPageDisplayName = "Users";
const rolesPageDisplayName = "Roles";
const ticketsPageDisplayName = "Tickets";
const usersPageRoute = "/users";
const rolesPageRoute = "/roles";
const ticketsPageRoute = "/tickets";
const liveViewLogin = "/logout";
const ticketsDetailsPageRoute = "/tickets_details";
const updateTicketsDetailsPageRoute = "/update_tickets_details";
const addTicketsDetailsPageRoute = "/add_tickets_details";
const farmProfileScreensRoute = '/farmProfileScreensRoute';

//AUTH
const authPageDisplayName = "Authentication";
const authPageRoute = "/auth";

//Entreprenuers

const entrepreneurNetworkPageDisplayName = "Entrepreneur Network";

const entreprenuersOverviewPageRoute = "/entreprenuers_overview";
const entreprenuersSuppliersPageRoute = "/entreprenuers_suppliers";
const entreprenuersRetailersPageRoute = "/entreprenuers_retailers";
const entreprenuersScreenPageRoute = "/entreprenuers_screen";
const entreprenuersContactPageRoute = "/Entreprenuers_contact";
const entreprenuersAddContactPageRoute = "/Entreprenuers_add_contact";
const entrepreneurDisplayName = 'Entrepreneurs';

const farmSupplierDisplayName = 'Farm Supplier';
const farmSupplierPageRoute = "/farm_supplier_screen";


const contactMomentDisplayName = 'Contact Moment';
const contactMomentRoute = "/contact_moment";

const updateBoerenwijzerDisplayName = 'Update Boerenwijzer';
const updateBoerenwijzerRoute = "/update_boerenwijzer";

const reviewRequestDisplayName = 'Review Requests';
const reviewRequestRoute = "/review_requests";


//Empty route
const emptyRoute = "/emptyRoute";

class MenuItem {
  final String name, route;
  final bool isExpandale;
  final List<MenuItem>? innerMenu;
  MenuItem(this.name, this.route, {required this.isExpandale, this.innerMenu});
}

List<MenuItem> sideMenuItems = [
  MenuItem(homePageDisplayName, homePageRoute, isExpandale: false),
  MenuItem(quickLinksPageDisplayName," ", isExpandale: true,
  innerMenu:[
    MenuItem(contactMomentDisplayName, contactMomentRoute, isExpandale: false),
    MenuItem(updateBoerenwijzerDisplayName, updateBoerenwijzerRoute, isExpandale: false),
  ]
  ),
  MenuItem(
    officePageDisplayName,
    "",
    isExpandale: true,
    innerMenu: [
      MenuItem(wijLandTeamsDisplayName, wijLandTeamsRoute, isExpandale: false),
      MenuItem(programmesDisplayName, programmesRoute, isExpandale: false),
      MenuItem(themeDisplayName, themePageRoute, isExpandale: false),
      MenuItem(mainProjectDisplayName, mainProjectPageRoute, isExpandale: false),
      MenuItem(projectDisplayName, projectPageRoute, isExpandale: false),
    ],
  ),
  MenuItem(
    contactsPageDisplayName,
    "",
    isExpandale: true,
    innerMenu: [
      MenuItem(contactsPageDisplayName, contactsPageRoute, isExpandale: false),
      MenuItem(farmersPageDisplayName, farmersPageRoute, isExpandale: false),
      MenuItem(organizationsPageDisplayName, organizationsPageRoute, isExpandale: false),
      MenuItem(funderDisplayName, funderPageRoute, isExpandale: false),
    ],
  ),
  MenuItem(mapPageDisplayName, mapPageRoute, isExpandale: false),
  MenuItem(dynamicFilterPageDisplayName, dynamicFilterPageRoute,
      isExpandale: false),
  MenuItem(
    farmNetworkPageDisplayName,
    "",
    isExpandale: true,
    innerMenu: [
      MenuItem(farmsPageDisplayName, farmsPageRoute, isExpandale: false),
      MenuItem(projectsPageDisplayName, projectsPageRoute, isExpandale: false),
      MenuItem(actionsPageDisplayName, actionsPageRoute, isExpandale: false),
      MenuItem(pilotContractsPageDisplayName, pilotContractsPageRoute,
          isExpandale: false),
      MenuItem(biomassMapPageDisplayName, biomassMapPageRoute,
          isExpandale: false),
      MenuItem(visualizationPageDisplayName, visualizationPageRoute,
          isExpandale: false),
    ],
  ),

  MenuItem(
    entrepreneurNetworkPageDisplayName,
    "",
    isExpandale: true,
    innerMenu: [
      MenuItem(entrepreneurDisplayName, entreprenuersScreenPageRoute,
          isExpandale: false),
      MenuItem(farmSupplierDisplayName, farmSupplierPageRoute,
          isExpandale: false),
    ],
  ),
  MenuItem(reviewRequestDisplayName, reviewRequestRoute, isExpandale: false),

  MenuItem(
    communicationPageDisplayName,
    "",
    isExpandale: true,
    innerMenu: [
      MenuItem(socialMediaPageDisplayName, socialMediaPageRoute,
          isExpandale: false),
      MenuItem(mediaPageDisplayName, mediaPageRoute, isExpandale: false),
      MenuItem(anecdotesPageDisplayName, anecdotesPageRoute,
          isExpandale: false),
      MenuItem(eventsPageDisplayName, eventsPageRoute, isExpandale: false),
    ],
  ),
  MenuItem(permissionsDisplayName,"", isExpandale: true,
  innerMenu: [
    MenuItem(requestPageDisplayName,   requestPageRoute, isExpandale: false)
  ]
  ),
  MenuItem(
    reportingPageDisplayName,
    "",
    isExpandale: true,
    innerMenu: [
      MenuItem(kpisPageDisplayName, kpisPageRoute, isExpandale: false),
      MenuItem(dynamicKpiPageDisplayName, dynamicKpiPageRoute, isExpandale: false),
      MenuItem(melPortalPageDisplayName, melPortalPageRoute, isExpandale: false),
    ],
  ),
  MenuItem(
    settingsPageDisplayName,
    "",
    isExpandale: true,
    innerMenu: [
      MenuItem(usersPageDisplayName, usersPageRoute, isExpandale: false),
      MenuItem(rolesPageDisplayName, rolesPageRoute, isExpandale: false),
      MenuItem(ticketsPageDisplayName, ticketsPageRoute, isExpandale: false),
    ],
  ),
  MenuItem(authPageDisplayName, authPageRoute, isExpandale: false),
];
