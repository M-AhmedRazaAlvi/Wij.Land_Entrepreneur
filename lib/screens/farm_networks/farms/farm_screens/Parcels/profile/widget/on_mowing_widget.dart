import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/profile/widget/empty_widget.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../app_common_widgets/counter_widget.dart';
import '../../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../office/widgets/add_text_button_widget.dart';
import '../../Widget/chnage_icon_text.dart';
import '../../Widget/general_drop_widget.dart';

class OnMowingWidget extends StatefulWidget {
  const OnMowingWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<OnMowingWidget> createState() => _OnMowingWidgetState();
}

class _OnMowingWidgetState extends State<OnMowingWidget> {
  String? farmer = "(y/n)";
  List<String> farmerList = <String>[
    "(y/n)",
    "Yes",
    "No",
  ];
  bool onclicked = false;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(25),
          alignment: Alignment.topRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              onclicked
                  ? AddTextButtonWidget(
                      text: "Cancel",
                      colors: Colors.white,
                      onPress: () {
                        setState(() {
                          onclicked = !onclicked;
                        });
                      },
                    )
                  : Container(),
              SizedBox(
                width: 20,
              ),
              ChangeIconTextButton(
                icon: onclicked ? Icons.save : Icons.edit_note,
                text: onclicked ? "Save" : "Edit",
                colors: onclicked ? Colors.yellowAccent : Colors.white,
                onPress: () {
                  setState(() {
                    onclicked = !onclicked;
                  });
                },
              ),
            ],
          ),
        ),
        SizedBox(
          width: !Responsive.isDesktop(context)
              ? getWidth(context)
              : getWidth(context) / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "Does the farmer Mow this parcel? (y/n)"),
              onclicked
                  ? RealDropDownWidget(
                      value: farmer,
                      onChanged: (newValue) {
                        setState(() {
                          farmer = newValue;
                        });
                      },
                      items: farmerList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                    )
                  : GeneralDropWidget(
                      text: "(y/n)",
                    ),
              SizedBox(
                height: 25,
              ),
              CustomText(text: "How many times per year do they mow?"),
              onclicked
                  ? CounterWidget(
                      count: counter,
                      onAddTap: () {
                        setState(() {
                          counter++;
                        });
                      },
                      onCloseTap: () {
                        setState(() {
                          counter--;
                        });
                      },
                    )
                  : EmptyWidget(),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        )
      ],
    );
  }
}
