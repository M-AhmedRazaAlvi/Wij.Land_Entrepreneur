import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/non_admin/providers/dashobard_provider/main_dashboard_provider.dart';

import '../../../../utils/styles.dart';

class FarmBusinessTypeSearch extends StatefulWidget {
  const FarmBusinessTypeSearch({Key? key}) : super(key: key);

  @override
  State<FarmBusinessTypeSearch> createState() => _FarmBusinessTypeSearchState();
}

class _FarmBusinessTypeSearchState extends State<FarmBusinessTypeSearch> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainFCDashboardProvider>(
      builder:(context,_provider,child){
        return Card(
          color: Colors.white,
          elevation: 12,
          child: SizedBox(
            height: 400,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 12,
                itemBuilder: (context, index) {
              return ListTile(
                title: Text('data'.tr(), style: TextStyle(fontFamily: Montserrat_Medium),),
                onTap: (){

                },
              );
            })),
        );
      }
    );
  }
}
