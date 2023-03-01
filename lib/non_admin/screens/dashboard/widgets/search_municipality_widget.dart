import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/non_admin/providers/dashobard_provider/main_dashboard_provider.dart';
import 'package:wij_land/utils/functions.dart';

import '../../../../utils/styles.dart';

class SearchMunicipalityWidget extends StatefulWidget {
  const SearchMunicipalityWidget({Key? key}) : super(key: key);

  @override
  State<SearchMunicipalityWidget> createState() =>
      _SearchMunicipalityWidgetState();
}

class _SearchMunicipalityWidgetState extends State<SearchMunicipalityWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainFCDashboardProvider>(
      builder: (context, _provider, widget) {
        return Card(
          color: Colors.white,
          elevation: 12,
          child: SizedBox(
            height: 250,
            width: getWidth(context) * 0.25,
            child: ListView.builder(
                itemCount: _provider.mMunicipalityList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _provider.mMunicipalityList[index],style: TextStyle(fontFamily: Montserrat_Medium),
                    ),
                    onTap: () {
                      print(
                          "ID In DROP DOwn :::::::::::::::::::::: ${_provider.mMunicipalityList[index]}");
                      /*_provider.updateProjectID(
                          id: _provider.mProjectSearchedList[index].id!);*/
                      setState(
                        () {
                          _provider.mMunicipalityController.text =
                              _provider.mMunicipalityList[index];
                          _provider.mMunicipalityWidget = false;
                        },
                      );
                    },
                  );
                }),
          ),
        );
      },
    );
  }
}
