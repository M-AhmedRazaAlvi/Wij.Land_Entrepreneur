


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../../../api_clients/entrepreneur_client.dart';
import '../../../../../providers/entrepreneur/entrepreneur_retailer_provider.dart';
import '../../../../office/widgets/add_text_button_widget.dart';

class DeleteRetailerDialog extends StatefulWidget {
final int? entrepreneurId,index;
final List? multipleIndex,allCheckedBoxId;
final int? retailerId;
final bool?allValue,singleId;
  const DeleteRetailerDialog({Key? key, this.entrepreneurId, this.multipleIndex, this.retailerId, this.allCheckedBoxId, this.allValue, this.singleId, this.index}) : super(key: key);

  @override
  State<DeleteRetailerDialog> createState() => _DeleteRetailerDialogState();
}

class _DeleteRetailerDialogState extends State<DeleteRetailerDialog> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurRetailerProvider>(builder: (BuildContext context, provider, Widget? child) {
      return AlertDialog(
        content: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Text("Are you sure you want to Delete".tr(),style: TextStyle( fontFamily: Montserrat_Medium,
          ),),
        ),
        actions: [
          AddTextButtonWidget(
            text: "Sure".tr(),
            colors: yellowishGreen,
            onPress: () async {
              if (widget.allValue == false) {
                if (widget.singleId == true) {
                  print("Single Selected======================================");
                  await EntrepreneurClients.deleteEntrepreneurRetailer(
                    mEntrepreneurID: widget.entrepreneurId!,
                    retailerId: widget.retailerId,
                    isBulkDelete: false,
                  );
                  provider.entrepreneurModel!.data!.remove(widget.retailerId);
                  setState(() {
                    Provider.of<EntrepreneurRetailerProvider>(context, listen: false).getEntrepreneurRetailerData(
                      entrepreneurId: widget.entrepreneurId!,
                    );
                  });
                  provider.getcheckedBool[widget.multipleIndex!.length] = false;
                  Navigator.of(context).pop('yes');
                } else {
                  if (widget.allCheckedBoxId!.isNotEmpty) {
                    print("Multiple selected data==========${widget.allCheckedBoxId!}");
                    await EntrepreneurClients.deleteEntrepreneurRetailer(
                      mEntrepreneurID: widget.entrepreneurId,
                      retailerId: widget.allCheckedBoxId!,
                      isBulkDelete: true,
                    );
                    Provider.of<EntrepreneurRetailerProvider>(context, listen: false)
                        .getEntrepreneurRetailerData(entrepreneurId: widget.entrepreneurId!);
                    provider.getcheckedBool[widget.multipleIndex!.length] = false;
                    Navigator.of(context).pop('yes');

                  }


                  print("empty  data======================================");
                }
              } else {
                print("All Selected======================================");
                await EntrepreneurClients.deleteEntrepreneurRetailer(
                  mEntrepreneurID: widget.entrepreneurId!,
                  retailerId: widget.allCheckedBoxId!,
                  isBulkDelete: true,
                );
                Navigator.of(context).pop('yes');

                setState(() {
                  Provider.of<EntrepreneurRetailerProvider>(context, listen: false).getEntrepreneurRetailerData(
                    entrepreneurId: widget.entrepreneurId!,
                  );
                });
                provider.getcheckedBool[widget.multipleIndex!.length] = false;
              }
            },
          ),
          AddTextButtonWidget(
            text: "Cancel".tr(),
            colors: dimMetalic3,
            onPress: () {
              Navigator.of(context,).pop('yes');
            },
          ),
        ],
      );

    },
    );
  }
}
