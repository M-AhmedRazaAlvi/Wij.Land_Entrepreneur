import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../app_common_widgets/common_text_form_field_widget.dart';
import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../../app_common_widgets/text_widget.dart';
import '../../../../providers/entrepreneur/entrepreneur_screen_provider.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/googleAutoCompleteSearch.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';

class AddEnterpriseDialogWidget extends StatefulWidget {
  const AddEnterpriseDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddEnterpriseDialogWidget> createState() =>
      _AddEnterpriseDialogWidgetState();
}

class _AddEnterpriseDialogWidgetState extends State<AddEnterpriseDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurScreenProvider>(
      builder: (context, _provider, widget) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Enterprise Name".tr(),
                        size: Responsive.isDesktop(context) ? 14 : 12,
                        weight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      CommonTextFormFieldWidget(
                        mTextEditingController:
                            _provider.mEnterpriseNameController,
                        isObscureText: false,
                        mIsEnabled: true,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      _provider.isName &&
                              _provider.mEnterpriseNameController.text.isEmpty
                          ? CustomText(
                              text: "Enterprise name can't be empty".tr(),
                              size: 11,
                              color: Colors.red,
                            )
                          : SizedBox.shrink(),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: "Post Address".tr(),
                        size: Responsive.isDesktop(context) ? 14 : 12,
                        weight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      InkWell(
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
                                          _provider.mPostAddressController
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
                          controller: _provider.mPostAddressController,
                          enabled: false,
                          suffixIcon: const Icon(Icons.search),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      _provider.isPostAddress &&
                              _provider.mPostAddressController.text.isEmpty
                          ? CustomText(
                              text: "Post address can't be empty",
                              size: 11,
                              color: Colors.red,
                            )
                          : SizedBox.shrink(),

                      /*  CommonTextFormFieldWidget(
                        mTextEditingController: _provider.mPostAddressController,
                        isObscureText: false,
                        mIsEnabled: false,
                        mOnTap: () {
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
                                        setState(() {
                                          _provider.mPostAddressController.text = detail;
                                        });
                                      },
                                      lat: (double lat) {
                                        setState(() {
                                          _provider.mPostAddressLatitude = lat.toString();
                                        });
                                      },
                                      lng: (double lng) {
                                        setState(() {
                                          _provider.mPostAddressLongitude = lng.toString();
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
                      ),*/
                      SizedBox(
                        height: 20,
                      ),
                      SelectableDropdownWidget(
                        items: _provider.relationToWijLandDropDownModel.data!,
                        title: "Relation to Wij.land".tr(),
                        widthSize: getWidth(context),
                        mSelectedValue:
                            _provider.mSelectedRelationToWijLandType,
                        mSelectedItemsList:
                            _provider.mSelectedRelationToWijLandList,
                        mOnDropDownChange: (value) {
                          setState(
                            () {
                              _provider.mSelectedRelationToWijLandType =
                                  value as String;
                              if (!_provider.mSelectedRelationToWijLandList
                                  .contains(_provider
                                      .mSelectedRelationToWijLandType)) {
                                _provider.mSelectedRelationToWijLandList.add(
                                    _provider.mSelectedRelationToWijLandType);
                              }
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      _provider.isRelationWijland &&
                              _provider.mSelectedRelationToWijLandType.isEmpty
                          ? CustomText(
                              text: "Relationship type can't be empty",
                              size: 11,
                              color: Colors.red,
                            )
                          : SizedBox.shrink(),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: !Responsive.isDesktop(context)
                            ? getWidth(context)
                            : getWidth(context) / 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Organization Type",
                              size: Responsive.isDesktop(context) ? 14 : 12,
                              weight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            RealDropDownWidget(
                              value: _provider.mOrganizationType,
                              onChanged: (va) {
                                setState(
                                  () {
                                    _provider.mOrganizationType = va;
                                  },
                                );
                              },
                              items: _provider.mOrganizationTypeDropDownList
                                  .map<DropdownMenuItem<String>>(
                                (String values) {
                                  return DropdownMenuItem<String>(
                                    value: values,
                                    child: Text(values,style: TextStyle(fontFamily: Montserrat_Medium),),
                                  );
                                },
                              ).toList(),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            _provider.isOrgType &&
                                    _provider.mOrganizationType.isEmpty
                                ? CustomText(
                                    text: "Organization type can't be empty".tr(),
                                    size: 11,
                                    color: Colors.red,
                                  )
                                : SizedBox.shrink(),
                            SizedBox(
                              height: 20,
                            ),
                            CustomText(
                              text: "Upload profile image/organisation logo".tr(),
                              size: Responsive.isDesktop(context) ? 14 : 12,
                              weight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DottedBorder(
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
                                  child: _provider.mWebImagePath == null
                                      ? IconButton(
                                          onPressed: () async {
                                            await _provider.pickImage();
                                            setState(() {});
                                          },
                                          icon: FaIcon(
                                            FontAwesomeIcons.plus,
                                            color: Color(0xff3c4b64),
                                            size: 16,
                                          ),
                                        )
                                      : IconButton(
                                          onPressed: () {
                                            _provider.pickImage();
                                          },
                                          icon: Image.memory(
                                            _provider.mWebImagePath,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
