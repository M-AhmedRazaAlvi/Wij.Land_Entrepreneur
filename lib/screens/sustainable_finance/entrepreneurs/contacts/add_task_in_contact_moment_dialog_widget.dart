import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/contacts/search_farm_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/contacts/search_person_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/contacts/search_projects_widget.dart';
import 'package:wij_land/utils/app_snackbars.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../utils/functions.dart';
import '../../../../../../utils/responsive.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../app_common_widgets/text_widget.dart';
import '../../../../models/entrepreneur/request/post_entrepreneur_task_request.dart';
import '../../../../providers/entrepreneur/entrepreneur_contact_moment_provider.dart';
import '../../../../utils/controller.dart';
import '../../../office/widgets/add_text_button_widget.dart';
import '../../../office/widgets/comment_text.dart';

class AddTasksDialogBox extends StatefulWidget {
  final int? mEntrepreneurID, mContactPersonID;

  const AddTasksDialogBox({
    Key? key,
    this.mEntrepreneurID,
    this.mContactPersonID,
  }) : super(key: key);

  @override
  State<AddTasksDialogBox> createState() => _AddTasksDialogBoxState();
}

class _AddTasksDialogBoxState extends State<AddTasksDialogBox> {
  @override
  void initState() {
    final provider = Provider.of<EntrepreneurContactMomentScreenProvider>(
        context,
        listen: false);
    provider.mPersonSearchController.addListener(() {
      if (provider.mPersonSearchController.text.isNotEmpty) {
        provider.searchPerson(value: provider.mPersonSearchController.text);
        setState(() {
          provider.mShowPersonsListWidget = true;
        });
      } else {
        setState(() {
          provider.mShowPersonsListWidget = false;
        });
      }
    });

    provider.mFarmSearchController.addListener(() {
      if (provider.mFarmSearchController.text.isNotEmpty) {
        provider.searchFarm(value: provider.mFarmSearchController.text);
        setState(() {
          provider.mShowFarmListWidget = true;
        });
      } else {
        setState(() {
          provider.mShowFarmListWidget = false;
        });
      }
    });

    provider.mProjectSearchController.addListener(() {
      if (provider.mProjectSearchController.text.isNotEmpty) {
        provider.searchProject(value: provider.mProjectSearchController.text);
        setState(() {
          provider.mShowProjectListWidget = true;
        });
      } else {
        setState(() {
          provider.mShowProjectListWidget = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurContactMomentScreenProvider>(
        builder: (context, _provider, widget) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.7,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: AlertDialog(
            title: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Add Task".tr(),
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
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "Assigned to".tr()),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _provider.mPersonSearchController,
                        cursorColor: Colors.black,
                        cursorWidth: 1,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.black26,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Colors.black26,
                                width: 0.5,
                              ),
                            ),
                            suffixIcon: Icon(Icons.search)),
                      ),
                      const SizedBox(height: 15),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.end,
                        spacing: 15,
                        runSpacing: 20,
                        children: [
                          SizedBox(
                            width: !Responsive.isDesktop(context)
                                ? getWidth(context)
                                : !Responsive.isDesktop(context)
                                    ? getWidth(context) / 2.42
                                    : getWidth(context) / 2.35,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(text: "Due Date".tr()),
                                const SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    _provider.pickDate(
                                      context: context,
                                      enablePreviousDates: false,
                                    );
                                  },
                                  child: TextWidgetField(
                                    controller:
                                        _provider.mDateTimeTextController,
                                    enabled: false,
                                    suffixIcon:
                                        const Icon(Icons.calendar_today),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: !Responsive.isDesktop(context)
                                ? getWidth(context)
                                : !Responsive.isDesktop(context)
                                    ? getWidth(context) / 2.42
                                    : getWidth(context) / 2.35,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(text: "Status".tr()),
                                const SizedBox(
                                  height: 10,
                                ),
                                RealDropDownWidget(
                                  value: _provider.selectedTaskStatus,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _provider.selectedTaskStatus = newValue;
                                    });
                                  },
                                  items: _provider.taskStatusList
                                      .map<DropdownMenuItem<String>>(
                                    (String value) {
                                      return DropdownMenuItem<String>(
                                          value: value, child: Text(value));
                                    },
                                  ).toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(text: "Related Farm".tr()),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _provider.mFarmSearchController,
                        cursorColor: Colors.black,
                        cursorWidth: 1,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.black26,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Colors.black26,
                                width: 0.5,
                              ),
                            ),
                            suffixIcon: Icon(Icons.search)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomText(text: "Project".tr()),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _provider.mProjectSearchController,
                        cursorColor: Colors.black,
                        cursorWidth: 1,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.black26,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Colors.black26,
                                width: 0.5,
                              ),
                            ),
                            suffixIcon: Icon(Icons.search)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomText(text: "Task Description".tr()),
                      const SizedBox(
                        height: 10,
                      ),
                      CommentTextField(
                          controller: _provider.mTaskDescriptionController),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  _provider.mShowPersonsListWidget
                      ? Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: SearchPersonDropDownWidget(),
                        )
                      : _provider.mShowFarmListWidget
                          ? Padding(
                              padding: const EdgeInsets.only(top: 250),
                              child: SearchFarmDropDownWidget(
                                  mIsTaskFarmSearch: true),
                            )
                          : _provider.mShowProjectListWidget
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 350),
                                  child: SearchProjectsDropDownWidget(),
                                )
                              : SizedBox()
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
                      text: "Add Task".tr(),
                      colors: Colors.yellow,
                      onPress: () {
                        if (_provider.mSearchedPersonId == 0) {
                          AppSnackBars.showWarningSnackBar(
                              context: context,
                              message: "Person is required!".tr());
                          print("Person is missing");
                          return;
                        }
                        if (_provider.mDateTimeTextController.text.isEmpty) {
                          AppSnackBars.showWarningSnackBar(
                              context: context,
                              message: "Date is required!".tr());
                          print("Date time is missing");
                          return;
                        }
                        if (_provider.selectedTaskStatus == 'Select status') {
                          AppSnackBars.showWarningSnackBar(
                              context: context,
                              message: "Task Status is required!".tr());
                          print("Task time is missing");
                          return;
                        }
                        if (_provider.mTaskDescriptionController.text.isEmpty) {
                          AppSnackBars.showWarningSnackBar(
                              context: context,
                              message: "Task Description is required!".tr());
                          print("Description is missing");
                          return;
                        }
                        if (_provider.mSearchedFarmId == 0) {
                          AppSnackBars.showWarningSnackBar(
                              context: context,
                              message: "Farm is required!".tr());
                          print("Farm is missing");
                          return;
                        }

                        if (_provider.mSearchedProjectId == 0) {
                          AppSnackBars.showWarningSnackBar(
                              context: context,
                              message: "Project is required!".tr());
                          print("Project is missing");
                          return;
                        }
                        late PostEntrepreneurTaskRequest
                            entrepreneurTaskRequest;

                        entrepreneurTaskRequest = PostEntrepreneurTaskRequest(
                            assignedToId:
                                _provider.mSearchedPersonId.toString(),
                            farmId: _provider.mSearchedFarmId.toString(),
                            projectId: _provider.mSearchedProjectId.toString(),
                            taskDescription:
                                _provider.mTaskDescriptionController.text,
                            taskDueDate:
                                _provider.mSelectedDateTimeForTask.toString(),
                            assignedById:
                                authController.myUser.value.id.toString(),
                            taskStatus: [
                              _provider.selectedTaskStatus.toString(),
                            ]);

                        _provider.addNewTaskInContactMoment(
                          mEntrepreneurID: this.widget.mEntrepreneurID!,
                          mContactMomentId: this.widget.mContactPersonID!,
                          context: context,
                          isUpdateScreen: false,
                          entrepreneurTaskRequest: entrepreneurTaskRequest,
                        );

//                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
