import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/providers/entrepreneur/entrepreneur_supplier_provider.dart';

import '../../../../utils/styles.dart';

class SearchSupplierFarmWidget extends StatefulWidget {
  final bool mIsTaskFarmSearch;

  const SearchSupplierFarmWidget({Key? key, required this.mIsTaskFarmSearch})
      : super(key: key);

  @override
  State<SearchSupplierFarmWidget> createState() =>
      _SearchSupplierFarmWidgetState();
}

class _SearchSupplierFarmWidgetState extends State<SearchSupplierFarmWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CreateNewEntreprenuerSupplierProvider>(
      builder: (context, _provider, widget) {
        return Card(
          color: Colors.white,
          elevation: 12,
          child: SizedBox(
            height: 400,
            width: double.infinity,
            child: ListView.builder(
                itemCount: _provider.mFarmSearchedList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _provider.mFarmSearchedList[index].name!,
                      style: TextStyle(fontFamily: Montserrat_Medium),
                    ),
                    onTap: () {
                      print(
                          "ID In DROP DOwn :::::::::::::::::::::: ${_provider.mFarmSearchedList[index].id!}");
                      _provider.updateFarmID(
                        id: _provider.mFarmSearchedList[index].id!,
                        isTaskId: this.widget.mIsTaskFarmSearch ? true : false,
                      );
                      if (this.widget.mIsTaskFarmSearch) {
                        setState(
                          () {
                            _provider.mSupplierFarm.text =
                                _provider.mFarmSearchedList[index].name!;
                            _provider.mShowFarmListWidget = false;
                          },
                        );
                      } else {
                        setState(
                          () {
                            _provider.mSupplierFarm.text =
                                _provider.mFarmSearchedList[index].name!;
                            _provider.mShowFarmListWidget = false;
                          },
                        );
                      }
                    },
                  );
                }),
          ),
        );
      },
    );
  }
}
