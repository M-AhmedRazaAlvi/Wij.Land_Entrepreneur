import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../office/widgets/add_text_button_widget.dart';
import '../../Widget/chnage_icon_text.dart';
import '../../Widget/general_drop_widget.dart';

class OnGeneralWidget extends StatefulWidget {
  const OnGeneralWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<OnGeneralWidget> createState() => _OnGeneralWidgetState();
}

class _OnGeneralWidgetState extends State<OnGeneralWidget> {
  String? grazing = "Select";
  List<String> grazingList = <String>[
    "Select",
    "Grazing",
    "Maize",
    "Mowing",
    "Other",
  ];
  String? productive = "(Y/n)";
  List<String> productiveList = <String>[
    "(Y/n)",
    "Yes",
    "No",
  ];
  String? limited = "(Y/n)";
  List<String> limitedList = <String>[
    "(Y/n)",
    "Yes",
    "No",
  ];
  String? partNNN = "(Y/n)";
  List<String> partNNNList = <String>[
    "(Y/n)",
    "Yes",
    "No",
  ];
  bool onclicked = false;

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
              CustomText(text: "What management do you apply to this parcel?"),
              onclicked
                  ? RealDropDownWidget(
                      value: grazing,
                      onChanged: (newValue) {
                        setState(() {
                          grazing = newValue;
                        });
                      },
                      items: grazingList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                    )
                  : GeneralDropWidget(
                      text: "Grazing",
                    ),
              SizedBox(
                height: 25,
              ),
              CustomText(text: "Is this parcel highly productive? (y/n)"),
              onclicked
                  ? RealDropDownWidget(
                      value: productive,
                      onChanged: (newValue) {
                        setState(() {
                          productive = newValue;
                        });
                      },
                      items: productiveList
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
              CustomText(
                  text:
                      "Does this Parcel have any particular limitation? (y/n)"),
              onclicked
                  ? RealDropDownWidget(
                      value: limited,
                      onChanged: (newValue) {
                        setState(() {
                          limited = newValue;
                        });
                      },
                      items: limitedList
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
              CustomText(
                  text:
                      "Is this parcel part of NNN (Nature Network Netherland)? (y/n)"),
              onclicked
                  ? RealDropDownWidget(
                      value: partNNN,
                      onChanged: (newValue) {
                        setState(() {
                          partNNN = newValue;
                        });
                      },
                      items: partNNNList
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
            ],
          ),
        )
      ],
    );
  }
}
