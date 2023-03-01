import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hovering/hovering.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:wij_land/utils/functions.dart';
import '../../../app_common_widgets/custom_text.dart';
import '../../../utils/responsive.dart';
import '../../../utils/styles.dart';
import '../../app_common_widgets/large_screen.dart';
import '../../providers/farm_computer_member_provider/farm_computer_members_provider.dart';

class FarmComputerMemberScreen extends StatefulWidget {
  final dynamic arguments;

  const FarmComputerMemberScreen({Key? key, this.arguments}) : super(key: key);

  @override
  State<FarmComputerMemberScreen> createState() => _FarmComputerMemberScreenState();
}

class _FarmComputerMemberScreenState extends State<FarmComputerMemberScreen> {
  @override
  void initState() {
    isLoading = true;
    super.initState();
    initData();
  }

  initData() async {
    var _provider = Provider.of<FarmComputerMembersProvider>(context, listen: false);
    await _provider.getFarmComputerMembers();
    isLoading = false;
  }

  bool isLoading = false;
  bool checkContactInfo = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FarmComputerMembersProvider>(context);
    print("value======================== ${widget.arguments}");
    return VisibilityDetector(
      key: Key('MembersScreen-key'),
      onVisibilityChanged: (visibilityInfo) {
        var visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 50) {
          if (widget.arguments != null) {
            global_farmer_entitiy.value = [
              HoverWidget(
                child: Text(
                  'Home / '.tr(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: shineGrey,
                    fontFamily: Montserrat_Medium,
                  ),
                ),
                hoverChild: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Home / '.tr(),
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: Montserrat_Medium,
                      fontWeight: FontWeight.bold,
                      color: shineGrey,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                    ),
                  ),
                ),
                onHover: (event) {},
              ),
              Text(
                'Members'.tr(),
                style: TextStyle(
                  fontFamily: Montserrat_Medium,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: darkRed,
                ),
              ),
            ];
          } else {
            global_farmer_entitiy.value = [
              Text(
                'Members'.tr(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: darkRed),
              ),
            ];
          }
        }
      },
      child: isLoading
          ? SizedBox(
              height: getHeight(context) / 2,
              width: getWidth(context),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : provider.farmComputerMembersModel.status == 400
              ? Container(
                  alignment: Alignment.topCenter,
                  height: getHeight(context) / 2,
                  child: Center(
                    child: CustomText(
                      text: provider.farmComputerMembersModel.message ?? "Data No Found",
                      color: Colors.red,
                      weight: FontWeight.w700,
                      size: 20,
                    ),
                  ),
                )
              : Scaffold(
                  body: SingleChildScrollView(
                    child: Container(
                      width: getWidth(context),
                      padding: EdgeInsets.all(Responsive.isMobile(context) ? 10 : 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: CustomText(
                                  text: "Members".tr(),
                                  size: Responsive.isMobile(context) ? 16 : 20,
                                  weight: FontWeight.w800,
                                  color: darkred,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Card(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(height: 20),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: DataTable(
                                      // showCheckboxColumn: true,
                                      // checkboxHorizontalMargin: 5,
                                      dataRowHeight: Responsive.isMobile(context) ? 60 : 100,
                                      columns: [
                                        // DataColumn(
                                        //   label: RealCheckBoxWidget(
                                        //     value: checkContactInfo,
                                        //     onChanged: (value) {
                                        //       setState(
                                        //         () {
                                        //          // checkContactInfo = !checkContactInfo;
                                        //         },
                                        //       );
                                        //     },
                                        //     Labeltext: "",
                                        //   ),
                                        // ),
                                        DataColumn(label: MemberInfoWidget(first: true, text: "Name".tr())),
                                        DataColumn(label: MemberInfoWidget(first: true, text: "Email".tr())),
                                        DataColumn(label: MemberInfoWidget(first: true, text: "Phone Number".tr())),
                                        DataColumn(label: MemberInfoWidget(first: true, text: "Join Date".tr(), width: 130)),
                                        DataColumn(label: MemberInfoWidget(first: true, text: "Role".tr(), width: 130)),
                                        DataColumn(label: MemberInfoWidget(first: true, text: "Comment".tr(), width: 180)),
                                        DataColumn(
                                            label: MemberInfoWidget(
                                                text: "Total".tr() + "${provider.farmComputerMembersModel.data!.length}", first: true)),
                                      ],
                                      rows: <DataRow>[
                                        for (int i = 0; i < provider.farmComputerMembersModel.data!.length; i++)
                                          DataRow(
                                            cells: [
                                              // DataCell(
                                              //   RealCheckBoxWidget(
                                              //     value: checkContactInfo,
                                              //     onChanged: (value) {
                                              //       setState(
                                              //         () {
                                              //          // checkContactInfo = !checkContactInfo;
                                              //         },
                                              //       );
                                              //     },
                                              //     Labeltext: "",
                                              //   ),
                                              // ),
                                              DataCell(MemberInfoWidget(first: false, text: provider.farmComputerMembersModel.data![i].name ?? "-")),
                                              DataCell(MemberInfoWidget(
                                                  first: false, text: provider.farmComputerMembersModel.data![i].emailAddress ?? "-")),
                                              DataCell(MemberInfoWidget(
                                                  first: false, text: provider.farmComputerMembersModel.data![i].phoneNumberMobile ?? "-")),
                                              DataCell(MemberInfoWidget(
                                                  first: false,
                                                  text: (provider.farmComputerMembersModel.data![i].joinDate == null) ||
                                                          (provider.farmComputerMembersModel.data![i].joinDate!.isEmpty)
                                                      ? "-"
                                                      : provider.farmComputerMembersModel.data![i].joinDate!.toString().substring(0, 10) ?? "-",
                                                  width: 130)),
                                              DataCell(MemberInfoWidget(
                                                  first: false,
                                                  text: provider.farmComputerMembersModel.data![i].role == null
                                                      ? "-"
                                                      : provider.farmComputerMembersModel.data![i].role!.first ?? "-",
                                                  width: 130)),
                                              DataCell(
                                                Container(
                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                  width: 150,
                                                  child: Html(
                                                    data:( provider.farmComputerMembersModel.data![i].comment == null)||( provider
                                                        .farmComputerMembersModel.data![i].comment!.isEmpty)
                                                        ? "-"
                                                        : provider.farmComputerMembersModel.data![i].comment ?? "-",
                                                    style: {
                                                      "#": Style(
                                                          fontWeight: Responsive.isMobile(context) ? FontWeight.w300 : FontWeight.normal,
                                                          padding: EdgeInsets.zero,
                                                          margin: EdgeInsets.zero),
                                                      "body": Style(
                                                        fontFamily: Montserrat_Medium,
                                                        fontSize: Responsive.isMobile(context) ? FontSize.xSmall : FontSize.smaller,
                                                        textAlign: TextAlign.start,
                                                        textOverflow: TextOverflow.ellipsis,
                                                        maxLines: 6,
                                                      ),
                                                      "span ": Style(
                                                        fontFamily: Montserrat_Medium,
                                                        fontSize: Responsive.isMobile(context) ? FontSize.xSmall : FontSize.smaller,
                                                        textAlign: TextAlign.start,
                                                        textOverflow: TextOverflow.ellipsis,
                                                        maxLines: 6,
                                                      ),
                                                    },
                                                  ),
                                                ),
                                              ),
                                              DataCell(MemberInfoWidget(first: false, text: ""), onTap: () {}),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}

class MemberInfoWidget extends StatelessWidget {
  const MemberInfoWidget({
    Key? key,
    required this.text,
    required this.first,
    this.width = 150,
  }) : super(key: key);
  final String text;
  final bool first;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: width,
      child: CustomText(
        text: text,
        lines: 5,
        overflows: TextOverflow.ellipsis,
        size: first
            ? Responsive.isMobile(context)
                ? 11
                : 14
            : Responsive.isMobile(context)
                ? 9
                : 12,
        weight: first ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
