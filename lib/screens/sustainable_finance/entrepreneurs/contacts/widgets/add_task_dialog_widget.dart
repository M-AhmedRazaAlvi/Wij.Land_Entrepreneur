import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/contacts/search_person_widget.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../app_common_widgets/text_widget.dart';
import '../../../../../providers/entrepreneur/entrepreneur_contact_moment_provider.dart';
import '../../../../../utils/functions.dart';
import '../../../../../utils/hex_color.dart';
import '../../../../../utils/styles.dart';
import '../../../../office/widgets/comment_text.dart';
import '../search_farm_widget.dart';
import '../search_projects_widget.dart';

class AddNewTaskDialogWidget extends StatefulWidget {
  const AddNewTaskDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddNewTaskDialogWidget> createState() => _AddNewTaskDialogWidgetState();
}

class _AddNewTaskDialogWidgetState extends State<AddNewTaskDialogWidget> {
  @override
  void initState() {
    final provider = Provider.of<EntrepreneurContactMomentScreenProvider>(context, listen: false);

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
    return Consumer<EntrepreneurContactMomentScreenProvider>(builder: (context, _provider, widget) {
      return SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Assigned to".tr(),
                    size: 18.0,
                    color: HexColor('#231F20'),
                  ),
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
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: getWidth(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "Due Date".tr(),
                          size: 18.0,
                          color: HexColor('#231F20'),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            _provider.pickDate(
                              context: context,
                              enablePreviousDates: false,
                            );
                          },
                          child: TextWidgetField(
                            controller: _provider.mDateTimeTextController,
                            enabled: false,
                            suffixIcon: const Icon(Icons.calendar_today),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: getWidth(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "Status".tr(),
                          size: 18.0,
                          color: HexColor('#231F20'),
                        ),
                        const SizedBox(height: 10),
                        RealDropDownWidget(
                          value: _provider.selectedTaskStatus,
                          widthSize: getWidth(context),
                          onChanged: (newValue) {
                            setState(() {
                              _provider.selectedTaskStatus = newValue;
                            });
                          },
                          items: _provider.taskStatusList.map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(value: value, child: Text(value,style: TextStyle( fontFamily: Montserrat_Medium,),));
                            },
                          ).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomText(
                    text: "Related Farm".tr(),
                    size: 18.0,
                    color: HexColor('#231F20'),
                  ),
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
                  CustomText(
                    text: "Project".tr(),
                    size: 18.0,
                    color: HexColor('#231F20'),
                  ),
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
                  CustomText(
                    text: "Task Description".tr(),
                    size: 18.0,
                    color: HexColor('#231F20'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommentTextField(controller: _provider.mTaskDescriptionController),
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
                          padding: const EdgeInsets.only(top: 350),
                          child: SearchFarmDropDownWidget(mIsTaskFarmSearch: true),
                        )
                      : _provider.mShowProjectListWidget
                          ? Padding(
                              padding: const EdgeInsets.only(top: 450),
                              child: SearchProjectsDropDownWidget(),
                            )
                          : SizedBox()
            ],
          ),
        ),
      );
    });
  }
}
