import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/api_clients/entrepreneur_client.dart';
import 'package:wij_land/app_common_widgets/on_hover.dart';
import 'package:wij_land/app_common_widgets/text_widget.dart';
import 'package:wij_land/models/entrepreneur/response/get_entrepreneure_supplier_response.dart';
import 'package:wij_land/non_admin/screens/project_dashboard/project_actions/widget/project_action_search_widget.dart';
import 'package:wij_land/providers/entrepreneur/entrepreneur_screen_overview_provider.dart';
import 'package:wij_land/screens/office/widgets/add_text_button_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/suppliers/dialog_supplier.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/suppliers/edit_dialog.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/suppliers/map_info_supplier.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/suppliers/map_supplier_screen.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/suppliers/supplier_info.dart';

import '../../../../app_common_widgets/animated_search.dart';
import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/icon_text_container.dart';
import '../../../../providers/GlobalProvider/navigation/navigation_provider.dart';
import '../../../../providers/entrepreneur/entrepreneur_supplier_provider.dart';
import '../../../../utils/ShimmerEffect.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../../../utils/url_scheme.dart';
import '../../../office/office_programes/Widgets/on_hover_button_widget.dart';
import '../overview/widgets/overview_small_screen_widget.dart';

enum DeleteStatus {
  single,
  multiple,
  all,
}

class SupplierScreen extends StatefulWidget {
  final arguments;

  final GetEntrepreneurSupplierResponse? model;
  final int? id;

  const SupplierScreen({Key? key, this.arguments, this.model, this.id}) : super(key: key);

  @override
  State<SupplierScreen> createState() => _SupplierScreenState();
}

class _SupplierScreenState extends State<SupplierScreen> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    callFirstMethod();
  }

  callFirstMethod() async {
    mapDisalble();
    await Provider.of<CreateNewEntreprenuerSupplierProvider>(context, listen: false).getAllSupplier(
      entreprenuerId: widget.arguments,
    );
    isLoading = false;
  }

  mapDisalble() {
    Provider.of<EntrepreneurOverviewScreenProvider>(context, listen: false).mapOpened = false;
    setState(() {});
  }

  String? textController;

  late int supplierId;
  late int id;
  bool checkedAllList = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var provider = Provider.of<EntrepreneurOverviewScreenProvider>(context, listen: false);
    setState(() {
      checkedAllList = false;
      provider.allCheckedBoxId.clear();
    });
  }

  bool singleId = false, isFilter = false, mapfilter = false, isExpand = false;
  String? farmName;

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateNewEntreprenuerSupplierProvider>(builder: (context, _provider, child) {
      return Container(
        padding: EdgeInsets.only(right: Provider.of<EntrepreneurOverviewScreenProvider>(context).mapOpened ? getWidth(context) * 0.450 : 0),
        margin: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Card(
            // elevation: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: getWidth(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 40,
                              color: yellowishGreen,
                            ),
                            CustomText(
                              text: "Supplier".tr(),
                              color: darkGreen,
                              size: 24,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AnimatedSearchWidget(
                              onChangeValue: (value) {
                                setState(() {
                                  textController = value;
                                });
                              },
                              onSubmit: (values) async {
                                setState(() {
                                  isLoading = true;
                                });
                                await Provider.of<CreateNewEntreprenuerSupplierProvider>(context, listen: false)
                                    .getAllSupplier(entreprenuerId: widget.arguments, searchValue: values);
                                setState(() {
                                  isLoading = false;
                                });
                              },
                              onPress: () async {
                                await Provider.of<CreateNewEntreprenuerSupplierProvider>(context, listen: false)
                                    .getAllSupplier(entreprenuerId: widget.arguments);
                                setState(() {});
                              },
                            ),
                            OnHoverButtonWidget(
                              icons: Icons.filter_alt,
                              onTap: () {
                                isFilter = !isFilter;

                                if (!isFilter) {
                                  _provider.getAllSupplier(entreprenuerId: widget.arguments);
                                  _provider.startDate.text = 'From';
                                  _provider.endDate.text = 'To';
                                  setState(() {});
                                }
                                setState(() {});
                              },
                            ),
                            IconAndTextContainer(
                              addText: "Supplier".tr(),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SupplierDialog(args: widget.arguments);
                                    });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  isFilter
                      ? SizedBox(
                          height: 65,
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: getWidth(context),
                                height: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  // alignment: WrapAlignment.spaceBetween,
                                  // runSpacing: 2,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          _provider.pickStartDate(context: context);
                                        },
                                        child: Builder(
                                          builder: (context) => SizedBox(
                                            height: 50,
                                            width: 200,
                                            child: TextWidgetField(
                                              controller: _provider.startDate,
                                              hintText: "From".tr(),
                                              textPadding: EdgeInsets.only(top: 5, left: 10),
                                              enabled: false,
                                              suffixIcon: const Icon(
                                                Icons.calendar_today_outlined,
                                                size: 14,
                                              ),
                                            ),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          _provider.pickEndDate(context: context);
                                        },
                                        child: Builder(
                                          builder: (context) => SizedBox(
                                            height: 50,
                                            width: 200,
                                            child: TextWidgetField(
                                              controller: _provider.endDate,
                                              hintText: "To".tr(),
                                              textPadding: EdgeInsets.only(top: 5, left: 10),
                                              enabled: false,
                                              suffixIcon: const Icon(
                                                Icons.calendar_today_outlined,
                                                size: 14,
                                              ),
                                            ),
                                          ),
                                        )),
                                    Expanded(child: SizedBox.shrink()),
                                    AddTextButtonWidget(
                                      text: 'Clear'.tr(),
                                      colors: dimMetalic3,
                                      onPress: () async {
                                        _provider.startDate.text = "";
                                        _provider.endDate.text = "";
                                        await _provider.getAllSupplier(entreprenuerId: widget.arguments);
                                        setState(() {});
                                      },
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    AddTextButtonWidget(
                                      text: 'Apply'.tr(),
                                      colors: yellow,
                                      onPress: () async {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        String date1 = _provider.startDate.text;
                                        String startDate = '${date1.split('-')[2]}-${date1.split('-')[1]}-${date1.split('-')[0]}';
                                        String date2 = _provider.endDate.text;
                                        String endDate = '${date2.split('-')[2]}-${date2.split('-')[1]}-${date2.split('-')[0]}';
                                        await _provider.getAllSupplier(entreprenuerId: widget.arguments, from: startDate, to: endDate);
                                        setState(() {
                                          isLoading = false;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  SizedBox(
                    height: 10,
                  ),
                  Stack(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SupplierInfo(
                              isChecked: true,
                              farmName: "Farm Name".tr(),
                              farmRep: "Farm Rep.".tr(),
                              connectedSince: "Connected".tr(),
                              relationShip: "Wij.land in Relationship".tr(),
                              rePhone: "",
                              size: 14,
                              weight: FontWeight.bold,
                              width: Responsive.isMobile(context) ? getWidth(context) / 4 : getWidth(context) * 0.2,
                              value:_provider.getcheckedBool.contains(false)?checkedAllList=false:!_provider.getcheckedBool.contains(false)
                                  ?checkedAllList=true:checkedAllList,
                              onChanged: (value) {
                                setState(() {
                                  _provider.allCheckedBoxId.clear();
                                  if (checkedAllList == true) {
                                    checkedAllList = false;
                                    for (int i = 0; i < _provider.getSupplierResponse!.data!.length; i++) {
                                      _provider.getcheckedBool[i] = false;
                                    }
                                    _provider.allCheckedBoxId = [];
                                    _provider.multipleIndex = [];
                                  } else {
                                    checkedAllList = true;
                                    for (int i = 0; i < _provider.getSupplierResponse!.data!.length; i++) {
                                      _provider.getcheckedBool[i] = true;
                                      _provider.allCheckedBoxId.add(_provider.getSupplierResponse!.data![i].id!);
                                      _provider.multipleIndex.add(i);
                                      _provider.allCheckedBoxCSVId.add(_provider.getSupplierResponse!.data![i].organization!.id!);
                                    }
                                  }
                                });
                              },
                            ),
                            isLoading
                                ? Container(
                                    child: ListView.builder(
                                      itemBuilder: (c, i) {
                                        return Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: ShimmerEffect(
                                              child: Container(
                                            height: 80,
                                            width: double.infinity,
                                            color: Colors.blue,
                                          )),
                                        );
                                      },
                                      itemCount: 10,
                                    ),
                                    height: getHeight(context),
                                    width: getWidth(context),
                                  )
                                : _provider.getSupplierResponse!.status == 404
                                    ? SizedBox(
                                        height: getHeight(context),
                                        width: getWidth(context),
                                        child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Padding(
                                              padding: const EdgeInsets.all(25.0),
                                              child: CustomText(
                                                text: '${_provider.getSupplierResponse!.message}',
                                                color: Colors.red,
                                                weight: FontWeight.w700,
                                                size: 20,
                                              ),
                                            )),
                                      )
                                    : Column(
                                        children: [
                                          for (int i = 0; i < _provider.getSupplierResponse!.data!.length; i++)
                                            SupplierInfo(
                                              isChecked: true,
                                              width: Responsive.isMobile(context) ? getWidth(context) / 4 : getWidth(context) * 0.2,
                                              value: _provider.getcheckedBool[i],
                                              onChanged: (val) {

                                                setState(() {
                                                  if (_provider.getcheckedBool[i] == true) {
                                                    _provider.getcheckedBool[i] = false;
                                                    _provider.allCheckedBoxId.remove(_provider.getSupplierResponse!.data![i].id!);
                                                    _provider.  multipleIndex.remove(i);
                                                    _provider.allCheckedBoxCSVId.remove(_provider.getSupplierResponse!.data![i].organization!.id!);

                                                  } else {
                                                    _provider.getcheckedBool[i] = true;
                                                    farmName = _provider.getSupplierResponse!.data![i].farmAutoName ?? '';
                                                    if (!_provider.allCheckedBoxId.contains(_provider.getSupplierResponse!.data![i].id!)) {
                                                      _provider.allCheckedBoxId.add(_provider.getSupplierResponse!.data![i].id!);
                                                      _provider.allCheckedBoxCSVId.add(_provider.getSupplierResponse!.data![i].organization!.id!);
                                                      _provider. multipleIndex.add(i);
                                                    } else {
                                                      supplierId = _provider.getSupplierResponse!.data![i].id!;
                                                      id = i;
                                                      singleId = true;
                                                    }
                                                  }
                                                });
                                              },
                                              farmName: _provider.getSupplierResponse!.data![i].farmAutoName ?? " ",
                                              farmRep: _provider.getSupplierResponse!.data![i].farmRepresentativeName ?? "",
                                              connectedSince: _provider.getSupplierResponse!.data![i].connectSince ?? " ",
                                              relationShip: _provider.getSupplierResponse!.data![i].wiRelationType ?? " ",
                                              rePhone: /* responseData.getSupplierResponse!.data![i].phoneNum ?? "Null"*/ '',
                                              size: 14,
                                              weight: FontWeight.normal,
                                              onName: (){
                                                launchUrl('https://$gloal_base_path/farms/${_provider.getSupplierResponse!
                                                    .data![i].farmId}');
                                              },
                                              onTap: () async {
                                              /*  showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return EditSupplierDialog(
                                                      args: widget.arguments,
                                                      isAllEditSupplier: false,
                                                      supplierid: _provider.getSupplierResponse!.data![i].id,
                                                      farmName: _provider.getSupplierResponse!.data![i].farmAutoName ?? "Null",
                                                      farmId: _provider.getSupplierResponse!.data![i].farmId.toString(),
                                                      wiRelationType: _provider.getSupplierResponse!.data![i].wiRelationType ?? "Null",
                                                      connectSince: _provider.getSupplierResponse!.data![i].connectSince ?? "Null",
                                                      phone: _provider.getSupplierResponse!.data![i].phoneNum ?? "Null",
                                                    );
                                                  },

                                                );
*/
                                              },
                                            ),
                                        ],
                                      ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 15,
                        child: PopupMenuButton(
                          // color: Colors.black,
                          child: OnHover(
                            builder: (hover) => SizedBox(
                              height: 50,
                              width: 50,
                              child: Card(
                                color: hover ? Colors.greenAccent : Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.more_vert,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.greenAccent,
                                    ),
                                  ),
                                  CustomText(text: 'Disconnect Supplier'.tr()),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 2,
                              onTap: () {
                                _provider.downloadCSV();
                              },
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                                    child: Icon(
                                      Icons.download,
                                      color: Colors.greenAccent,
                                    ),
                                  ),
                                  Text('Download CSV'.tr(),style: TextStyle(fontFamily: Montserrat_Medium),),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 3,
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.greenAccent,
                                    ),
                                  ),
                                  Text('Bulk Edit'.tr(),style: TextStyle(fontFamily: Montserrat_Medium),),
                                ],
                              ),
                            ),
                          ],
                          onSelected: (value) async {
                            if (value == 1) {
                              if (_provider.allCheckedBoxId.isNotEmpty) {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Text("Are you sure you want to Delete".tr(),style: TextStyle(fontFamily: Montserrat_Medium),),
                                    ),
                                    actions: [
                                      AddTextButtonWidget(
                                        onPress: () async {
                                          if (checkedAllList == false) {
                                            if (singleId == true) {
                                              print("Single Selected======================================");
                                              await EntrepreneurClients.deleteEntreprenuerSupplierResponseData(
                                                id: widget.arguments,
                                                supplierid: supplierId,
                                                isBulkDelete: false,
                                              );
                                              _provider.getSupplierResponse!.data!.removeAt(id);
                                              setState(() {
                                                Provider.of<CreateNewEntreprenuerSupplierProvider>(context, listen: false).getAllSupplier(
                                                  entreprenuerId: widget.arguments,
                                                );
                                              });
                                              _provider.getcheckedBool[_provider.multipleIndex.length] = false;
                                              Navigator.of(context).pop();
                                            } else {
                                              print("Multiple selected data======================================");
                                              await EntrepreneurClients.deleteEntreprenuerSupplierResponseData(
                                                id: widget.arguments,
                                                supplierid: _provider.allCheckedBoxId,
                                                isBulkDelete: true,
                                              );

                                              setState(() {
                                                Provider.of<CreateNewEntreprenuerSupplierProvider>(context, listen: false).getAllSupplier(
                                                  entreprenuerId: widget.arguments,
                                                );
                                              });
                                              _provider.getcheckedBool[_provider.multipleIndex.length] = false;
                                              Navigator.of(context).pop();
                                            }
                                          } else {
                                            print("All Selected======================================");
                                            await EntrepreneurClients.deleteEntreprenuerSupplierResponseData(
                                              id: widget.arguments,
                                              supplierid: _provider.allCheckedBoxId,
                                              isBulkDelete: true,
                                            );

                                            setState(() {
                                              Provider.of<CreateNewEntreprenuerSupplierProvider>(context, listen: false).getAllSupplier(
                                                entreprenuerId: widget.arguments,
                                              );
                                            });
                                            _provider.getcheckedBool[_provider.multipleIndex.length] = false;
                                            Navigator.of(context).pop();
                                          }
                                        },
                                        text: 'Sure'.tr(),
                                        colors: yellowishGreen,
                                      ),
                                      AddTextButtonWidget(
                                        text: "Cancel".tr(),
                                        colors: dimMetalic3,
                                        onPress: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                ).then((value) {
                                  if (value == 'yes') {
                                    setState(() {
                                      Navigator.of(context).pop();
                                    });
                                  }
                                });
                              } else {
                                showSnack('please select any supplier first..'.tr());
                              }
                            }
                            if (value == 2) {}
                            if (value == 3) {
                              if (_provider.allCheckedBoxId.length>1) {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return EditSupplierDialog(
                                        farmId: '',
                                        connectSince: '',
                                        wiRelationType: '',
                                        phone: '',
                                        args: widget.arguments,
                                        isAllEditSupplier: true,
                                        supplierid: _provider.allCheckedBoxId,
                                      );
                                    });

                                  // multipleIndex=[];

                              }
                              else if(_provider.allCheckedBoxId.length==1){

                                  showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return EditSupplierDialog(
                                                      args: widget.arguments,
                                                      isAllEditSupplier: false,
                                                      supplierid: _provider.allCheckedBoxId[0],
                                                      farmName: _provider.getSupplierResponse!.data![_provider.multipleIndex[0]].farmAutoName ?? "Null",
                                                      farmId: _provider.getSupplierResponse!.data![_provider.multipleIndex[0]].farmId.toString(),
                                                      wiRelationType: _provider.getSupplierResponse!.data![_provider.multipleIndex[0]].wiRelationType ?? "Null",
                                                      connectSince: _provider.getSupplierResponse!.data![_provider.multipleIndex[0]].connectSince ?? "Null",
                                                      phone: _provider.getSupplierResponse!.data![_provider.multipleIndex[0]].phoneNum ?? "Null",
                                                    );
                                                  },

                                                );
                                // multipleIndex=[];

                              }
                              else{
                                showSnack('please select any supplier first..'.tr());
                                // multipleIndex=[];

                              }

                              setState(() {});
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
