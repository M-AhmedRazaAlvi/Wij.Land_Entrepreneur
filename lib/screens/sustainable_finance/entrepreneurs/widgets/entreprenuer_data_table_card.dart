import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/utils/functions.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../models/entrepreneur/response/get_entrepreneur_response.dart';
import '../../../../providers/entrepreneur/entrepreneur_screen_overview_provider.dart';
import '../../../../providers/entrepreneur/entrepreneur_screen_provider.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/controller.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../../contacts/widgets/popup_menu_button.dart';
import '../../../office/widgets/add_text_button_widget.dart';

class EntrepreneurDataTableCard extends StatefulWidget {
  final GetEntrepreneurResponse model;

  const EntrepreneurDataTableCard({Key? key, required this.model}) : super(key: key);

  @override
  State<EntrepreneurDataTableCard> createState() => _EntrepreneurDataTableCardState();
}

class _EntrepreneurDataTableCardState extends State<EntrepreneurDataTableCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<EntrepreneurScreenProvider, EntrepreneurOverviewScreenProvider>(
      builder: (context, _provider, _overview, widget) {
        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  offset: Offset(0, 15),
                  blurRadius: 25,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: DataTable(
                      showBottomBorder: false,
                      headingRowHeight: !Responsive.isDesktop(context) ? 50 : 80,
                      dividerThickness: 0.2,
                      dataRowColor: MaterialStateProperty.resolveWith(_getDataRowColor),
                      dataRowHeight: !Responsive.isDesktop(context) ? 50 : 80,
                      columnSpacing: /*Responsive.isMobile(context) ?getWidth(context)*0.25:getWidth(context)*0.07*/ 0,
                      headingTextStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: !Responsive.isDesktop(context) ? 14 : 16,
                        fontWeight: !Responsive.isDesktop(context) ? FontWeight.w600 : FontWeight.bold,
                      ),
                      onSelectAll: (bool? selectAll) {
                        _provider.selected!.clear();
                        setState(() {});

                        for (var i = 0; i < this.widget.model.data!.length; i++) {
                          if (selectAll == true) {
                            _provider.selected!.add(true);
                            setState(() {});
                          } else {
                            _provider.selected!.add(false);
                            setState(() {});
                          }
                        }
                        print("Selected values : ${_provider.selected}");
                      },
                      columns: <DataColumn>[
                        DataColumn(
                          label: SizedBox(
                            width: Responsive.isMobile(context) ? getWidth(context) * 0.2 : getWidth(context) * 0.15,
                            child: CustomText(
                              text: "Name ".tr(),
                              textAligns: TextAlign.start,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: Responsive.isMobile(context) ? getWidth(context) * 0.2 : getWidth(context) * 0.15,
                            child: CustomText(
                              text: 'Focus Area'.tr(),
                              textAligns: TextAlign.start,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: Responsive.isMobile(context) ? getWidth(context) * 0.2 : getWidth(context) * 0.15,
                            child: CustomText(
                              text: 'Legal Structure'.tr(),
                              weight: FontWeight.bold,
                              textAligns: TextAlign.start,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: Responsive.isMobile(context) ? getWidth(context) * 0.2 : getWidth(context) * 0.15,
                            child: CustomText(
                              text: 'Farms'.tr(),
                              textAligns: TextAlign.start,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: Responsive.isMobile(context) ? getWidth(context) * 0.25 : getWidth(context) * 0.15,
                            child: CustomText(
                              text: 'Selling Location'.tr(),
                              textAligns: TextAlign.start,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: getWidth(context) * 0.05,
                            child: CustomText(
                              text: '#',
                              textAligns: TextAlign.start,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: PopUpMenuEntreprenuerButtonWidget(
                            mOnDeleteTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                    child: Text("Are you sure you want to delete this entrepreneur profile?".tr(),style: TextStyle(fontFamily: Montserrat_Medium),),
                                  ),
                                  actions: [
                                    SizedBox(
                                      width: 120,
                                      child: AddTextButtonWidget(
                                        text: "YES".tr(),
                                        colors: yellowishGreen,
                                        onPress: () async {
                                          List<int> mIdsList = [];
                                          for (var i = 0; i < _provider.selected!.length; i++) {
                                            if (_provider.selected![i] == true) {
                                              mIdsList.add(this.widget.model.data![i].id!);
                                            }
                                          }
                                          _provider.deleteAllEntrepreneur(mIdsList);
                                          Navigator.of(
                                            context,
                                          ).pop();
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 120,
                                      child: AddTextButtonWidget(
                                        text: "CANCEL".tr(),
                                        colors: dimMetalic3,
                                        onPress: () {
                                          Navigator.of(
                                            context,
                                          ).pop('yes');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            mOnEditTap: () {
                              _provider.downloadCSV();
                            },
                          ),
                        ),
                      ],
                      rows: <DataRow>[
                        for (int i = 0; i < this.widget.model.data!.length; i++)
                          DataRow(
                            selected: _provider.selected![i],
                            onSelectChanged: (bool? value) {
                              setState(
                                () {
                                  _provider.selected![i] = value!;
                                },
                              );
                            },
                            cells: <DataCell>[
                              DataCell(
                                SizedBox(
                                  width: Responsive.isMobile(context) ? getWidth(context) * 0.2 : getWidth(context) * 0.15,
                                  child: CustomText(
                                    text: '${this.widget.model.data![i].name}',
                                    textAligns: TextAlign.left,
                                    size: 12,
                                  ),
                                ),
                                onTap: () {
                                  _overview.productData.clear();
                                  for (int j = 0; j < this.widget.model.data![i].entrepreneurInfo!.products!.length; j++) {
                                    _overview.productData.insert(
                                        j,
                                        Products(
                                            icon: this.widget.model.data![i].entrepreneurInfo!.products![j].icon,
                                            name: this.widget.model.data![i].entrepreneurInfo!.products![j].name));
                                  }
                                  navigationController.navigateToWithArguments(
                                    arguments: {"id": this.widget.model.data![i].id},
                                    routeName: entreprenuersOverviewPageRoute,
                                  ).then((value) {
                                    if (Provider.of<EntrepreneurOverviewScreenProvider>(context, listen: false).isUpdateEntrepreneur) {
                                      _provider.getEntrepreneur(false);

                                      Provider.of<EntrepreneurOverviewScreenProvider>(context, listen: false).isUpdateEntrepreneur = false;
                                    }
                                    if (value == 0) {
                                      _provider.getEntrepreneur(false);
                                    }
                                  });
                                },
                              ),
                              DataCell(
                                SizedBox(
                                  width: Responsive.isMobile(context) ? getWidth(context) * 0.2 : getWidth(context) * 0.15,
                                  child: CustomText(
                                    text: "${this.widget.model.data![i].entrepreneurInfo!.focusArea}",
                                    textAligns: TextAlign.left,
                                    size: 12,
                                  ),
                                ),
                                onTap: () {
                                  _overview.productData.clear();

                                  for (int j = 0; j < this.widget.model.data![i].entrepreneurInfo!.products!.length; j++) {
                                    _overview.productData.insert(
                                        j,
                                        Products(
                                            icon: this.widget.model.data![i].entrepreneurInfo!.products![j].icon,
                                            name: this.widget.model.data![i].entrepreneurInfo!.products![j].name));
                                  }
                                  navigationController.navigateToWithArguments(
                                    arguments: {"id": this.widget.model.data![i].id},
                                    routeName: entreprenuersOverviewPageRoute,
                                  ).then((value) {
                                    if (Provider.of<EntrepreneurOverviewScreenProvider>(context, listen: false).isUpdateEntrepreneur) {
                                      _provider.getEntrepreneur(false);
                                      Provider.of<EntrepreneurOverviewScreenProvider>(context, listen: false).isUpdateEntrepreneur = false;
                                    }
                                    if (value == 0) {
                                      _provider.getEntrepreneur(false);
                                    }
                                  });
                                },
                              ),
                              DataCell(
                                SizedBox(
                                  width: Responsive.isMobile(context) ? getWidth(context) * 0.2 : getWidth(context) * 0.15,
                                  child: CustomText(
                                    text: "${this.widget.model.data![i].entrepreneurInfo!.legalStructure}",
                                    textAligns: TextAlign.left,
                                    size: 12,
                                  ),
                                ),
                                onTap: () {
                                  _overview.productData.clear();

                                  for (int j = 0; j < this.widget.model.data![i].entrepreneurInfo!.products!.length; j++) {
                                    _overview.productData.insert(
                                        j,
                                        Products(
                                            icon: this.widget.model.data![i].entrepreneurInfo!.products![j].icon,
                                            name: this.widget.model.data![i].entrepreneurInfo!.products![j].name));
                                  }
                                  navigationController.navigateToWithArguments(
                                    arguments: {"id": this.widget.model.data![i].id},
                                    routeName: entreprenuersOverviewPageRoute,
                                  ).then((value) {
                                    if (Provider.of<EntrepreneurOverviewScreenProvider>(context, listen: false).isUpdateEntrepreneur) {
                                      _provider.getEntrepreneur(false);
                                      Provider.of<EntrepreneurOverviewScreenProvider>(context, listen: false).isUpdateEntrepreneur = false;
                                    }
                                    if (value == 0) {
                                      _provider.getEntrepreneur(false);
                                    }
                                  });
                                },
                              ),
                              DataCell(
                                SizedBox(
                                  width: Responsive.isMobile(context) ? getWidth(context) * 0.2 : getWidth(context) * 0.15,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: CustomText(
                                      text: '${this.widget.model.data![i].farms}',
                                      textAligns: TextAlign.left,
                                      size: 12,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  _overview.productData.clear();

                                  for (int j = 0; j < this.widget.model.data![i].entrepreneurInfo!.products!.length; j++) {
                                    _overview.productData.insert(
                                        j,
                                        Products(
                                            icon: this.widget.model.data![i].entrepreneurInfo!.products![j].icon,
                                            name: this.widget.model.data![i].entrepreneurInfo!.products![j].name));
                                  }
                                  navigationController.navigateToWithArguments(
                                    arguments: {"id": this.widget.model.data![i].id},
                                    routeName: entreprenuersOverviewPageRoute,
                                  ).then((value) {
                                    if (Provider.of<EntrepreneurOverviewScreenProvider>(context, listen: false).isUpdateEntrepreneur) {
                                      _provider.getEntrepreneur(false);
                                      Provider.of<EntrepreneurOverviewScreenProvider>(context, listen: false).isUpdateEntrepreneur = false;
                                    }
                                    if (value == 0) {
                                      _provider.getEntrepreneur(false);
                                    }
                                  });
                                },
                              ),
                              DataCell(
                                SizedBox(
                                  width: Responsive.isMobile(context) ? getWidth(context) * 0.25 : getWidth(context) * 0.15,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: CustomText(
                                      text: '${this.widget.model.data![i].sellingLocations}',
                                      textAligns: TextAlign.start,
                                      size: 12,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  _overview.productData.clear();

                                  for (int j = 0; j < this.widget.model.data![i].entrepreneurInfo!.products!.length; j++) {
                                    _overview.productData.insert(
                                        j,
                                        Products(
                                            icon: this.widget.model.data![i].entrepreneurInfo!.products![j].icon,
                                            name: this.widget.model.data![i].entrepreneurInfo!.products![j].name));
                                  }
                                  navigationController.navigateToWithArguments(
                                    arguments: {"id": this.widget.model.data![i].id},
                                    routeName: entreprenuersOverviewPageRoute,
                                  ).then((value) {
                                    if (Provider.of<EntrepreneurOverviewScreenProvider>(context, listen: false).isUpdateEntrepreneur) {
                                      _provider.getEntrepreneur(false);
                                      Provider.of<EntrepreneurOverviewScreenProvider>(context, listen: false).isUpdateEntrepreneur = false;
                                    }
                                    if (value == 0) {
                                      _provider.getEntrepreneur(false);
                                    }
                                  });
                                },
                              ),
                              DataCell(
                                Container(),
                                onTap: () {
                                  _overview.productData.clear();

                                  for (int j = 0; j < this.widget.model.data![i].entrepreneurInfo!.products!.length; j++) {
                                    _overview.productData.insert(
                                        j,
                                        Products(
                                            icon: this.widget.model.data![i].entrepreneurInfo!.products![j].icon,
                                            name: this.widget.model.data![i].entrepreneurInfo!.products![j].name));
                                  }
                                  navigationController.navigateToWithArguments(
                                    arguments: {"id": this.widget.model.data![i].id},
                                    routeName: entreprenuersOverviewPageRoute,
                                  ).then((value) {
                                    if (Provider.of<EntrepreneurOverviewScreenProvider>(context, listen: false).isUpdateEntrepreneur) {
                                      _provider.getEntrepreneur(false);
                                      Provider.of<EntrepreneurOverviewScreenProvider>(context, listen: false).isUpdateEntrepreneur = false;
                                    }

                                    if (value == 0) {
                                      _provider.getEntrepreneur(false);
                                    }
                                  });
                                },
                              ),
                              DataCell(SizedBox.shrink()),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getDataRowColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };

    if (states.any(interactiveStates.contains)) {
      return Colors.transparent;
    }
    //return Colors.green; // Use the default value.
    return Colors.transparent;
  }
}
