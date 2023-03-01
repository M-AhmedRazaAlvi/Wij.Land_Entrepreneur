import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/entrepreneur/entrepreneur_contact_moment_provider.dart';
import '../../../../utils/styles.dart';

class SearchProjectsDropDownWidget extends StatefulWidget {
  const SearchProjectsDropDownWidget({Key? key}) : super(key: key);

  @override
  State<SearchProjectsDropDownWidget> createState() =>
      _SearchProjectsDropDownWidgetState();
}

class _SearchProjectsDropDownWidgetState
    extends State<SearchProjectsDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurContactMomentScreenProvider>(
      builder: (context, _provider, widget) {
        return Card(
          color: Colors.white,
          elevation: 12,
          child: _provider.mProjectSearchedList.isEmpty
              ? SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text("No Data Found!".tr(),style: TextStyle(fontFamily: Montserrat_Medium),),
                  ),
                )
              : Column(
                  children: _provider.mProjectSearchedList.map((e) {
                    var index = _provider.mProjectSearchedList.indexOf(e);
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
                            _provider.mProjectSearchController.text =
                                _provider.mProjectSearchedList[index].name!;
                            _provider.mShowProjectListWidget = false;
                          },
                        );
                      },
                    );
                  }).toList(),
                ),
        );
      },
    );
  }
}
