import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/non_admin/models/farm_computer_events/computer_event_participating/response/get_computer_event_participating_response.dart';
import 'package:wij_land/non_admin/providers/farm_computer_projects_provider/farm_computer_event_participating_provider.dart';
import 'package:wij_land/non_admin/screens/computer_events/widgets/participation_info_widget.dart';
import 'package:wij_land/utils/responsive.dart';
import '../../../app_common_widgets/custom_text.dart';
import '../../../utils/functions.dart';
import '../../../utils/styles.dart';

class EventsParticipationWidget extends StatefulWidget {
  const EventsParticipationWidget({Key? key, this.participatingId, this.model}) : super(key: key);
  final dynamic participatingId;
  final GetFarmComputerEventParticipatingResponse? model;

  @override
  State<EventsParticipationWidget> createState() => _EventsParticipationWidgetState();
}

class _EventsParticipationWidgetState extends State<EventsParticipationWidget> {
  @override
  void initState() {
    isLoading = true;
    initData();
    super.initState();
  }

  initData() async {
    await Provider.of<CreateFarmComputerEventsParicipatingProvider>(context, listen: false)
        .getFarmComputerEventPaticipating(particicpatngId: widget.participatingId);
    isLoading = false;
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateFarmComputerEventsParicipatingProvider>(
      builder: (context, provider, child) {
        return isLoading
            ? SizedBox(
                height: getHeight(context) / 2,
                width: getWidth(context),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : provider.farmComputerEventParticipatingResponseModel.error?.status == 404
                ? Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.all(20),
                    child: CustomText(
                      text: provider.farmComputerEventParticipatingResponseModel.error?.message ?? "Only Invited Guests Can View Data".tr(),
                      color: Colors.red,
                      weight: FontWeight.w700,
                      size: Responsive.isMobile(context) ? 12 : 16,
                    ),
                  )
                : SizedBox(
                    width: getWidth(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: Responsive.isMobile(context) ? 15 : 20, horizontal: 10),
                          child: CustomText(
                            text: "Participating".tr(),
                            size: Responsive.isMobile(context) ? 12 : 16,
                            color: darkGreen,
                            weight: FontWeight.bold,
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? 6 : 10),
                            child: Column(
                              children: [
                                ParticipationInfoRowWidget(
                                  first: true,
                                  farmName: "Farm Name".tr(),
                                  response: "Response".tr(),
                                  attended: "Attended".tr(),
                                  totalRow: "Total".tr() + " ${provider.farmComputerEventParticipatingResponseModel.data!.length}",
                                  size: Responsive.isMobile(context) ? getWidth(context) / 6 : getWidth(context) / 6,
                                ),
                                for (int i = 0; i < provider.farmComputerEventParticipatingResponseModel.data!.length; i++)
                                  ParticipationInfoRowWidget(
                                    first: false,
                                    farmName: provider.farmComputerEventParticipatingResponseModel.data![i].name ?? "-",
                                    response: provider.farmComputerEventParticipatingResponseModel.data![i].rsvpAnswer == null
                                        ? '-'
                                        : provider.farmComputerEventParticipatingResponseModel.data![i].rsvpAnswer == null
                                            ? ""
                                            : provider.farmComputerEventParticipatingResponseModel.data![i].rsvpAnswer![0],
                                    attended: provider.farmComputerEventParticipatingResponseModel.data![i].attendedMode == null
                                        ? "-"
                                        : provider.farmComputerEventParticipatingResponseModel.data![i].attendedMode!,
                                    totalRow: "",
                                    size: Responsive.isMobile(context) ? getWidth(context) / 6 : getWidth(context) / 6,
                                  ),
                                provider.farmComputerEventParticipatingResponseModel.data!.length <= 2
                                    ? SizedBox(height: 100)
                                    : SizedBox(
                                        height: 50,
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
      },
    );
  }
}
