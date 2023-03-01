import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/actions/action_parcel_info.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/actions/dialogs/parcel_action_add_dialog.dart';

import '../../../../../../../app_common_widgets/animated_search.dart';
import '../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../app_common_widgets/icon_text_container.dart';
import '../../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../../utils/functions.dart';
import '../../../../../../../utils/responsive.dart';
import '../../../../../../../utils/styles.dart';
import '../../../../../../office/widgets/search_widget.dart';

class ParcelActionWidget extends StatefulWidget {
  const ParcelActionWidget({Key? key}) : super(key: key);

  @override
  State<ParcelActionWidget> createState() => _ParcelActionWidgetState();
}

class _ParcelActionWidgetState extends State<ParcelActionWidget> {
  String? ditchBank = "Select Season";
  List<String> ditchBankList = <String>[
    "Select Season",
    "Fall/Autumn",
    "Spring",
    "Summer",
    "Winter",
  ];
  bool filterTapped = false;
  bool checkAll = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        width: getWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: getWidth(context),
              child: !Responsive.isDesktop(context)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            text: "Actions",
                            size: 30,
                            color: hoverColor,
                            weight: FontWeight.bold,
                          ),
                        ),
                        AnimatedSearchWidget(),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            ClickIconButton(
                              icon: Icons.filter_list,
                              clickcolors:
                                  filterTapped ? hoverColor : Colors.white,
                              onPressed: () {
                                setState(
                                  () {
                                    filterTapped = !filterTapped;
                                  },
                                );
                              },
                            ),
                            IconAndTextContainer(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ParcelActionAddDialog();
                                    });
                              },
                              addText: "Action",
                            ),
                          ],
                        )
                      ],
                    )
                  : Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        CustomText(
                          text: "Actions",
                          size: 30,
                          color: hoverColor,
                          weight: FontWeight.bold,
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            AnimatedSearchWidget(),
                            ClickIconButton(
                              icon: Icons.filter_list,
                              clickcolors:
                                  filterTapped ? hoverColor : Colors.white,
                              onPressed: () {
                                setState(
                                  () {
                                    filterTapped = !filterTapped;
                                  },
                                );
                              },
                            ),
                            IconAndTextContainer(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ParcelActionAddDialog();
                                    });
                              },
                              addText: "Action",
                            ),
                          ],
                        )
                      ],
                    ),
            ),
            if (filterTapped)
              Card(
                elevation: 3,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Container(
                  width: getWidth(context),
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "Season"),
                      SizedBox(
                        width: !Responsive.isDesktop(context)
                            ? getWidth(context)
                            : getWidth(context) / 4,
                        child: RealDropDownWidget(
                          value: ditchBank,
                          onChanged: (newValue) {
                            setState(() {
                              ditchBank = newValue;
                            });
                          },
                          items: ditchBankList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                                value: value, child: Text(value));
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            SizedBox(
              height: 10,
            ),
            ParcelActionInfo(checkAll: checkAll)
          ],
        ),
      ),
    );
  }
}
