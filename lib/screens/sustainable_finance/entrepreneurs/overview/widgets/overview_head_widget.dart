import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/models/entrepreneur/response/get_entrepreneur_detail_response.dart';
import 'package:wij_land/models/entrepreneur/response/get_entrepreneur_overview.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/overview/widgets/update_entrepreneur_dialog_widget.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../app_common_widgets/on_hover.dart';
import '../../../../../providers/entrepreneur/entrepreneur_screen_overview_provider.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/responsive.dart';
import '../../../../../utils/styles.dart';
import '../../../../office/widgets/add_text_button_widget.dart';

class OverviewHeadWidget extends StatefulWidget {
  final Function()? isClicked;
  final bool onClick;
  final GetEntrepreneurOverviewResponse model;
  final GetEntrepreneurDetailsResponse detailsResponse;
  final int mEntrepreneurID;

  const OverviewHeadWidget({
    Key? key,
    required this.onClick,
    required this.isClicked,
    required this.model,
    required this.detailsResponse,
    required this.mEntrepreneurID,
  }) : super(key: key);

  @override
  State<OverviewHeadWidget> createState() => _OverviewHeadWidgetState();
}

class _OverviewHeadWidgetState extends State<OverviewHeadWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurOverviewScreenProvider>(builder: (context, _provider, widget) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.all(10),
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
            child: _provider.detailsResponse.data?.imagePath?.path == null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image(
                      image: AssetImage(Images.wallpaper),
                      fit: BoxFit.cover,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.network(
                      _provider.detailsResponse.data!.imagePath!.path!,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          OnHover(
            builder: (hover) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: this.widget.isClicked,
                      child: CustomText(
                        text: this.widget.detailsResponse.data?.entrepreneurName ?? "",
                        color: Color(0xffA71832),
                        size: Responsive.isDesktop(context) ? 20 : 16,
                        weight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: this.widget.isClicked,
                      child: Icon(
                        FontAwesomeIcons.angleDown,
                        size: 16,
                        color: Color(0xffA71832),
                      ),
                    ),
                    SizedBox(
                      width: this.widget.onClick ? 50 : 0,
                    ),
                    !this.widget.onClick
                        ? hover
                            ? SizedBox()
                            : SizedBox()
                        : PopupMenuButton<int>(
                            iconSize: !Responsive.isDesktop(context) ? 15 : 20,
                            itemBuilder: (context) {
                              return <PopupMenuEntry<int>>[
                                PopupMenuItem(
                                  child: Text("Edit".tr(), style: TextStyle(fontFamily: Montserrat_Medium),),
                                  value: 1,
                                  onTap: () {
                                    // _provider.mEnterpriseNameController.text =
                                    //     _provider.detailsResponse.data!
                                    //         .entrepreneurName!;
                                    // _provider.mSellingLocationsController
                                    //         .text =
                                    //     this
                                    //         .widget
                                    //         .model
                                    //         .data![i]
                                    //         .sellingLocations
                                    //         .toString();
                                    _provider.titleClick = [true, false];
                                    showDialog(
                                      context: context,
                                      builder: (_) => UpdateEntrepreneurDialogWidget(
                                        mEntrepreneurID: this.widget.mEntrepreneurID,
                                      ),
                                    );

                                    // _provider.mEnterpriseNameController
                                    //     .text =
                                    // this.widget.model.data![i].name!;
                                    // _provider.mSellingLocationsController
                                    //     .text =
                                    //     this
                                    //         .widget
                                    //         .model
                                    //         .data![i]
                                    //         .sellingLocations
                                    //         .toString();
                                    // showDialog(
                                    //   context: context,
                                    //   builder: (_) =>
                                    //       EntrepreneursDialogWidget(
                                    //         isUpdate: true,
                                    //         mEntrepreneurID:
                                    //         this.widget.model.data![i].id!,
                                    //       ),
                                    // );
                                  },
                                ),
                                PopupMenuItem(
                                  child: Text("Delete".tr(), style: TextStyle(fontFamily: Montserrat_Medium),),
                                  value: 0,
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        content: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                          child: Text("Are you sure you want to delete this entrepreneur profile?".tr(),style: TextStyle(fontFamily: Montserrat_Medium),),
                                        ),
                                        actions: [
                                          SizedBox(
                                            width: 120,
                                            child: AddTextButtonWidget(
                                              text: "YES".tr(),
                                              colors: yellowishGreen,
                                              onPress: () async {
                                                await _provider.deleteAnEntrepreneur(this.widget.mEntrepreneurID, context);
                                                Navigator.of(context).pop(0);
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: 120,
                                            child: AddTextButtonWidget(
                                              text: "CANCEL".tr(),
                                              colors: dimMetalic3,
                                              onPress: () {
                                                Navigator.of(
                                                  context,
                                                ).pop('yes');
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ).then((value) {
                                      if (value == 0) {
                                        Navigator.of(
                                          context,
                                        ).pop(0);
                                      }
                                    });

                                    // _provider.deleteAnEntrepreneur(
                                    //   this.widget.model.data![i].id!,
                                    //   getEntrepreneurData: true,
                                    // );
                                    // setState(
                                    //       () {
                                    //     this.widget.model.data!.removeAt(i);
                                    //   },
                                    // );
                                  },
                                ),
                              ];
                            },
                          ),
                  ],
                ),
              );
            },
          ),
        ],
      );
    });
  }
}
