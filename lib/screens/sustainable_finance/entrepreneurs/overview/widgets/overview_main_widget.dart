import 'package:easy_localization/easy_localization.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:provider/provider.dart';
import 'package:wij_land/app_common_widgets/common_elevated_button.dart';
import 'package:wij_land/models/entrepreneur/response/get_entrepreneur_overview.dart';
import 'package:wij_land/providers/entrepreneur/entrepreneur_retailer_provider.dart';
import 'package:wij_land/providers/entrepreneur/entrepreneur_supplier_provider.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/overview/widgets/add_overview_person_dialog_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/overview/widgets/edit_overview_person_dialog_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/overview/widgets/select_existing_person_dialog_widget.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../app_common_widgets/icon_text_container.dart';
import '../../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../../../providers/GlobalProvider/navigation/navigation_provider.dart';
import '../../../../../providers/entrepreneur/entrepreneur_screen_overview_provider.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/responsive.dart';
import '../../../../../utils/url_scheme.dart';
import '../../../../contacts/widgets/popup_menu_button.dart';
import '../../../../office/widgets/add_text_button_widget.dart';
import 'overview_design_card.dart';

class OverviewMainWidget extends StatefulWidget {
  const OverviewMainWidget({
    Key? key,
    required this.icon,
    required this.description,
    required this.sideColor,
    required this.isSocial,
    required this.model,
    required this.mEntrepreneurID,
    this.personModel,
  }) : super(key: key);

  final List<IconData> icon;

  final List<String> description;
  final List<Color> sideColor;
  final List<bool> isSocial;
  final Entrepreneur model;
  final List<EntrepreneurPersons>? personModel;
  final int mEntrepreneurID;

  @override
  State<OverviewMainWidget> createState() => _OverviewMainWidgetState();
}

class _OverviewMainWidgetState extends State<OverviewMainWidget> {
  bool isSelectAll = false;

  @override
  void initState() {
    mapDisable();
    super.initState();
  }

  mapDisable() {
    Provider.of<EntrepreneurOverviewScreenProvider>(context, listen: false).mapOpened = false;
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    isSelectAll = false;
    var provider = Provider.of<EntrepreneurOverviewScreenProvider>(context, listen: false);
    provider.allCheckedBoxId = [];

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<EntrepreneurOverviewScreenProvider, CreateNewEntreprenuerSupplierProvider, EntrepreneurRetailerProvider>(
      builder: (context, _provider, _supplier, _retailer, widget) {
        return SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Wrap(
                alignment: Responsive.isMobile(context) ? WrapAlignment.center : WrapAlignment.start,
                children: [
                  FadeInLeft(
                    child: OverviewCardWidgets(
                      icon: this.widget.icon[0],
                      subtitle: this.widget.description[0],
                      cardColor: this.widget.sideColor[0],
                      title:
                          _supplier.getSupplierResponse?.data == null ? this.widget.model.noofSupplier! : _supplier.getSupplierResponse?.data!.length,
                      iconColor: this.widget.sideColor[0],
                    ),
                  ),
                  FadeInLeft(
                    child: OverviewCardWidgets(
                      icon: this.widget.icon[1],
                      subtitle: this.widget.description[1],
                      cardColor: this.widget.sideColor[1],
                      iconColor: this.widget.sideColor[1],
                      title: _retailer.entrepreneurModel?.data == null ? this.widget.model.noofRetailer! : _retailer.entrepreneurModel!.data!.length,
                    ),
                  ),
                  FadeInLeft(
                    child: OverviewCardWidgets(
                      icon: this.widget.icon[2],
                      subtitle: this.widget.description[2],
                      cardColor: this.widget.sideColor[2],
                      iconColor: this.widget.sideColor[2],
                      title: this.widget.model.linkedinFollower!,
                    ),
                  ),
                  FadeInRight(
                    child: OverviewCardWidgets(
                      icon: this.widget.icon[3],
                      subtitle: this.widget.description[3],
                      cardColor: this.widget.sideColor[3],
                      iconColor: this.widget.sideColor[3],
                      title: this.widget.model.instagramFollowers!,
                    ),
                  ),
                  FadeInRight(
                    child: OverviewCardWidgets(
                      icon: this.widget.icon[4],
                      subtitle: this.widget.description[4],
                      cardColor: this.widget.sideColor[4],
                      iconColor: this.widget.sideColor[4],
                      title: this.widget.model.facebookFollower!,
                    ),
                  ),
                  FadeInRight(
                    child: OverviewCardWidgets(
                      icon: this.widget.icon[5],
                      subtitle: this.widget.description[5],
                      cardColor: this.widget.sideColor[5],
                      iconColor: this.widget.sideColor[5],
                      title: this.widget.model.twitterFollower!,
                    ),
                  ),
                ],
              ),
              Obx(
                () => _provider.showLoadingWidget.value
                    ? Center(
                        child: CircularProgressIndicator(strokeWidth: 1),
                      )
                    : FadeInUp(
                        child: Card(
                        elevation: 3,
                        margin: EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding:  EdgeInsets.all(20.0),
                              child: Flex(
                                direction: Axis.horizontal,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: CustomText(
                                      text: "The Team ".tr(),
                                      size: 24,
                                      color: green1,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                    width: 20,
                                  ),
                                  AddTextButtonWidget(
                                    text: "Select existing person".tr(),
                                    colors: lightBlack,
                                    onPress: () {
                                      setState(() {
                                        _provider.mCommentsController.clear();
                                        _provider.mPersonSearchController.clear();
                                        _provider.mPositionController.clear();
                                        _provider.mSelectedRole = "";
                                        _provider.mOrganizationController.clear();
                                        _provider.updatePersonID(id: 0);
                                        _provider.mDateTimeTextController.clear();
                                        _provider.isFIlePicked = false;
                                        _provider.mUserImagePath = null;
                                        _provider.mLogoID = '';
                                      });
                                      showDialog(
                                        context: context,
                                        builder: (_) => SelectExistingPersonDialogWidget(
                                          mEntrepreneurID: this.widget.mEntrepreneurID,
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                    width: 20,
                                  ),
                                  IconAndTextContainer(
                                    addText: 'New Person'.tr(),
                                    onTap: () {
                                      setState(() {
                                        _provider.mFirstNameController.clear();
                                        _provider.mLastNameController.clear();
                                        _provider.mEmailAddressController.clear();
                                        _provider.mPhoneNumberController.clear();
                                        _provider.mMobileNumberController.clear();
                                        _provider.mMailingAddressController.clear();
                                        _provider.mDateTimeTextController.clear();
                                        _provider.mCommentsController.clear();
                                        _provider.mSelectedRole = "";
                                        _provider.mPositionController.clear();
                                        _provider.isFIlePicked = false;
                                        _provider.mUserImagePath = null;
                                        _provider.mLogoID = '';
                                      });
                                      showDialog(
                                        context: context,
                                        builder: (c) => AlertDialog(
                                          title: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText(
                                                text: "Add Person".tr(),
                                                size: 30,
                                                weight: FontWeight.bold,
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  Navigator.pop(c);
                                                },
                                                icon: Icon(
                                                  Icons.close,
                                                  size: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                          content: AddOverviewPersonDialogWidget(
                                            mEntrepreneurID: this.widget.mEntrepreneurID,
                                            isUpdate: false,
                                            mPersonId: 0,
                                          ),
                                          actions: [
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  SizedBox(
                                                    child: CommonElevatedButton(
                                                        mOnTap: () {
                                                          _provider.updateUI(false, false, false);
                                                          setState(() {});

                                                          Navigator.pop(c);
                                                        },
                                                        mButtonText: "Cancel".tr(),
                                                        mButtonColor: Colors.black12),
                                                    width: 120,
                                                  ),
                                                  const SizedBox(width: 10),
                                                  SizedBox(
                                                    child: CommonElevatedButton(
                                                      mOnTap: () {
                                                        if (_provider.mFirstNameController.text.isEmpty) {
                                                          _provider.updateUI(true, false, false);
                                                          setState(() {});

                                                          return;
                                                        }
                                                        if (_provider.mLastNameController.text.isEmpty) {
                                                          _provider.updateUI(true, true, false);
                                                          setState(() {});
                                                          return;
                                                        }

                                                        /*   if (_provider.mMobileNumberController.text.isEmpty) {
                                                        _provider.updateUI(true, true, true);
                                                        setState(() {

                                                        });
                                                        return;
                                                      }*/

                                                        /*  if (_provider.mDateTimeTextController.text.isEmpty) {
                                                        AppSnackBars.showWarningSnackBar(context: c, message: "Date is required");
                                                        return;
                                                      }

                                                      if (_provider.mSelectedRoleTypesList.isEmpty) {
                                                        AppSnackBars.showWarningSnackBar(context: c, message: "Role is required");
                                                        return;
                                                      }*/

                                                        setState(() {});
                                                        Navigator.pop(c, "show next");
                                                        // Navigator.of(context).pop("show next");
                                                      },
                                                      mButtonText: "Add person".tr(),
                                                      mButtonColor: yellow,
                                                    ),
                                                    width: 120,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ).then((value) {
                                        if (value == "show next") {
                                          showDialog(
                                              context: context,
                                              builder: (context) => EditOverviewPersonDialogWidget(
                                                    isUpdate: false,
                                                    mEntrepreneurID: this.widget.mEntrepreneurID.toString(),
                                                  ));
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 8,
                              ),
                              child: DataTable(
                                showCheckboxColumn: false,
                                showBottomBorder: true,
                                headingRowHeight: !Responsive.isDesktop(context) ? 50 : 70,
                                dividerThickness: 0.5,
                                dataRowColor: MaterialStateProperty.resolveWith(_getDataRowColor),
                                checkboxHorizontalMargin: 4.0,
                                dataRowHeight: !Responsive.isDesktop(context) ? 50 : 70,
                                columnSpacing: getWidth(context) * 0.06,
                                headingTextStyle: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                    fontFamily: Montserrat_Medium
                                ),
                                columns: <DataColumn>[
                                  DataColumn(
                                      label: Expanded(
                                    child: RealCheckBoxWidget(
                                      value: _provider.selected.contains(false)? isSelectAll=false:!_provider.selected.contains(false)
                                          ?isSelectAll=true:isSelectAll,
                                      Labeltext: '',
                                      onChanged: (value) {
                                        setState(() {
                                          _provider.allCheckedBoxId.clear();
                                          if (isSelectAll == true) {
                                            isSelectAll = false;
                                            for (int i = 0; i < this.widget.personModel!.length; i++) {
                                              _provider.selected[i] = false;
                                            }
                                            _provider.allCheckedBoxId = [];
                                          } else {
                                            isSelectAll = true;
                                            for (int i = 0; i < this.widget.personModel!.length; i++) {
                                              _provider.selected[i] = true;
                                              _provider.allCheckedBoxId.add(int.parse(this.widget.personModel![i].id!));
                                            }
                                          }
                                        });
                                      },
                                    ),
                                  )),
                                  DataColumn(
                                    label: Expanded(
                                      child: Text(
                                        'Name'.tr(),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(fontFamily: Montserrat_Medium),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Expanded(
                                      child: Text(
                                        'Role'.tr(),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(fontFamily: Montserrat_Medium),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Expanded(
                                      child: Text(
                                        'E-mail'.tr(),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(fontFamily: Montserrat_Medium),

                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Expanded(
                                      child: Text(
                                        'Phone Number'.tr(),
                                        textAlign: TextAlign.start,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontFamily: Montserrat_Medium),

                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Expanded(
                                      // width: 100,
                                      child: Text(
                                        "Total: ".tr()+"${this.widget.personModel!.length.toString()}",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(fontFamily: Montserrat_Medium),

                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: SizedBox(
                                      width: 50,
                                      child: PopUpMenuButtonWidget(
                                        mOnDeleteTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              content: Container(
                                                  width: MediaQuery.of(context).size.width * 0.4,
                                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                                  child: CustomText(text: "Are you sure you want to remove this person from this organisation?".tr())),
                                              actions: [
                                                AddTextButtonWidget(
                                                  text: "Yes".tr(),
                                                  colors: yellowishGreen,
                                                  onPress: () async {
                                                    List<String> mIdsList = [];
                                                    for (var i = 0; i < _provider.selected.length; i++) {
                                                      if (_provider.selected[i] == true) {
                                                        mIdsList.add(
                                                          this.widget.personModel![i].id.toString(),
                                                        );
                                                      }
                                                    }
                                                    _provider.deleteAllEntrepreneurPersons(
                                                        entrepreneurID: this.widget.mEntrepreneurID, mPersonIds: mIdsList);
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                AddTextButtonWidget(
                                                  text: "Cancel".tr(),
                                                  colors: dimMetalic3,
                                                  onPress: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        mOnTapDownloadCSV: () {
                                          _provider.downloadCSV();
                                        },
                                        mOnEditTap: () {
                                          _provider.mFirstNameController.clear();
                                          _provider.mLastNameController.clear();
                                          _provider.mEmailAddressController.clear();
                                          _provider.mPhoneNumberController.clear();
                                          _provider.mMobileNumberController.clear();
                                          _provider.mMailingAddressController.clear();
                                          _provider.mDateTimeTextController.clear();
                                          _provider.mCommentsController.clear();
                                          _provider.mSelectedRole = "";
                                          _provider.mPositionController.clear();
                                          _provider.isFIlePicked = false;
                                          _provider.mUserImagePath = null;
                                          _provider.mLogoID = '';
                                          if (_provider.selected.contains(true) && _provider.allCheckedBoxId.length <= 1) {
                                            for (var i = 0; i < this.widget.personModel!.length; i++) {
                                              if (_provider.selected[i]) {
                                                setState(() {
                                                  String date = this.widget.personModel![i].positions![0].date.toString();
                                                  String newDate = '${date.split('-')[2]}-${date.split('-')[1]}-${date.split('-')[0]}';

                                                  _provider.mSelectedRole = this.widget.personModel![i].positions![0].role!.role![0];
                                                  _provider.mPositionController.text = this.widget.personModel![i].positions![0].position!;
                                                  _provider.mDateTimeTextController.text = newDate;
                                                  _provider.mCommentsController.text = this.widget.personModel![i].positions![0].comment == null
                                                      ? ""
                                                      : this.widget.personModel![i].positions![0].comment!;
                                                });
                                              }
                                            }
                                            showDialog(
                                                context: context,
                                                builder: (context) => EditOverviewPersonDialogWidget(
                                                      isUpdate: true,
                                                      personId: _provider.allCheckedBoxId[0].toString(),
                                                      mEntrepreneurID: this.widget.mEntrepreneurID.toString(),
                                                    ));
                                          } else if (!_provider.selected.contains(true) && _provider.allCheckedBoxId.isEmpty) {
                                            showSnack('Select Team Member first'.tr());
                                          } else {
                                            showDialog(
                                                context: context,
                                                builder: (c) => AlertDialog(
                                                      title: CustomText(
                                                        text: 'Warning!!!'.tr(),
                                                        weight: FontWeight.bold,
                                                      ),
                                                      content: Container(
                                                        width: MediaQuery.of(context).size.width * 0.3,
                                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                                        child: CustomText(
                                                          size: 13,
                                                          textAligns: TextAlign.start,
                                                          text:
                                                              "You can only edit the role of one person at the time. Please select one team member at the time and edit their role".tr(),
                                                        ),
                                                      ),
                                                      actions: [
                                                        AddTextButtonWidget(
                                                          text: "Ok".tr(),
                                                          colors: yellowishGreen,
                                                          onPress: () {
                                                            Navigator.of(context, rootNavigator: true).pop();
                                                          },
                                                        ),
                                                      ],
                                                    ));
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                                rows: <DataRow>[
                                  for (int i = 0; i < this.widget.personModel!.length; i++)
                                    DataRow(
                                      onSelectChanged: (bool? value) {
                                        setState(
                                          () {
                                            // navigationController.navigateTo(wijLandProfileScreenRoute);
                                            launchUrl('https://$gloal_base_path/people/${this.widget.personModel![i].id}');
                                          },
                                        );
                                      },
                                      cells: <DataCell>[
                                        DataCell(RealCheckBoxWidget(
                                          value: _provider.selected[i],
                                          Labeltext: '',
                                          onChanged: (value) {
                                            setState(() {
                                              if (_provider.selected[i] == true) {
                                                _provider.selected[i] = false;
                                                _provider.allCheckedBoxId.remove(this.widget.personModel![i].id);
                                              } else {
                                                _provider.selected[i] = true;
                                                if (!_provider.allCheckedBoxId.contains(this.widget.personModel![i].id)) {
                                                  _provider.allCheckedBoxId.add(int.parse(this.widget.personModel![i].id!));
                                                }
                                              }
                                            });
                                          },
                                        )),
                                        DataCell(Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              CircleAvatar(
                                                radius: 20,
                                                backgroundImage: this.widget.personModel![i].imageInfo?.path != null
                                                    ? NetworkImage(
                                                        this.widget.personModel![i].imageInfo!.path!,
                                                      )
                                                    : AssetImage(
                                                        Images.profileImg,
                                                      ) as ImageProvider,
                                              ),
                                              SizedBox(
                                                width: 12,
                                              ),
                                              Expanded(
                                                child: CustomText(
                                                  text: this.widget.personModel![i].name ?? "",
                                                  textAligns: TextAlign.start,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                        DataCell(
                                          CustomText(
                                            text: this.widget.personModel![i].positions![0].role!.role!.isNotEmpty
                                                ? this.widget.personModel![i].positions![0].role!.role![0]
                                                : "",
                                            textAligns: TextAlign.start,
                                          ),
                                        ),
                                        DataCell(
                                          CustomText(
                                            text: this.widget.personModel![i].email ?? "",
                                            textAligns: TextAlign.start,
                                          ),
                                        ),
                                        DataCell(
                                          CustomText(
                                            text: this.widget.personModel![i].mobile != null
                                                ? this.widget.personModel![i].mobile ?? this.widget.personModel![i].phone!
                                                : '',
                                            textAligns: TextAlign.start,
                                          ),
                                        ),
                                        DataCell(
                                          SizedBox(),
                                        ),
                                        DataCell(SizedBox())
                                      ],
                                    ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
              ),
              FadeInUp(
                child: Card(
                  elevation: 3.0,
                  margin: EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 28.0, left: 16),
                        child: CustomText(
                          text: 'Help Request'.tr(),
                          color: green1,
                          size: 24,
                          weight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16.0, left: 16, right: 16, bottom: 34),
                        child: CustomText(
                          text: this.widget.model.helpRequest!,
                          size: 12,
                          weight: FontWeight.normal,
                          textAligns: TextAlign.start,
                          lines: 200,
                          color: Color(0xff707070),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Color _getDataRowColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };

    if (states.any(interactiveStates.contains)) {
      return Colors.transparent;
    }
    //return Colors.green; // Use the default value.
    return Colors.transparent;
  }
}
