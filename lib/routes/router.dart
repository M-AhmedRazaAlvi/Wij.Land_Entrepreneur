import 'package:flutter/material.dart';
import 'package:wij_land/routes/routes.dart';
import 'package:wij_land/screens/entrepreneur_network/farm_supplier/farm_supplier_screen.dart';

import '../app_common_widgets/RefreshRoutePage.dart';
import '../screens/Map/map_screen.dart';
import '../screens/auth/authentication_page.dart';
import '../screens/communications/anecdotes/ancedotes_details_screen.dart';
import '../screens/communications/anecdotes/anecdotes_screen.dart';
import '../screens/communications/anecdotes/widgets/anecdotes_add_widget.dart';
import '../screens/communications/anecdotes/widgets/anecdotes_edit_widget.dart';
import '../screens/communications/events/events_details_screen.dart';
import '../screens/communications/events/events_screen.dart';
import '../screens/communications/media/media_details_screen.dart';
import '../screens/communications/media/media_screen.dart';
import '../screens/communications/media/widgets/media-add_widget.dart';
import '../screens/communications/media/widgets/media-edit_widget.dart';
import '../screens/communications/social_media/social_media_screen.dart';
import '../screens/contacts/contacts/contacts_screen.dart';
import '../screens/contacts/farmers/farmers_screen.dart';
import '../screens/contacts/organizations/organization_profile_screen.dart';
import '../screens/contacts/organizations/organizations_screen.dart';
import '../screens/dynamic_filters/dynamic_filters_screen.dart';
import '../screens/farm_networks/actions/actions_screen.dart';
import '../screens/farm_networks/actions/farm_action_profile_screen.dart';
import '../screens/farm_networks/farms/farm_profile.dart';
import '../screens/farm_networks/farms/farm_screens/Parcels/parcel_profile.dart';
import '../screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/biomassProject/biomass_making_bokashi.dart';
import '../screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/biomassProject/bokhashi_sample.dart';
import '../screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/grazing_Project/grazing_advice.dart';
import '../screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/herbs_Project/preparing_herbs.dart';
import '../screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/herbs_Project/sowing_herbs.dart';
import '../screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/herbs_Project/vegetation_scan_herbs.dart';
import '../screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/property_Project/property_scan.dart';
import '../screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/soilProject/amendment_stone.dart';
import '../screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/soilProject/giving_soil_advice.dart';
import '../screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/soilProject/plant_juice_sample.dart';
import '../screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/soilProject/set_validation.dart';
import '../screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/soilProject/soil_sample.dart';
import '../screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/soilProject/soil_vegetation_scan.dart';
import '../screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/soilProject/spread_materail.dart';
import '../screens/farm_networks/farms/farms_screen.dart';
import '../screens/farm_networks/pilot_contracts/pilot_contract_profile_screen.dart';
import '../screens/farm_networks/pilot_contracts/pilot_contract_screen.dart';
import '../screens/farm_networks/projects/project_profile_screens/project_profile_screen.dart';
import '../screens/farm_networks/projects/projects_screen.dart';
import '../screens/farm_networks/visualization/visualization_screen.dart';
import '../screens/home/home_page.dart';
import '../screens/office/office_programes/office_programmes.dart';
import '../screens/office/wij_lan_team/WijLand_screens/wij_land_team_screen.dart';
import '../screens/office/wij_lan_team/person_profile/person_profile_screen.dart';
import '../screens/reporting/kpi/kpi_details_screen.dart';
import '../screens/reporting/kpi/kpi_screen.dart';
import '../screens/settings/roles/roles_screen.dart';
import '../screens/settings/tickets/ticket_screen.dart';
import '../screens/settings/tickets/tickets_details_screen.dart';
import '../screens/settings/tickets/widget/add_ticket_widget.dart';
import '../screens/settings/tickets/widget/update_ticket_widget.dart';
import '../screens/settings/users/users_screen.dart';
import '../screens/sustainable_finance/entrepreneurs/contacts/add_contact_moment_screen.dart';
import '../screens/sustainable_finance/entrepreneurs/contacts/entreprenuer_contact_screen.dart';
import '../screens/sustainable_finance/entrepreneurs/entreprenuers_screen.dart';
import '../screens/sustainable_finance/entrepreneurs/overview/overview_screen.dart';
import '../screens/sustainable_finance/entrepreneurs/retailers/retailer_screen.dart';
import '../screens/sustainable_finance/entrepreneurs/suppliers/supplier_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // debug debugPrint" THIS ${settings.arguments.toString()}");
  var args = settings.arguments;
  switch (settings.name) {
    //HOME
    case homePageRoute:
      return _getPageRoute(const HomePage());
    //OFFICE

    //////////////////////////

    case wijLandTeamsRoute:
      return _getPageRoute(const WijLandTeamScreen());
    case wijLandProfileScreenRoute:
      return _getPageRoute(PersonProfileScreen());
    case programmesRoute:
      return _getPageRoute(const OfficeProgrammes());
    // case addContactMomentRoute:
    //   return _getPageRoute(const AddContactMomnet());
    // case onContactMomentRoute:
    //   return _getPageRoute(const OnContactMoment());

    ///////////////////////////////////////////

    //CONTACTS

    case contactsPageRoute:
      return _getPageRoute(const ContactsScreen());
    case contactsPersonProfileRoute:
      return _getPageRoute(const PersonProfileScreen());
    //Farmers
    case farmersPageRoute:
      return _getPageRoute(const FarmersScreen());
    case farmerPersonProfileRoute:
      return _getPageRoute(const PersonProfileScreen());
    //Organization
    case organizationsPageRoute:
      return _getPageRoute(const OrganizationsScreen());
    case organizationsProfilePageRoute:
      return _getPageRoute(const OrganizationProfileScreen());
    //MAP
    case mapPageDisplayName:
      return _getPageRoute(const MapScreen());
    //FILTERS
    case dynamicFilterPageDisplayName:
      return _getPageRoute(const DynamicFilterScreen());
    //FARM NETWORK
    case farmsPageRoute:
      return _getPageRoute(const FarmsScreen());
    case farmProfileScreensRoute:
      return _getPageRoute(const FarmProfileScreens());
    case parcelProfileScreenRoute:
      return _getPageRoute(const ParcelProfileScreen());
    case projectsPageRoute:
      return _getPageRoute(const ProjectsScreen());
    case actionBiomassMakingBokashiRoute:
      return _getPageRoute(const ActionBiomassMakingBokashi());
    case actionBiomassBokashiSampleRoute:
      return _getPageRoute(const ActionBiomassBokashiSample());
    case grazingAdviceScreenRoute:
      return _getPageRoute(const GrazingAdviceScreen());
    case sowingHerbsProjectRoute:
      return _getPageRoute(const SowingHerbsProject());
    case vegetationScanHerbsRoute:
      return _getPageRoute(const VegetationScanHerbs());
    case preparingHerbsRoute:
      return _getPageRoute(const PreparingHerbs());
    case propertyScanHerbsRoute:
      return _getPageRoute(const PropertyScanHerbs());
    case soilSampleScreenRoute:
      return _getPageRoute(const SoilSampleScreen());
    case soilVegetationScanRoute:
      return _getPageRoute(const SoilVegetationScan());
    case givingSoilAdviseRoute:
      return _getPageRoute(const GivingSoilAdvise());
    case plantJuiceSampleRoute:
      return _getPageRoute(const PlantJuiceSample());
    case amendmentStoneFlourBoxRoute:
      return _getPageRoute(const AmendmentStoneFlourBox());
    case spreadMaterialAmendmentRoute:
      return _getPageRoute(const SpreadMaterialAmendment());
    case setVelidationPlotRoute:
      return _getPageRoute(const SetVelidationPlot());
    case farmProfileRoute:
      return _getPageRoute(const FarmProfileScreens());
    case farmProjectProfileScreenRoute:
      return _getPageRoute(const ProjectProfileScreen());

    case actionsPageRoute:
      return _getPageRoute(const ActionsScreen());
    case farmActionProfile:
      return _getPageRoute(const FarmActionProfileScreen());
    case pilotContractsPageRoute:
      return _getPageRoute(const PilotContractScreen());
    case pilotContractProfileRoute:
      return _getPageRoute(const PilotContractProfileScreen());
    case biomassMapPageRoute:
      return _getPageRoute(const HomePage());
    case visualizationPageRoute:
      return _getPageRoute(const VisualizationScreen());
    case entreprenuersScreenPageRoute:
      return _getPageRoute(EntrepreneurScreen());
    case entreprenuersOverviewPageRoute:
      return _getPageRoute(OverviewScreen(
        aurguments: args,
      ));

    case entreprenuersContactPageRoute:
      return _getPageRoute(EntrepreneursContactScreen());

    case entreprenuersSuppliersPageRoute:
      return _getPageRoute(SupplierScreen(arguments: args));

    // case entreprenuersAddContactPageRoute:
    //   return _getPageRoute(AddContactMomentScreen(arguments: args,));

    //FARM SUPPLIER
    case farmSupplierPageRoute:
      return _getPageRoute(FarmSupplierScreen());
    //COMMUNICATION
    case socialMediaPageRoute:
      return _getPageRoute(const SocialMediaScreen());
    case mediaPageRoute:
      return _getPageRoute(const MediaScreen());
    case mediaDetailPageRoute:
      return _getPageRoute(const MediaDetailScreen());
    case mediaAddPageRoute:
      return _getPageRoute(const AddMediaWidget());
    case mediaEditPageRoute:
      return _getPageRoute(const EditMediaWidget());
    case anecdotesPageRoute:
      return _getPageRoute(const AnecdotesScreen());
    case anecdotesAddPageRoute:
      return _getPageRoute(const AddAnecdotesWidget());
    case anecdotesDetailPageRoute:
      return _getPageRoute(const AnecdotesDetailScreen());
    case anecdotesEditPageRoute:
      return _getPageRoute(const EditAnecdotesWidget());
    case eventsPageRoute:
      return _getPageRoute(const EventsScreen());
    case eventsDetailPageRoute:
      return _getPageRoute(const EventsDetailScreen());

//PERMISSION
    case permissionsPageRoute:
      return _getPageRoute(const EventsDetailScreen());

    //REPORTING
    case kpisPageRoute:
      return _getPageRoute(const KpiScreen());
    case kpisDetailsPageRoute:
      return _getPageRoute(const KpiDetailsScreen());
    case melPortalPageRoute:
      return _getPageRoute(const HomePage());
    //SETTINGS
    case usersPageRoute:
      return _getPageRoute(const UserScreen());
    case rolesPageRoute:
      return _getPageRoute(const RolesScreen());
    case ticketsPageRoute:
      return _getPageRoute(const TicketScreen());
    case ticketsDetailsPageRoute:
      return _getPageRoute(const TicketDetailsScreen());
    case updateTicketsDetailsPageRoute:
      return _getPageRoute(const UpdateTicketWidget());
    case addTicketsDetailsPageRoute:
      return _getPageRoute(const AddTicketWidget());

    //AUTH
    case authPageRoute:
      return _getPageRoute(AuthenticationPage());
    case emptyRoute:
      return _getPageRoute(RefreshPageRoute());
    default:
      return _getPageRoute(const HomePage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

Map<String, WidgetBuilder> routes() {
  return {
    //HOME
    homePageRoute: (context) => const HomePage(),
    //OFFICE

    wijLandTeamsRoute: (context) => const WijLandTeamScreen(),
    wijLandProfileScreenRoute: (context) => const PersonProfileScreen(),
    programmesRoute: (context) => const OfficeProgrammes(),
    // addContactMomentRoute: (context) => const AddContactMomnet(),
    // onContactMomentRoute: (context) => const OnContactMoment(),

    //CONTACTS
    contactsPageRoute: (context) => const HomePage(),
    farmersPageRoute: (context) => const HomePage(),
    organizationsPageRoute: (context) => const OrganizationsScreen(),
    organizationsProfilePageRoute: (context) =>
        const OrganizationProfileScreen(),
    //MAP
    mapPageDisplayName: (context) => const MapScreen(),
    //FILTERS
    dynamicFilterPageDisplayName: (context) => const DynamicFilterScreen(),
    //FARM NETWORK
    farmsPageRoute: (context) => const FarmsScreen(),
    parcelProfileScreenRoute: (context) => ParcelProfileScreen(),
    projectsPageRoute: (context) => const ProjectsScreen(),
    actionBiomassMakingBokashiRoute: (context) => ActionBiomassMakingBokashi(),
    actionBiomassBokashiSampleRoute: (context) => ActionBiomassBokashiSample(),
    grazingAdviceScreenRoute: (context) => GrazingAdviceScreen(),
    sowingHerbsProjectRoute: (context) => SowingHerbsProject(),
    vegetationScanHerbsRoute: (context) => VegetationScanHerbs(),
    preparingHerbsRoute: (context) => PreparingHerbs(),
    propertyScanHerbsRoute: (context) => PropertyScanHerbs(),
    soilSampleScreenRoute: (context) => SoilSampleScreen(),
    soilVegetationScanRoute: (context) => SoilVegetationScan(),
    givingSoilAdviseRoute: (context) => GivingSoilAdvise(),
    plantJuiceSampleRoute: (context) => PlantJuiceSample(),
    amendmentStoneFlourBoxRoute: (context) => AmendmentStoneFlourBox(),
    spreadMaterialAmendmentRoute: (context) => SpreadMaterialAmendment(),
    setVelidationPlotRoute: (context) => SetVelidationPlot(),
    actionsPageRoute: (context) => const ActionsScreen(),
    farmProjectProfileScreenRoute: (context) => ProjectProfileScreen(),
    pilotContractsPageRoute: (context) => const PilotContractScreen(),
    biomassMapPageRoute: (context) => const HomePage(),
    visualizationPageRoute: (context) => const VisualizationScreen(),

    //COMMUNICATION
    socialMediaPageRoute: (context) => const SocialMediaScreen(),
    mediaPageRoute: (context) => const MediaScreen(),
    mediaAddPageRoute: (context) => const AddMediaWidget(),
    mediaEditPageRoute: (context) => const EditMediaWidget(),
    mediaDetailPageRoute: (context) => const MediaDetailScreen(),
    anecdotesPageRoute: (context) => const AnecdotesScreen(),
    anecdotesAddPageRoute: (context) => const AddAnecdotesWidget(),
    anecdotesDetailPageRoute: (context) => const AnecdotesDetailScreen(),
    anecdotesEditPageRoute: (context) => const EditAnecdotesWidget(),
    eventsPageRoute: (context) => const EventsScreen(),
    eventsDetailPageRoute: (context) => const EventsDetailScreen(),
    //REPORTING
    kpisPageRoute: (context) => const KpiScreen(),
    kpisDetailsPageRoute: (context) => const KpiDetailsScreen(),
    melPortalPageRoute: (context) => const HomePage(),
    //SETTINGS
    usersPageRoute: (context) => const UserScreen(),
    rolesPageRoute: (context) => const RolesScreen(),
    ticketsPageRoute: (context) => const TicketScreen(),
    ticketsDetailsPageRoute: (context) => const TicketDetailsScreen(),
    updateTicketsDetailsPageRoute: (context) => const UpdateTicketWidget(),
    addTicketsDetailsPageRoute: (context) => const AddTicketWidget(),

    //ENTREPRENUERS
    entreprenuersScreenPageRoute: (context) => const EntrepreneurScreen(),
    entreprenuersOverviewPageRoute: (context) => const OverviewScreen(),
    entreprenuersContactPageRoute: (context) =>
        const EntrepreneursContactScreen(),
    entreprenuersSuppliersPageRoute: (context) => const SupplierScreen(),
    entreprenuersRetailersPageRoute: (context) => const RetailerScreen(),
    entreprenuersAddContactPageRoute: (context) =>
        const AddContactMomentScreen(),

    //FARM SUPPLIER
    farmSupplierPageRoute: (context) => const FarmSupplierScreen(),

    //AUTH
    authPageRoute: (context) => AuthenticationPage(),
    //Empty route
    emptyRoute: (context) => RefreshPageRoute()
  };
}
