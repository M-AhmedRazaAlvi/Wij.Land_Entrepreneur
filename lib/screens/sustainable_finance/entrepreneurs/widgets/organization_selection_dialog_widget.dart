import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/widgets/enterpreneurs_dialog_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/widgets/search_organization_widget.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../../app_common_widgets/common_elevated_button.dart';
import '../../../../app_common_widgets/common_text_form_field_widget.dart';
import '../../../../app_common_widgets/custom_text.dart';
import '../../../../models/entrepreneur/request/post_entrepreneur_request.dart';
import '../../../../providers/entrepreneur/entrepreneur_screen_provider.dart';
import '../../../../utils/hex_color.dart';
import '../../../../utils/responsive.dart';
import '../../../office/widgets/add_text_button_widget.dart';

var selectedFirst = true.obs;

class OrganizationSelectionDialogWidget extends StatefulWidget {
  const OrganizationSelectionDialogWidget({Key? key}) : super(key: key);

  @override
  State<OrganizationSelectionDialogWidget> createState() => _OrganizationSelectionDialogWidgetState();
}

class _OrganizationSelectionDialogWidgetState extends State<OrganizationSelectionDialogWidget> {
  @override
  void initState() {
    final provider = Provider.of<EntrepreneurScreenProvider>(context, listen: false);
    provider.mOrganizationController.addListener(() {
      if (provider.mOrganizationController.text.isNotEmpty) {
        provider.searchOrganization(value: provider.mOrganizationController.text);
        setState(() {
          provider.mShowOrganizationSearchWidget = true;
        });
      } else {
        setState(() {
          provider.mShowOrganizationSearchWidget = false;
        });
      }
    });
    Future.delayed(Duration(milliseconds: 0), () {
      selectedFirst.value = true;
      Provider.of<EntrepreneurScreenProvider>(context).updateUI(false, false, false, false, false, false, false, false, false, false, false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext c) {
    return Consumer<EntrepreneurScreenProvider>(
      builder: (context, _provider, widget) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.35,
          height: 300,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Search existing organization".tr(),
                      size: Responsive.isDesktop(c) ? 12 : 10,
                    ),
                    SizedBox(height: 10),
                    CommonTextFormFieldWidget(
                      mTextEditingController: _provider.mOrganizationController,
                      isObscureText: false,
                      mIsEnabled: true,
                      mPrefixIconWidget: Icon(Icons.search),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: Responsive.isDesktop(c) ? 130 : 100,
                        child: CommonElevatedButton(
                          mButtonColor: yellow,
                          mOnTap: () {
                            if (_provider.mSelectedOrganizationDataModel.id == 0) {
                              ScaffoldMessenger.of(c).showSnackBar(
                                SnackBar(
                                  content: Text('Select any organization first!'.tr(),style: TextStyle(fontFamily: Montserrat_Medium),),
                                  duration: const Duration(seconds: 1),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            } else {
                              Navigator.pop(c);
                              _provider.mPostAddressLatitude = _provider.mSelectedOrganizationDataModel.latitude.toString();
                              showDialog(
                                context: context,
                                builder: (c) => AlertDialog(
                                  content: EntrepreneursDialogWidget(
                                    isUpdate: false,
                                    mEntrepreneurID: 0,
                                  ),
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: _provider.titleClick[0] ? _provider.titleListForAdd[0] : _provider.titleListForAdd[1],
                                        size: Responsive.isDesktop(c) ? 24 : 18,
                                        weight: FontWeight.bold,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.of(c).pop();
                                        },
                                        icon: Icon(
                                          Icons.close,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 40,
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            child: AddTextButtonWidget(
                                              text: "Cancel".tr(),
                                              colors: Color(0xfff2f2f2),
                                              onPress: () {
                                                _provider.updateUI(false, false, false, false, false, false, false, false, false, false, false);
                                                Navigator.of(c).pop();
                                              },
                                            ),
                                            width: 120,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                            width: 120,
                                            child: AddTextButtonWidget(
                                              text: selectedFirst.value ? 'Next'.tr() : "Continue".tr(),
                                              colors: Colors.yellow,
                                              onPress: () {
                                                if (_provider.mEnterpriseNameController.text.isNotEmpty &&
                                                    _provider.mPostAddressController.text.isNotEmpty &&
                                                    _provider.mOrganizationType.isNotEmpty &&
                                                    _provider.mSelectedRelationToWijLandType.isNotEmpty &&
                                                    _provider.titleClick[0]) {
                                                  _provider.updateTitleClick(
                                                    firstTitleClicked: false,
                                                    secondTitleClicked: true,
                                                  );
                                                  selectedFirst.value = false;
                                                } else {
                                                  if (_provider.mEnterpriseNameController.text.isEmpty) {
                                                    _provider.updateUI(true, false, false, false, false, false, false, false, false, false, false);
                                                    return;
                                                  }
                                                  if (_provider.mPostAddressController.text.isEmpty) {
                                                    _provider.updateUI(true, true, false, false, false, false, false, false, false, false, false);
                                                    return;
                                                  }
                                                  if (_provider.mSelectedRelationToWijLandType.isEmpty) {
                                                    _provider.updateUI(true, true, true, false, false, false, false, false, false, false, false);
                                                    return;
                                                  }
                                                  if (_provider.mOrganizationType.isEmpty) {
                                                    _provider.updateUI(true, true, true, true, false, false, false, false, false, false, false);
                                                    return;
                                                  }
                                                  if (_provider.mVisitingAddressController.text.isEmpty) {
                                                    _provider.updateUI(true, true, true, true, true, false, false, false, false, false, false);
                                                    return;
                                                  }

                                                  if (_provider.mSelectedFocusAreaType.isEmpty) {
                                                    _provider.updateUI(true, true, true, true, true, true, false, false, false, false, false);
                                                    return;
                                                  }

                                                  if (_provider.mSelectedEntrepreneurRelationToWijLandType.isEmpty) {
                                                    _provider.updateUI(true, true, true, true, true, true, true, false, false, false, false);
                                                    return;
                                                  }

                                                  if (_provider.mSelectedLegalStructureType.isEmpty) {
                                                    _provider.updateUI(true, true, true, true, true, true, true, true, false, false, false);
                                                    return;
                                                  }
                                                  if (_provider.mDateTimeTextController.text.isEmpty) {
                                                    _provider.updateUI(true, true, true, true, true, true, true, false, false, false, true);
                                                    return;
                                                  }

                                                  if (_provider.mSelectedProductsList.isEmpty) {
                                                    _provider.updateUI(true, true, true, true, true, true, true, true, true, false, true);
                                                    return;
                                                  }

                                                  /* if (_provider.mPostAddressLatitude.isEmpty || _provider.mPostAddressLatitude.toString() == 'null') {
                                                      AppSnackBars.showWarningSnackBar(
                                                          context: c, message: "Post address Latitude and Longitude is required!");

                                                      return;
                                                    }*/

                                                  if (_provider.mHelpRequestController.text.isEmpty) {
                                                    _provider.updateUI(true, true, true, true, true, true, true, true, true, true, true);
                                                    return;
                                                  }
                                                  //4.1825314, _entrepreneurModel!.data![i].lng ?? 52.1493511

                                                  String date = _provider.mDateTimeTextController.text;
                                                  String newDate = '${date.split('-')[2]}-${date.split('-')[1]}-${date.split('-')[0]}';
                                                  PostEntrepreneurRequest postEntrepreneurRequest = PostEntrepreneurRequest(
                                                    address: _provider.mPostAddressController.text,
                                                    latitude: _provider.mPostAddressLatitude == 'null' ? '4.1825314' : _provider.mPostAddressLatitude,
                                                    longitude:
                                                        _provider.mPostAddressLongitude == 'null' ? '52.1493511' : _provider.mPostAddressLongitude,
                                                    entrepreneur: Entrepreneur(
                                                      connectedToWijlandSince: newDate,
                                                      amount: _provider.mAmountController.text,
                                                      projectId: _provider.mSearchedProjectId == 0 ? "" : _provider.mSearchedProjectId.toString(),
                                                      year: _provider.mYearController.text,
                                                      focusArea: _provider.mSelectedFocusAreaType,
                                                      helpRequest: _provider.mHelpRequestController.text,
                                                      legalStructure: _provider.mSelectedLegalStructureType,
                                                      products: _provider.mSelectedProductsList,
                                                      relationToWijland: [_provider.mSelectedEntrepreneurRelationToWijLandType],
                                                      visitingAddress: _provider.mVisitingAddressController.text,
                                                      facebook: _provider.mFacebookLinkController.text,
                                                      facebookFollower: _provider.mFacebookFollowersController.text.isEmpty
                                                          ? 0
                                                          : int.parse(_provider.mFacebookFollowersController.text),
                                                      instagram: _provider.mInstagramLinkController.text,
                                                      instagramFollower: _provider.mInstagramFollowersController.text.isEmpty
                                                          ? 0
                                                          : int.parse(_provider.mInstagramFollowersController.text),
                                                      linkedin: _provider.mLinkedInLinkController.text,
                                                      linkedinFollower: _provider.mLinkedInFollowersController.text.isEmpty
                                                          ? 0
                                                          : int.parse(_provider.mLinkedInFollowersController.text),
                                                      twitter: _provider.mTwitterLinkController.text,
                                                      twitterFollower: _provider.mTwitterFollowersController.text.isEmpty
                                                          ? 0
                                                          : int.parse(_provider.mTwitterFollowersController.text),
                                                      website: _provider.mWebsiteLinkController.text,
                                                    ),
                                                    name: _provider.mEnterpriseNameController.text,
                                                    organizationType: [_provider.mOrganizationType],
                                                    organizationId: _provider.mSelectedOrganizationDataModel.id == 0
                                                        ? ""
                                                        : _provider.mSelectedOrganizationDataModel.id.toString(),
                                                    relationToWijland: _provider.mSelectedRelationToWijLandList,
                                                  );
                                                  print('List of selected items : ${_provider.mSelectedRelationToWijLandList}');
                                                  Navigator.pop(c);

                                                  _provider.uploadFile(
                                                    postEntrepreneurRequest: postEntrepreneurRequest,
                                                    isUpdate: false,
                                                    mEntrepreneurID: 0,
                                                  );
                                                }
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          mButtonText: "Continue".tr(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    SizedBox(height: 5),
                    CustomText(
                      text: "Cannot find the organization?".tr(),
                      size: Responsive.isDesktop(c) ? 12 : 10,
                    ),
                    SizedBox(height: 4),
                    CustomText(
                      text: "Create a new one by clicking the below button".tr(),
                      size: Responsive.isDesktop(c) ? 12 : 10,
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Responsive.isDesktop(c) ? 130 : 100,
                          child: CommonElevatedButton(
                            mButtonColor: HexColor('#F5F6FA'),
                            mOnTap: () {
                              Navigator.pop(c);
                            },
                            mButtonText: "Cancel".tr(),
                          ),
                        ),
                        SizedBox(
                          width: Responsive.isDesktop(c) ? 130 : 100,
                          child: CommonElevatedButton(
                            mButtonColor: yellow,
                            mOnTap: () {
                              Navigator.pop(c);
                              setState(() {
                                _provider.clearAllFields();
                              });
                              showDialog(
                                context: context,
                                builder: (c) => AlertDialog(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: _provider.titleClick[0] ? _provider.titleListForAdd[0] : _provider.titleListForAdd[1],
                                        size: Responsive.isDesktop(c) ? 24 : 18,
                                        weight: FontWeight.bold,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.of(c).pop();
                                        },
                                        icon: Icon(
                                          Icons.close,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  content: EntrepreneursDialogWidget(
                                    isUpdate: false,
                                    mEntrepreneurID: 0,
                                  ),
                                  actions: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 40,
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width: 120,
                                            child: AddTextButtonWidget(
                                              text: "Cancel".tr(),
                                              colors: HexColor('#F5F6FA'),
                                              onPress: () {
                                                _provider.updateUI(false, false, false, false, false, false, false, false, false, false, false);
                                                Navigator.of(c).pop();
                                              },
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          SizedBox(
                                            width: 120,
                                            child: Obx(
                                              () => AddTextButtonWidget(
                                                text: selectedFirst.value ? 'Next'.tr() : "Continue".tr(),
                                                colors: yellow,
                                                onPress: () {
                                                  if (_provider.mEnterpriseNameController.text.isNotEmpty &&
                                                      _provider.mPostAddressController.text.isNotEmpty &&
                                                      _provider.mOrganizationType.isNotEmpty &&
                                                      _provider.mSelectedRelationToWijLandType.isNotEmpty &&
                                                      _provider.titleClick[0]) {
                                                    _provider.updateTitleClick(
                                                      firstTitleClicked: false,
                                                      secondTitleClicked: true,
                                                    );
                                                    selectedFirst.value = false;
                                                  } else {
                                                    if (_provider.mEnterpriseNameController.text.isEmpty) {
                                                      _provider.updateUI(true, false, false, false, false, false, false, false, false, false, false);
                                                      return;
                                                    }
                                                    if (_provider.mPostAddressController.text.isEmpty) {
                                                      _provider.updateUI(true, true, false, false, false, false, false, false, false, false, false);
                                                      return;
                                                    }
                                                    if (_provider.mSelectedRelationToWijLandType.isEmpty) {
                                                      _provider.updateUI(true, true, true, false, false, false, false, false, false, false, false);
                                                      return;
                                                    }
                                                    if (_provider.mOrganizationType.isEmpty) {
                                                      _provider.updateUI(true, true, true, true, false, false, false, false, false, false, false);
                                                      return;
                                                    }

                                                    if (_provider.mVisitingAddressController.text.isEmpty) {
                                                      _provider.updateUI(true, true, true, true, true, false, false, false, false, false, false);
                                                      return;
                                                    }
                                                    if (_provider.mSelectedFocusAreaType.isEmpty) {
                                                      _provider.updateUI(true, true, true, true, true, true, true, false, false, false, false);
                                                      return;
                                                    }

                                                    if (_provider.mSelectedEntrepreneurRelationToWijLandType.isEmpty) {
                                                      _provider.updateUI(true, true, true, true, true, true, true, false, false, false, false);
                                                      return;
                                                    }

                                                    if (_provider.mSelectedLegalStructureType.isEmpty) {
                                                      _provider.updateUI(true, true, true, true, true, true, true, true, false, false, false);
                                                      return;
                                                    }
                                                    if (_provider.mDateTimeTextController.text.isEmpty) {
                                                      _provider.updateUI(true, true, true, true, true, true, true, false, false, false, true);
                                                      return;
                                                    }

                                                    if (_provider.mSelectedProductsList.isEmpty) {
                                                      _provider.updateUI(true, true, true, true, true, true, true, true, true, false, true);
                                                      return;
                                                    }

                                                    /* if (_provider.mPostAddressLatitude.isEmpty || _provider.mPostAddressLatitude.toString() == 'null') {
                                                      AppSnackBars.showWarningSnackBar(
                                                          context: c, message: "Post address Latitude and Longitude is required!");

                                                      return;
                                                    }*/

                                                    if (_provider.mHelpRequestController.text.isEmpty) {
                                                      _provider.updateUI(true, true, true, true, true, true, true, true, true, true, true);
                                                      return;
                                                    }

                                                    Navigator.pop(c);
                                                    String date = _provider.mDateTimeTextController.text;
                                                    String newDate = '${date.split('-')[2]}-${date.split('-')[1]}-${date.split('-')[0]}';
                                                    PostEntrepreneurRequest postEntrepreneurRequest = PostEntrepreneurRequest(
                                                      address: _provider.mPostAddressController.text,
                                                      latitude: _provider.mPostAddressLatitude,
                                                      longitude: _provider.mPostAddressLongitude,
                                                      entrepreneur: Entrepreneur(
                                                        connectedToWijlandSince: newDate,
                                                        amount: _provider.mAmountController.text,
                                                        projectId: _provider.mSearchedProjectId == 0 ? "" : _provider.mSearchedProjectId.toString(),
                                                        year: _provider.mYearController.text,
                                                        focusArea: _provider.mSelectedFocusAreaType,
                                                        helpRequest: _provider.mHelpRequestController.text,
                                                        legalStructure: _provider.mSelectedLegalStructureType,
                                                        products: _provider.mSelectedProductsList,
                                                        relationToWijland: [_provider.mSelectedEntrepreneurRelationToWijLandType],
                                                        visitingAddress: _provider.mVisitingAddressController.text,
                                                        facebook: _provider.mFacebookLinkController.text,
                                                        facebookFollower: _provider.mFacebookFollowersController.text.isEmpty
                                                            ? 0
                                                            : int.parse(_provider.mFacebookFollowersController.text),
                                                        instagram: _provider.mInstagramLinkController.text,
                                                        instagramFollower: _provider.mInstagramFollowersController.text.isEmpty
                                                            ? 0
                                                            : int.parse(_provider.mInstagramFollowersController.text),
                                                        linkedin: _provider.mLinkedInLinkController.text,
                                                        linkedinFollower: _provider.mLinkedInFollowersController.text.isEmpty
                                                            ? 0
                                                            : int.parse(_provider.mLinkedInFollowersController.text),
                                                        twitter: _provider.mTwitterLinkController.text,
                                                        twitterFollower: _provider.mTwitterFollowersController.text.isEmpty
                                                            ? 0
                                                            : int.parse(_provider.mTwitterFollowersController.text),
                                                        website: _provider.mWebsiteLinkController.text,
                                                      ),
                                                      name: _provider.mEnterpriseNameController.text,
                                                      organizationType: [_provider.mOrganizationType],
                                                      organizationId: _provider.mSelectedOrganizationDataModel.id == 0
                                                          ? ""
                                                          : _provider.mSelectedOrganizationDataModel.id.toString(),
                                                      relationToWijland: _provider.mSelectedRelationToWijLandList,
                                                    );

                                                    _provider.uploadFile(
                                                      postEntrepreneurRequest: postEntrepreneurRequest,
                                                      isUpdate: false,
                                                      mEntrepreneurID: 0,
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            mButtonText: "Create New".tr(),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                _provider.mShowOrganizationSearchWidget
                    ? Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: SearchOrganizationWidget(),
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
