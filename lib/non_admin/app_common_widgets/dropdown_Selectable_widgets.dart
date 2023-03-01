import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/styles.dart';
import '../providers/farm_computer_projects_provider/farm_computer_contact_moments_provider.dart';

class DropdownSelectableWidget extends StatefulWidget {
  DropdownSelectableWidget({
    Key? key,
    required this.items,
    required this.title,
    this.widthSize = 250,
    this.heightSize = 50,
    this.isVertical = false,
    required this.mOnDropDownChange,
    required this.mSelectedItemsList,
    required this.mSelectedValue,
  }) : super(key: key);
  final List<String> items;
  final dynamic title;
  final double widthSize;
  final double heightSize;
  final bool isVertical;
  final Function(dynamic)? mOnDropDownChange;
  final List<dynamic> mSelectedItemsList;
  final dynamic mSelectedValue;

  @override
  State<DropdownSelectableWidget> createState() => _DropdownSelectableWidgetState();
}

class _DropdownSelectableWidgetState extends State<DropdownSelectableWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CreateFarmComputerContactMomentsProvider>(
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
                  border: Border.all(color: lightGrey, width: 1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Stack(
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          items: this.widget.items.map((dynamic items) {
                            return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: Montserrat_Medium,
                                  ),
                                ));
                          }).toList(),
                          selectedItemBuilder: (BuildContext context) {
                            return this.widget.items.map((dynamic items) {
                              return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: Montserrat_Medium,
                                    ),
                                  ));
                            }).toList();
                          },
                          onChanged: this.widget.mOnDropDownChange,
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        height: this.widget.heightSize,
                        width: this.widget.widthSize * 0.98,
                        margin: EdgeInsets.only(right: 20),
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
                                  onDeleted: () => setState(() {
                                    this.widget.mSelectedItemsList.remove(this.widget.mSelectedItemsList[index]);
                                  }),
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
