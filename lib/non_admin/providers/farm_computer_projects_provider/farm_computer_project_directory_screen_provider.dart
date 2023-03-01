import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wij_land/non_admin/api_clients/farm_computer_project_clients.dart';
import 'package:wij_land/non_admin/models/farm_computer_project/farm_computers_project_details_response_model.dart';

import '../../models/farm_computer_project/farm_computers_projects_response_model.dart';
import '../../screens/project_directory/widgets/not_participating_dialog_widget.dart';

class FarmComputerProjectDirectoryScreenProvider extends ChangeNotifier {
  //* VARIABLES INITIALIZATION STARTS *//

  int mTabPosition = 0;
  bool mShowLoading = false;

  //* VARIABLES INITIALIZATION ENDS *//

  //* GET PROJECT DATA API WORK STARTS *//
  late FarmComputersProjectsResponseModel farmComputersProjectsResponseModel;
  List<ProjectsData> participatingList = [];
  List<ProjectsData> notParticipatingList = [];

  Future getProjectsData(
      {required String mSearchString, required mStatus}) async {
    mShowLoading = true;
    participatingList.clear();
    notParticipatingList.clear();
    notifyListeners();

    farmComputersProjectsResponseModel =
        await FarmComputerProjectClients.getFarmComputerProjects(
      searchString: mSearchString,
      status: mStatus,
    );

    if (farmComputersProjectsResponseModel.data!.isNotEmpty) {
      participatingList = farmComputersProjectsResponseModel.data!;
      notParticipatingList = farmComputersProjectsResponseModel.data!;

      // if (mStatus == 'active_participation') {
      //
      //
      // } else {
      //
      // }
    }
    mShowLoading = false;
    notifyListeners();
  }

  //* GET PROJECT DATA API WORK ENDS *//

  //* GET PROJECT DETAILS DATA API WORK STARTS *//
  late FarmComputersProjectDetailResponseModel projectDetailResponseModel;

  getProjectDetailsData({
    required int id,
    required BuildContext context,
    required ProjectsData projectsData,
  }) async {
    projectDetailResponseModel =
        await FarmComputerProjectClients.getFarmComputerProjectDetails(
      id: id,
    );

    if (projectDetailResponseModel.data?.interestStatus != [] ||
        projectDetailResponseModel.data?.interestStatus != null) {
      projectDetailResponseModel.data!.interestStatus![0] == "Interested"
          ? isInterested = true
          : isInterested = false;
      print("Coming here ");
      notifyListeners();
    } else {
      isInterested = false;
    }
    print("List : ${projectDetailResponseModel.data?.personResponsibles}");
    showDialog(
        context: context,
        builder: (_) {
          return NotParticipatingDialogWidget(
            projectData: projectsData,
          );
        });
  }

  //* GET PROJECT DETAILS DATA API WORK ENDS *//

  //* UPDATE PROJECT INTEREST STATUS, PUT METHOD *//

  late FarmComputersProjectDetailResponseModel
      farmComputersProjectDetailResponseModel;

  updateProjectInterest(
      {required int projectID, required String interestStatus}) async {
    farmComputersProjectDetailResponseModel =
        await FarmComputerProjectClients.updateProjectInterest(
      id: projectID,
      interestStatus: interestStatus,
    );
    print(
        "Interest Response : ${farmComputersProjectDetailResponseModel.data!.toJson()}");
    await getProjectsData(mSearchString: '', mStatus: 'not_participation');
  }

  bool isInterested = false;

  void launchMailClient(String email) async {
    final mailUrl = 'mailto:$email';
    try {
      await launch(mailUrl);
    } catch (e) {}
  }

//* UPDATE PROJECT INTEREST STATUS, PUT METHOD *//

}
