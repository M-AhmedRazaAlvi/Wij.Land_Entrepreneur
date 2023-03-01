import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';

import '../../../../../utils/functions.dart';
import '../../../../app_common_widgets/common_text_widget.dart';
import '../../../../app_common_widgets/styles.dart';

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({Key? key}) : super(key: key);

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  TextEditingController titleController = TextEditingController(text: "");
  HtmlEditorController messageController = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 12),
                child: CustomText(
                  text: "Title",
                  size: 18,
                  color: anecBlack,
                  weight: FontWeight.w700,
                ),
              ),
              Expanded(
                child: CommonTextFieldWidget(
                  mEditController: titleController,
                  onChange: (v) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: CustomText(
                  text: "Attendees",
                  color: anecBlack,
                  size: 18,
                  weight: FontWeight.w700,
                ),
              ),
              Expanded(
                child: CommonTextFieldWidget(
                  mPrefixIconWidget: Icon(CupertinoIcons.person_alt),
                  mEditController: titleController,
                  onChange: (v) {},
                ),
              ),
              Expanded(
                // height: 150,
                flex: 4,
                child: HtmlEditor(
                  controller: messageController, //required
                  htmlEditorOptions: HtmlEditorOptions(
                    hint: "Your text here...",
                    autoAdjustHeight: true,
                    initialText: "",
                  ),
                  otherOptions: OtherOptions(
                    height: getHeight(context) * 0.35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                  htmlToolbarOptions: HtmlToolbarOptions(
                    buttonBorderWidth: 1,
                    buttonBorderColor: Colors.red,
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: ElevatedButton(
                          onPressed: () {},
                          child: CustomText(
                            text: 'Create',
                            color: Colors.white,
                          ))))
            ],
          ),
        ),
      ),
    );
  }
}
