import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/entrepreneur/entrepreneur_contact_moment_provider.dart';
import '../../../../utils/styles.dart';

class SearchAttendeesDropDownWidget extends StatefulWidget {
  const SearchAttendeesDropDownWidget({Key? key}) : super(key: key);

  @override
  State<SearchAttendeesDropDownWidget> createState() =>
      _SearchAttendeesDropDownWidgetState();
}

class _SearchAttendeesDropDownWidgetState
    extends State<SearchAttendeesDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurContactMomentScreenProvider>(
      builder: (context, _provider, widget) {
        return Card(
          color: Colors.white,
          elevation: 12,
          child: _provider.mAttendeesSearchedList.isEmpty
              ? SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text("No Data Found!".tr(),style: TextStyle( fontFamily: Montserrat_Medium,),),
                  ),
                )
              : Column(
                  children: _provider.mAttendeesSearchedList.map((e) {
                    var index = _provider.mAttendeesSearchedList.indexOf(e);
                    return ListTile(
                      title: Text(
                        _provider.mAttendeesSearchedList[index].name!,
                        style: TextStyle( fontFamily: Montserrat_Medium,),
                      ),
                      onTap: () {
                        if (_provider.mAttendeesSelectedList.isEmpty) {
                          setState(() {
                            _provider.mAttendeesSelectedList
                                .add(_provider.mAttendeesSearchedList[index]);
                            _provider.mAttendeesSearchController.clear();
                            _provider.mShowAttendeeListWidget = false;
                          });
                        } else {
                          bool valueMatched = false;
                          for (var i = 0;
                              i < _provider.mAttendeesSelectedList.length;
                              i++) {
                            if (_provider.mAttendeesSelectedList[i].id
                                    .toString() ==
                                _provider.mAttendeesSearchedList[index].id
                                    .toString()) {
                              print(
                                  "Searched Id : ${_provider.mAttendeesSearchedList[index].id}");
                              print(
                                  "Selected Id : ${_provider.mAttendeesSelectedList[i].id}");
                              setState(() {
                                valueMatched = true;
                              });
                            } else {}
                          }
                          if (valueMatched == false) {
                            _provider.mAttendeesSelectedList
                                .add(_provider.mAttendeesSearchedList[index]);
                            setState(() {});
                          }
                          setState(() {
                            _provider.mShowAttendeeListWidget = false;
                            _provider.mAttendeesSearchController.clear();
                          });
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
