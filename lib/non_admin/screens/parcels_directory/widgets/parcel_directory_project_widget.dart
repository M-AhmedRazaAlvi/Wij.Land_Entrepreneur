import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:wij_land/non_admin/models/farm_computer_parcels/response/get_farm_computer_parcels_response.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../utils/controller.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../../routes/routes.dart';

class ParcelDirectoryProjectWidget extends StatefulWidget {
  ParcelData? model;

  ParcelDirectoryProjectWidget({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  State<ParcelDirectoryProjectWidget> createState() =>
      _ParcelDirectoryProjectWidgetState();
}

class _ParcelDirectoryProjectWidgetState
    extends State<ParcelDirectoryProjectWidget> {
  @override
  void initState() {
    //   debugprint"projects====${widget.model!.projects![1].projectName!}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            (Wrap(children: [
              for (int i = 0; i < widget.model!.projects!.length; i++)
                HoverWidget(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
                    child: Container(
                      height: 25,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: darkGreen),
                      child: Center(
                          child: CustomText(
                              text: widget.model!.projects![i].projectName!
                                      .contains("null")
                                  ? "There is no project in this parcel".tr()
                                  : widget.model!.projects![i].projectName!,
                              color: Colors.white)),
                    ),
                  ),
                  hoverChild: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
                    child: InkWell(
                      onTap: () {
                        navigationController.navigateToWithArguments(
                            routeName: farmComputerProjectDashboardPageRoute,
                            arguments:
                                int.parse(widget.model!.projects![i].id!));
                      },
                      child: Container(
                        height: 25,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: yellow),
                        child: Center(
                            child: CustomText(
                                text: widget.model!.projects![i].projectName!
                                        .contains("null")
                                    ? "There is no project in this parcel".tr()
                                    : widget.model!.projects![i].projectName!,
                                size: Responsive.isMobile(context) ? 10 : 13,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                  onHover: (event) {},
                ),
            ])),
          ],
        ));
  }
}
