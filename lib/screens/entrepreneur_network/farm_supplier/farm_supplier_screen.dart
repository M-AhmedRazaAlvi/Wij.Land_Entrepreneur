


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:wij_land/providers/entrepreneur/farm_supplier_provider.dart';
import 'package:wij_land/utils/images.dart';

import '../../../app_common_widgets/large_screen.dart';
import '../../../utils/hex_color.dart';
import '../../../utils/responsive.dart';
import '../../../utils/styles.dart';
import 'farm_supplier_large_screen.dart';
import 'farm_supplier_small_screen.dart';

class FarmSupplierScreen extends StatefulWidget {
  const FarmSupplierScreen({Key? key}) : super(key: key);

  @override
  State<FarmSupplierScreen> createState() => _FarmSupplierScreenState();
}

class _FarmSupplierScreenState extends State<FarmSupplierScreen> {
  bool isDevelop=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initData();
  }
  initData()async{
   await  Provider.of<GetFarmSupplier>(context,listen: false).getFarmSupplier();

  }

  @override
  Widget build(BuildContext context) {
    return !showLoading.value? Center(
      child:Center(child: CircularProgressIndicator(),),
    ): Consumer<GetFarmSupplier>(
      builder: (context,_provider,child) {
        return Title(
           title: "Farm Suppliers".tr(),
          color: Colors.black,
          child: VisibilityDetector(
            key:  Key('FarmSupplierScreen-key'),
            onVisibilityChanged: (VisibilityInfo visibilityInfo) {
              var visiblePercentage = visibilityInfo.visibleFraction * 100;
              if (visiblePercentage > 50) {
                global_entitiy.value = [
                  Text(
                    'Farm Suppliers'.tr(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: darkRed),
                  ),
                ];
              }
            },
            child: Scaffold(
              backgroundColor: HexColor("#F3F6F9"),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Responsive.isDesktop(context)
                    ? FarmSupplierSmallScreen(response: _provider.farmSupplierResponse,)
                    : FarmSupplierLargeScreen(response: _provider.farmSupplierResponse,),
              ),
            ),
          ),
        );
      }
    );
  }
}
