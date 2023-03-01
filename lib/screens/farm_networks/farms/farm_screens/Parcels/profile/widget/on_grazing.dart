import 'package:flutter/material.dart';

import '../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../../utils/functions.dart';
import '../../../../../../../utils/responsive.dart';
import '../../../../../../office/widgets/add_text_button_widget.dart';
import '../../Widget/chnage_icon_text.dart';
import '../../Widget/general_drop_widget.dart';

class OnGrazingWidget extends StatefulWidget {
  const OnGrazingWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<OnGrazingWidget> createState() => _OnGrazingWidgetState();
}

class _OnGrazingWidgetState extends State<OnGrazingWidget> {
  String? grazing = "Select";
  List<String> grazingList = <String>[
    "Select",
    "Strip grazing",
    "extensive grazing",
    "nature grazing",
    "new dutch grazing",
    "Other",
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
            ],
          ),
        )
      ],
    );
  }
}
