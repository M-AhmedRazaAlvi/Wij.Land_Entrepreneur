import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/models/entrepreneur/request/put_enterpreneur_person_request.dart';
import 'package:wij_land/providers/entrepreneur/entrepreneur_screen_overview_provider.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../app_common_widgets/text_widget.dart';
import '../../../../../models/entrepreneur/request/post_entrepreneur_person_request.dart';
import '../../../../../utils/functions.dart';
import '../../../../../utils/responsive.dart';
import '../../../../office/widgets/add_text_button_widget.dart';

class EditOverviewPersonDialogWidget extends StatefulWidget {
  EditOverviewPersonDialogWidget({Key? key, required this.isUpdate, required this.mEntrepreneurID, this.personId}) : super(key: key);
  bool? isUpdate;
  String? mEntrepreneurID, personId;

  @override
  State<EditOverviewPersonDialogWidget> createState() => _EditOverviewPersonDialogWidgetState();
}

class _EditOverviewPersonDialogWidgetState extends State<EditOverviewPersonDialogWidget> {
  bool isRole = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurOverviewScreenProvider>(
      builder: (BuildContext context, _provider, Widget? child) {
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
                          text: widget.isUpdate! ? "Edit Role".tr() : "Add Role".tr(),
                          size: 24,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: "Enterprise Name".tr()),
                    SizedBox(height: 6),
                    TextWidgetField(
                      controller: _provider.mEnterpriseNameController,
                      enabled: false,
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(child: CustomText(text: "Role".tr())),
                        SizedBox(
                          width: !Responsive.isDesktop(context)
                              ? 6
                              : !Responsive.isDesktop(context)
                                  ? 4
                                  : 12,
                        ),
                        Expanded(child: CustomText(text: "Position".tr())),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: getWidth(context) / 3.5,
                            child: RealDropDownWidget(
                              value: _provider.mSelectedRole,
                              onChanged: (va) {
                                /* if (_provider.mOverviewData.data!.persons!.isNotEmpty) {
                                  for (var element in _provider.mOverviewData.data!.persons!) {
                                    for (var value in element.positions!) {
                                      if (va.toString().toLowerCase() == 'owner' && value.role!.role![0].toString().toLowerCase() == 'owner') {
                                        showSnack('Owner Role already selected kindly choose other role');
                                      } else {
                                        setState(() {
                                          _provider.mSelectedRole = va;
                                        });
                                      }
                                    }
                                  }
                                } else {*/
                                setState(() {
                                  _provider.mSelectedRole = va;
                                });
                                // }
                              },
                              items: _provider.mRolesList.map<DropdownMenuItem<String>>((String values) {
                                return DropdownMenuItem<String>(
                                    value: values,
                                    child: Text(
                                      values,
                                      style: TextStyle(fontFamily: Montserrat_Medium),
                                    ));
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: !Responsive.isDesktop(context)
                              ? 6
                              : !Responsive.isDesktop(context)
                                  ? 4
                                  : 12,
                        ),
                        Expanded(
                            child: TextWidgetField(
                          controller: _provider.mPositionController,
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        isRole && _provider.mSelectedRole.isEmpty
                            ? CustomText(
                                text: "Role can't be empty".tr(),
                                size: 11,
                                color: Colors.red,
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                    SizedBox(height: 20),
                    CustomText(text: "Date".tr()),
                    SizedBox(height: 6),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextWidgetField(
                            controller: _provider.mDateTimeTextController,
                          ),
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
                              _provider.pickDate(context: context);
                            },
                            icon: Icon(
                              Icons.calendar_today_rounded,
                              color: Color(0xff768192),
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    CustomText(text: "Comment".tr()),
                    SizedBox(height: 6),
                    TextWidgetField(
                      maxLine: 5,
                      controller: _provider.mCommentsController,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              actions: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AddTextButtonWidget(
                        text: "Cancel".tr(),
                        colors: Colors.black12,
                        onPress: () {
                          isRole = false;
                          setState(() {});
                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      AddTextButtonWidget(
                        text: widget.isUpdate! ? "Edit Role".tr() : "Add Role".tr(),
                        colors: yellowishGreen,
                        onPress: () async {
                          if (widget.isUpdate!) {
                            /*  if (_provider.mDateTimeTextController.text.isEmpty) {
                              AppSnackBars.showWarningSnackBar(context: context, message: "Date is required");
                              return;
                            }*/

                            if (_provider.mSelectedRole.isEmpty) {
                              isRole = true;
                              setState(() {});
                              return;
                            }
                            /*  if (_provider.mCommentsController.text.isEmpty) {
                              AppSnackBars.showWarningSnackBar(context: context, message: "comments is required");
                              return;
                            }*/

                            /*   if (_provider.mPositionController.text.isEmpty) {
                              AppSnackBars.showWarningSnackBar(context: context, message: "Position is required");
                              return;
                            }*/
                            String date = _provider.mDateTimeTextController.text;
                            String newdate = '${date.split('-')[2]}-${date.split('-')[1]}-${date.split('-')[0]}';

                            PutEntrepreneurPersonRequest request = PutEntrepreneurPersonRequest(
                              comment: _provider.mCommentsController.text,
                              date: newdate,
                              position: _provider.mPositionController.text,
                              role: [_provider.mSelectedRole],
                            );

                            await _provider.updatePerson(int.parse(widget.mEntrepreneurID!), request, int.parse(widget.personId!));
                            if (_provider.updatePersonOfEntrepreneurResponse.status == 200) {
                              Navigator.of(context).pop();
                              await _provider.getOverviewData(int.parse(widget.mEntrepreneurID!), false);
                            } else {
                              showSnack(_provider.updatePersonOfEntrepreneurResponse.error!.message);
                            }
                          } else {
                            if (_provider.mSelectedRole.isEmpty) {
                              isRole = true;
                              setState(() {});
                              return;
                            }
                            String date = _provider.mDateTimeTextController.text;
                            String newDate = '${date.split('-')[2]}-${date.split('-')[1]}-${date.split('-')[0]}';

                            late PostEntrepreneurPersonRequest postEntrepreneurPersonRequest;

                            postEntrepreneurPersonRequest = PostEntrepreneurPersonRequest(
                              comment: _provider.mCommentsController.text,
                              date: newDate,
                              position: _provider.mPositionController.text,
                              role: [_provider.mSelectedRole],
                              person: Person(
                                addressMail: _provider.mMailingAddressController.text,
                                emailAddress: _provider.mEmailAddressController.text,
                                firstName: _provider.mFirstNameController.text,
                                lastName: _provider.mLastNameController.text,
                                phoneNumberHome: _provider.mPhoneNumberController.text,
                                phoneNumberMobile: _provider.mMobileNumberController.text,
                              ),
                            );

                            _provider.uploadFile(
                              true,
                              postEntrepreneurRequest: null,
                              isUpdate: false,
                              mEntrepreneurID: int.parse(widget.mEntrepreneurID!),
                              postEntrepreneurPersonRequest: postEntrepreneurPersonRequest,
                              dialogContext: context,
                            );
                            Navigator.of(context, rootNavigator: true).pop();
                            Navigator.of(context).pop();
                          }
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
