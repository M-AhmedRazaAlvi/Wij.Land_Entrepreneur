import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/styles.dart';
import '../../../models/farm_computer_dropdown/farm_files_dropdown.dart';
import '../../../models/farm_computer_dropdown/parcel_organizations_drop_down.dart';
import '../../../providers/permissions_providers/permission_screen_provider.dart';

class SelectableDropdownWidgetForPermissions extends StatefulWidget {
  SelectableDropdownWidgetForPermissions({
    Key? key,
    required this.items,
    required this.title,
    this.widthSize = 250,
    this.heightSize = 50,
    this.isVertical = false,
    required this.mOnDropDownChange,
    required this.mSelectedItemsList,
    required this.mSelectedValue,
    this.mSelectedOrganizationsList,
    this.mSelectedProjectsList,
  }) : super(key: key);
  final List<String> items;
  final String title;
  double widthSize;
  double heightSize;
  bool isVertical;
  final Function(String?)? mOnDropDownChange;
  final List<String> mSelectedItemsList;
  final String mSelectedValue;
  final List<FarmFilesData>? mSelectedProjectsList;
  final List<LandOrganizationData>? mSelectedOrganizationsList;

  @override
  State<SelectableDropdownWidgetForPermissions> createState() => _SelectableDropdownWidgetForPermissionsState();
}

class _SelectableDropdownWidgetForPermissionsState extends State<SelectableDropdownWidgetForPermissions> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PermissionScreenProvider>(
      builder: (context, _provider, widget) {
        return SizedBox(
          height: this.widget.heightSize > 50 ? this.widget.heightSize + 45 : null,
          width: this.widget.widthSize,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                this.widget.title,
                style: TextStyle(
                  fontFamily: Montserrat_Medium,
                ),
              ),
              Container(
                width: this.widget.widthSize,
                height: this.widget.heightSize,
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: lightGrey,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Stack(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    alignment: Alignment.center,
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton(
                          dropdownColor: Colors.white,
                          iconSize: 20,
                          isDense: true,
                          isExpanded: true,
                          style: Theme.of(context).textTheme.headline6,
                          value: this.widget.mSelectedValue,
                          elevation: 12,
                          iconDisabledColor: Colors.white,
                          iconEnabledColor: Colors.white,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                          ),
                          items: this.widget.items.map(
                            (String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: Montserrat_Medium,
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                          selectedItemBuilder: (BuildContext context) {
                            return this.widget.items.map(
                              (String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: Montserrat_Medium,
                                    ),
                                  ),
                                );
                              },
                            ).toList();
                          },
                          onChanged: this.widget.mOnDropDownChange,
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        height: this.widget.heightSize,
                        // width: this.widget.widthSize * 0.7,
                        margin: EdgeInsets.only(right: 50),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: this.widget.isVertical ? Axis.vertical : Axis.horizontal,
                          itemCount: this.widget.mSelectedItemsList.length,
                          itemBuilder: ((context, index) => Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Chip(
                                  deleteIcon: const Icon(
                                    Icons.close,
                                    size: 10,
                                  ),
                                  onDeleted: () {
                                    if (this.widget.mSelectedProjectsList == null && this.widget.mSelectedOrganizationsList == null) {
                                      log("Deleting Projects");
                                      setState(() {
                                        this.widget.mSelectedItemsList.remove(this.widget.mSelectedItemsList[index]);
                                      });
                                    } else if (this.widget.mSelectedOrganizationsList == null) {
                                      log("Deleting Projects");
                                      setState(() {
                                        this.widget.mSelectedItemsList.remove(this.widget.mSelectedItemsList[index]);
                                        this.widget.mSelectedProjectsList!.removeAt(index);
                                      });
                                    } else {
                                      log("Deleting organizations");
                                      setState(() {
                                        this.widget.mSelectedItemsList.remove(this.widget.mSelectedItemsList[index]);
                                        this.widget.mSelectedOrganizationsList!.removeAt(index);
                                      });
                                    }
                                  },
                                  label: Text(
                                    this.widget.mSelectedItemsList[index],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: Montserrat_Medium,
                                    ),
                                  ),
                                  backgroundColor: primary,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
