import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:wij_land/non_admin/screens/profile/view/dialog_content_widget.dart';
import 'package:wij_land/non_admin/screens/profile/view/shimmer_effect_widget.dart';
import 'package:wij_land/utils/controller.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/hex_color.dart';
import 'package:wij_land/utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../../app_common_widgets/large_screen.dart';
import '../../../providers/person_profile_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    final provider = Provider.of<PersonProfileProvider>(context, listen: false);

    provider.getPersonProfileDetailData(id: authController.myUser.value.personId!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PersonProfileProvider>(builder: (context, provider, widget) {
      return VisibilityDetector(
        key:  Key('ProfileScreen-key'),
        onVisibilityChanged: (VisibilityInfo visibilityInfo) {
          var visiblePercentage = visibilityInfo.visibleFraction * 100;
          if (visiblePercentage > 50) {
            global_farmer_entitiy.value = [
              Text(
                'Profile'.tr(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: darkRed),
              ),
            ];
          }
        },
        child: Scaffold(
          backgroundColor: HexColor('#E5E5E5'),
          body: provider.mShowLoading
              ? ShimmerEffectWidgetForProfile()
              : Padding(
                  padding: EdgeInsets.only(left: Responsive.isMobile(context) ? 22 : 60, right: Responsive.isMobile(context) ? 22 : 60, top: 37),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _TextWidget(
                        mText: "Person Profile".tr(),
                        mFontSize: Responsive.isMobile(context) ? 16 : 22,
                        mFontWeight: Responsive.isMobile(context) ? FontWeight.w600 : FontWeight.w800,
                        mColor: HexColor('#892913'),
                      ),
                      SizedBox(height: 19),
                      Card(
                        // width: MediaQuery.of(context).size.width,
                        // clipBehavior: Clip.hardEdge,
                        // height: 200,
                        // decoration: BoxDecoration(
                        //   color: HexColor("#FFFFFF"),
                        //   borderRadius: BorderRadius.circular(12),
                        // ),
                        child: Padding(
                          padding:  EdgeInsets.only(left:Responsive.isMobile(context)?12: 21, top: 14, right:Responsive.isMobile(context)?12: 33),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flex(
                                direction: Responsive.isMobile(context)?Axis.vertical:Axis.horizontal,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height:Responsive.isMobile(context)?100: 129,
                                    width:Responsive.isMobile(context)?100: 129,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.shade200,
                                    ),
                                    child: provider.personProfileDetailResponseModel.data?.imagePath == null
                                        ? SizedBox()
                                        : ClipRRect(
                                            borderRadius: BorderRadius.circular(100),
                                            child: Image.network(
                                              provider.personProfileDetailResponseModel.data!.imagePath!.path!,
                                              height:Responsive.isMobile(context)?100: 129,
                                              width:Responsive.isMobile(context)?100: 129,
                                              fit: BoxFit.cover,
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) return child;
                                                return SizedBox(
                                                  height: 129,
                                                  width: 129,
                                                  child: Center(
                                                    child: CircularProgressIndicator(
                                                      value: loadingProgress.expectedTotalBytes != null
                                                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                                          : null,
                                                      strokeWidth: 1,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                  ),
                                  SizedBox(width:Responsive.isMobile(context)?14: 33),
                                  SizedBox(
                                    // width: getWidth(context)*0.5,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            _TextWidget(
                                              mText:
                                                  "${provider.personProfileDetailResponseModel.data?.firstName ?? ""} ${provider.personProfileDetailResponseModel.data?.lastName ?? ""} ",
                                              mFontSize: Responsive.isMobile(context) ? 13 : 16,
                                              mFontWeight: FontWeight.w800,
                                              mColor: HexColor('#48883E'),
                                            ),
                                            // SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                                            IconButton(
                                              onPressed: () {
                                                provider.setData();
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                        title: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            _TextWidget(
                                                              mText: "Edit Person".tr(),
                                                              mFontSize:Responsive.isMobile(context)?14: 16,
                                                              mFontWeight:Responsive.isMobile(context)?FontWeight.w600: FontWeight.w800,
                                                              mColor: HexColor('#000000'),
                                                            ),
                                                            IconButton(
                                                              onPressed: () {
                                                                Navigator.pop(context);
                                                              },
                                                              icon: Icon(
                                                                Icons.close,
                                                                size: 18,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        backgroundColor: Colors.white,
                                                        content: DialogContentWidget());
                                                  },
                                                );
                                              },
                                              icon: Icon(
                                                Icons.edit,
                                                size: 18,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 3),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Email".tr(),
                                                style: TextStyle(
                                                  color: HexColor('#000000'),
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: Responsive.isMobile(context) ? 13 : 16,
                                                  fontFamily: Montserrat_Medium,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ": ${provider.personProfileDetailResponseModel.data?.emailAddress ?? ""}",
                                                style: TextStyle(
                                                  color: HexColor('#000000'),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: Responsive.isMobile(context) ? 12 : 14,
                                                  fontFamily: Montserrat_Medium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 3),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Mobile ".tr(),
                                                style: TextStyle(
                                                  color: HexColor('#000000'),
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: Responsive.isMobile(context) ? 13 : 16,
                                                  fontFamily: Montserrat_Medium,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ": ${provider.personProfileDetailResponseModel.data?.phoneNumberMobile ?? ""}",
                                                style: TextStyle(
                                                  color: HexColor('#000000'),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: Responsive.isMobile(context) ? 12 : 14,
                                                  fontFamily: Montserrat_Medium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 3),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Home ".tr(),
                                                style: TextStyle(
                                                  color: HexColor('#000000'),
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: Responsive.isMobile(context) ? 13 : 16,
                                                  fontFamily: Montserrat_Medium,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ": ${provider.personProfileDetailResponseModel.data?.phoneNumberHome ?? ""}",
                                                style: TextStyle(
                                                  color: HexColor('#000000'),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: Responsive.isMobile(context) ? 12 : 14,
                                                  fontFamily: Montserrat_Medium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 3),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Address ".tr(),
                                                style: TextStyle(
                                                  color: HexColor('#000000'),
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: Responsive.isMobile(context) ? 13 : 16,
                                                  fontFamily: Montserrat_Medium,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ": ${provider.personProfileDetailResponseModel.data?.addressMail ?? ""}",
                                                style: TextStyle(
                                                  color: HexColor('#000000'),
                                                  fontWeight: FontWeight.w400,
                                                  overflow: TextOverflow.ellipsis,
                                                  fontSize: Responsive.isMobile(context) ? 12 : 14,
                                                  fontFamily: Montserrat_Medium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 35,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    _TextWidget(
                                      mText: "Roles".tr(),
                                      mFontSize: Responsive.isMobile(context) ? 16 : 20,
                                      mFontWeight: FontWeight.w600,
                                      mColor: HexColor('#48883E'),
                                    ),
                                    SizedBox(height: 6),
                                    Container(
                                      height: 3,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: HexColor("#48883E"),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 19),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        //  height: 196,
                        decoration: BoxDecoration(
                          color: HexColor("#FFFFFF"),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, top: 14, right: 33, bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: _TextWidget(
                                  mText: provider.personProfileDetailResponseModel.data?.role ?? "",
                                  mFontSize: Responsive.isMobile(context) ? 16 : 22,
                                  mFontWeight: FontWeight.w800,
                                  mColor: HexColor('#000000'),
                                ),
                              ),
                              SizedBox(height: 9),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Involved with WijLand Since\t".tr() +
                                            DateFormat('dd-MM-yyyy').format(
                                                DateTime.parse(provider.personProfileDetailResponseModel.data?.dateAdded ?? DateTime.now().toString())),
                                        style: TextStyle(
                                          color: HexColor('#000000'),
                                          fontWeight: FontWeight.w400,
                                          fontSize: Responsive.isMobile(context) ? 12 : 14,
                                          fontFamily: Montserrat_Medium,
                                        ),
                                      ),
                                      // TextSpan(
                                      //   text: "    Farmer Role:".tr(),
                                      //   style: TextStyle(
                                      //     color: HexColor('#000000'),
                                      //     fontWeight: FontWeight.w800,
                                      //     fontSize: 16,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 14),
                              // Padding(
                              //   padding: const EdgeInsets.only(left: 8),
                              //   child: _TextWidget(
                              //     mText: "Relevant checkboxes",
                              //     mFontSize: 14,
                              //     mFontWeight: FontWeight.w400,
                              //     mColor: HexColor('#000000'),
                              //   ),
                              // ),
                              // SizedBox(height: 5),
                              // Row(
                              //   children: [
                              //     Checkbox(
                              //       value: provider.personProfileDetailResponseModel.data?.interestedToRentNatureGrounds == null
                              //           ? false
                              //           : provider.personProfileDetailResponseModel.data!.interestedToRentNatureGrounds!,
                              //       onChanged: (value) {},
                              //       activeColor: HexColor("#48883E"),
                              //     ),
                              //     _TextWidget(
                              //       mText: "Interested in Renting Nature Grounds",
                              //       mFontSize: 14,
                              //       mFontWeight: FontWeight.w400,
                              //       mColor: HexColor('#000000'),
                              //     ),
                              //   ],
                              // ),
                              // Row(
                              //   children: [
                              //     Checkbox(
                              //       value: provider.personProfileDetailResponseModel.data?.focusGroupMember == null
                              //           ? false
                              //           : provider.personProfileDetailResponseModel.data!.focusGroupMember!,
                              //       onChanged: (value) {},
                              //       activeColor: HexColor("#48883E"),
                              //     ),
                              //     _TextWidget(
                              //       mText: "Member of Focus Group",
                              //       mFontSize: 14,
                              //       mFontWeight: FontWeight.w400,
                              //       mColor: HexColor('#000000'),
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
        fontFamily: Montserrat_Medium,
      ),
    );
  }
}
