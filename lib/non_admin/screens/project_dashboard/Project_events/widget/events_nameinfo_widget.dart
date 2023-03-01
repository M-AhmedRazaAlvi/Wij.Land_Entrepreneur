import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/non_admin/routes/routes.dart';
import 'package:wij_land/utils/controller.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/images.dart';
import 'package:wij_land/utils/styles.dart';

class EventsNameInfoWidget extends StatelessWidget {
  const EventsNameInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigationController.navigateTo(eventsCalenderListPageRoute);
        //navigationController.navigateTo(eventsFileScreenPageRoute);
        // Get.to(EventsFileScreen());
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.horizontal(right: Radius.circular(10))),
          child: Row(
            // crossAxisAlignment: WrapCrossAlignment.start,
            // alignment: WrapAlignment.start,

            children: [
              Image(
                image: AssetImage(Images.eventImage),
                height: 156,
                width: 136,
              ),
              SizedBox(
                width: 80,
                height: 156,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: "JAN.".tr(), size: 25, color: darkred),
                    CustomText(text: "25", size: 35, weight: FontWeight.bold),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10, top: 20, bottom: 10),
                width: getWidth(context) / 4.5,
                // height: 156,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text: "Event Name".tr(),
                        size: 22,
                        color: darkred,
                        weight: FontWeight.bold),
                    SizedBox(
                      height: 6,
                    ),
                    CustomText(
                        text: "project • location ".tr(), weight: FontWeight.w700),
                    SizedBox(
                      height: 6,
                    ),
                    CustomText(
                      text:
                          "",
                      weight: FontWeight.w700,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
