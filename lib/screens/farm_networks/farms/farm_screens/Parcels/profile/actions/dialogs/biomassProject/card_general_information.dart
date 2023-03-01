import 'package:flutter/material.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/real_date_picker.dart';
import '../../../../../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../../../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/responsive.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../../../../../../office/widgets/comment_text.dart';

class CardGeneralInformation extends StatefulWidget {
  const CardGeneralInformation({
    Key? key,
    required this.farms,
    required this.farmList,
    required this.actionList,
    required this.actiondate,
    required this.season,
    required this.seasonList,
    this.onClickedFarms,
    this.onClickedseason,
    required this.farmOgrInfo,
  }) : super(key: key);
  final bool farmOgrInfo;
  final String? farms;
  final dynamic onClickedFarms;

  final List<String> farmList;
  final List<String> actionList;
  final TextEditingController actiondate;
  final String? season;
  final dynamic onClickedseason;
  final List<String> seasonList;

  @override
  State<CardGeneralInformation> createState() => _CardGeneralInformationState();
}

class _CardGeneralInformationState extends State<CardGeneralInformation> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          CustomText(
            text: "General Information",
            size: 25,
            color: darkBlue,
          ),
          SizedBox(
            height: 20,
          ),
          widget.farmOgrInfo
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Farm/Organizations",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RealDropDownWidget(
                      value: widget.farms,
                      onChanged: widget.onClickedFarms,
                      items: widget.farmList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                    ),
                  ],
                )
              : Container(),
          SizedBox(height: 20),
          SelectableDropdownWidget(
            widthSize: !Responsive.isDesktop(context)
                ? getWidth(context) * 0.87
                : getWidth(context) * 0.45,
            items: widget.actionList,
            title: "Action done by",
            mSelectedValue: "",
            mOnDropDownChange: (value){},
            mSelectedItemsList: [],

          ),
          SizedBox(height: 20),
          CustomText(text: "Date of Action"),
          SizedBox(height: 10),
          RealDatePickerWidget(dateController: widget.actiondate),
          SizedBox(height: 20),
          CustomText(
            text: "Done in Season",
          ),
          SizedBox(height: 10),
          SizedBox(
            child: RealDropDownWidget(
              value: widget.season,
              onChanged: widget.onClickedseason,
              items: widget.seasonList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
            ),
          ),
          SizedBox(height: 20),
          CustomText(text: "Method Description"),
          SizedBox(height: 10),
          CommentTextField(),
          SizedBox(height: 20),
          CustomText(text: "Comment"),
          SizedBox(height: 10),
          CommentTextField(),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
