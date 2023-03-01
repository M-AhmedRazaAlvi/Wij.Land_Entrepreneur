import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/anacdots_mobile/utils/NotificationKeys.dart';

import '../../utils/styles.dart';
import '../providers/anacdots_dropdowns_provider/anacdots_dropdowns_provider.dart';

// ignore: must_be_immutable
class SelectableDropdownWidget extends StatefulWidget {
  SelectableDropdownWidget({
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
  final String title;
  double widthSize;
  double heightSize;
  bool isVertical;
  final Function(String?)? mOnDropDownChange;
  final List<String> mSelectedItemsList;
  final String mSelectedValue;

  @override
  State<SelectableDropdownWidget> createState() =>
      _SelectableDropdownWidgetState();
}

class _SelectableDropdownWidgetState extends State<SelectableDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AnacdotsDropDownsProvider>(
        builder: (context, provider, child) {
      return SizedBox(
        height: widget.heightSize > 50 ? widget.heightSize + 45 : null,
        width: widget.widthSize,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(widget.title),
            Container(
              width: widget.widthSize,
              height: widget.heightSize,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: lightGrey, width: 0.6),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 6, right: 10, top: 10),
                child: Stack(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  alignment: Alignment.center,
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        onTap: () {
                          setState(() {});
                          debugPrint("khadijaa");
                        },
                        dropdownColor: Colors.white,
                        iconSize: 25,
                        isDense: true,
                        isExpanded: true,
                        style: Theme.of(context).textTheme.headline6,
                        value: widget.mSelectedValue,
                        elevation: 12,
                        iconDisabledColor: Colors.white,
                        iconEnabledColor: Colors.white,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                        items: widget.items.map((String items) {
                          return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: AppFont.light),
                              ));
                        }).toList(),
                        selectedItemBuilder: (BuildContext context) {
                          return widget.items.map((String items) {
                            return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ));
                          }).toList();
                        },
                        onChanged: widget.mOnDropDownChange,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.search),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      color: Colors.white,
                      height: widget.heightSize,
                      // width: widget.widthSize * 0.7,
                      margin: EdgeInsets.only(right: 50, left: 30),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection:
                            widget.isVertical ? Axis.vertical : Axis.horizontal,
                        itemCount: widget.mSelectedItemsList.length,
                        itemBuilder: ((context, index) => Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Chip(
                                deleteIcon: const Icon(
                                  Icons.close,
                                  color: Color(0xFF008055),
                                  size: 10,
                                ),
                                onDeleted: () => setState(() {
                                  if (widget.title == "People") {
                                    var selectedIndex = provider.personsItemList
                                        .indexOf(
                                            widget.mSelectedItemsList[index]);
                                    provider.selectedAnacdotsPersonsDropDownIds
                                        .remove(provider
                                            .personsItemListIds[selectedIndex]);
                                    print("removeItem:::::$selectedIndex");
                                    print(
                                        "list:::${provider.selectedAnacdotsPersonsDropDownIds}");

                                    widget.mSelectedItemsList.remove(
                                        widget.mSelectedItemsList[index]);
                                  }
                                  // PROJECT REMOVE////
                                  if (widget.title == "Project") {
                                    var selectedIndexProj =
                                        provider.projectsItemList.indexOf(
                                            widget.mSelectedItemsList[index]);
                                    provider.selectedAnacdotsProjectDropDownIds
                                        .remove(provider.projectsItemListIds[
                                            selectedIndexProj]);
                                    debugPrint(
                                        "removeItemProject:::::$selectedIndexProj");
                                    debugPrint(
                                        "listProject:::${provider.selectedAnacdotsProjectDropDownIds}");

                                    widget.mSelectedItemsList.remove(
                                        widget.mSelectedItemsList[index]);
                                  }

                                  // //ORGANIZATION REMOVE//
                                  if (widget.title == "Organization") {
                                    setState(() {});
                                    var selectedIndexOrg =
                                        provider.organizationsItemList.indexOf(
                                            widget.mSelectedItemsList[index]);
                                    provider
                                        .selectedAnacdotsOrganizationstDropDownIds
                                        .remove(
                                            provider.organizationsItemListIds[
                                                selectedIndexOrg]);
                                    debugPrint(
                                        "removeItem:::::$selectedIndexOrg");
                                    debugPrint(
                                        "list:::${provider.selectedAnacdotsOrganizationstDropDownIds}");

                                    widget.mSelectedItemsList.remove(
                                        widget.mSelectedItemsList[index]);
                                  }
                                  if (widget.title == "Tags") {
                                    setState(() {});
                                    var selectedIndexTags =
                                        provider.itemsListTags.indexOf(
                                            widget.mSelectedItemsList[index]);
                                    provider.selectedItemsTagList.remove(
                                        provider
                                            .itemsListTags[selectedIndexTags]);
                                    debugPrint(
                                        "removeItem:::::$selectedIndexTags");

                                    debugPrint(
                                        "removeItemTag:::::${provider.selectedItemsTagList}");
                                  }
                                }),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                label: Text(
                                  widget.mSelectedItemsList[index],
                                  style: const TextStyle(
                                      fontSize: 12, color: Color(0xFF008055)),
                                ),
                                backgroundColor: APPColor.chipColor,
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  dropDownSize() {
    const int mediumScreenSize = 768;
    const int smallSceenSize = 360;
    const int customScreenSize = 1100;

    if (widget.widthSize <= smallSceenSize) {
      return widget.widthSize - 40;
    } else if (widget.widthSize > smallSceenSize &&
        widget.widthSize <= mediumScreenSize) {
      return widget.widthSize - 60;
    } else if (widget.widthSize > mediumScreenSize &&
        widget.widthSize <= customScreenSize) {
      return widget.widthSize - 50;
    } else {
      return widget.widthSize - 40;
    }
  }
}
