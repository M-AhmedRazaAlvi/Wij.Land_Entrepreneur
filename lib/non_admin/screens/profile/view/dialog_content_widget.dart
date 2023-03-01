import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app_common_widgets/common_elevated_button.dart';
import '../../../../app_common_widgets/common_text_form_field_widget.dart';
import '../../../../app_common_widgets/custom_text.dart';
import '../../../../utils/controller.dart';
import '../../../../utils/hex_color.dart';
import '../../../../utils/styles.dart';
import '../../../providers/person_profile_provider.dart';

class DialogContentWidget extends StatefulWidget {
  const DialogContentWidget({Key? key}) : super(key: key);

  @override
  State<DialogContentWidget> createState() => _DialogContentWidgetState();
}

class _DialogContentWidgetState extends State<DialogContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PersonProfileProvider>(builder: (context, provider, widget) {
      return SingleChildScrollView(
        child: SizedBox(
          // width: 500,
          // height: 550,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _TextWidget(
                mText: "Basic Information".tr(),
                mFontSize: 14,
                mFontWeight: FontWeight.w700,
                mColor: HexColor('#000000'),
              ),
              SizedBox(height: 15),
              _TextWidget(
                mText: "Upload Person Photo".tr(),
                mFontSize: 12,
                mFontWeight: FontWeight.w400,
                mColor: HexColor('#000000'),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  provider.isFIlePicked
                      ? DottedBorder(
                          borderType: BorderType.RRect,
                          dashPattern: const [3, 3],
                          strokeWidth: 0.5,
                          color: Colors.grey,
                          padding: EdgeInsets.all(6),
                          child: Image.memory(
                            provider.mUserImagePath,
                            fit: BoxFit.cover,
                            height: 40,
                            width: 40,
                          ))
                      : provider.mShowNetworkImage
                          ? provider.mImagePath.isEmpty
                              ? SizedBox()
                              : DottedBorder(
                                  borderType: BorderType.RRect,
                                  dashPattern: const [3, 3],
                                  strokeWidth: 0.5,
                                  color: Colors.grey,
                                  padding: EdgeInsets.all(6),
                                  child: Image.network(
                                    provider.mImagePath,
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.cover,
                                  ),
                                )
                          : SizedBox(),
                  SizedBox(width: 8),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: const [3, 3],
                    strokeWidth: 0.5,
                    color: Colors.grey,
                    padding: EdgeInsets.all(6),
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            provider.pickUserImage();
                            setState(() {});
                          },
                          icon: Icon(Icons.add),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "First Name".tr(),
                      style: TextStyle(
                        color: HexColor('#000000'),
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                          fontFamily: Montserrat_Medium
                      ),
                    ),
                    TextSpan(
                      text: "*",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                          fontFamily: Montserrat_Medium
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              SizedBox(
                height: 40,
                child: CommonTextFormFieldWidget(
                  mTextEditingController: provider.mFirstNameController,
                  isObscureText: false,
                  mIsEnabled: true,
                ),
              ),
              provider.isFormNotValid && provider.mFirstNameController.text.isEmpty
                  ? CustomText(
                      text: "First name is required!".tr(),
                      size: 11,
                      color: Colors.red,
                    )
                  : SizedBox(),
              SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Last Name".tr(),
                      style: TextStyle(
                        color: HexColor('#000000'),
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                          fontFamily: Montserrat_Medium
                      ),
                    ),
                    TextSpan(
                      text: "*",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                          fontFamily: Montserrat_Medium
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              SizedBox(
                height: 40,
                child: CommonTextFormFieldWidget(
                  mTextEditingController: provider.mLastNameController,
                  isObscureText: false,
                  mIsEnabled: true,
                ),
              ),
              provider.isFormNotValid && provider.mLastNameController.text.isEmpty
                  ? CustomText(
                      text: "Last name is required!".tr(),
                      size: 11,
                      color: Colors.red,
                    )
                  : SizedBox(),
              SizedBox(height: 5),
              _TextWidget(
                mText: "Email Address".tr(),
                mFontSize: 12,
                mFontWeight: FontWeight.w400,
                mColor: HexColor('#000000'),
              ),
              SizedBox(height: 5),
              SizedBox(
                height: 40,
                child: CommonTextFormFieldWidget(
                  mTextEditingController: provider.mEmailAddressController,
                  isObscureText: false,
                  mIsEnabled: true,
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _TextWidget(
                          mText: "Phone Number (Mobile)".tr(),
                          mFontSize: 12,
                          mFontWeight: FontWeight.w400,
                          mColor: HexColor('#000000'),
                        ),
                        SizedBox(height: 5),
                        SizedBox(
                          height: 40,
                          child: CommonTextFormFieldWidget(
                            mTextEditingController: provider.mMobileNumberController,
                            isObscureText: false,
                            mIsEnabled: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _TextWidget(
                          mText: "Phone Number (Home)".tr(),
                          mFontSize: 12,
                          mFontWeight: FontWeight.w400,
                          mColor: HexColor('#000000'),
                        ),
                        SizedBox(height: 5),
                        SizedBox(
                          height: 40,
                          child: CommonTextFormFieldWidget(
                            mTextEditingController: provider.mPhoneNumberController,
                            isObscureText: false,
                            mIsEnabled: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              _TextWidget(
                mText: "Mailing Address".tr(),
                mFontSize: 12,
                mFontWeight: FontWeight.w400,
                mColor: HexColor('#000000'),
              ),
              SizedBox(height: 5),
              SizedBox(
                height: 40,
                child: CommonTextFormFieldWidget(
                  mTextEditingController: provider.mMailingAddressController,
                  isObscureText: false,
                  mIsEnabled: true,
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: CommonElevatedButton(
                      mOnTap: () {Navigator.pop(context);},
                      mButtonText: "Cancel".tr(),
                      mButtonColor: Colors.grey.shade200,
                    ),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: CommonElevatedButton(
                      mOnTap: () {
                        setState(() {
                          provider.updateState();
                        });
                        if (provider.mFirstNameController.text.isEmpty) {
                          return;
                        }

                        if (provider.mLastNameController.text.isEmpty) {
                          return;
                        }
                        Navigator.pop(context);
                        provider.uploadFile(
                          context: context,
                          id: authController.myUser.value.personId!,
                        );
                      },
                      mButtonText: "Update".tr(),
                      mButtonColor: Colors.amber,
                    ),
                  ),
                  SizedBox(width: 8)
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}

class _TextWidget extends StatelessWidget {
  final String mText;
  final Color mColor;
  final double mFontSize;
  final FontWeight mFontWeight;
  final FontStyle? mFontStyle;

  const _TextWidget({
    Key? key,
    required this.mText,
    required this.mColor,
    required this.mFontSize,
    required this.mFontWeight,
    this.mFontStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      mText,
      style: TextStyle(
        color: mColor,
        fontSize: mFontSize,
        fontWeight: mFontWeight,
        fontStyle: mFontStyle,
          fontFamily: Montserrat_Medium
      ),
    );
  }
}
