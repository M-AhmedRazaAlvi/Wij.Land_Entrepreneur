import 'package:wij_land/models/entrepreneur_dropDown/assigned_by_dropDown.dart';
import 'package:wij_land/models/entrepreneur_dropDown/attendees_dropDown.dart';
import 'package:wij_land/models/entrepreneur_dropDown/farmers_dropDown.dart';
import 'package:wij_land/models/entrepreneur_dropDown/organization_dropDown.dart';
import 'package:wij_land/models/entrepreneur_dropDown/persons_dropDown.dart';
import 'package:wij_land/models/entrepreneur_dropDown/programme_coordinator_dropDown.dart';
import 'package:wij_land/models/entrepreneur_dropDown/wij_land_team_dropDown.dart';

import '../../../../api_clients/dropDown_client.dart';
import '../../../../models/entrepreneur_dropDown/assigned_to_dropDown.dart';
import '../../../../models/entrepreneur_dropDown/farm_dropDown.dart';
import '../../../../models/entrepreneur_dropDown/project_dropDown.dart';

class EntrepreneurDropdownProvider {
  /// get all project dropDown
  ProjectDropdown _projectDropdown = ProjectDropdown();

  ProjectDropdown get projectDropdown => _projectDropdown;

  getProjectDropdown() async {
    _projectDropdown = await DropDownClients.getProjectsDetailData();
  }

  /// get all organizations dropDown
  OrganizationDropdown _organizationDropdown = OrganizationDropdown();

  OrganizationDropdown get organizationDropdown => _organizationDropdown;

  getOrganizationDropdown() async {
    _organizationDropdown = await DropDownClients.getOrganizationDetailData();
  }

  /// get all wij_land_team dropdown

  WijLandTeamDropdown _wijLandTeamDropdown = WijLandTeamDropdown();

  WijLandTeamDropdown get wijlandDropdown => _wijLandTeamDropdown;

  getWijLandDropdown() async {
    _wijLandTeamDropdown = await DropDownClients.getWijLandTeamDetailData();
  }

  /// get all attendees dropdown

  AttendeesDropdown _attendeesDropdown = AttendeesDropdown();

  AttendeesDropdown get attendeesDropdown => _attendeesDropdown;

  getAttendeesDropdown() async {
    _attendeesDropdown = await DropDownClients.getAttendeesDetailData();
  }

  /// get all persons dropdown
  PersonsDropdown _personsDropdown = PersonsDropdown();

  PersonsDropdown get personDropdown => _personsDropdown;

  getPersonDropdown() async {
    _personsDropdown = await DropDownClients.getPersonDetailData();
  }

  ///  get all assigned_by dropdown
  AssignedByDropdown _assignedByDropdown = AssignedByDropdown();

  AssignedByDropdown get assignedByDropdown => _assignedByDropdown;

  getAssignedByDropdown() async {
    _assignedByDropdown = await DropDownClients.getAssignedByDetailData();
  }

  /// get programme_coordinator dropdown
  ProgrammeCoordinatorDropdown _programmeCoordinatorDropdown = ProgrammeCoordinatorDropdown();

  ProgrammeCoordinatorDropdown get programmeCoordinatorDropdown => _programmeCoordinatorDropdown;

  getProgramCoordinatorDropdown() async {
    _programmeCoordinatorDropdown = await DropDownClients.getProgramCoordinatorDetailData();
  }

  /// get assigned_to dropdown
  AssignedToDropdown _assignedToDropdown = AssignedToDropdown();

  AssignedToDropdown get assignedToDropdown => _assignedToDropdown;

  getAssignedTo() async {
    _assignedToDropdown = await DropDownClients.getAssignedToDetailData();
  }

  /// get farmers dropdown
  FarmersDropdown _farmersDropdown = FarmersDropdown();

  FarmersDropdown get farmersDropdown => _farmersDropdown;

  getFarmersDropdown() async {
    _farmersDropdown = await DropDownClients.getFarmersDetailData();
  }

  /// get Farm dropdown
  FarmDropDown _farmDropdown = FarmDropDown();

  FarmDropDown get farmDropdown => _farmDropdown;

  getFarmDropdown() async {
    _farmDropdown = await DropDownClients.getFarmDetailData();
  }

  getAllDropDown() async {
    await getProjectDropdown();
    await getOrganizationDropdown();
    await getWijLandDropdown();
    await getAttendeesDropdown();
    await getPersonDropdown();
    await getAssignedByDropdown();
    await getProgramCoordinatorDropdown();
    await getAssignedTo();
    await getFarmersDropdown();
    await getFarmDropdown();
  }
}
