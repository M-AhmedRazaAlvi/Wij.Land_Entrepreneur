import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/entrepreneur/entrepreneur_contact_moment_provider.dart';
import '../../../../utils/styles.dart';

class SearchFarmDropDownWidget extends StatefulWidget {
  final bool mIsTaskFarmSearch;

  const SearchFarmDropDownWidget({Key? key, required this.mIsTaskFarmSearch})
      : super(key: key);

  @override
  State<SearchFarmDropDownWidget> createState() =>
      _SearchFarmDropDownWidgetState();
}

class _SearchFarmDropDownWidgetState extends State<SearchFarmDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurContactMomentScreenProvider>(
      builder: (context, _provider, widget) {
        return Card(
          color: Colors.white,
          elevation: 12,
          child: _provider.mFarmSearchedList.isEmpty
              ? SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text("No Data Found!".tr(),style: TextStyle( fontFamily: Montserrat_Medium,),),
                  ),
                )
              : Column(
                  children: _provider.mFarmSearchedList.map((e) {
                    var index = _provider.mFarmSearchedList.indexOf(e);
                    return ListTile(
                      title: Text(
                        _provider.mFarmSearchedList[index].name!,
                        style: TextStyle( fontFamily: Montserrat_Medium,),
                      ),
                      onTap: () {
                        print(
                            "ID In DROP DOwn :::::::::::::::::::::: ${_provider.mFarmSearchedList[index].id!}");
                        _provider.updateFarmID(
                          id: _provider.mFarmSearchedList[index].id!,
                          isTaskId:
                              this.widget.mIsTaskFarmSearch ? true : false,
                        );
                        if (this.widget.mIsTaskFarmSearch) {
                          setState(
                            () {
                              _provider.mFarmSearchController.text =
                                  _provider.mFarmSearchedList[index].name!;
                              _provider.mShowFarmListWidget = false;
                            },
                          );
                        } else {
                          setState(
                            () {
                              _provider.mContactFarmSearchController.text =
                                  _provider.mFarmSearchedList[index].name!;
                              _provider.mShowFarmListWidget = false;
                            },
                          );
                        }
                      },
                    );
                  }).toList(),
                ),
        );
      },
    );
  }
}
