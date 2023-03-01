import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/real_check_box_widget.dart';

class ContactInfoWidget extends StatelessWidget {
  const ContactInfoWidget({
    Key? key,
    required this.first,
    required this.size,
    required this.check,
    required this.contactDate,
    required this.contactType,
    required this.peopleInvolved,
    required this.comment,
  }) : super(key: key);
  final bool first, check;
  final String contactDate, contactType, peopleInvolved, comment;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black26))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (first)
            SizedBox(
                width: size / 6, child: ContactCheckBoxWidget(check: check))
          else
            SizedBox(
                width: size / 6, child: ContactCheckBoxWidget(check: check)),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: size,
            child: CustomText(
              text: contactType,
              size: first ? 18 : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width: size,
            child: CustomText(
              text: contactDate,
              size: first ? 18 : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width: size,
            child: CustomText(
              text: peopleInvolved,
              size: first ? 18 : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width: size,
            child: CustomText(
              text: comment,
              size: first ? 18 : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class ContactCheckBoxWidget extends StatefulWidget {
  ContactCheckBoxWidget({
    Key? key,
    required this.check,
    this.labeltext = "",
  }) : super(key: key);

  bool check = false;
  final String labeltext;

  @override
  State<ContactCheckBoxWidget> createState() => _ContactCheckBoxWidgetState();
}

class _ContactCheckBoxWidgetState extends State<ContactCheckBoxWidget> {
//  late bool checkContactInfo = false;
  @override
  Widget build(BuildContext context) {
    return RealCheckBoxWidget(
        value: widget.check,
        onChanged: (value) {
          setState(() {
            widget.check = value ?? false;
          });
        },
        Labeltext: widget.labeltext);
  }
}
