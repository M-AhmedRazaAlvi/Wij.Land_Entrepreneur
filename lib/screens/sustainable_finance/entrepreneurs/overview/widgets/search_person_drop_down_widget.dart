import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/entrepreneur/entrepreneur_screen_overview_provider.dart';
import '../../../../../utils/styles.dart';

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
    return Consumer<EntrepreneurOverviewScreenProvider>(
      builder: (context, _provider, widget) {
        return Card(
          color: Colors.white,
          elevation: 12,
          child: SizedBox(
            height: 400,
            width: double.infinity,
            child: ListView.builder(
                itemCount: _provider.mOrgPersonSearchedList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _provider.mOrgPersonSearchedList[index].personName!,
                      style: TextStyle(fontFamily: Montserrat_Medium,),
                    ),
                    onTap: () {
                      _provider.updatePersonID(
                          id: _provider.mOrgPersonSearchedList[index].id!);
                      setState(
                        () {
                          _provider.mPersonSearchController.text = _provider.mOrgPersonSearchedList[index].personName!;

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
