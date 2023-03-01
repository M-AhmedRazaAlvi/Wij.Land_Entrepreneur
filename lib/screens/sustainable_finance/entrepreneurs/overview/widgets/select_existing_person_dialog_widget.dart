import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/models/entrepreneur/request/update_person_of_entrepreneur_request.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/overview/widgets/search_person_drop_down_widget.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../../../app_common_widgets/common_text_form_field_widget.dart';
import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../app_common_widgets/text_widget.dart';
import '../../../../../providers/entrepreneur/entrepreneur_screen_overview_provider.dart';
import '../../../../../utils/app_snackbars.dart';
import '../../../../../utils/functions.dart';
import '../../../../../utils/responsive.dart';
import '../../../../office/widgets/add_text_button_widget.dart';

class SelectExistingPersonDialogWidget extends StatefulWidget {
  final int mEntrepreneurID;

  const SelectExistingPersonDialogWidget({Key? key, required this.mEntrepreneurID}) : super(key: key);

  @override
  State<SelectExistingPersonDialogWidget> createState() => _SelectExistingPersonDialogWidgetState();
}

class _SelectExistingPersonDialogWidgetState extends State<SelectExistingPersonDialogWidget> {
  @override
  void initState() {
    var mProvider = Provider.of<EntrepreneurOverviewScreenProvider>(context, listen: false);
    mProvider.mPersonSearchController.addListener(() {
      if (mProvider.mPersonSearchController.text.isNotEmpty) {
        mProvider.searchOrganizePerson(value: mProvider.mPersonSearchController.text);
        setState(() {
          mProvider.mShowPersonsListWidget = true;
        });
      } else {
        setState(() {
          mProvider.mShowPersonsListWidget = false;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurOverviewScreenProvider>(
      builder: (context, _provider, widget) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
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
                          text: "Select Existing Person".tr(),
                          size: 30,
                          weight: FontWeight.bold,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              content: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        CustomText(text: "Person Name".tr()),
                        SizedBox(height: 6),
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
                        SizedBox(height: 20),
                        CustomText(text: "Enterprise Name".tr()),
                        SizedBox(height: 6),
                        TextWidgetField(
                          controller: _provider.mEnterpriseNameController,
                          enabled: false,
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                                child: CustomText(
                              text: 'Role'.tr(),
                            )),
                            SizedBox(width: 12,),

                            Expanded(
                                child: CustomText(
                              text: 'Position'.tr(),
                            )),
                            /*Expanded(
                              child: SelectableDropdownWidget(
                                items: _provider.mRolesList,
                                title: "Role",
                                mSelectedValue: _provider.mSelectedRole,
                                mSelectedItemsList: _provider.mSelectedRoleTypesList,
                                mOnDropDownChange: (value) {
                                  setState(
                                    () {
                                      _provider.mSelectedRole = value as String;
                                      if (!_provider.mSelectedRoleTypesList.contains(_provider.mSelectedRole)) {
                                        _provider.mSelectedRoleTypesList.add(_provider.mSelectedRole);
                                      }
                                    },
                                  );
                                },
                              ),
                            ),*/
                          ],
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Expanded(child: RealDropDownWidget(value: _provider.mSelectedRole,onChanged:(va){
                              _provider.mSelectedRole = va;
                              setState(() {});
                            } ,items:_provider.mRolesList.map<DropdownMenuItem<String>>(
                                    (String values) {
                                  return DropdownMenuItem<String>(
                                      value: values, child: CustomText(text:values));
                                }).toList() ,)),
                            SizedBox(width: 12,),
                            Expanded(child:TextWidgetField(controller: _provider.mPositionController)),
                          ],
                        ),
                        SizedBox(height: 20),
                        CustomText(text: "Date".tr()),
                        SizedBox(height: 6),
                        Stack(
                          children: [
                            TextWidgetField(
                              controller: _provider.mDateTimeTextController,
                            ),
                            Positioned(
                              right: !Responsive.isDesktop(context)
                                  ? getWidth(context) / 100
                                  : !Responsive.isDesktop(context)
                                      ? getWidth(context) / 100
                                      : getWidth(context) / 150,
                              top: !Responsive.isDesktop(context)
                                  ? getWidth(context) / 80
                                  : !Responsive.isDesktop(context)
                                      ? getWidth(context) / 100
                                      : getWidth(context) / 200,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  _provider.pickDate(context: context,);
                                },
                                icon: Icon(
                                  CupertinoIcons.calendar,
                                  color: Color(0xff768192),
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        CustomText(text: "Comments".tr()),
                        SizedBox(height: 6),
                        CommonTextFormFieldWidget(
                          mTextEditingController: _provider.mCommentsController,
                          mKeyboardType: TextInputType.text,
                          mLabelText: "",
                          mHintText: "",
                          isObscureText: false,
                          mIsEnabled: true,
                          mMaxLines: 5,
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                    _provider.mShowPersonsListWidget
                        ? Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: SearchPersonDropDownWidget(),
                          )
                        : SizedBox()
                  ],
                ),
              ),
              actions: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AddTextButtonWidget(
                        text: "Cancel".tr(),
                        colors: Colors.black12,
                        onPress: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      AddTextButtonWidget(
                        text: "Add Member".tr(),
                        colors: yellowishGreen,
                        onPress: () {
                          if (_provider.mDateTimeTextController.text.isEmpty) {
                            AppSnackBars.showWarningSnackBar(context: context, message: "Date is required".tr());
                            return;
                          }
                          if (_provider.mSearchedPersonId == 0) {
                            AppSnackBars.showWarningSnackBar(context: context, message: "Person is required!".tr());
                            return;
                          }

                          if (_provider.mEnterpriseNameController.text.isEmpty) {
                            AppSnackBars.showWarningSnackBar(context: context, message: "Enterprise name is required!".tr());

                            return;
                          }


                          if (_provider.mPositionController.text.isEmpty) {
                            AppSnackBars.showWarningSnackBar(context: context, message: "Position is required!".tr());

                            return;
                          }

                          if (_provider.mSelectedRole.isEmpty) {
                            AppSnackBars.showWarningSnackBar(context: context, message: "Role is required".tr());
                            return;
                          }

                          Navigator.pop(context);

                          /*late PostEntrepreneurPersonRequest postEntrepreneurPersonRequest;

                          postEntrepreneurPersonRequest = PostEntrepreneurPersonRequest(
                            comment: _provider.mCommentsController.text,
                            date: _provider.mSelectedDateTime!.toString(),
                            position: "Employee Role",
                            role: _provider.mSelectedRoleTypesList,
                            person: Person(
                              addressMail: "",
                              emailAddress: "",
                              firstName: "",
                              lastName: "",
                              phoneNumberHome: "",
                              phoneNumberMobile: "",
                            ),
                          );
*/
                          String date = _provider.mDateTimeTextController.text;
                          String newdate = '${date.split('-')[2]}-${date.split('-')[1]}-${date.split('-')[0]}';

                          UpdatePersonOfEntrepreneur updatePerson=UpdatePersonOfEntrepreneur(
                            comment: _provider.mCommentsController.text,
                            date:  newdate,
                            role: [_provider.mSelectedRole],
                            position: _provider.mPositionController.text,
                            personId: _provider.mSearchedPersonId.toString(),
                          );
                          _provider.addExistingPerson(
                            this.widget.mEntrepreneurID,
                            updatePerson,
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
