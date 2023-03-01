import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/non_admin/routes/routes.dart';
import 'package:wij_land/non_admin/screens/project_directory/widgets/participating_card_widget.dart';
import 'package:wij_land/utils/controller.dart';

import '../../../../utils/functions.dart';
import '../../../../utils/styles.dart';
import '../../../providers/farm_computer_projects_provider/farm_computer_project_directory_screen_provider.dart';

class ParticipatingScreen extends StatefulWidget {
  final arguments;
  const ParticipatingScreen({Key? key,this.arguments}) : super(key: key);

  @override
  State<ParticipatingScreen> createState() => _ParticipatingScreenState();
}

class _ParticipatingScreenState extends State<ParticipatingScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FarmComputerProjectDirectoryScreenProvider>(
      builder: (context, _provider, widget) {
        return SingleChildScrollView(
          child: _provider.participatingList.isEmpty
              ? SizedBox(
                  height: getHeight(context) * 0.7,
                  child: Center(
                    child: Text(
                      "No Data Found!".tr(),
                      style: TextStyle(fontFamily: Montserrat_Medium),
                    ),
                  ),
                )
              : Wrap(
                  children: [
                    for (int i = 0; i < _provider.participatingList.length; i++)
                      ParticipatingCardWidget(
                        title: _provider.participatingList[i].projectName ?? "",
                        date: _provider.participatingList[i].startDate ?? "",
                        thumbImageURL: _provider.participatingList[i].bannerImage?.file?.thumb ?? "",
                        onPress: () {
                          navigationController.navigateToWithArguments(
                            routeName: farmComputerProjectDashboardPageRoute,
                            arguments: {"id":_provider.participatingList[i].projectId,"arguments":this.widget.arguments},
                          );
                        },
                        imageUrl: _provider.participatingList[i].bannerImage?.file?.original ?? "",
                        farmValue: _provider.participatingList[i].activeFarms.toString(),
                      ),
                  ],
                ),
        );
      },
    );
  }
}
