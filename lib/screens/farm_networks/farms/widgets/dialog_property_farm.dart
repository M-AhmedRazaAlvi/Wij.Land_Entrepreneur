import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';

class FarmPropertyDialog extends StatelessWidget {
  const FarmPropertyDialog({
    Key? key,
    required this.titleFarmButtonList,
  }) : super(key: key);
  final List<String> titleFarmButtonList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: SingleChildScrollView(
        child: AlertDialog(
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: getWidth(context),
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < 1; i++)
                        CustomText(
                          text: titleFarmButtonList[i],
                          size:
                              !Responsive.isDesktop(context) ? 18 : 22,
                          color: hoverColor,
                          weight: FontWeight.bold,
                        ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          content: Card(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height:
                  !Responsive.isDesktop(context) ? 20 * 20 : 20 * 15,
              width: !Responsive.isDesktop(context)
                  ? getWidth(context)
                  : getWidth(context) * 0.8,
              child: ListView(
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black))),
                        child: PropertyInfoDialog(
                          first: true,
                          pastValue: "Past Value",
                          newValue: "New Value",
                          dateChange: "Date Changed",
                          edit: "Editor",
                          size: !Responsive.isDesktop(context)
                              ? getWidth(context) / 6
                              : getWidth(context) / 4,
                        ),
                      ),
                      for (int i = 0; i < 3; i++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PropertyInfoDialog(
                            first: false,
                            pastValue: "Past Value",
                            newValue: "New Value",
                            dateChange: "Date Changed",
                            edit: "Editor",
                            size: !Responsive.isDesktop(context)
                                ? getWidth(context) / 6
                                : getWidth(context) / 4,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PropertyInfoDialog extends StatelessWidget {
  const PropertyInfoDialog({
    Key? key,
    required this.first,
    required this.size,
    required this.pastValue,
    required this.newValue,
    required this.dateChange,
    required this.edit,
  }) : super(key: key);
  final bool first;
  final String pastValue, newValue, dateChange, edit;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context),
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: first ? Colors.white : Colors.black26))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size,
            child: CustomText(
              text: pastValue,
              size: first ? 18 : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width: size,
            child: CustomText(
              text: newValue,
              size: first ? 18 : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width: size,
            child: CustomText(
              text: dateChange,
              size: first ? 18 : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width: size,
            child: CustomText(
              text: edit,
              size: first ? 18 : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
