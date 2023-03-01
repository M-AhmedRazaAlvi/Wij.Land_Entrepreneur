import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/text_widget.dart';
import '../../../../widgets/comment_text.dart';

class RoleContractorWidget extends StatefulWidget {
  const RoleContractorWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<RoleContractorWidget> createState() => _RoleContractorWidgetState();
}

class _RoleContractorWidgetState extends State<RoleContractorWidget> {
  final TextEditingController fName = TextEditingController(),
      date = TextEditingController(),
      comment = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    date.dispose();
    comment.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: "Contractor",
          size: 18,
          weight: FontWeight.bold,
        ),
        const SizedBox(
          height: 15,
        ),
        const CustomText(text: "Connected to WijLand Since"),
        const SizedBox(
          height: 5,
        ),
        InkWell(
          onTap: () {
            showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2023))
                .then((d) {
              debugPrint("$d");
              if (d != null) {
                setState(() {
                  date.text = d.toString().split(" ")[0];
                });
              }
            });
          },
          child: TextWidgetField(
            controller: date,
            enabled: false,
            suffixIcon: Icon(Icons.calendar_today),
          ),
        ),
        const SizedBox(height: 10),
        const CustomText(
          text: "Comments",
        ),
        const SizedBox(height: 10),
        CommentTextField(
          controller: comment,
        )
      ],
    );
  }
}
