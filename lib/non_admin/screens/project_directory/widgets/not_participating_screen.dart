import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/non_admin/screens/project_directory/widgets/not_participating_dialog_widget.dart';
import 'package:wij_land/non_admin/screens/project_directory/widgets/participating_card_widget.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/styles.dart';
import '../../../providers/farm_computer_projects_provider/farm_computer_project_directory_screen_provider.dart';

class NotParticipatingScreen extends StatefulWidget {
  const NotParticipatingScreen({Key? key}) : super(key: key);

  @override
  State<NotParticipatingScreen> createState() => _NotParticipatingScreenState();
}

class _NotParticipatingScreenState extends State<NotParticipatingScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FarmComputerProjectDirectoryScreenProvider>(builder: (context, _provider, widget) {
      return SingleChildScrollView(
        child: _provider.notParticipatingList.isEmpty
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
                  for (int i = 0; i < _provider.notParticipatingList.length; i++)
                    ParticipatingCardWidget(
                      title: _provider.notParticipatingList[i].projectName ?? "",
                      date: _provider.notParticipatingList[i].startDate ?? "",
                      thumbImageURL: _provider.participatingList[i].bannerImage?.file?.thumb ?? "",
                      onPress: () async {
                        await _provider.getProjectDetailsData(
                          id: _provider.notParticipatingList[i].projectId!,
                          context: context,
                          projectsData: _provider.notParticipatingList[i],
                        );
                      },
                      imageUrl: _provider.notParticipatingList[i].bannerImage?.path ?? "",
                      farmValue: _provider.notParticipatingList[i].activeFarms.toString(),
                    ),
                ],
              ),
      );
    });
  }
}
