import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/models/entrepreneur/request/put_entrepreneur_supplier_request.dart';
import 'package:wij_land/providers/entrepreneur/entrepreneur_supplier_provider.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../app_common_widgets/text_widget.dart';
import '../../../../models/entrepreneur/request/put_entrepreneur_supplier_bulk_request.dart';
import '../../../../utils/styles.dart';
import '../../../office/widgets/add_text_button_widget.dart';

class EditSupplierDialog extends StatefulWidget {
  final args;
  final supplierid;
  String? connectSince;
  String? farmId, farmName;
  String? phone;
  String? wiRelationType;
  bool? isAllEditSupplier;

  EditSupplierDialog(
      {Key? key,
      this.args,
      this.connectSince,
      this.farmId,
      this.farmName,
      this.wiRelationType,
      this.supplierid,
      required this.isAllEditSupplier,
      required this.phone})
      : super(key: key);

  @override
  State<EditSupplierDialog> createState() => _EditSupplierDialogState();
}

class _EditSupplierDialogState extends State<EditSupplierDialog> {
  final TextEditingController fName = TextEditingController(), comment = TextEditingController(), relatedProject = TextEditingController();
  String contractPhone = '';
  bool isEmpty = false;

  @override
  void dispose() {
    super.dispose();

    comment.dispose();
    relatedProject.dispose();
     // Provider.of<CreateNewEntreprenuerSupplierProvider>(context,listen: false).mDateTimeTextController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    relatedProject.text = widget.farmName ?? '';
    Provider.of<CreateNewEntreprenuerSupplierProvider>(context, listen: false).mDateTimeTextController.text = widget.connectSince!;
    contractPhone = widget.phone!;
    kindContact = widget.wiRelationType == "Yes" ? "Yes" : "No";

    setState(() {

    });
  }

  String? kindContact = 'Yes'.tr();
  List<String> kindContactList = <String>[
    'Yes',
    'No',
  ];
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateNewEntreprenuerSupplierProvider>(builder: (context, data, child) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: AlertDialog(
            title: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomText(
                          text: "Edit Supplier".tr(),
                          size: 30,
                          weight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 30,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                         CustomText(
                          text: "Farm Name".tr(),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextWidgetField(
                          textPadding: EdgeInsets.only(top: 10, left: 15),

                          controller: relatedProject,
                          enabled: false,
                          suffixIcon: const Icon(Icons.search),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomText(text: "Connected Since".tr()),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
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
                        SizedBox(
                          height: 2,
                        ),
                        isEmpty && data.mDateTimeTextController.text.isEmpty
                            ? CustomText(
                                text: "Date can't be empty".tr(),
                                size: 11,
                                color: Colors.red,
                              )
                            : SizedBox.shrink(),
                        const SizedBox(height: 15),
                        // const CustomText(text: "Phone Number"),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        // IntlPhoneField(
                        //   inputFormatters: <TextInputFormatter>[
                        //     FilteringTextInputFormatter.digitsOnly
                        //   ],
                        //   initialValue: contractPhone,
                        //   keyboardType: TextInputType.number,
                        //   decoration: InputDecoration(
                        //     labelText: 'Phone Number',
                        //     border: OutlineInputBorder(
                        //       borderSide: BorderSide(),
                        //     ),
                        //   ),
                        //   initialCountryCode: 'PK',
                        //   onCountryChanged: (value) {
                        //     setState(() {
                        //       contractPhone = '';
                        //     });
                        //   },
                        //   onChanged: (phone) {
                        //     setState(() {
                        //       contractPhone = phone.number;
                        //     });
                        //     print(phone.completeNumber);
                        //   },
                        // ),
                        const SizedBox(height: 15),
                        CustomText(text: "Wij.land active in relationship".tr()),
                        const SizedBox(
                          height: 15,
                        ),
                        RealDropDownWidget(
                          value: kindContact,
                          onChanged: (newValue) {
                            setState(() {
                              kindContact = newValue;
                            });
                          },
                          items: kindContactList.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(value: value, child: Text(value.tr(), style: TextStyle(fontFamily: Montserrat_Medium),));
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
            actions: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: AddTextButtonWidget(
                  text: "Edit Supplier".tr(),
                  colors: Colors.yellow,
                  onPress: data.mDateTimeTextController.value.text.isEmpty
                      ? () {
                          isEmpty = true;
                          setState(() {});
                        }
                      // : contractPhone.length != 10
                      //     ? null
                      : () async {
                          setState(() {
                            loading = true;
                          });
                          String date = data.mDateTimeTextController.text;
                          String newdate = '${date.split('-')[2]}-${date.split('-')[1]}-${date.split('-')[0]}';
                          if (widget.isAllEditSupplier!) {
                            PutEntrepreneurSupplierBulkRequest _request = PutEntrepreneurSupplierBulkRequest(
                              wiRelationType: kindContact!,
                              connectSince: data.mDateTimeTextController.text,
                              suppliersIds: widget.supplierid,
                            );
                            await data.updateBulkSupplier(_request, widget.args, 0);
                            setState(() {
                              data.allCheckedBoxId=[];
                              data.multipleIndex=[];

                              data.getAllSupplier(entreprenuerId: widget.args);
                              loading = false;
                            });
                            Navigator.of(context).pop();
                          } else {
                            PutEntrepreneurSupplierRequest _request = PutEntrepreneurSupplierRequest(
                                farmId: widget.farmId!,
                                wiRelationType: kindContact!,
                                connectSince: data.mDateTimeTextController.text,
                                phoneNum: contractPhone);
                            await data.updateSupplier(
                              _request,
                              widget.args,
                              widget.supplierid,
                            );
                            setState(() {
                              data.allCheckedBoxId=[];
                              data.multipleIndex=[];
                                data.getAllSupplier(entreprenuerId: widget.args);
                              loading = false;
                            });
                            Navigator.of(context).pop();
                          }

                          loading = false;
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
