import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/responsive.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../app_common_widgets/text_widget.dart';
import '../../../../../utils/images.dart';
import '../../../../providers/dashobard_provider/main_dashboard_provider.dart';

class AddProjectActionDialog extends StatefulWidget {
  const AddProjectActionDialog({Key? key}) : super(key: key);

  @override
  State<AddProjectActionDialog> createState() => _AddProjectActionDialogState();
}

class _AddProjectActionDialogState extends State<AddProjectActionDialog> {
  final TextEditingController actiondate = TextEditingController();

  String? pileStatus = 'Active';
  List<String> pileStatusList = ['Active', 'In Active'];
  String? season = 'Fall';
  List<String> seasonList = [
    'Fall',
    'Autumn',
    'Spring',
    'Winter',
  ];

  int countBokashi = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<MainFCDashboardProvider>(
      builder: (context, provider, child) {
        return SizedBox(
          //   width: getWidth(context) * 0.6,
          child: AlertDialog(
            scrollable: true,
            content: Builder(
              builder: (context) {
                return SizedBox(
                  width: Responsive.isMobile(context) ? getWidth(context) : getWidth(context) * 0.6,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: "Action Type".tr(), weight: FontWeight.bold, size: 18),
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.close))
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                SizedBox(
                                  width: getWidth(context),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Visibility(
                                        visible: Responsive.isMobile(context) ? true : false,
                                        child: Container(
                                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
                                          child: Image.asset(
                                            Images.mapImage,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      CustomText(text: "Location".tr(), size: 18, weight: FontWeight.bold),
                                      SizedBox(height: 10),
                                      TextWidgetField(hintText: provider.info!.data!.farmName!, enabled: false),
                                      SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                CustomText(text: "Latitude".tr()),
                                                SizedBox(height: 10),
                                                TextWidgetField(suffixIcon: null, prefixIcons: null),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: Responsive.isMobile(context) ? 5 : 20),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                CustomText(text: "Longitude".tr()),
                                                SizedBox(height: 10),
                                                TextWidgetField(suffixIcon: null, prefixIcons: null),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      CustomText(text: "General Information".tr(), size: 18, weight: FontWeight.bold),
                                      SizedBox(height: 10),
                                      CustomText(text: "Date of Action".tr()),
                                      SizedBox(height: 10),
                                      InkWell(
                                          onTap: () {
                                            showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(2001),
                                                    lastDate: DateTime(2023))
                                                .then((d) {
                                              debugPrint("$d");
                                              if (d != null) {
                                                setState(() {
                                                  actiondate.text = d.toString().split(" ")[0];
                                                });
                                              }
                                            });
                                          },
                                          child: Builder(
                                            builder: (context) => TextWidgetField(
                                              controller: actiondate,
                                              hintText: "Start Date".tr(),
                                              textPadding: EdgeInsets.only(top: 5, left: 10),
                                              enabled: false,
                                              suffixIcon: Padding(
                                                padding: const EdgeInsets.only(right: 10),
                                                child: Icon(Icons.calendar_today_outlined, size: 14),
                                              ),
                                            ),
                                          )),
                                      SizedBox(height: 20),
                                      CustomText(text: "Done in Season".tr()),
                                      SizedBox(height: 10),
                                      Builder(builder: (context) {
                                        return RealDropDownWidget(
                                          value: season,
                                          onChanged: (newValue) {
                                            setState(() {
                                              season = newValue;
                                            });
                                          },
                                          items: seasonList.map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value.tr(),
                                                  style: TextStyle(fontFamily: Montserrat_Medium),
                                                ));
                                          }).toList(),
                                        );
                                      }),
                                      SizedBox(height: 20),
                                      CustomText(text: "Method Description".tr()),
                                      SizedBox(height: 10),
                                      TextWidgetField(),
                                      SizedBox(height: 10),
                                      CustomText(text: "Comment".tr()),
                                      SizedBox(height: 10),
                                      TextWidgetField(),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CustomText(text: "Additional Information".tr().tr(), weight: FontWeight.bold, size: 18),
                                      SizedBox(height: 20),
                                      CustomText(text: "Tons of Bakoshi".tr()),
                                      SizedBox(height: 10),
                                      TextWidgetField(),
                                      SizedBox(height: 10),
                                      CustomText(text: "Comment".tr()),
                                      SizedBox(height: 10),
                                      TextWidgetField(),
                                      SizedBox(height: 20),
                                      CustomText(text: "Reciepe and Ingredients".tr()),
                                      SizedBox(height: 10),
                                      TextWidgetField(),
                                      SizedBox(height: 10),
                                      CustomText(text: "Pile Status".tr()),
                                      SizedBox(height: 10),
                                      Builder(builder: (context) {
                                        return RealDropDownWidget(
                                          value: pileStatus,
                                          onChanged: (newValue) {
                                            setState(() {
                                              pileStatus = newValue;
                                            });
                                          },
                                          items: pileStatusList.map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value.tr(),
                                                  style: TextStyle(fontFamily: Montserrat_Medium),
                                                ));
                                          }).toList(),
                                        );
                                      }),
                                      SizedBox(height: 20),
                                      Visibility(
                                        visible: Responsive.isMobile(context) ? true : false,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CustomText(text: "Pictures".tr(), weight: FontWeight.bold, size: 18),
                                            SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                for (int i = 0; i < 4; i++) Icon(Icons.image),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: !Responsive.isMobile(context) ? true : false,
                            child: Expanded(
                                child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: SizedBox(
                                    width: getWidth(context),
                                    //  color: Colors.black,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
                                          child: Image.asset(
                                            Images.mapImage,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        CustomText(text: "Pictures".tr(), weight: FontWeight.bold, size: 18),
                                        SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            for (int i = 0; i < 4; i++) Icon(Icons.image),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
