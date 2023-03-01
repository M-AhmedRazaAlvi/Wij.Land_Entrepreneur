import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/entrepreneur/entrepreneur_screen_provider.dart';
import '../../../../utils/styles.dart';

class SearchProjectsWidget extends StatefulWidget {
  const SearchProjectsWidget({Key? key}) : super(key: key);

  @override
  State<SearchProjectsWidget> createState() => _SearchProjectsWidgetState();
}

class _SearchProjectsWidgetState extends State<SearchProjectsWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurScreenProvider>(
      builder: (context, _provider, widget) {
        return Card(
          color: Colors.white,
          elevation: 12,
          child: SizedBox(
            height: 400,
            width: double.infinity,
            child: ListView.builder(
                itemCount: _provider.mProjectSearchedList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(

                      _provider.mProjectSearchedList[index].name!,
                      style: TextStyle(fontFamily: Montserrat_Medium),
                    ),
                    onTap: () {
                      print(
                          "ID In DROP DOwn :::::::::::::::::::::: ${_provider.mProjectSearchedList[index].id!}");
                      _provider.updateProjectID(
                          id: _provider.mProjectSearchedList[index].id!);
                      setState(
                        () {
                          _provider.mProjectController.text =
                              _provider.mProjectSearchedList[index].name!;
                          _provider.mShowProjectListWidget = false;
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
