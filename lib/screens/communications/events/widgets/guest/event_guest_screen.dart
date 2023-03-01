import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wij_land/screens/communications/events/widgets/guest/add_guest_dialog_widget.dart';
import 'package:wij_land/screens/communications/events/widgets/guest/guest_delete_dialog_widget.dart';
import 'package:wij_land/screens/communications/events/widgets/guest/guest_edit_dialog_widget.dart';

import '../../../../../app_common_widgets/animated_search.dart';
import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../../app_common_widgets/selectable_dropdown_widget.dart';
import '../../../../../utils/functions.dart';
import '../../../../../utils/responsive.dart';
import '../../../../../utils/styles.dart';
import '../../../../office/widgets/add_button.dart';
import '../events_constants.dart';

class EventGuestScreen extends StatefulWidget {
  const EventGuestScreen({Key? key}) : super(key: key);

  @override
  State<EventGuestScreen> createState() => _EventGuestScreenState();
}

class _EventGuestScreenState extends State<EventGuestScreen> {
  bool _isFilter = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    plusClicked = List.filled(9, false);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: !Responsive.isDesktop(context) || !Responsive.isDesktop(context)
            ? getWidth(context) * 1.6
            : getWidth(context) / 1.04,
        // height: 84 * 10,
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                    child: CustomText(
                  text: 'Guests',
                  color: darkGreen,
                  size: 30,
                  weight: FontWeight.w600,
                )),
                AnimatedSearchWidget(),
                IconHoverButton(
                    icons: FontAwesomeIcons.filter,
                    onPress: () {
                      setState(() {
                        _isFilter = !_isFilter;
                      });
                    }),
                SizedBox(
                  width: 4,
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: ButtonWithAddIcon(
                    text: 'Add Guest',
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AddGuestsDialogWidget();
                          });
                    },
                  ),
                ),
              ],
            ),
            _isFilter
                ? Card(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: [
                          SelectableDropdownWidget(
                            items: guestAttendList,
                            title: "Attended",
                            mSelectedValue: "",
                            mOnDropDownChange: (value) {},
                            mSelectedItemsList: [],
                          ),
                          SizedBox(width: 40),
                          SelectableDropdownWidget(
                            items: guestResponseList,
                            title: "Response",
                            mSelectedValue: "",
                            mOnDropDownChange: (value) {},
                            mSelectedItemsList: [],
                          ),
                          SizedBox(width: 40),
                          SelectableDropdownWidget(
                            items: guestRoundList,
                            title: "Round",
                            mSelectedValue: "",
                            mOnDropDownChange: (value) {},
                            mSelectedItemsList: [],
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RealCheckBoxWidget(
                    value: contactPerson,
                    onChanged: (va) {
                      setState(() {
                        if (contactPerson == true) {
                          contactPerson = false;
                        } else {
                          contactPerson = true;
                        }
                      });
                    },
                    Labeltext: contactText),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: CustomText(
                      text: 'Name',
                      textAligns: TextAlign.start,
                      size: 16,
                      color: ivoryBlack,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: CustomText(
                    text: 'Response',
                    textAligns: TextAlign.end,
                    size: 16,
                    color: ivoryBlack,
                    weight: FontWeight.w600,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: CustomText(
                      text: 'Attended',
                      textAligns: TextAlign.center,
                      size: 16,
                      color: ivoryBlack,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
                !Responsive.isDesktop(context)
                    ? SizedBox.shrink()
                    : Expanded(
                        child: CustomText(
                          text: 'Total(..)',
                          textAligns: TextAlign.center,
                          size: 16,
                          color: ivoryBlack,
                          weight: FontWeight.w600,
                        ),
                      ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconHoverButton(
                      icons: FontAwesomeIcons.ellipsisV,
                      onPress: () {
                        showPopupGuestMenu(context);
                      },
                    ),
                  ),
                )
              ],
            ),
            Divider(
              color: Color(0xff333333),
              indent: 10,
              endIndent: 10,
              thickness: 0.2,
              height: 0.1,
            ),
            SizedBox(
              height: 24,
            ),
            for (int i = 0; i < 9; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RealCheckBoxWidget(
                          value: contactPerson,
                          onChanged: (va) {
                            setState(() {
                              if (contactPerson == true) {
                                contactPerson = false;
                              } else {
                                contactPerson = true;
                              }
                            });
                          },
                          Labeltext: contactText),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: CustomText(
                            text: '$i Name',
                            textAligns: TextAlign.start,
                            size: 14,
                            color: ivoryBlack,
                            weight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Expanded(
                        child: RealDropDownWidget(
                          value: responseType,
                          onChanged: (va) {
                            setState(() {
                              responseType = va;
                            });
                          },
                          items: guestResponseList
                              .map<DropdownMenuItem<String>>((String values) {
                            return DropdownMenuItem<String>(
                                value: values, child: Text(values));
                          }).toList(),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: RealCheckBoxWidget(
                              value: contactPerson,
                              onChanged: (va) {
                                setState(() {
                                  if (contactPerson == true) {
                                    contactPerson = false;
                                  } else {
                                    contactPerson = true;
                                  }
                                });
                              },
                              Labeltext: contactText),
                        ),
                      ),
                      !Responsive.isDesktop(context)
                          ? SizedBox.shrink()
                          : Expanded(
                              child: CustomText(
                                text: '',
                                textAligns: TextAlign.start,
                                size: 14,
                                color: ivoryBlack,
                                weight: FontWeight.w400,
                              ),
                            ),
                      !Responsive.isDesktop(context)
                          ? SizedBox.shrink()
                          : Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  /*IconHoverButton(icons:plusClicked[i]==true?FontAwesomeIcons.minus: FontAwesomeIcons.plus, onPress: (){
                              setState(() {
                                if(plusClicked[i]==true){
                                  plusClicked[i]=false;
                                }else{
                                  plusClicked[i]=true;
                                }
                              });
                            },
                            ),*/
                                  IconHoverButton(
                                    icons: FontAwesomeIcons.pencilAlt,
                                    onPress: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return EditGuestDialogWidget();
                                          });
                                    },
                                  ),
                                  IconHoverButton(
                                    icons: FontAwesomeIcons.trashAlt,
                                    onPress: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return DeleteGuestDialogWidget();
                                          });
                                    },
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                  Divider(
                    color: Color(0xff333333),
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.2,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  plusClicked[i] == true
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomText(
                                      text: 'Email:',
                                      textAligns: TextAlign.start,
                                      size: 14,
                                      color: ivoryBlack,
                                      weight: FontWeight.w600,
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomText(
                                      text: 'ellie.jong@livemail.com',
                                      textAligns: TextAlign.start,
                                      size: 14,
                                      color: ivoryBlack,
                                      weight: FontWeight.w400,
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomText(
                                      text: 'Organisation name:',
                                      textAligns: TextAlign.start,
                                      size: 14,
                                      color: ivoryBlack,
                                      weight: FontWeight.w600,
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomText(
                                      text: '$i Name',
                                      textAligns: TextAlign.start,
                                      size: 14,
                                      color: ivoryBlack,
                                      weight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Divider(
                                color: Color(0xff333333),
                                indent: 10,
                                endIndent: 10,
                                thickness: 0.2,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomText(
                                      text: 'Comment:',
                                      textAligns: TextAlign.start,
                                      size: 14,
                                      color: ivoryBlack,
                                      weight: FontWeight.w600,
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomText(
                                      text: ' good work',
                                      textAligns: TextAlign.start,
                                      size: 14,
                                      color: ivoryBlack,
                                      weight: FontWeight.w400,
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomText(
                                      text: 'Invited by:',
                                      textAligns: TextAlign.start,
                                      size: 14,
                                      color: ivoryBlack,
                                      weight: FontWeight.w600,
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomText(
                                      text: 'Juliel Solano',
                                      textAligns: TextAlign.start,
                                      size: 14,
                                      color: ivoryBlack,
                                      weight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Divider(
                                color: Color(0xff333333),
                                indent: 10,
                                endIndent: 10,
                                thickness: 0.2,
                              ),
                            ],
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
