


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/providers/entrepreneur/entrepreneur_retailer_provider.dart';
import 'package:wij_land/utils/styles.dart';

class SearchRetailerWidget extends StatefulWidget {
  const SearchRetailerWidget({Key? key}) : super(key: key);

  @override
  State<SearchRetailerWidget> createState() => _SearchRetailerWidgetState();
}

class _SearchRetailerWidgetState extends State<SearchRetailerWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurRetailerProvider>(
      builder: (BuildContext context, _provider, Widget? child) {
        return  Card(
          color: Colors.white,
          elevation: 12,
          child: SizedBox(
            height: 400,
            width: double.infinity,
            child: ListView.builder(
                itemCount: _provider.mRetailerSearchList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _provider.mRetailerSearchList[index].name!,
                      style: TextStyle(fontFamily: Montserrat_Medium),
                    ),
                    onTap: () {
                      debugPrint(
                          "ID In DROP DOwn :::::::::::::::::::::: ${_provider.mRetailerSearchList[index].id!}");
                      _provider.updateRetailerID(
                          id: _provider.mRetailerSearchList[index].id!);
                      setState(
                            () {
                          _provider.mRetailerSearchController.text =
                          _provider.mRetailerSearchList[index].name!;
                          _provider.mSearchRetailerList = false;
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
