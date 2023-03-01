import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/non_admin/models/farm_computer_project/farm_computer_project_participant/response/get_farm_computer_proj_participants_response.dart';
import 'package:wij_land/non_admin/providers/farm_computer_projects_provider/farm_computer_proj_participant_provider.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/responsive.dart';
import 'package:wij_land/utils/styles.dart';

class ProjectPartcipatingScreen extends StatefulWidget {
  const ProjectPartcipatingScreen({this.model, this.projectID, Key? key}) : super(key: key);
  final GetFarmComputerProjectParticipantResponse? model;
  final  projectID;

  @override
  State<ProjectPartcipatingScreen> createState() => _ProjectPartcipatingScreenState();
}

class _ProjectPartcipatingScreenState extends State<ProjectPartcipatingScreen> {
  @override
  bool isLoading = false;

  void initState() {
    isLoading = true;
    // TODO: implement initState

    Future.delayed(Duration(seconds: 2), () async {
      await Provider.of<FarmComputerProjectParticipantProvider>(context, listen: false)
          .getFarmComputerProjectParticipant(projectID: widget.projectID['id']);
      isLoading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FarmComputerProjectParticipantProvider>(context);
    return SizedBox(
      // height: getHeight(context),
      child: isLoading
          ? SizedBox(
              height: getHeight(context),
              width: getWidth(context),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : provider.farmComputerProjectParticipantResponseModel.data!.farms == null ||
                  provider.farmComputerProjectParticipantResponseModel.data!.farms!.isEmpty
              ? Container(
                  height: getHeight(context),
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(20),
                  child: CustomText(
                    text: provider.farmComputerProjectParticipantResponseModel.message ?? "No data found".tr(),
                    color: Colors.red,
                    weight: FontWeight.w700,
                    size: 20,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: SizedBox(
                        // height: getHeight(context),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Row(
                            children: [
                              CustomText(
                                text: "Participating".tr(),
                                size: 20,
                                color: darkGreen,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                  dataRowHeight: 40, showBottomBorder: true, horizontalMargin: 0, columnSpacing: 10, columns: [
                                DataColumn(
                                  label: CustomText(
                                    text: 'Farm Name'.tr(),
                                    color: Colors.black,
                                    size: 12,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                                DataColumn(
                                  label: CustomText(
                                    text: 'Start Date'.tr(),
                                    color: Colors.black,
                                    size: 12,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                                DataColumn(
                                    label: SizedBox(
                                        width: Responsive.isDesktop(context)
                                            ? 450
                                            : Responsive.isTablet(context)
                                                ? 260
                                                : 20)),
                                DataColumn(
                                    label: CustomText(
                                  text: "Row Total:  ".tr() + "${provider.farmComputerProjectParticipantResponseModel.data!.totalCount}",
                                  color: Colors.black,
                                  size: 12,
                                  weight: FontWeight.bold,
                                )),
                              ], rows: <DataRow>[
                                for (int i = 0; i < provider.farmComputerProjectParticipantResponseModel.data!.farms!.length; i++)
                                  DataRow(cells: [
                                    DataCell(Text(provider.farmComputerProjectParticipantResponseModel.data!.farms![i].farmName ?? "No Data Found",
                                      style: TextStyle(fontFamily: Montserrat_Medium),)
                                        ),
                                    DataCell(Text(
                                        provider.farmComputerProjectParticipantResponseModel.data!.farms![i].participatingDate ?? "No Data Found",
                                      style: TextStyle(fontFamily: Montserrat_Medium),)),
                                    DataCell(Text('')),
                                    DataCell(Text('')),

                                    // DataCell(Text(
                                    //     "${provider.farmComputerProjectParticipantResponseModel.data!.totalCount}")),
                                  ]),
                              ]),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
    );
  }
}
