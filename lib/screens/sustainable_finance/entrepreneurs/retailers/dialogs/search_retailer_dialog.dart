import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/screens/office/widgets/add_text_button_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/retailers/dialogs/search_retailer_widget.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../providers/entrepreneur/entrepreneur_retailer_provider.dart';

EntrepreneurRetailerProvider?  retailerProvider;

class SearchRetailerDialogWidget extends StatefulWidget {
final  int? entrepreneurId;
  const SearchRetailerDialogWidget({Key? key,required this.entrepreneurId}) : super(key: key);

  @override
  State<SearchRetailerDialogWidget> createState() => _SearchRetailerDialogWidgetState();
}

class _SearchRetailerDialogWidgetState extends State<SearchRetailerDialogWidget> {
  @override
  void initState() {
    // TODO: implement initState
      dropDown();
    var mProvider = Provider.of<EntrepreneurRetailerProvider>(context, listen: false);

    mProvider.mRetailerSearchController.addListener(() {
      if (mProvider.mRetailerSearchController.text.isNotEmpty) {
        mProvider.searchRetailer(value: mProvider.mRetailerSearchController.text);
        setState(() {
          mProvider.mSearchRetailerList = true;
        });
      } else {
        setState(() {
          mProvider.mSearchRetailerList = false;
        });
      }
    });

    super.initState();
  }
  dropDown()async{
    retailerProvider = Provider.of<EntrepreneurRetailerProvider>(context,listen: false);
    await retailerProvider!.getRetailerData(id:widget.entrepreneurId!);
    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurRetailerProvider>(
      builder: (BuildContext context, _provider, Widget? child) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: AlertDialog(
            title: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomText(
                          text: "Add Retailer".tr(),
                          size: 20,
                          weight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {

                          _provider.mRetailerSearchController.text="";
                          _provider.mSearchedRetailerId = 0;
                          setState(() {

                          });
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            content: Container(
              width: MediaQuery.of(context).size.width * 0.35,
              height: _provider.mRetailerSearchController.value.text.isEmpty ||_provider.mSearchedRetailerId!=0? 90:getHeight(context),

              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Retailer Name".tr(),
                        size: 13,
                        weight: FontWeight.w300,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _provider.mRetailerSearchController,
                        cursorColor: Colors.black,
                        cursorWidth: 1,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.black26,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Colors.black26,
                                width: 0.5,
                              ),
                            ),
                            suffixIcon: Icon(Icons.search)),
                      ),
                    ],
                  ),
                  _provider.mSearchRetailerList
                      ? Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: SearchRetailerWidget(),
                        )
                      : SizedBox()
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),

                child: AddTextButtonWidget(
                    text: 'Add Retailer'.tr(),
                    colors: yellowishGreen,
                    onPress: ()async {

                      if (_provider.mSearchedRetailerId == 0) {
                        showSnack( "Retailer is required!");
                        return;
                      }
                      Map<String,dynamic> object ={
                        "retailer_id":_provider.mSearchedRetailerId,
                      };
                      await _provider.postEntrepreneurRetailerData(entrepreneurId: widget.entrepreneurId, requestBody: object);

                      _provider.mRetailerSearchController.text="";
                      _provider.mSearchedRetailerId = 0;
                      Navigator.of(context).pop();
                    }),
              )
            ],
          ),
        );
      },
    );
  }
}
