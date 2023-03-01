import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

// import 'package:flutter_widget_from_html/flutter_widget_from_dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/contacts/add_contact_moment_dialog_widget.dart';
import 'package:wij_land/screens/sustainable_finance/entrepreneurs/contacts/add_contact_moment_screen.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../../app_common_widgets/on_hover.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../app_common_widgets/text_widget.dart';
import '../../../../models/entrepreneur/response/get_entrepreneur_contact_moment_response.dart';
import '../../../../providers/entrepreneur/entrepreneur_contact_moment_provider.dart';
import '../../../../utils/ShimmerEffect.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/hex_color.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../../office/widgets/add_button.dart';
import '../../../office/widgets/add_text_button_widget.dart';

class EntrepreneursContactScreen extends StatefulWidget {
  final id;
  final entrepreneurName;

  const EntrepreneursContactScreen({Key? key, this.id, this.entrepreneurName}) : super(key: key);

  @override
  State<EntrepreneursContactScreen> createState() => _EntrepreneursContactScreenState();
}

class _EntrepreneursContactScreenState extends State<EntrepreneursContactScreen> {
  @override
  void initState() {
    final provider = Provider.of<EntrepreneurContactMomentScreenProvider>(context, listen: false);

    provider.getEntrepreneurContactMomentData(widget.id);
    provider.getProjectsDropDownData();
    provider.getPersonsDropDownData();
    provider.getFarmsDropDownData();
    provider.getAttendeesDropDownData();
    super.initState();
  }

  apiCalls() async {}

  bool loadData = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurContactMomentScreenProvider>(builder: (context, provider, widget) {
      return Container(
          padding: const EdgeInsets.all(20),
          width: getWidth(context),
          child: provider.showLoadingWidget
              ? SingleChildScrollView(
                  child: SizedBox(
                    child: ListView.builder(
                      itemBuilder: (c, i) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: ShimmerEffect(
                              child: Container(
                            height: 80,
                            width: double.infinity,
                            color: Colors.blue,
                          )),
                        );
                      },
                      itemCount: 10,
                    ),
                    height: getHeight(context),
                    width: getWidth(context),
                  ),
                )
              : SingleChildScrollView(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: getWidth(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: "Contact".tr(),
                                  size: 24,
                                  weight: FontWeight.bold,
                                  color: darkGreen,
                                ),
                                Expanded(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    OnHover(
                                      builder: (hover) {
                                        return Card(
                                          elevation: 2,
                                          child: AnimatedContainer(
                                            alignment: Alignment.center,
                                            duration: const Duration(milliseconds: 400),
                                            height: 45,
                                            width: provider.searchTapped ? 200 : 45,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(5)),
                                              color: provider.searchTapped
                                                  ? HexColor('#FFFFFF')
                                                  : hover
                                                      ? lightGreen
                                                      : HexColor('#FFFFFF'),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.04),
                                                  offset: Offset(0, 15),
                                                  blurRadius: 25,
                                                )
                                              ],
                                            ),
                                            child: Center(
                                              child: Row(
                                                children: [
                                                  if (provider.searchTapped)
                                                    Expanded(
                                                      child: TextField(
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          contentPadding: EdgeInsets.only(left: 10, bottom: 5),
                                                        ),
                                                        controller: provider.mFilterSearchStringController,
                                                        autofocus: true,
                                                        onChanged: (value) {
                                                          provider.getEntrepreneurContactMomentData(
                                                            this.widget.id,
                                                          );
                                                        },
                                                        onSubmitted: (value) {
                                                          provider.getEntrepreneurContactMomentData(
                                                            this.widget.id,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  SizedBox(
                                                    height: 45,
                                                    width: 45,
                                                    child: OnHover(
                                                      builder: (hover) => InkWell(
                                                        onTap: () async {
                                                          setState(
                                                            () {
                                                              provider.searchTapped = !provider.searchTapped;
                                                            },
                                                          );
                                                        },
                                                        hoverColor: Colors.transparent,
                                                        child: Icon(
                                                          Icons.search,
                                                          color: provider.searchTapped
                                                              ? secondary
                                                              : hover
                                                                  ? Colors.white
                                                                  : secondary,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      width: 11,
                                    ),
                                    Card(
                                      elevation: 2,
                                      child: IconHoverButton(
                                        icons: FontAwesomeIcons.filter,
                                        widthSize: 63,
                                        onPress: () {
                                          setState(() {
                                            provider.mShowFilters = !provider.mShowFilters;
                                            provider.showFilter(filterValue: provider.mShowFilters);
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 11),
                                    ButtonWithAddIcon(
                                      text: "Contact".tr(),
                                      onPressed: () {
                                        provider.clearContactMomentSelectedData();
                                        //  provider.setDataFromAddNotesDialogButton();
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return EntreContactDialog(
                                                mEntrepreneurID: this.widget.id,
                                                isUUpdate: false,
                                                entrepreneurName: this.widget.entrepreneurName,
                                              );
                                            }).then((value) async {
                                          setState(() {});
                                          // if (value == 'true') {
                                          //   setState(() {});
                                          // }
                                        });
                                      },
                                    )
                                  ],
                                )),
                              ],
                            ),
                          ),
                          provider.mShowFilters
                              ? Container(
                                  height: 100,
                                  width: double.infinity,
                                  color: Colors.white,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 4,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 12, right: 12),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  showDatePicker(
                                                          context: context,
                                                          initialDate: DateTime.now(),
                                                          firstDate: DateTime(2001),
                                                          lastDate: DateTime(2023))
                                                      .then((d) {
                                                    if (d != null) {
                                                      setState(() {
                                                        provider.mFilterFromDateController.text = DateFormat('dd-MM-yyyy').format(d);
                                                        provider.mFromDateForSend = d.toString().split(" ")[0];
                                                      });
                                                    }
                                                  });
                                                },
                                                child: Builder(
                                                  builder: (context) => SizedBox(
                                                    height: 50,
                                                    width: 130,
                                                    child: TextWidgetField(
                                                      controller: provider.mFilterFromDateController,
                                                      hintText: "From".tr(),
                                                      textPadding: EdgeInsets.only(top: 5, left: 10),
                                                      enabled: false,
                                                      suffixIcon: const Icon(
                                                        Icons.calendar_today_outlined,
                                                        size: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  showDatePicker(
                                                          context: context,
                                                          initialDate: DateTime.now(),
                                                          firstDate: DateTime(2001),
                                                          lastDate: DateTime(2023))
                                                      .then((d) {
                                                    if (d != null) {
                                                      setState(() {
                                                        provider.mFilterToDateController.text = DateFormat('dd-MM-yyyy').format(d);
                                                        provider.mToDateForSend = d.toString().split(" ")[0];
                                                      });
                                                    }
                                                  });
                                                },
                                                child: Builder(
                                                  builder: (context) => SizedBox(
                                                    height: 50,
                                                    width: 130,
                                                    child: TextWidgetField(
                                                      controller: provider.mFilterToDateController,
                                                      hintText: "To".tr(),
                                                      textPadding: EdgeInsets.only(top: 5, left: 10),
                                                      enabled: false,
                                                      suffixIcon: const Icon(
                                                        Icons.calendar_today_outlined,
                                                        size: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: RealDropDownWidget(
                                                value: provider.mContactMomentTypeForFilter,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    provider.mContactMomentTypeForFilter = newValue;
                                                  });
                                                },
                                                items: provider.mContactMomentTypDropDown.map<DropdownMenuItem<String>>((String value) {
                                                  return DropdownMenuItem<String>(value: value, child: Text(value, style: TextStyle( fontFamily: Montserrat_Medium),));
                                                }).toList(),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            // Expanded(
                                            //   child: RealDropDownWidget(
                                            //     value: provider.mAttendeeForFilter,
                                            //     onChanged: (newValue) {
                                            //       setState(() {
                                            //         provider.mAttendeeForFilter = newValue;
                                            //       });
                                            //     },
                                            //     items: provider.attendeesDropdown.data!.map<DropdownMenuItem<AttendeesData>>((AttendeesData value) {
                                            //       return DropdownMenuItem<AttendeesData>(value: value, child: Text(value.name!));
                                            //     }).toList(),
                                            //   ),
                                            // ),
                                            SizedBox(width: 10),
                                            AddTextButtonWidget(
                                              text: 'Clear'.tr(),
                                              colors: dimMetalic3,
                                              onPress: () {
                                                setState(() {
                                                  provider.mFilterToDateController.clear();
                                                  provider.mFilterFromDateController.clear();
                                                  provider.mContactMomentTypeForFilter = "Select Contact Moment";
                                                  provider.mFilterSearchStringController.clear();
                                                  provider.mToDateForSend = "";
                                                  provider.mFromDateForSend = "";
                                                });
                                                provider.getEntrepreneurContactMomentData(
                                                  this.widget.id,
                                                );
                                              },
                                            ),
                                            SizedBox(width: 10),
                                            AddTextButtonWidget(
                                              text: 'Apply'.tr(),
                                              colors: yellow,
                                              onPress: () {
                                                provider.getEntrepreneurContactMomentData(
                                                  this.widget.id,
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(height: 10),
                          provider.model.data == null
                              ? SizedBox()
                              : Visibility(
                                  visible: provider.model.data == null ? false : true,
                                  child: Column(
                                      children: provider.model.data!.map((e) {
                                    return InkWell(
                                      onTap: () async {
                                        provider.setAlreadyAssignedDataBeforeUpdate(
                                          contactMomentModel: e,
                                        );

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => AddContactMomentScreen(
                                              mEntrepreneurID: this.widget.id,
                                              mContactPersonID: e.id!,
                                              contactMomentResponse: e,
                                              mDisplayDataOnly: true,
                                              mIndex: provider.model.data!.indexOf(e),
                                              title: this.widget.entrepreneurName,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          ConstrainedBox(
                                            constraints: BoxConstraints(minWidth: getWidth(context) * 0.2, maxWidth: getWidth(context) * 0.2),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20),
                                              child: Column(
                                                children: [
                                                  CustomText(
                                                    text: e.contactMomentType ?? "",
                                                    size: 20,
                                                    lines: 3,
                                                    weight: FontWeight.bold,
                                                  ),
                                                  CustomText(
                                                    text: DateFormat('dd-MM-yyyy').format(DateTime.parse(e.contactMomentDate!)).toString(),
                                                    size: 16,
                                                    lines: 3,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(left: 8, right: 5),
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: provider.colors[(provider.model.data!.indexOf(e) + 1) % 4],
                                                  borderRadius: BorderRadius.circular(50),
                                                ),
                                                child: SvgPicture.asset(
                                                  setImageIconAccordingToContact(
                                                    contactMomentType: e.contactMomentType!,
                                                  ),
                                                  height: 24,
                                                  width: 24,
                                                ),
                                              ),
                                              Container(
                                                width: 2,
                                                height: !Responsive.isDesktop(context) ? 200 : 150,
                                                color: provider.model.data!.indexOf(e) == provider.model.data!.length - 1
                                                    ? Colors.transparent
                                                    : Colors.black12,
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: !Responsive.isDesktop(context) ? 5 : 30,
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: HtmlWidget(
                                                          e.contactSubject ?? "",
                                                          textStyle: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                            fontFamily: Montserrat_Medium,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 10),
                                                    ],
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      CustomText(
                                                        text: "Attended:".tr(),
                                                        size: 18,
                                                        weight: FontWeight.bold,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Expanded(
                                                        child: CustomText(
                                                          text: e.attendees == null || e.attendees!.isEmpty ? '' : listOfAttachedString(e.attendees!),
                                                          size: 18,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  HtmlWidget(
                                                    e.contactNotes ?? "",
                                                    textStyle: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                      fontFamily: Montserrat_Medium,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList()),
                                ),
                          // Container(
                          //   width: getWidth(context),
                          //   padding: EdgeInsets.all(20),
                          //   child: ListView.builder(
                          //     shrinkWrap: true,
                          //     itemCount: provider.model.data?.length ?? 0,
                          //     itemBuilder: (context, index) {
                          //       return InkWell(
                          //         onTap: () async {
                          //           provider.setAlreadyAssignedDataBeforeUpdate(
                          //             contactMomentModel: provider.model.data![index],
                          //           );
                          //           Navigator.push(
                          //             context,
                          //             MaterialPageRoute(
                          //               builder: (context) => AddContactMomentScreen(
                          //                 mEntrepreneurID: this.widget.id,
                          //                 mContactPersonID: provider.model.data![index].id!,
                          //                 contactMomentResponse: provider.model.data![index],
                          //                 mDisplayDataOnly: true,
                          //                 mIndex: index,
                          //               ),
                          //             ),
                          //           );
                          //         },
                          //         child: Row(
                          //           crossAxisAlignment: CrossAxisAlignment.start,
                          //           children: <Widget>[
                          //             ConstrainedBox(
                          //               constraints: BoxConstraints(minWidth: 250, maxWidth: 300),
                          //               child: Padding(
                          //                 padding: const EdgeInsets.symmetric(horizontal: 20),
                          //                 child: Column(
                          //                   children: [
                          //                     CustomText(
                          //                       text: provider.model.data![index].contactMomentType ?? "",
                          //                       size: 20,
                          //                       weight: FontWeight.bold,
                          //                     ),
                          //                     CustomText(
                          //                       text: DateFormat('dd-MM-yyyy')
                          //                           .format(DateTime.parse(provider.model.data![index].contactMomentDate!))
                          //                           .toString(),
                          //                       size: 16,
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ),
                          //             Column(
                          //               crossAxisAlignment: CrossAxisAlignment.center,
                          //               children: <Widget>[
                          //                 Container(
                          //                   margin: EdgeInsets.only(left: 8, right: 5),
                          //                   padding: EdgeInsets.all(10),
                          //                   decoration: BoxDecoration(
                          //                     color: provider.colors[(index + 1) % 4],
                          //                     borderRadius: BorderRadius.circular(50),
                          //                   ),
                          //                   child: SvgPicture.asset(
                          //                     setImageIconAccordingToContact(
                          //                       contactMomentType: provider.model.data![index].contactMomentType!,
                          //                     ),
                          //                     height: 24,
                          //                     width: 24,
                          //                   ),
                          //                 ),
                          //                 Container(
                          //                   width: 2,
                          //                   height: !Responsive.isDesktop(context) ? 200 : 150,
                          //                   color: index == provider.model.data!.length - 1 ? Colors.transparent : Colors.black12,
                          //                 ),
                          //               ],
                          //             ),
                          //             Expanded(
                          //               child: Container(
                          //                 padding: EdgeInsets.symmetric(
                          //                   horizontal: !Responsive.isDesktop(context) ? 5 : 30,
                          //                 ),
                          //                 child: Column(
                          //                   crossAxisAlignment: CrossAxisAlignment.start,
                          //                   mainAxisAlignment: MainAxisAlignment.start,
                          //                   children: [
                          //                     Row(
                          //                       children: [
                          //                         Expanded(
                          //                           child: HtmlWidget(
                          //                             provider.model.data![index].contactSubject ?? "",
                          //                             textStyle: TextStyle(
                          //                               fontSize: 18,
                          //                               fontWeight: FontWeight.bold,
                          //                             ),
                          //                           ),
                          //                         ),
                          //                         SizedBox(width: 10),
                          //                       ],
                          //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //                     ),
                          //                     Row(
                          //                       crossAxisAlignment: CrossAxisAlignment.center,
                          //                       children: [
                          //                         CustomText(
                          //                           text: "Attended:",
                          //                           size: 18,
                          //                           weight: FontWeight.bold,
                          //                         ),
                          //                         SizedBox(
                          //                           width: 10,
                          //                         ),
                          //                         CustomText(
                          //                           text: provider.model.data![index].attendees == null ||
                          //                                   provider.model.data![index].attendees!.isEmpty
                          //                               ? ''
                          //                               : listOfAttachedString(provider.model.data![index].attendees!),
                          //                           size: 18,
                          //                         ),
                          //                       ],
                          //                     ),
                          //                     HtmlWidget(
                          //                       provider.model.data![index].attendeeNote ?? "",
                          //                       textStyle: TextStyle(
                          //                         fontSize: 18,
                          //                         fontWeight: FontWeight.bold,
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       );
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ));
    });
  }

  String setImageIconAccordingToContact({required String contactMomentType}) {
    String value = "assets/icons/at_event.svg";
    if (contactMomentType == "At Event") {
      value = "assets/icons/at_event.svg";
    }
    if (contactMomentType == "Chat") {
      value = "assets/icons/chat.svg";
    }
    if (contactMomentType == "Email") {
      value = "assets/icons/email.svg";
    }

    if (contactMomentType == "Farm Visit") {
      value = "assets/icons/farm_visit.svg";
    }
    if (contactMomentType == "Phone Call") {
      value = "assets/icons/phone_call.svg";
    }
    if (contactMomentType == "Live Meeting") {
      value = "assets/icons/live_meeting.svg";
    }
    if (contactMomentType == "Video Conference") {
      value = "assets/icons/video_confirence.svg";
    }
    if (contactMomentType == "Webinar/Online event") {
      value = "assets/icons/online_event.svg";
    }

    return value;
  }

  String listOfAttachedString(List<Attendees> list) {
    String value = '';
    List<String> attendeesList = [];
    for (var i = 0; i < list.length; i++) {
      attendeesList.add(list[i].name!);
    }
    value = attendeesList.join(', ');
    return value;
  }
}
