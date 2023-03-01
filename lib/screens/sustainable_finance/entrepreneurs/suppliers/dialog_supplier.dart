import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/suppliers/supplier_farm_search_widget.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../app_common_widgets/text_widget.dart';
import '../../../../models/entrepreneur/request/post_entrepreneur_supplier_request.dart';
import '../../../../providers/entrepreneur/entrepreneur_supplier_provider.dart';
import '../../../office/widgets/add_text_button_widget.dart';

class SupplierDialog extends StatefulWidget {
  final args;

  const SupplierDialog({
    Key? key,
    this.args,
  }) : super(key: key);

  @override
  State<SupplierDialog> createState() => _SupplierDialogState();
}

class _SupplierDialogState extends State<SupplierDialog> {
  TextEditingController fName = TextEditingController(), comment = TextEditingController(), relatedProject = TextEditingController();
  String contractPhone = '';

  @override
  void initState() {
    var provider = Provider.of<CreateNewEntreprenuerSupplierProvider>(context, listen: false);
    provider.mDateTimeTextController.text="";
    provider.getFarmsDropDownData();

    provider.mSupplierFarm.addListener(() {
      if (provider.mSupplierFarm.text.isNotEmpty) {
        provider.searchFarm(value: provider.mSupplierFarm.text);
        setState(() {
          provider.mShowFarmListWidget = true;
        });
      } else {
        setState(() {
          provider.mShowFarmListWidget = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    comment.dispose();
    relatedProject.dispose();
    // Provider.of<CreateNewEntreprenuerSupplierProvider>(context, listen: false).mDateTimeTextController.dispose();
  }

  String? kindContact = 'Yes'.tr();
  List<String> kindContactList = <String>[
    'Yes',
    'No',
  ];
  bool loading = false, isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateNewEntreprenuerSupplierProvider>(builder: (context, data, child) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomText(
                          text: "Add Supplier".tr(),
                          size: 17,
                          weight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          data.clearAllFeeilds();
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ])),
            content: loading
                ? SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: 150,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Farm Name ",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                                width:MediaQuery.of(context).size.width *0.32,
                              child: TextFormField(
                                controller: data.mSupplierFarm,
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
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(text: "Connected Since".tr()),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 45,
                              width: MediaQuery.of(context).size.width *0.32,
                              child: InkWell(
                                onTap: () {
                                  data.pickDate(context: context);
                                },
                                child: TextWidgetField(
                                  textPadding: EdgeInsets.only(top: 10, left: 15),
                                  controller: data.mDateTimeTextController,
                                  enabled: false,
                                  suffixIcon: const Icon(Icons.calendar_today),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            isEmpty && data.mDateTimeTextController.text.isEmpty
                                ? CustomText(
                                    text: "Date can't be empty",
                                    size: 11,
                                    color: Colors.red,
                                  )
                                : SizedBox.shrink(),
                            const SizedBox(height: 10),
                            /*  const CustomText(text: "Phone Number"),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 70,
                                child: IntlPhoneField(
                                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                  textAlignVertical: TextAlignVertical.center,
                                  textAlign: TextAlign.start,
                                  initialValue: contractPhone,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    // contentPadding: EdgeInsets.only(top: 15),
                                    labelText: 'Phone Number',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  initialCountryCode: 'PK',
                                  onCountryChanged: (value) {
                                    setState(() {
                                      contractPhone = '';
                                    });
                                  },
                                  onChanged: (phone) {
                                    setState(() {
                                      contractPhone = phone.number;
                                    });
                                    print(contractPhone);
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),*/
                            CustomText(text: "Wij.land active in relationship".tr()),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 45,
                              width: MediaQuery.of(context).size.width *0.32,
                              child: RealDropDownWidget(
                                value: kindContact,
                                onChanged: (newValue) {
                                  setState(() {
                                    kindContact = newValue;
                                  });
                                },
                                items: kindContactList.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(value: value, child: Text(value.tr(),style: TextStyle(fontFamily: Montserrat_Medium)
                                    ,));
                                }).toList(),
                              ),
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                          ],
                        ),
                        Positioned(
                          top: 80,
                          width: MediaQuery.of(context).size.width * 0.32,
                          height: 165,
                          child: data.mShowFarmListWidget
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 1),
                                  child: SearchSupplierFarmWidget(mIsTaskFarmSearch: false),
                                )
                              : SizedBox.shrink(),
                        )
                      ],
                    ),
                  ),
            actions: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: AddTextButtonWidget(
                  text: "Add Supplier".tr(),
                  colors: shineYellow,
                  onPress: data.mDateTimeTextController.value.text.isEmpty
                      ? () {
                          isEmpty = true;
                          setState(() {});
                        }
                      : () async {
                          setState(() {
                            loading = true;
                          });
                          String date = data.mDateTimeTextController.text;
                          String newdate = '${date.split('-')[2]}-${date.split('-')[1]}-${date.split('-')[0]}';
                          PostEntrepreneurSupplierRequest _request = PostEntrepreneurSupplierRequest(
                              farmId: int.tryParse(data.selectFarmID),
                              wiRelationType: kindContact!,
                              connectSince: data.mDateTimeTextController.text,
                              phoneNumber: contractPhone);
                          await data.createNewSupplier(context, _request, widget.args);
                          setState(() {
                            data.getAllSupplier(
                              entreprenuerId: widget.args,
                            );
                          });
                          data.clearAllFeeilds();
                          Navigator.of(context).pop();
                        },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
