import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/text_widget.dart';
import '../../../../../office/widgets/comment_text.dart';

class ContractorMemberWidget extends StatefulWidget {
  const ContractorMemberWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ContractorMemberWidget> createState() => _ContractorMemberWidgetState();
}

class _ContractorMemberWidgetState extends State<ContractorMemberWidget> {
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
        const SizedBox(
          height: 30,
        ),
        CustomText(
          text: "Contractor Details",
          size: 20,
          weight: FontWeight.bold,
        ),
        const SizedBox(
          height: 15,
        ),
        const CustomText(text: "Connected To WijLand Since"),
        const SizedBox(
          height: 15,
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
            suffixIcon: const Icon(Icons.calendar_today),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const CustomText(text: "Comment"),
        const SizedBox(
          height: 15,
        ),
        CommentTextField(
          controller: comment,
        ),
      ],
    );
  }
}
