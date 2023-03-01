import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/widgets/search_projects_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/widgets/social_design.dart';

import '../../../../app_common_widgets/common_text_form_field_widget.dart';
import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../../providers/entrepreneur/entrepreneur_screen_provider.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/googleAutoCompleteSearch.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';

class DetailsEnterpriseDialogWidget extends StatefulWidget {
  const DetailsEnterpriseDialogWidget({Key? key}) : super(key: key);

  @override
  State<DetailsEnterpriseDialogWidget> createState() =>
      _DetailsEnterpriseDialogWidgetState();
}

class _DetailsEnterpriseDialogWidgetState
    extends State<DetailsEnterpriseDialogWidget> {
  @override
  void initState() {
    final provider =
        Provider.of<EntrepreneurScreenProvider>(context, listen: false);
    provider.mProjectController.addListener(() {
      if (provider.mProjectController.text.isNotEmpty) {
        provider.searchProject(value: provider.mProjectController.text);
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
    return Consumer<EntrepreneurScreenProvider>(
      builder: (context, _provider, widget) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Visiting Address".tr(),
                        size: Responsive.isDesktop(context) ? 14 : 12,
                        weight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      CommonTextFormFieldWidget(
                        mTextEditingController:
                            _provider.mVisitingAddressController,
                        isObscureText: false,
                        mIsEnabled: true,
                        mOnTap: () {
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
                                          _provider.mVisitingAddressController
                                              .text = detail;
                                        });
                                      },
                                      lat: (double lat) {
                                        setState(() {
                                          _provider.mVisitingAddressLatitude =
                                              lat.toString();
                                        });
                                      },
                                      lng: (double lng) {
                                        setState(() {
                                          _provider.mVisitingAddressLongitude =
                                              lng.toString();
                                        });
                                      },
                                    ),
                                  ),
                                );
                              });
                        },
                        mPrefixIconWidget: Icon(
                          Icons.search,
                          size: 20,
                          color: Color(0xff768192),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      _provider.isVisitingAddress &&
                              _provider.mVisitingAddressController.text.isEmpty
                          ? CustomText(
                              text: "Visiting address can't be empty".tr(),
                              size: 11,
                              color: Colors.red,
                            )
                          : SizedBox.shrink(),
                      SizedBox(
                        height: 20,
                      ),
                      Flex(
                        direction: !Responsive.isDesktop(context)
                            ? Axis.vertical
                            : Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: "Focus Area".tr(),
                                    size:
                                        Responsive.isDesktop(context) ? 14 : 12,
                                    weight: FontWeight.w500),
                                SizedBox(
                                  height: !Responsive.isDesktop(context)
                                      ? 6
                                      : !Responsive.isDesktop(context)
                                          ? 4
                                          : 12,
                                ),
                                SizedBox(
                                  width: !Responsive.isDesktop(context)
                                      ? getWidth(context)
                                      : getWidth(context) * 0.21,
                                  child: RealDropDownWidget(
                                    value: _provider.mSelectedFocusAreaType,
                                    onChanged: (va) {
                                      setState(
                                        () {
                                          _provider.mSelectedFocusAreaType = va;
                                        },
                                      );
                                    },
                                    items: _provider
                                        .focusAreaDropDownModel.data!
                                        .map<DropdownMenuItem<String>>(
                                      (String values) {
                                        return DropdownMenuItem<String>(
                                          value: values,
                                          child: Text(values),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 12,
                            width: 12,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Entrepreneur Relation to Wij.land".tr(),
                                  size: Responsive.isDesktop(context) ? 14 : 12,
                                  weight: FontWeight.w500,
                                  textAligns: TextAlign.start,
                                ),
                                SizedBox(
                                  height:
                                      !Responsive.isDesktop(context) ? 6 : 12,
                                ),
                                SizedBox(
                                  width: !Responsive.isDesktop(context)
                                      ? getWidth(context)
                                      : getWidth(context) * 0.21,
                                  child: RealDropDownWidget(
                                    value: _provider
                                        .mSelectedEntrepreneurRelationToWijLandType,
                                    onChanged: (va) {
                                      setState(
                                        () {
                                          _provider
                                              .mSelectedEntrepreneurRelationToWijLandType = va;
                                        },
                                      );
                                    },
                                    items: _provider
                                        .entrepreneurRelationToWijLandDropDownModel
                                        .data!
                                        .map<DropdownMenuItem<String>>(
                                      (String values) {
                                        return DropdownMenuItem<String>(
                                          value: values,
                                          child: Text(values,style: TextStyle(fontFamily: Montserrat_Medium),),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _provider.isFocusArea &&
                                  _provider.mSelectedFocusAreaType.isEmpty
                              ? Expanded(
                                  child: CustomText(
                                    text: "Focus area type can't be empty".tr(),
                                    size: 11,
                                    color: Colors.red,
                                  ),
                                )
                              : SizedBox.shrink(),
                          _provider.isEnterpreneurRelation &&
                                  _provider
                                      .mSelectedEntrepreneurRelationToWijLandType
                                      .isEmpty
                              ? Expanded(
                                  child: CustomText(
                                    text:
                                        "Entrepreneur relationship type can't be empty".tr(),
                                    size: 11,
                                    color: Colors.red,
                                    textAligns: TextAlign.end,
                                  ),
                                )
                              : SizedBox.shrink(),
                          SizedBox(
                            width: 12,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _provider.mSelectedEntrepreneurRelationToWijLandType ==
                              'Innovatieprijs'
                          ? Flex(
                              direction: !Responsive.isDesktop(context)
                                  ? Axis.vertical
                                  : Axis.horizontal,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: "Year".tr(),
                                        size: Responsive.isDesktop(context)
                                            ? 14
                                            : 12,
                                        weight: FontWeight.w500,
                                      ),
                                      SizedBox(
                                        height: !Responsive.isDesktop(context)
                                            ? 6
                                            : 12,
                                      ),
                                      Container(
                                        width: !Responsive.isDesktop(context)
                                            ? getWidth(context)
                                            : getWidth(context) * 0.21,
                                        height: 55,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                            color: Colors.black26,
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(_provider
                                                    .mYearController.text,style: TextStyle(fontFamily: Montserrat_Medium),),
                                                IconButton(
                                                  padding: EdgeInsets.zero,
                                                  onPressed: () {
                                                    _provider.pickYear(
                                                      context: context,
                                                    );
                                                  },
                                                  icon: Icon(
                                                    CupertinoIcons.calendar,
                                                    color: Color(0xff768192),
                                                    size: 20,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                  width: 12,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: "Amount (€)".tr(),
                                        size: Responsive.isDesktop(context)
                                            ? 14
                                            : 12,
                                        weight: FontWeight.w500,
                                      ),
                                      SizedBox(
                                        height: !Responsive.isDesktop(context)
                                            ? 6
                                            : 12,
                                      ),
                                      SizedBox(
                                        width: !Responsive.isDesktop(context)
                                            ? getWidth(context)
                                            : getWidth(context) * 0.21,
                                        child: CommonTextFormFieldWidget(
                                          mTextEditingController:
                                              _provider.mAmountController,
                                          isObscureText: false,
                                          mKeyboardType: TextInputType.number,
                                          mIsEnabled: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : _provider.mSelectedEntrepreneurRelationToWijLandType ==
                                  'Financiële ondersteuning'
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "Amount (€)".tr(),
                                      size: Responsive.isDesktop(context)
                                          ? 14
                                          : 12,
                                      weight: FontWeight.w500,
                                    ),
                                    SizedBox(
                                      height: !Responsive.isDesktop(context)
                                          ? 6
                                          : 12,
                                    ),
                                    CommonTextFormFieldWidget(
                                      mTextEditingController:
                                          _provider.mAmountController,
                                      isObscureText: false,
                                      mKeyboardType: TextInputType.number,
                                      mIsEnabled: true,
                                    ),
                                  ],
                                )
                              : _provider.mSelectedEntrepreneurRelationToWijLandType ==
                                      'Projectpartner'
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: "Project".tr(),
                                          size: Responsive.isDesktop(context)
                                              ? 14
                                              : 12,
                                          weight: FontWeight.w500,
                                        ),
                                        SizedBox(
                                          height: !Responsive.isDesktop(context)
                                              ? 6
                                              : 12,
                                        ),
                                        CommonTextFormFieldWidget(
                                          mTextEditingController:
                                              _provider.mProjectController,
                                          isObscureText: false,
                                          mIsEnabled: true,
                                          mPrefixIconWidget: Icon(Icons.search),
                                        ),
                                      ],
                                    )
                                  : Text(""),
                      SizedBox(
                        height: _provider
                                    .mSelectedEntrepreneurRelationToWijLandType ==
                                'Netwerk'
                            ? 0
                            : 12,
                      ),
                      Flex(
                        direction: !Responsive.isDesktop(context)
                            ? Axis.vertical
                            : Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Legal Structure".tr(),
                                  size: Responsive.isDesktop(context) ? 14 : 12,
                                  weight: FontWeight.w500,
                                ),
                                SizedBox(
                                  height:
                                      !Responsive.isDesktop(context) ? 6 : 12,
                                ),
                                SizedBox(
                                  width: !Responsive.isDesktop(context)
                                      ? getWidth(context)
                                      : getWidth(context) * 0.21,
                                  child: RealDropDownWidget(
                                    value:
                                        _provider.mSelectedLegalStructureType,
                                    onChanged: (va) {
                                      setState(
                                        () {
                                          _provider
                                              .mSelectedLegalStructureType = va;
                                        },
                                      );
                                    },
                                    items: _provider
                                        .legalStructureDropDownModel.data!
                                        .map<DropdownMenuItem<String>>(
                                      (String values) {
                                        return DropdownMenuItem<String>(
                                          value: values,
                                          child: Text(values),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          !Responsive.isDesktop(context) &&
                                  _provider.isLegal &&
                                  _provider.mSelectedLegalStructureType.isEmpty
                              ? CustomText(
                                  text: "Legal structure can't be empty".tr(),
                                  size: 11,
                                  color: Colors.red,
                                )
                              : SizedBox.shrink(),
                          SizedBox(
                            height: 12,
                            width: 12,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Connected to Wij.land Since".tr(),
                                  size: Responsive.isDesktop(context) ? 14 : 12,
                                  weight: FontWeight.w500,
                                  textAligns: TextAlign.start,
                                ),
                                SizedBox(
                                  height:
                                      !Responsive.isDesktop(context) ? 6 : 12,
                                ),
                                Container(
                                  width: !Responsive.isDesktop(context)
                                      ? getWidth(context)
                                      : getWidth(context) * 0.21,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Colors.black26,
                                      width: 0.5,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            _provider.mDateTimeTextController
                                                    .text.isEmpty
                                                ? "dd/mm/yyyy"
                                                : _provider
                                                    .mDateTimeTextController
                                                    .text,
                                            style:
                                                TextStyle(color: Colors.black,fontFamily: Montserrat_Medium),
                                          ),
                                          IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              _provider
                                                  .pickDate(
                                                context: context,
                                              )
                                                  .then((value) {
                                                setState(
                                                  () {},
                                                );
                                              });
                                            },
                                            icon: Icon(
                                              CupertinoIcons.calendar,
                                              color: Color(0xff768192),
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _provider.isLegal &&
                                  _provider.mSelectedLegalStructureType.isEmpty
                              ? Expanded(
                                  child: CustomText(
                                    text: "Legal structure can't be empty".tr(),
                                    size: 11,
                                    color: Colors.red,
                                  ),
                                )
                              : SizedBox.shrink(),
                          _provider.isDate &&
                                  _provider.mDateTimeTextController.text.isEmpty
                              ? Expanded(
                                  child: CustomText(
                                    text: "Date can't be empty".tr(),
                                    textAligns: TextAlign.end,
                                    size: 11,
                                    color: Colors.red,
                                  ),
                                )
                              : SizedBox.shrink(),
                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SelectableDropdownWidget(
                        items: _provider.productsDropDownModel.data!,
                        title: "Products".tr(),
                        widthSize: getWidth(context),
                        mSelectedValue: _provider.mSelectedProductsType,
                        mSelectedItemsList: _provider.mSelectedProductsList,
                        mOnDropDownChange: (value) {
                          setState(
                            () {
                              _provider.mSelectedProductsType = value as String;
                              if (!_provider.mSelectedProductsList
                                  .contains(_provider.mSelectedProductsType)) {
                                _provider.mSelectedProductsList
                                    .add(_provider.mSelectedProductsType);
                              }
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      _provider.isProduct &&
                              _provider.mSelectedProductsList.isEmpty
                          ? CustomText(
                              text: "Product List can't be empty".tr(),
                              size: 11,
                              color: Colors.red,
                            )
                          : SizedBox.shrink(),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: "Help Request".tr(),
                        size: Responsive.isDesktop(context) ? 14 : 12,
                        weight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      CommonTextFormFieldWidget(
                        mTextEditingController:
                            _provider.mHelpRequestController,
                        isObscureText: false,
                        mIsEnabled: true,
                        mMaxLines: 5,
                        //textPadding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 4.0),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      _provider.isHelp &&
                              _provider.mHelpRequestController.text.isEmpty
                          ? CustomText(
                              text: "Help Request type can't be empty".tr(),
                              size: 11,
                              color: Colors.red,
                            )
                          : SizedBox.shrink(),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: Color(0xff333333),
                        thickness: 0.1,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomText(
                        text: "Social Media".tr(),
                        size: Responsive.isDesktop(context) ? 14 : 12,
                        weight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomText(
                        text: "Links".tr(),
                        size: Responsive.isDesktop(context) ? 14 : 12,
                        weight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                SocialDesign(
                                  icon: FontAwesomeIcons.globe,
                                  iconColor: Color(0xff333333),
                                  textController:
                                      _provider.mWebsiteLinkController,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                SocialDesign(
                                  icon: FontAwesomeIcons.instagramSquare,
                                  iconColor: Color(0xffDD2A7B),
                                  textController:
                                      _provider.mInstagramLinkController,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                SocialDesign(
                                  icon: FontAwesomeIcons.linkedinIn,
                                  iconColor: Color(0xff0077B5),
                                  textController:
                                      _provider.mLinkedInLinkController,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                SocialDesign(
                                  icon: FontAwesomeIcons.facebookSquare,
                                  iconColor: Color(0xff3B5998),
                                  textController:
                                      _provider.mFacebookLinkController,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                SocialDesign(
                                  icon: FontAwesomeIcons.twitter,
                                  iconColor: Color(0xff08A0E9),
                                  textController:
                                      _provider.mTwitterLinkController,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: 40,
                                  child: Text(
                                    "Followers".tr(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: Montserrat_Medium,
                                      fontSize: Responsive.isDesktop(context)
                                          ? 16
                                          : 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                CommonTextFormFieldWidget(
                                  mTextEditingController:
                                      _provider.mInstagramFollowersController,
                                  isObscureText: false,
                                  mKeyboardType: TextInputType.number,
                                  mIsEnabled: true,
                                  mInputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]'),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                CommonTextFormFieldWidget(
                                  mTextEditingController:
                                      _provider.mLinkedInFollowersController,
                                  isObscureText: false,
                                  mKeyboardType: TextInputType.number,
                                  mIsEnabled: true,
                                  mInputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]'),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                CommonTextFormFieldWidget(
                                  mTextEditingController:
                                      _provider.mFacebookFollowersController,
                                  isObscureText: false,
                                  mIsEnabled: true,
                                  mKeyboardType: TextInputType.number,
                                  mInputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]'),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                CommonTextFormFieldWidget(
                                  mTextEditingController:
                                      _provider.mTwitterFollowersController,
                                  isObscureText: false,
                                  mIsEnabled: true,
                                  mKeyboardType: TextInputType.number,
                                  mInputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                _provider.mShowProjectListWidget
                    ? Padding(
                        padding: const EdgeInsets.only(top: 270),
                        child: SearchProjectsWidget(),
                      )
                    : SizedBox()
              ],
            ),
          ),
        );
      },
    );
  }
}
