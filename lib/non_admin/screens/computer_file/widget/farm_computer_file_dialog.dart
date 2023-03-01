import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/non_admin/api_clients/farm_computer_project_clients.dart';
import 'package:wij_land/non_admin/providers/fc_files_provider/main_files_provider.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../utils/responsive.dart';

class FarmComputerFileDialog extends StatefulWidget {
  int fileId;

  FarmComputerFileDialog({Key? key, required this.fileId}) : super(key: key);

  @override
  State<FarmComputerFileDialog> createState() => _FarmComputerFileDialogState();
}

class _FarmComputerFileDialogState extends State<FarmComputerFileDialog> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    initData();
  }

  initData() async {
    await Provider.of<MainFilesProvider>(context, listen: false).getDialogData(widget.fileId);
    isLoading = false;
    setState(() {});
  }

  int steps = 1;

  @override
  Widget build(BuildContext context) {
    return Consumer<MainFilesProvider>(builder: (context, provider, child) {
      return SingleChildScrollView(
        child: AlertDialog(
                title: isLoading
                    ? Center(
                  child: CircularProgressIndicator(color: Colors.transparent,),
                )
                    : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomText(
                              text:provider.dialogData['data']['contract']==null? "${provider.dialogData['data']['file']['type']}":"${provider
                                  .dialogData['data']['contract']['contract_type'][0]}",
                              size:Responsive.isMobile(context)?18: 24,
                              color: darkred,
                              lines: 5,
                              textAligns: TextAlign.start,
                              overflows: TextOverflow.visible,
                              weight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.close,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                content:  isLoading
                    ? SizedBox(
                  width: MediaQuery.of(context).size.width * 0.33,
                  height: getHeight(context)*0.33,
                  child: Center(child: CircularProgressIndicator()),
                )
                    :SizedBox(
                  width: MediaQuery.of(context).size.width * 0.33,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        (provider.dialogData['data']['file']['type'].toString().toLowerCase() == "media" ||
                                provider.dialogData['data']['file']['type'].toString().toLowerCase() == "interview report" ||
                                provider.dialogData['data']['file']['type'].toString().toLowerCase() == "other") //media,interview report and others
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Responsive.isMobile(context)?SizedBox(width:   20,) :SizedBox(width: 60,),

                                      Expanded(
                                        child: CustomText(
                                          text: 'Date'.tr(),
                                          size: 18,
                                          color: Colors.black,
                                          weight: FontWeight.bold,
                                        ),
                                      ),
                                      Expanded(
                                        child: CustomText(
                                            text:
                                                '${provider.dialogData['data']['file']['date'].toString().split('-')[2]}-${provider.dialogData['data']['file']['date'].toString().split('-')[1]}-${provider.dialogData['data']['file']['date'].toString().split('-')[0]}'),
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  ),
                                  SizedBox(height: 10),
                                  Divider(
                                    color: dimMetalic2,
                                    thickness: 0.5,
                                  ),
                                  SizedBox(height: 10),
                                  CustomText(
                                    text: 'Tags'.tr(),
                                    size: 18,
                                    color: Colors.black,
                                    weight: FontWeight.bold,
                                  ),
                                  SizedBox(height: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Responsive.isMobile(context)?SizedBox(width:   20,) :SizedBox(width: 60,),
                                          Expanded(child: CustomText(text: 'Farm'.tr(),size: 12,)),
                                          //Responsive.isMobile(context) ?SizedBox(width: 60,) : SizedBox(width: 60,),
                                          Expanded(
                                            // width:Responsive.isMobile(context) ?getWidth(context)*0.32: getWidth(context)*0.15,
                                            child: Wrap(
                                              children: [
                                                for (int i = 0; i < provider.dialogData['data']['file_tags']['farms'].length; i++)
                                                  if (provider.dialogData['data']['file_tags']['farms'][i] != null)
                                                    CustomText( text:  '${provider.dialogData['data']['file_tags']['farms'][i]['farm_name']},',
                                                      size: 12,),
                                              ],
                                            ),
                                          ),
                                        ],
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Responsive.isMobile(context)?SizedBox(width: 20,) :SizedBox(width: 60,),
                                          Expanded(child: CustomText(text: 'Parcel '.tr(),size: 12,)),
                                          // Responsive.isMobile(context) ?SizedBox(width: 50,) :   SizedBox(width: 90,),
                                          Expanded(
                                            // width:Responsive.isMobile(context) ?getWidth(context)*0.32: getWidth(context)*0.15,
                                            child: Wrap(
                                              children: [
                                                for (int i = 0; i < provider.dialogData['data']['file_tags']['parcels'].length; i++)
                                                  if (provider.dialogData['data']['file_tags']['parcels'][i] != null)
                                                    CustomText(text: '${provider.dialogData['data']['file_tags']['parcels'][i]['name_auto']},',
                                                      size: 12,),
                                              ],
                                            ),
                                          ),
                                        ],
                                        // alignment: WrapAlignment.spaceAround,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Responsive.isMobile(context)?SizedBox(width: 20,) :SizedBox(width: 60,),

                                          Expanded(child: CustomText(text: 'Project '.tr(),size: 12,)),
                                          // Responsive.isMobile(context) ?SizedBox(width: 45,) :SizedBox(width:90),
                                          Expanded(
                                            // width:Responsive.isMobile(context) ?getWidth(context)*0.32: getWidth(context)*0.15,
                                            child: Wrap(
                                              children: [
                                                for (int i = 0; i < provider.dialogData['data']['file_tags']['projects'].length; i++)
                                                  if (provider.dialogData['data']['file_tags']['projects'][i] != null)
                                                    CustomText(text: '${provider
                                                        .dialogData['data']['file_tags']['projects'][i]['name']},',size: 12,
                                                    ),
                                              ],
                                            ),
                                          ),

                                        ],
                                        // alignment: WrapAlignment.spaceAround,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Responsive.isMobile(context)?SizedBox(width: 20,) :SizedBox(width: 60,),

                                          Expanded(child: CustomText(text: 'Organisation '.tr(),size: 12,)),
                                          // Responsive.isMobile(context) ?SizedBox(width: 10,) :  SizedBox(width: 46,),
                                          Expanded(
                                            // width:Responsive.isMobile(context) ?getWidth(context)*0.25: getWidth(context)*0.15,

                                            child: Wrap(
                                              children: [
                                                for (int i = 0; i < provider.dialogData['data']['file_tags']['organizations'].length; i++)
                                                  if (provider.dialogData['data']['file_tags']['organizations'][i] != null)
                                                    CustomText(text: '${provider
                                                        .dialogData['data']['file_tags']['organizations'][i]['organization_name']},',size: 12,),
                                              ],
                                            ),
                                          ),
                                        ],
                                        // alignment: WrapAlignment.spaceAround,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Row  (
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Responsive.isMobile(context)?SizedBox(width: 20,) :SizedBox(width: 60,),
                                          Expanded(child: CustomText(text: 'Events '.tr(),size: 12,)),
                                          // Responsive.isMobile(context) ?SizedBox(width: 45,) :  SizedBox(width: 88,),
                                          Expanded(
                                            // width:Responsive.isMobile(context) ?getWidth(context)*0.32: getWidth(context)*0.15,
                                            child: Wrap(
                                              children: [
                                                for (int i = 0; i < provider.dialogData['data']['file_tags']['events'].length; i++)
                                                  if (provider.dialogData['data']['file_tags']['events'][i] != null)
                                                    CustomText(text: '${provider.dialogData['data']['file_tags']['events'][i]['event_name']},',
                                                      size: 12,),
                                              ],
                                            ),
                                          ),
                                        ],
                                        // alignment: WrapAlignment.spaceAround,
                                      ),
                                    ],
                                  ),


                                ],
                              )
                            : provider.dialogData['data']['file']['type'].toString().toLowerCase() == "soil advisory report" //soil advisory report
                                ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Responsive.isMobile(context)?SizedBox(width:   20,) :SizedBox(width: 60,),
                                          Expanded(
                                            child: CustomText(
                                              text: 'Date'.tr(),
                                              size: 14,
                                              color: Colors.black,
                                              weight: FontWeight.bold,
                                            ),
                                          ),
                                          Expanded(child: CustomText(text: '${provider.dialogData['data']['soil_advise_report']['advise_date'].toString().split('-')
                                          [2]}-${provider.dialogData['data']['soil_advise_report']['advise_date'].toString().split('-')[1]}-${provider
                                              .dialogData['data']['soil_advise_report']['advise_date'].toString().split('-')[0]}',size: 12,)),
                                        ],
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Responsive.isMobile(context)?SizedBox(width:   20,) :SizedBox(width: 60,),
                                          Expanded(
                                            child: CustomText(
                                              text: 'Report Title'.tr(),
                                              size: 14,
                                              color: Colors.black,
                                              weight: FontWeight.bold,
                                            ),
                                          ),
                                          Expanded(child: CustomText(text: provider.dialogData['data']['soil_advise_report']['report_title']??"",size: 12,)),
                                        ],
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Responsive.isMobile(context)?SizedBox(width:   20,) :SizedBox(width: 60,),

                                          Expanded(
                                            child: CustomText(
                                              text: 'Date report received'.tr(),
                                              size: 14,
                                              color: Colors.black,
                                              weight: FontWeight.bold,
                                            ),
                                          ),
                                          Expanded(child: CustomText(text: '${provider.dialogData['data']['soil_advise_report']['report_date']
                                              .toString().split('T')[0].split('-')
                                          [2]}-${provider.dialogData['data']['soil_advise_report']['report_date'].toString().split('T')[0].split('-')[1]}-${provider
                                              .dialogData['data']['soil_advise_report']['report_date'].toString().split('T')[0].split('-')[0]}',size: 12,)),
                                        ],
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Responsive.isMobile(context)?SizedBox(width:   20,) :SizedBox(width: 60,),

                                          Expanded(
                                            child: CustomText(
                                              text: 'Report made by'.tr(),
                                              size: 14,
                                              color: Colors.black,
                                              weight: FontWeight.bold,
                                            ),
                                          ),
                                          Expanded(child: CustomText(text:  provider.dialogData['data']['soil_advise_report']['report_made_by']['report_made_by_name']??"",
                                            size: 12,)),
                                        ],
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                      ),
                                      SizedBox(height: 10),
                                      Divider(
                                        color: dimMetalic3,
                                        thickness: 0.5,
                                      ),
                                      SizedBox(height: 10),
                                      CustomText(
                                        text: 'Tags'.tr(),
                                        size: 18,
                                        color: Colors.black,
                                        weight: FontWeight.bold,
                                      ),
                                      SizedBox(height: 10),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Responsive.isMobile(context)?SizedBox(width:   20,) :SizedBox(width: 60,),
                                              Expanded(child: CustomText(text: 'Farm'.tr(),size: 12,)),
                                              //Responsive.isMobile(context) ?SizedBox(width: 60,) : SizedBox(width: 60,),
                                              Expanded(
                                                // width:Responsive.isMobile(context) ?getWidth(context)*0.32: getWidth(context)*0.15,
                                                child: Wrap(
                                                  children: [
                                                    for (int i = 0; i < provider.dialogData['data']['file_tags']['farms'].length; i++)
                                                      if (provider.dialogData['data']['file_tags']['farms'][i] != null)
                                                        CustomText( text:  '${provider.dialogData['data']['file_tags']['farms'][i]['farm_name']},',
                                                          size: 12,),
                                                  ],
                                                ),
                                              ),
                                            ],
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Responsive.isMobile(context)?SizedBox(width: 20,) :SizedBox(width: 60,),
                                              Expanded(child: CustomText(text: 'Parcel '.tr(),size: 12,)),
                                              // Responsive.isMobile(context) ?SizedBox(width: 50,) :   SizedBox(width: 90,),
                                              Expanded(
                                                // width:Responsive.isMobile(context) ?getWidth(context)*0.32: getWidth(context)*0.15,
                                                child: Wrap(
                                                  children: [
                                                    for (int i = 0; i < provider.dialogData['data']['file_tags']['parcels'].length; i++)
                                                      if (provider.dialogData['data']['file_tags']['parcels'][i] != null)
                                                        CustomText(text: '${provider.dialogData['data']['file_tags']['parcels'][i]['name_auto']},',
                                                          size: 12,),
                                                  ],
                                                ),
                                              ),
                                            ],
                                            // alignment: WrapAlignment.spaceAround,
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Responsive.isMobile(context)?SizedBox(width: 20,) :SizedBox(width: 60,),

                                              Expanded(child: CustomText(text: 'Project '.tr(),size: 12,)),
                                              // Responsive.isMobile(context) ?SizedBox(width: 45,) :SizedBox(width:90),
                                              Expanded(
                                                // width:Responsive.isMobile(context) ?getWidth(context)*0.32: getWidth(context)*0.15,
                                                child: Wrap(
                                                  children: [
                                                    for (int i = 0; i < provider.dialogData['data']['file_tags']['projects'].length; i++)
                                                      if (provider.dialogData['data']['file_tags']['projects'][i] != null)
                                                        CustomText(text: '${provider
                                                            .dialogData['data']['file_tags']['projects'][i]['name']},',size: 12,
                                                        ),
                                                  ],
                                                ),
                                              ),

                                            ],
                                            // alignment: WrapAlignment.spaceAround,
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Responsive.isMobile(context)?SizedBox(width: 20,) :SizedBox(width: 60,),

                                              Expanded(child: CustomText(text: 'Organisation '.tr(),size: 12,)),
                                              // Responsive.isMobile(context) ?SizedBox(width: 10,) :  SizedBox(width: 46,),
                                              Expanded(
                                                // width:Responsive.isMobile(context) ?getWidth(context)*0.25: getWidth(context)*0.15,

                                                child: Wrap(
                                                  children: [
                                                    for (int i = 0; i < provider.dialogData['data']['file_tags']['organizations'].length; i++)
                                                      if (provider.dialogData['data']['file_tags']['organizations'][i] != null)
                                                        CustomText(text: '${provider
                                                            .dialogData['data']['file_tags']['organizations'][i]['organization_name']},',size: 12,),
                                                  ],
                                                ),
                                              ),
                                            ],
                                            // alignment: WrapAlignment.spaceAround,
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Row  (
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Responsive.isMobile(context)?SizedBox(width: 20,) :SizedBox(width: 60,),
                                              Expanded(child: CustomText(text: 'Events '.tr(),size: 12,)),
                                              // Responsive.isMobile(context) ?SizedBox(width: 45,) :  SizedBox(width: 88,),
                                              Expanded(
                                                // width:Responsive.isMobile(context) ?getWidth(context)*0.32: getWidth(context)*0.15,
                                                child: Wrap(
                                                  children: [
                                                    for (int i = 0; i < provider.dialogData['data']['file_tags']['events'].length; i++)
                                                      if (provider.dialogData['data']['file_tags']['events'][i] != null)
                                                        CustomText(text: '${provider.dialogData['data']['file_tags']['events'][i]['event_name']},',
                                                          size: 12,),
                                                  ],
                                                ),
                                              ),
                                            ],
                                            // alignment: WrapAlignment.spaceAround,
                                          ),
                                        ],
                                      ),




                                    ],
                                  )
                                : provider.dialogData['data']['file']['type'].toString().toLowerCase() ==
                                        "farm management plan" //farm management plan
                                    ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Responsive.isMobile(context)?SizedBox(width:   20,) :SizedBox(width: 60,),

                                              Expanded(
                                                child: CustomText(
                                                  text: 'Date'.tr(),
                                                  size: 14,
                                                  color: Colors.black,
                                                  weight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(child: CustomText(text:  '${provider.dialogData['data']['file']['date'].toString().split
                                                ('-')[2]}-${provider.dialogData['data']['file']['date'].toString().split('-')[1]}-${provider
                                                  .dialogData['data']['file']['date'].toString().split('-')[0]}',size: 12,),
                                              ),
                                            ],
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                          ),
                                          SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Responsive.isMobile(context)?SizedBox(width:   20,) :SizedBox(width: 60,),
                                              Expanded(
                                                child: CustomText(
                                                  text: "Plan Title".tr(),
                                                  size: 14,
                                                  color:Colors.black,
                                                  weight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(child: CustomText(text: provider.dialogData['data']['file']['title']??"",size: 12,)),
                                            ],
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                          ),
                                          SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Responsive.isMobile(context)?SizedBox(width:   20,) :SizedBox(width: 60,),
                                              Expanded(
                                                child: CustomText(
                                                  text: 'Comments'.tr(),
                                                  size: 14,
                                                  color: Colors.black,
                                                  weight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(child: CustomText(text:provider.dialogData['data']['file']['comments']??" ",size: 12,lines:
                                              50,overflows: TextOverflow.visible,textAligns: TextAlign.start,)),
                                            ],
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                          ),
                                          SizedBox(height: 10),
                                          Divider(
                                            color: dimMetalic3,
                                            thickness: 0.5,
                                          ),
                                          SizedBox(height: 10),
                                          CustomText(
                                            text: 'Tags'.tr(),
                                            size: 14,
                                            color: Colors.black,
                                            weight: FontWeight.bold,
                                          ),
                                          SizedBox(height: 10),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Responsive.isMobile(context)?SizedBox(width:   20,) :SizedBox(width: 60,),
                                                  Expanded(child: CustomText(text: 'Farm'.tr(),size: 12,)),
                                                  //Responsive.isMobile(context) ?SizedBox(width: 60,) : SizedBox(width: 60,),
                                                  Expanded(
                                                    // width:Responsive.isMobile(context) ?getWidth(context)*0.32: getWidth(context)*0.15,
                                                    child: Wrap(
                                                      children: [
                                                        for (int i = 0; i < provider.dialogData['data']['file_tags']['farms'].length; i++)
                                                          if (provider.dialogData['data']['file_tags']['farms'][i] != null)
                                                            CustomText( text:  '${provider.dialogData['data']['file_tags']['farms'][i]['farm_name']},',
                                                              size: 12,),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Responsive.isMobile(context)?SizedBox(width: 20,) :SizedBox(width: 60,),
                                                  Expanded(child: CustomText(text: 'Parcel '.tr(),size: 12,)),
                                                  // Responsive.isMobile(context) ?SizedBox(width: 50,) :   SizedBox(width: 90,),
                                                  Expanded(
                                                    // width:Responsive.isMobile(context) ?getWidth(context)*0.32: getWidth(context)*0.15,
                                                    child: Wrap(
                                                      children: [
                                                        for (int i = 0; i < provider.dialogData['data']['file_tags']['parcels'].length; i++)
                                                          if (provider.dialogData['data']['file_tags']['parcels'][i] != null)
                                                            CustomText(text: '${provider.dialogData['data']['file_tags']['parcels'][i]['name_auto']},',
                                                              size: 12,),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                                // alignment: WrapAlignment.spaceAround,
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Responsive.isMobile(context)?SizedBox(width: 20,) :SizedBox(width: 60,),

                                                  Expanded(child: CustomText(text: 'Project '.tr(),size: 12,)),
                                                  // Responsive.isMobile(context) ?SizedBox(width: 45,) :SizedBox(width:90),
                                                  Expanded(
                                                    // width:Responsive.isMobile(context) ?getWidth(context)*0.32: getWidth(context)*0.15,
                                                    child: Wrap(
                                                      children: [
                                                        for (int i = 0; i < provider.dialogData['data']['file_tags']['projects'].length; i++)
                                                          if (provider.dialogData['data']['file_tags']['projects'][i] != null)
                                                            CustomText(text: '${provider
                                                                .dialogData['data']['file_tags']['projects'][i]['name']},',size: 12,
                                                            ),
                                                      ],
                                                    ),
                                                  ),

                                                ],
                                                // alignment: WrapAlignment.spaceAround,
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Responsive.isMobile(context)?SizedBox(width: 20,) :SizedBox(width: 60,),

                                                  Expanded(child: CustomText(text: 'Organisation '.tr(),size: 12,)),
                                                  // Responsive.isMobile(context) ?SizedBox(width: 10,) :  SizedBox(width: 46,),
                                                  Expanded(
                                                    // width:Responsive.isMobile(context) ?getWidth(context)*0.25: getWidth(context)*0.15,

                                                    child: Wrap(
                                                      children: [
                                                        for (int i = 0; i < provider.dialogData['data']['file_tags']['organizations'].length; i++)
                                                          if (provider.dialogData['data']['file_tags']['organizations'][i] != null)
                                                            CustomText(text: '${provider
                                                                .dialogData['data']['file_tags']['organizations'][i]['organization_name']},',size: 12,),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                                // alignment: WrapAlignment.spaceAround,
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Row  (
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Responsive.isMobile(context)?SizedBox(width: 20,) :SizedBox(width: 60,),
                                                  Expanded(child: CustomText(text: 'Events '.tr(),size: 12,)),
                                                  // Responsive.isMobile(context) ?SizedBox(width: 45,) :  SizedBox(width: 88,),
                                                  Expanded(
                                                    // width:Responsive.isMobile(context) ?getWidth(context)*0.32: getWidth(context)*0.15,
                                                    child: Wrap(
                                                      children: [
                                                        for (int i = 0; i < provider.dialogData['data']['file_tags']['events'].length; i++)
                                                          if (provider.dialogData['data']['file_tags']['events'][i] != null)
                                                            CustomText(text: '${provider.dialogData['data']['file_tags']['events'][i]['event_name']},',
                                                              size: 12,),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                                // alignment: WrapAlignment.spaceAround,
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    : provider.dialogData['data']['file']['type'].toString().toLowerCase() ==
                                            "analysis result" //soil analysis resul
                                        ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              SizedBox(height: 8),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Responsive.isMobile(context)?SizedBox(width:20,) :SizedBox(width: 60,),
                                                  Expanded(
                                                    child: CustomText(
                                                      text: 'Date'.tr(),
                                                      size: 14,
                                                      color: Colors.black,
                                                      weight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: CustomText(text:'${provider.dialogData['data']['file']['date'].toString().split('-')
                                                    [2]}-${provider.dialogData['data']['file']['date'].toString().split('-')[1]}-${provider
                                                        .dialogData['data']['file']['date'].toString().split('-')[0]}',size: 12,),
                                                  ),
                                                ],
                                                // alignment: WrapAlignment.spaceEvenly,
                                              ),
                                              SizedBox(height: 4),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Responsive.isMobile(context)?SizedBox(width:   20,) :SizedBox(width: 60,),

                                                  Expanded(
                                                    child: CustomText(
                                                      text: 'Analysis Name'.tr(),
                                                      size: 14,
                                                      color: Colors.black,
                                                      weight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Expanded(child: CustomText(text: provider.dialogData['data']['analysis_result']['analysis_name'][0],
                                                    size: 12,)),
                                                ],
                                                // alignment: WrapAlignment.spaceEvenly,
                                              ),
                                              SizedBox(height: 4),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Responsive.isMobile(context)?SizedBox(width:   20,) :SizedBox(width: 60,),


                                                  Expanded(
                                                    child: CustomText(
                                                      text: 'Analysis Code'.tr(),
                                                      size: 14,
                                                      color: Colors.black,
                                                      weight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  // SizedBox(width: 85,),

                                                  Expanded(child: CustomText(text: provider.dialogData['data']['analysis_result']['analysis_code'],size:
                                                  12,)),
                                                ],
                                                // alignment: WrapAlignment.spaceEvenly,
                                              ),
                                              SizedBox(height: 4),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Responsive.isMobile(context)?SizedBox(width:   20,) :SizedBox(width: 60,),

                                                  Expanded(
                                                    child: CustomText(
                                                      text: 'Lab'.tr(),
                                                      size: 14,
                                                      color: Colors.black,
                                                      weight: FontWeight.bold,
                                                    ),
                                                  ),

                                                  Expanded(child: CustomText(text: provider.dialogData['data']['analysis_result']['sent_to_lab']??" ")),
                                                ],
                                                // alignment: WrapAlignment.spaceEvenly,
                                              ),
                                              SizedBox(height: 4),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Responsive.isMobile(context)?SizedBox(width:   20,) :SizedBox(width: 60,),
                                                  Expanded(
                                                    child: CustomText(
                                                      text: 'Comments'.tr(),
                                                      size: 14,
                                                      color: Colors.black,
                                                      weight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Expanded(child: CustomText(text: provider.dialogData['data']['analysis_result']['comments']??"",
                                                    size: 12,lines: 70,overflows: TextOverflow.visible,textAligns: TextAlign.start,)),
                                                ],
                                                // alignment: WrapAlignment.spaceAround,
                                              ),
                                              SizedBox(height: 10),
                                              Divider(
                                                color: dimMetalic3,
                                                thickness: 0.5,
                                              ),
                                              SizedBox(height: 10),
                                              CustomText(
                                                text: 'Tags'.tr(),
                                                size: 18,
                                                color: Colors.black,
                                                weight: FontWeight.bold,
                                              ),
                                              SizedBox(height: 10),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Responsive.isMobile(context)?SizedBox(width:   20,) :SizedBox(width: 60,),
                                                      Expanded(child: CustomText(text: 'Farm'.tr(),size: 12,)),
                                                      //Responsive.isMobile(context) ?SizedBox(width: 60,) : SizedBox(width: 60,),
                                                      Expanded(
                                                        // width:Responsive.isMobile(context) ?getWidth(context)*0.32: getWidth(context)*0.15,
                                                        child: Wrap(
                                                          children: [
                                                            for (int i = 0; i < provider.dialogData['data']['file_tags']['farms'].length; i++)
                                                              if (provider.dialogData['data']['file_tags']['farms'][i] != null)
                                                                CustomText( text:  '${provider.dialogData['data']['file_tags']['farms'][i]['farm_name']},',
                                                                  size: 12,),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Responsive.isMobile(context)?SizedBox(width: 20,) :SizedBox(width: 60,),
                                                      Expanded(child: CustomText(text: 'Parcel '.tr(),size: 12,)),
                                                      // Responsive.isMobile(context) ?SizedBox(width: 50,) :   SizedBox(width: 90,),
                                                      Expanded(
                                                        // width:Responsive.isMobile(context) ?getWidth(context)*0.32: getWidth(context)*0.15,
                                                        child: Wrap(
                                                          children: [
                                                            for (int i = 0; i < provider.dialogData['data']['file_tags']['parcels'].length; i++)
                                                              if (provider.dialogData['data']['file_tags']['parcels'][i] != null)
                                                                CustomText(text: '${provider.dialogData['data']['file_tags']['parcels'][i]['name_auto']},',
                                                                  size: 12,),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                    // alignment: WrapAlignment.spaceAround,
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Responsive.isMobile(context)?SizedBox(width: 20,) :SizedBox(width: 60,),

                                                      Expanded(child: CustomText(text: 'Project '.tr(),size: 12,)),
                                                      // Responsive.isMobile(context) ?SizedBox(width: 45,) :SizedBox(width:90),
                                                      Expanded(
                                                        // width:Responsive.isMobile(context) ?getWidth(context)*0.32: getWidth(context)*0.15,
                                                        child: Wrap(
                                                          children: [
                                                            for (int i = 0; i < provider.dialogData['data']['file_tags']['projects'].length; i++)
                                                              if (provider.dialogData['data']['file_tags']['projects'][i] != null)
                                                                CustomText(text: '${provider
                                                                    .dialogData['data']['file_tags']['projects'][i]['name']},',size: 12,
                                                                ),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                    // alignment: WrapAlignment.spaceAround,
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Responsive.isMobile(context)?SizedBox(width: 20,) :SizedBox(width: 60,),

                                                      Expanded(child: CustomText(text: 'Organisation '.tr(),size: 12,)),
                                                      // Responsive.isMobile(context) ?SizedBox(width: 10,) :  SizedBox(width: 46,),
                                                      Expanded(
                                                        // width:Responsive.isMobile(context) ?getWidth(context)*0.25: getWidth(context)*0.15,

                                                        child: Wrap(
                                                          children: [
                                                            for (int i = 0; i < provider.dialogData['data']['file_tags']['organizations'].length; i++)
                                                              if (provider.dialogData['data']['file_tags']['organizations'][i] != null)
                                                                CustomText(text: '${provider
                                                                    .dialogData['data']['file_tags']['organizations'][i]['organization_name']},',size: 12,),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                    // alignment: WrapAlignment.spaceAround,
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Row  (
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Responsive.isMobile(context)?SizedBox(width: 20,) :SizedBox(width: 60,),
                                                      Expanded(child: CustomText(text: 'Events '.tr(),size: 12,)),
                                                      // Responsive.isMobile(context) ?SizedBox(width: 45,) :  SizedBox(width: 88,),
                                                      Expanded(
                                                        // width:Responsive.isMobile(context) ?getWidth(context)*0.32: getWidth(context)*0.15,
                                                        child: Wrap(
                                                          children: [
                                                            for (int i = 0; i < provider.dialogData['data']['file_tags']['events'].length; i++)
                                                              if (provider.dialogData['data']['file_tags']['events'][i] != null)
                                                                CustomText(text: '${provider.dialogData['data']['file_tags']['events'][i]['event_name']},',
                                                                  size: 12,),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                    // alignment: WrapAlignment.spaceAround,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        :provider
                            .dialogData['data']['contract'] != null //soil analysis resul
                            ?  Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,

                          children: [
                                              SizedBox(height: 8),
                                              Row(

                                                children: [
                                                  Responsive.isMobile(context)?SizedBox(width:   20,) :SizedBox(width: 60,),

                                                  Expanded(
                                                    child: CustomText(
                                                      text: 'Project'.tr(),
                                                      size: 14,
                                                      color: Colors.black,
                                                      weight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Expanded(child: CustomText(text: "${provider.dialogData['data']['contract']['project']['project_name']??""}",size:
                                                  12,)),
                                                ],
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                              ),
                                              SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Responsive.isMobile(context)?SizedBox(width:   20,) :SizedBox(width: 60,),
                                                  Expanded(
                                                    child: CustomText(
                                                      text: 'Start Date'.tr(),
                                                      size: 14,
                                                      color: Colors.black,
                                                      weight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Expanded(child: CustomText(text:'${provider.dialogData['data']['contract']['contract_date']
                                                      .toString()
                                                      .split
                                                    ('-')[2]}-${provider.dialogData['data']['contract']['contract_date'].toString().split('-')
                                                  [1]}-${provider
                                                      .dialogData['data']['contract']['contract_date'].toString().split('-')[0]}',size: 12,)),
                                                ],
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                              ),
                                              SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Responsive.isMobile(context)?SizedBox(width:   20,) :SizedBox(width: 60,),

                                                  Expanded(
                                                    child: CustomText(
                                                      text: 'Expiration Date'.tr(),
                                                      size: 14,
                                                      color: Colors.black,
                                                      weight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Expanded(child: CustomText(text: '${provider.dialogData['data']['contract']['date_expiration']
                                                      .toString()
                                                      .split
                                                    ('-')[2]}-${provider.dialogData['data']['contract']['date_expiration'].toString().split('-')
                                                  [1]}-${provider
                                                      .dialogData['data']['contract']['date_expiration'].toString().split('-')[0]}',size: 12,)),
                                                ],
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                              ),
                                              SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Responsive.isMobile(context)?SizedBox(width:   20,) :SizedBox(width: 60,),

                                                  Expanded(
                                                    child: CustomText(
                                                      text: 'Status'.tr(),
                                                      size: 14,
                                                      color: Colors.black,
                                                      weight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Expanded(child: CustomText(text: '${provider.dialogData['data']['contract']['status_signed']??" "}',
                                                    size: 12,)),
                                                ],
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                              ),
                                              SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Responsive.isMobile(context)?SizedBox(width:   20,) :SizedBox(width: 60,),

                                                  Expanded(
                                                    child: CustomText(
                                                      text: 'Pilot Year'.tr(),
                                                      size: 14,
                                                      color: Colors.black,
                                                      weight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Expanded(child: CustomText(text: '${provider.dialogData['data']['contract']['pilot_year']??" "}',
                                                    size: 12,)),
                                                ],
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                              ),
                                              SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Responsive.isMobile(context)?SizedBox(width:   20,) :SizedBox(width: 60,),

                                                  Expanded(
                                                    child: CustomText(
                                                      text: 'Pilot Invoice'.tr(),
                                                      size: 14,
                                                      color: Colors.black,
                                                      weight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Expanded(child: CustomText(text: '${provider.dialogData['data']['contract']['pilot_invoice']??" "}',
                                                    size: 12,)),
                                                ],
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                              ),
                                              SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Responsive.isMobile(context)?SizedBox(width:   20,) :SizedBox(width: 60,),

                                                  Expanded(
                                                    child: CustomText(
                                                      text: 'People Involved'.tr(),
                                                      size: 14,
                                                      color: Colors.black,
                                                      weight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Expanded(child: CustomText(text: '${provider
                                                      .dialogData['data']['contract']['people_involved']['first_name']??" "
                                                      ""} ${provider
                                                      .dialogData['data']['contract']['people_involved']['last_name']??" "
                                                      ""}',
                                                    size: 12,)),
                                                ],
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                              ),
                                              SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Responsive.isMobile(context)?SizedBox(width:   20,) :SizedBox(width: 60,),

                                                  Expanded(
                                                    child: CustomText(
                                                      text: 'Description'.tr(),
                                                      size: 14,
                                                      color: Colors.black,
                                                      weight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Expanded(child: CustomText(text:'${provider
                                                      .dialogData['data']['contract']['contract_description']??" "}',size: 12,lines: 50,overflows:
                                                  TextOverflow.visible,textAligns: TextAlign.start,)),
                                                ],
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              ),
                                            ],
                                          ):CustomText(text: "This design is not complete yet".tr())
                      ],
                    ),
                  ),
                ),
              ),
      );
    });
  }
}
