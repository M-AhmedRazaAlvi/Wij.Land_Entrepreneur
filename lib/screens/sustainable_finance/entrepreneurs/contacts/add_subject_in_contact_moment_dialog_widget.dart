import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/utils/app_snackbars.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../../providers/entrepreneur/entrepreneur_contact_moment_provider.dart';
import '../../../office/widgets/add_text_button_widget.dart';
import '../../../office/widgets/comment_text.dart';

class SubjectDialogBox extends StatefulWidget {
  final int mEntrepreneurID, mContactMomentID;

  const SubjectDialogBox({
    Key? key,
    required this.mContactMomentID,
    required this.mEntrepreneurID,
  }) : super(key: key);

  @override
  State<SubjectDialogBox> createState() => _SubjectDialogBoxState();
}

class _SubjectDialogBoxState extends State<SubjectDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurContactMomentScreenProvider>(
      builder: (context, provider, widget) {
        return Container(
          width: MediaQuery.of(context).size.width * 0.7,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SingleChildScrollView(
            child: AlertDialog(
              title: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "Add Subject".tr(),
                          size: 40,
                          weight: FontWeight.bold,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              content: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomText(
                        text: "Project Related".tr(),
                        size: 20,
                      ),
                    ),
                    Wrap(
                      runSpacing: 2,
                      children: [
                        for (int i = 0;
                            i < provider.mCheckBoxDataList.length;
                            i++)
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: RealCheckBoxWidget(
                              value: provider.mCheckBoxDataList[i].status,
                              onChanged: (val) {
                                setState(
                                  () {
                                    provider.mCheckBoxDataList[i].status =
                                        !provider.mCheckBoxDataList[i].status;
                                  },
                                );
                              },
                              Labeltext: provider.mCheckBoxDataList[i].title,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(text: "Description".tr()),
                    const SizedBox(
                      height: 10,
                    ),
                    CommentTextField(
                        controller: provider.mNewSubjectDescriptionController),
                  ],
                ),
              ),
              actions: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AddTextButtonWidget(
                        text: "Cancel".tr(),
                        colors: Colors.white,
                        onPress: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      AddTextButtonWidget(
                        text: "Add Subject".tr(),
                        colors: Colors.yellow,
                        onPress: () {
                          if (provider
                              .mNewSubjectDescriptionController.text.isEmpty) {
                            AppSnackBars.showWarningSnackBar(
                                context: this.context,
                                message: "Description is required!".tr());
                            print("Clicked");
                            return;
                          }
                          provider.mSelectedDataList.clear();
                          for (var i = 0;
                              i < provider.mCheckBoxDataList.length;
                              i++) {
                            if (provider.mCheckBoxDataList[i].status == true) {
                              setState(() {
                                provider.mSelectedDataList
                                    .add(provider.mCheckBoxDataList[i].title);
                              });
                            }
                          }
                          if (provider.mSelectedDataList.isEmpty) {
                            AppSnackBars.showWarningSnackBar(
                                context: this.context,
                                message: "Subject is required!".tr());
                            return;
                          }

                          provider.addNewSubjectInContactMoment(
                            mEntrepreneurID: this.widget.mEntrepreneurID,
                            mContactMomentId: this.widget.mContactMomentID,
                            context: context,
                          );
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
