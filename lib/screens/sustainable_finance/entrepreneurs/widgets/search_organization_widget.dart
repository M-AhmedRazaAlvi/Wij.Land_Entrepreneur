import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/entrepreneur/entrepreneur_screen_provider.dart';
import '../../../../utils/styles.dart';

class SearchOrganizationWidget extends StatefulWidget {
  const SearchOrganizationWidget({Key? key}) : super(key: key);

  @override
  State<SearchOrganizationWidget> createState() => _SearchOrganizationWidgetState();
}

class _SearchOrganizationWidgetState extends State<SearchOrganizationWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurScreenProvider>(
      builder: (context, _provider, widget) {
        return Card(
          color: Colors.white,
          elevation: 12,
          child: SizedBox(
            height: 200,
            width: double.infinity,
            child: _provider.mOrganizationsSearchedList.isEmpty
                ? Center(
                    child: Text('Result not found with this search query'.tr(),style: TextStyle(
                        fontFamily: Montserrat_Medium,
                        color: Colors.red,fontSize: 11),),
                  )
                : ListView.builder(
                    itemCount: _provider.mOrganizationsSearchedList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          _provider.mOrganizationsSearchedList[index].name!,
                          style: TextStyle(fontSize: 14,fontFamily: Montserrat_Medium),
                        ),
                        onTap: () {
                          setState(
                            () {
                              _provider.updateOrganizationModel(
                                model: _provider.mOrganizationsSearchedList[index],
                              );
                              _provider.mOrganizationController.text = _provider.mOrganizationsSearchedList[index].name!;
                              _provider.mShowOrganizationSearchWidget = false;
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
