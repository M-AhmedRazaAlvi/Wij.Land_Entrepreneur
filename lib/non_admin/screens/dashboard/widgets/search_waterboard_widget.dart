import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/non_admin/providers/dashobard_provider/main_dashboard_provider.dart';
import 'package:wij_land/utils/functions.dart';

import '../../../../utils/styles.dart';

class SearchWaterBoardWidget extends StatefulWidget {
  const SearchWaterBoardWidget({Key? key}) : super(key: key);

  @override
  State<SearchWaterBoardWidget> createState() => _SearchWaterBoardWidgetState();
}

class _SearchWaterBoardWidgetState extends State<SearchWaterBoardWidget> {
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
                itemCount: _provider.mWaterBoardList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _provider.mWaterBoardList[index],style: TextStyle(fontFamily: Montserrat_Medium),
                    ),
                    onTap: () {
                      print(
                          "ID In water DROP DOwn :::::::::::::::::::::: ${_provider.mWaterBoardList[index]}");
                      /*_provider.updateProjectID(
                          id: _provider.mProjectSearchedList[index].id!);*/
                      setState(
                        () {
                          _provider.mWaterBoardController.text =
                              _provider.mWaterBoardList[index];
                          _provider.mWaterBoardWidget = false;
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
