import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../app_common_widgets/text_widget.dart';
import '../../../office/widgets/comment_text.dart';

class ExternalAddProject extends StatefulWidget {
  const ExternalAddProject({Key? key}) : super(key: key);

  @override
  State<ExternalAddProject> createState() => _ExternalAddProjectState();
}

class _ExternalAddProjectState extends State<ExternalAddProject> {
  final TextEditingController projectName = TextEditingController(),
      date = TextEditingController(),
      commentTextField = TextEditingController(),
      link = TextEditingController(),
      linkTitle = TextEditingController(),
      organizations = TextEditingController();

  String? selectedStatus = 'Select Status';
  List<String> statuslist = [
    'Select Status',
    'Active',
    'Idea',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Project Name ",
          size: 16,
        ),
        SizedBox(
          height: 10,
        ),
        TextWidgetField(
          controller: projectName,
        ),
        SizedBox(
          height: 10,
        ),
        CustomText(text: "Start Date "),
        SizedBox(
          height: 20,
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
        SizedBox(
          height: 20,
        ),
        RealDropDownWidget(
          value: selectedStatus,
          onChanged: (newValue) {
            setState(() {
              selectedStatus = newValue;
            });
          },
          items: statuslist.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
        ),
        SizedBox(
          height: 10,
        ),
        CustomText(
          text: "Description",
          size: 16,
        ),
        SizedBox(
          height: 10,
        ),
        CommentTextField(
          controller: commentTextField,
        ),
        SizedBox(
          height: 10,
        ),
        CustomText(
          text: "Link ",
          size: 16,
        ),
        SizedBox(
          height: 10,
        ),
        TextWidgetField(
          controller: link,
        ),
        SizedBox(
          height: 10,
        ),
        CustomText(
          text: "Link Title",
          size: 16,
        ),
        SizedBox(
          height: 10,
        ),
        TextWidgetField(
          controller: linkTitle,
        ),
        SizedBox(
          height: 10,
        ),
        CustomText(
          text: "Organization(s)",
          size: 16,
        ),
        SizedBox(
          height: 10,
        ),
        TextWidgetField(
          controller: organizations,
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: DottedBorder(
            borderType: BorderType.RRect,
            dashPattern: const [4, 4],
            radius: Radius.circular(4),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              child: SizedBox(
                height: 130,
                width: MediaQuery.of(context).size.width * 0.55,
                child: /*imageFile!=null?Image.file(File('$imageFile')):*/ Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        // imagePick();
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.plus,
                        color: Color(0xff3c4b64),
                        size: 16,
                      ),
                    ),
                    CustomText(text: "Add a cover Image")
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
