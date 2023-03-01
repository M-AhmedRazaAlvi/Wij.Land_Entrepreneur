import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/overview/widgets/add_enterpreneurs_dialog_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/overview/widgets/details_enterpreneurs_dialog_widget.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../models/entrepreneur/request/post_entrepreneur_request.dart';
import '../../../../../providers/entrepreneur/entrepreneur_screen_overview_provider.dart';
import '../../../../../utils/app_snackbars.dart';
import '../../../../../utils/responsive.dart';
import '../../../../../utils/styles.dart';
import '../../../../office/widgets/add_text_button_widget.dart';

class UpdateEntrepreneurDialogWidget extends StatefulWidget {
  final int mEntrepreneurID;

  const UpdateEntrepreneurDialogWidget({Key? key, required this.mEntrepreneurID}) : super(key: key);

  @override
  State<UpdateEntrepreneurDialogWidget> createState() => _UpdateEntrepreneurDialogWidgetState();
}

class _UpdateEntrepreneurDialogWidgetState extends State<UpdateEntrepreneurDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurOverviewScreenProvider>(
      builder: (context, _provider, widget) {
        return AlertDialog(
          title: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: _provider.titleClick[0] ? _provider.titleListForUpdate[0] : _provider.titleListForUpdate[1],
                      size: Responsive.isDesktop(context) ? 24 : 18,
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flex(
                    direction: !Responsive.isDesktop(context) ? Axis.vertical : Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            fixedSize: Size(230, 40),
                            backgroundColor: _provider.titleClick[0] ? Color(0xffF2F2F2) : Colors.transparent,
                          ),
                          onPressed: () {
                            setState(
                              () {
                                if (!_provider.titleClick[0]) {
                                  _provider.titleClick[0] = true;
                                  _provider.titleClick[1] = false;
                                }
                              },
                            );
                          },
                          child: Text(
                            "Enterprise Basics".tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: Montserrat_Medium,
                              fontWeight: _provider.titleClick[0] ? FontWeight.bold : FontWeight.normal,
                              color: _provider.titleClick[0] ? Color(0xff231f20) : Color(0xff333333),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: !Responsive.isDesktop(context) ? 6 : 12,
                        height: !Responsive.isDesktop(context) ? 6 : 12,
                      ),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            setState(
                              () {
                                if (!_provider.titleClick[1]) {
                                  _provider.titleClick[1] = true;
                                  _provider.titleClick[0] = false;
                                }
                              },
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            fixedSize: Size(230, 40),
                            backgroundColor: _provider.titleClick[1] ? Color(0xffF2F2F2) : Colors.transparent,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Text(
                              "Enterprise Details".tr(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: Montserrat_Medium,

                                fontWeight: _provider.titleClick[1] ? FontWeight.bold : FontWeight.normal,
                                color: _provider.titleClick[1] ? Color(0xff231f20) : Color(0xff333333),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  _provider.titleClick[0] ? AddEnterpriseDialogWidget() : DetailsEnterpriseDialogWidget(),
                ],
              ),
            ),
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
                  AddTextButtonWidget(
                    text: "Cancel".tr(),
                    colors: Color(0xfff2f2f2),
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AddTextButtonWidget(
                    text: _provider.titleClick[0] ? "Next".tr() : "Update".tr(),
                    colors: Colors.yellow,
                    onPress: _provider.titleClick[0]
                        ? () {
                            setState(
                              () {
                                if (!_provider.titleClick[1]) {
                                  _provider.titleClick[1] = true;
                                  _provider.titleClick[0] = false;
                                }
                              },
                            );
                          }
                        : () {
                            if (_provider.mEnterpriseNameController.text.isEmpty) {
                              AppSnackBars.showWarningSnackBar(context: context, message: "Enterprise name is required".tr());
                              return;
                            }
                            if (_provider.mPostAddressController.text.isEmpty) {
                              AppSnackBars.showWarningSnackBar(context: context, message: "Post address is required".tr());
                              return;
                            }

                            if (_provider.mHelpRequestController.text.isEmpty) {
                              AppSnackBars.showWarningSnackBar(context: context, message: "Help request is required".tr());
                              return;
                            }

                            if (_provider.mSelectedEntrepreneurProductsList.isEmpty) {
                              AppSnackBars.showWarningSnackBar(context: context, message: "Products are required!".tr());
                              return;
                            }

                            // if (_provider.mPostAddressLatitude.isEmpty || _provider.mPostAddressLatitude.toString() == 'null') {
                            //   AppSnackBars.showWarningSnackBar(context: context, message: "Post address Latitude and Longitude is required!");
                            //   return;
                            // }
                            if (_provider.mDateTimeTextController.text.isEmpty) {
                              AppSnackBars.showWarningSnackBar(context: context, message: "Date is required".tr());
                              return;
                            }

                            if (_provider.mSelectedRelationToWijLandList.isEmpty) {
                              AppSnackBars.showWarningSnackBar(context: context, message: "Relation to WijLand is required!".tr());
                              return;
                            }
                            if (_provider.mOrganizationType.isEmpty) {
                              AppSnackBars.showWarningSnackBar(context: context, message: "Organization Type is required!".tr());
                              return;
                            }
                            if (_provider.mSelectedFocusAreaType.isEmpty) {
                              AppSnackBars.showWarningSnackBar(context: context, message: "Focus area is required!".tr());
                              return;
                            }

                            if (_provider.mSelectedEntrepreneurRelationToWijLandType.isEmpty) {
                              AppSnackBars.showWarningSnackBar(context: context, message: "Entrepreneur relation to wijland is required!".tr());
                              return;
                            }
                            if (_provider.mSelectedLegalStructureType.isEmpty) {
                              AppSnackBars.showWarningSnackBar(context: context, message: "Legal structure is required!".tr());
                              return;
                            }
                            print('amount and year = ${_provider.mPostAddressLatitude} ${_provider.mPostAddressLongitude}');
                            Navigator.pop(context);
                            String date = _provider.mDateTimeTextController.text;
                            String newdate = '${date.split('-')[2]}-${date.split('-')[1]}-${date.split('-')[0]}';
                            PostEntrepreneurRequest postEntrepreneurRequest = PostEntrepreneurRequest(
                              address: _provider.mPostAddressController.text,
                              latitude: _provider.mPostAddressLatitude,
                              longitude: _provider.mPostAddressLongitude,
                              entrepreneur: Entrepreneur(
                                connectedToWijlandSince: newdate,
                                amount: _provider.mAmountController.text,
                                projectId: _provider.mSearchedProjectId == 0 ? "" : _provider.mSearchedProjectId.toString(),
                                year: _provider.mYearController.text,
                                focusArea: _provider.mSelectedFocusAreaType,
                                helpRequest: _provider.mHelpRequestController.text,
                                legalStructure: _provider.mSelectedLegalStructureType,
                                products: _provider.mSelectedEntrepreneurProductsList,
                                relationToWijland: [_provider.mSelectedEntrepreneurRelationToWijLandType],
                                visitingAddress: _provider.mVisitingAddressController.text,
                                facebook: _provider.mFacebookLinkController.text,
                                facebookFollower: int.parse(_provider.mFacebookFollowersController.text),
                                instagram: _provider.mInstagramLinkController.text,
                                instagramFollower: int.parse(_provider.mInstagramFollowersController.text),
                                linkedin: _provider.mLinkedInLinkController.text,
                                linkedinFollower: int.parse(_provider.mLinkedInFollowersController.text),
                                twitter: _provider.mTwitterLinkController.text,
                                twitterFollower: int.parse(_provider.mTwitterFollowersController.text),
                                website: _provider.mWebsiteLinkController.text,
                              ),
                              name: _provider.mEnterpriseNameController.text,
                              organizationType: [_provider.mOrganizationType],
                              organizationId: '',
                              relationToWijland: _provider.mSelectedRelationToWijLandList,
                            );
                            _provider.uploadFile(
                              false,
                              postEntrepreneurPersonRequest: null,
                              postEntrepreneurRequest: postEntrepreneurRequest,
                              isUpdate: true,
                              mEntrepreneurID: this.widget.mEntrepreneurID,
                              dialogContext: context,
                            );
                          },
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
