import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../../app_common_widgets/common_text_form_field_widget.dart';
import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../app_common_widgets/text_widget.dart';
import '../../../../../providers/entrepreneur/entrepreneur_screen_overview_provider.dart';
import '../../../../../utils/functions.dart';
import '../../../../../utils/googleAutoCompleteSearch.dart';
import '../../../../../utils/responsive.dart';

class AddOverviewPersonDialogWidget extends StatefulWidget {
  final int mEntrepreneurID;
  final bool isUpdate;
  final int mPersonId;

  const AddOverviewPersonDialogWidget({
    Key? key,
    required this.mEntrepreneurID,
    required this.isUpdate,
    required this.mPersonId,
  }) : super(key: key);

  @override
  State<AddOverviewPersonDialogWidget> createState() =>
      _AddOverviewPersonDialogWidgetState();
}

class _AddOverviewPersonDialogWidgetState
    extends State<AddOverviewPersonDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurOverviewScreenProvider>(
      builder: (context, _provider, widget) {
        return SizedBox(
          width: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width * 0.4
              : MediaQuery.of(context).size.width * 0.6,
          child: SingleChildScrollView(
              child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                this.widget.isUpdate
                    ? SizedBox()
                    : Row(
                        children: [
                          Expanded(child: CustomText(text: "First Name".tr())),
                          SizedBox(
                            width: !Responsive.isDesktop(context)
                                ? 6
                                : !Responsive.isDesktop(context)
                                    ? 4
                                    : 12,
                          ),
                          Expanded(
                            child: CustomText(text: "Last Name".tr()),
                          ),
                        ],
                      ),
                this.widget.isUpdate
                    ? SizedBox()
                    : SizedBox(
                        height: 6,
                      ),
                this.widget.isUpdate
                    ? SizedBox()
                    : SizedBox(
                        width: getWidth(context),
                        child: Row(
                          children: [
                            Expanded(
                              child: CommonTextFormFieldWidget(
                                mTextEditingController:
                                    _provider.mFirstNameController,
                                mKeyboardType: TextInputType.text,
                                mLabelText: "",
                                mHintText: "",
                                isObscureText: false,
                                mIsEnabled: this.widget.isUpdate ? false : true,
                                onChange: (va) {
                                  _provider.mFirstNameController.text = va;
                                  _provider.mFirstNameController.selection =
                                      TextSelection.fromPosition(TextPosition(
                                          offset: _provider.mFirstNameController
                                              .text.length));
                                  setState(() {});
                                },
                              ),
                            ),
                            SizedBox(
                              width: !Responsive.isDesktop(context) ? 6 : 12,
                            ),
                            Expanded(
                              child: CommonTextFormFieldWidget(
                                mTextEditingController:
                                    _provider.mLastNameController,
                                mKeyboardType: TextInputType.text,
                                mLabelText: "",
                                mHintText: "",
                                isObscureText: false,
                                mIsEnabled: this.widget.isUpdate ? false : true,
                                onChange: (va) {
                                  _provider.mLastNameController.text = va;
                                  _provider.mLastNameController.selection =
                                      TextSelection.fromPosition(TextPosition(
                                          offset: _provider.mLastNameController
                                              .text.length));
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                SizedBox(
                  height: 2,
                ),
                this.widget.isUpdate
                    ? SizedBox()
                    : SizedBox(
                        width: getWidth(context),
                        child: Row(
                          children: [
                            Expanded(
                              child: _provider.isFirst &&
                                      _provider
                                          .mFirstNameController.text.isEmpty
                                  ? CustomText(
                                      text: "First Name can't be empty".tr(),
                                      size: 11,
                                      color: Colors.red,
                                    )
                                  : SizedBox.shrink(),
                            ),
                            SizedBox(
                              width: !Responsive.isDesktop(context) ? 6 : 12,
                            ),
                            Expanded(
                                child: _provider.isLast &&
                                        _provider
                                            .mLastNameController.text.isEmpty
                                    ? CustomText(
                                        text: "Last Name can't be empty".tr(),
                                        size: 11,
                                        color: Colors.red,
                                      )
                                    : SizedBox.shrink())
                          ],
                        ),
                      ),
                this.widget.isUpdate
                    ? SizedBox()
                    : SizedBox(
                        height: 20,
                      ),
                this.widget.isUpdate
                    ? SizedBox()
                    : CustomText(text: "E-mail".tr()),
                this.widget.isUpdate
                    ? SizedBox()
                    : SizedBox(
                        height: 6,
                      ),
                this.widget.isUpdate
                    ? SizedBox()
                    : CommonTextFormFieldWidget(
                        mTextEditingController:
                            _provider.mEmailAddressController,
                        mKeyboardType: TextInputType.emailAddress,
                        mLabelText: "",
                        mHintText: "",
                        isObscureText: false,
                        mIsEnabled: this.widget.isUpdate ? false : true,
                      ),
                this.widget.isUpdate
                    ? SizedBox()
                    : SizedBox(
                        height: 20,
                      ),
                this.widget.isUpdate
                    ? SizedBox()
                    : SizedBox(
                        width: getWidth(context),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomText(text: "Mobile number".tr()),
                            ),
                            SizedBox(
                              width: !Responsive.isDesktop(context) ? 6 : 12,
                            ),
                            Expanded(
                              child: CustomText(text: "Phone number".tr()),
                            ),
                          ],
                        ),
                      ),
                this.widget.isUpdate
                    ? SizedBox()
                    : SizedBox(
                        height: 6,
                      ),
                this.widget.isUpdate
                    ? SizedBox()
                    : SizedBox(
                        width: getWidth(context),
                        child: Row(
                          children: [
                            Expanded(
                              child: CommonTextFormFieldWidget(
                                mTextEditingController:
                                    _provider.mMobileNumberController,
                                mKeyboardType: TextInputType.number,
                                mInputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]'),
                                  ),
                                ],
                                onChange: (va) {
                                  _provider.mMobileNumberController.text = va;
                                  _provider.mMobileNumberController.selection =
                                      TextSelection.fromPosition(TextPosition(
                                          offset: _provider
                                              .mMobileNumberController
                                              .text
                                              .length));
                                  setState(() {});
                                },
                                mLabelText: "",
                                mHintText: "",
                                isObscureText: false,
                                mIsEnabled: this.widget.isUpdate ? false : true,
                              ),
                            ),
                            SizedBox(
                              width: !Responsive.isDesktop(context) ? 6 : 12,
                            ),
                            Expanded(
                              child: CommonTextFormFieldWidget(
                                mTextEditingController:
                                    _provider.mPhoneNumberController,
                                mLabelText: "",
                                mHintText: "",
                                mIsEnabled: this.widget.isUpdate ? false : true,
                                isObscureText: false,
                                mKeyboardType: TextInputType.number,
                                mInputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                SizedBox(
                  height: 2,
                ),
                _provider.isMobile &&
                        _provider.mMobileNumberController.text.isEmpty
                    ? CustomText(
                        text: "Mobile Number can't be empty".tr(),
                        size: 11,
                        color: Colors.red,
                      )
                    : SizedBox.shrink(),
                this.widget.isUpdate
                    ? SizedBox()
                    : SizedBox(
                        height: 20,
                      ),
                this.widget.isUpdate
                    ? SizedBox()
                    : CustomText(text: "Mailing Address ".tr()),
                this.widget.isUpdate
                    ? SizedBox()
                    : SizedBox(
                        height: 6,
                      ),
                this.widget.isUpdate
                    ? SizedBox()
                    : InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                  child: Container(
                                    height: 450,
                                    width: 400,
                                    padding: EdgeInsets.all(10),
                                    child: GoogleSearchWidget(
                                      adddress: (String detail) {
                                        setState(() {
                                          print('result search ${detail}');
                                          _provider.mMailingAddressController
                                              .text = detail;
                                        });
                                      },
                                      lat: (double lat) {
                                        setState(() {
                                          _provider.mPostAddressLatitude =
                                              lat.toString();
                                        });
                                      },
                                      lng: (double lng) {
                                        setState(() {
                                          _provider.mPostAddressLongitude =
                                              lng.toString();
                                        });
                                      },
                                    ),
                                  ),
                                );
                              });
                        },
                        child: TextWidgetField(
                          controller: _provider.mMailingAddressController,
                          enabled: false,
                          suffixIcon: const Icon(Icons.search),
                        ),
                      ),

                /*  CommonTextFormFieldWidget(
                        mTextEditingController: _provider.mMailingAddressController,
                        //mKeyboardType: TextInputType.emailAddress,
                        mLabelText: "",
                        mHintText: "",
                        isObscureText: false,
                        mIsEnabled: true,
                        mOnTap: () {
                          if (!this.widget.isUpdate) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                                    child: Container(
                                      height: 450,
                                      width: 400,
                                      color: Colors.white,
                                      padding: EdgeInsets.all(10),
                                      child: GoogleSearchWidget(
                                        adddress: (String detail) {
                                          _provider.mMailingAddressController.text = detail;
                                        },
                                        lng: (lng) {},
                                        lat: (lat) {},
                                      ),
                                    ),
                                  );
                                }).then((value) {
                              setState(() {});
                            });
                          }
                        },
                        //mIsEnabled: this.widget.isUpdate ? false : true,
                      ),*/
                /*     Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(text: "Date"),
                    SizedBox(
                      height: 6,
                    ),
                    Stack(
                      children: [
                        TextWidgetField(
                          controller: _provider.mDateTimeTextController,
                          enabled: false,
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
                              _provider.pickDateTime(context: context);
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
                  ],
                ),
                SizedBox(height: 20),
                CustomText(text: "Comments"),
                SizedBox(height: 6),
                CommonTextFormFieldWidget(
                  mTextEditingController: _provider.mCommentsController,
                  mKeyboardType: TextInputType.text,
                  mLabelText: "",
                  mHintText: "",
                  mMaxLines: 4,
                  isObscureText: false,
                  mIsEnabled: true,
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: getWidth(context),
                  child: Row(
                    children: [
                      Expanded(
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
                      ),
                    ],
                  ),
                ),*/
                SizedBox(height: 20),
                this.widget.isUpdate
                    ? SizedBox()
                    : CustomText(
                        text: "Upload profile image".tr(),
                        size: 14,
                        color: Color(0xff333333),
                        weight: FontWeight.w400,
                      ),
                this.widget.isUpdate ? SizedBox() : SizedBox(height: 20),
                this.widget.isUpdate
                    ? SizedBox()
                    : DottedBorder(
                        borderType: BorderType.RRect,
                        dashPattern: const [4, 4],
                        radius: Radius.circular(4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                          child: SizedBox(
                            height: 60,
                            width: 60,
                            child: _provider.mUserImagePath == null
                                ? IconButton(
                                    onPressed: () {
                                      _provider.pickUserImage();
                                    },
                                    icon: FaIcon(
                                      FontAwesomeIcons.plus,
                                      color: Color(0xff3c4b64),
                                      size: 16,
                                    ),
                                  )
                                : IconButton(
                                    onPressed: () {
                                      _provider.pickUserImage();
                                    },
                                    icon: Image.memory(
                                      _provider.mUserImagePath,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                SizedBox(height: 20),
              ],
            ),
          )),
        );
      },
    );
  }
}
