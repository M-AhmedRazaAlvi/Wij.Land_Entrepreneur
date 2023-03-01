import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/entrepreneur/entrepreneur_contact_moment_provider.dart';
import '../../../../utils/styles.dart';

class SearchPersonDropDownWidget extends StatefulWidget {
  const SearchPersonDropDownWidget({Key? key}) : super(key: key);

  @override
  State<SearchPersonDropDownWidget> createState() =>
      _SearchPersonDropDownWidgetState();
}

class _SearchPersonDropDownWidgetState
    extends State<SearchPersonDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurContactMomentScreenProvider>(
      builder: (context, _provider, widget) {
        return Card(
          color: Colors.white,
          elevation: 12,
          child: SizedBox(
            height: 400,
            width: double.infinity,
            child: ListView.builder(
                itemCount: _provider.mPersonSearchedList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _provider.mPersonSearchedList[index].name!,
                      style: TextStyle(fontFamily: Montserrat_Medium,),
                    ),
                    onTap: () {
                      print(
                          "ID In DROP DOwn :::::::::::::::::::::: ${_provider.mPersonSearchedList[index].id!}");
                      _provider.updatePersonID(
                          id: _provider.mPersonSearchedList[index].id!);
                      setState(
                        () {
                          _provider.mPersonSearchController.text =
                              _provider.mPersonSearchedList[index].name!;
                          _provider.mShowPersonsListWidget = false;
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
