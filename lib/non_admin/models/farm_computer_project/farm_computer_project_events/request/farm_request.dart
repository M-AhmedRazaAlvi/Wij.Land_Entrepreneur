import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import 'package:wij_land/app_common_widgets/real_dropdown_widget.dart';
import 'package:wij_land/app_common_widgets/text_widget.dart';
import 'package:wij_land/non_admin/routes/routes.dart';
import 'package:wij_land/non_admin/screens/computer_events/widgets/event_going_button.dart';
import 'package:wij_land/non_admin/screens/computer_events/widgets/event_text_search_widget.dart';
import 'package:wij_land/utils/controller.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/images.dart';
import 'package:wij_land/utils/styles.dart';

class EventsViewListWidget extends StatefulWidget {
  const EventsViewListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<EventsViewListWidget> createState() => _EventsViewListWidgetState();
}

class _EventsViewListWidgetState extends State<EventsViewListWidget> {
  final TextEditingController startdate = TextEditingController(),
      endDate = TextEditingController(),
      nameController = TextEditingController(),
      typeController = TextEditingController(),
      projectController = TextEditingController();
  String? select = 'Sort';
  List<String> selectList = <String>[
    'Sort',
    'Representative',
    'Farm Member',
    'Other'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SizedBox(
              width: getWidth(context),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: 12,
                children: [
                  EventTextSearchWidget(hintText: "Event Name"),
                  EventTextSearchWidget(hintText: "Project(multi-select)"),
                  EventTextSearchWidget(hintText: "Type"),
                  InkWell(
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2001),
                              lastDate: DateTime(2023))
                          .then((d) {
                        debugPrint("$d");
                        if (d != null) {
                          setState(() {
                            startdate.text = d.toString().split(" ")[0];
                          });
                        }
                      });
                    },
                    child: SizedBox(
                      width: 160,
                      child: TextWidgetField(
                        controller: startdate,
                        hintText: "Date",
                        enabled: false,
                        suffixIcon: const Icon(CupertinoIcons.calendar),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2001),
                              lastDate: DateTime(2023))
                          .then((d) {
                        debugPrint("$d");
                        if (d != null) {
                          setState(() {
                            endDate.text = d.toString().split(" ")[0];
                          });
                        }
                      });
                    },
                    child: SizedBox(
                      width: 160,
                      child: TextWidgetField(
                        controller: endDate,
                        hintText: "Date",
                        enabled: false,
                        suffixIcon: const Icon(CupertinoIcons.calendar),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    child: RealDropDownWidget(
                      value: select,
                      onChanged: (newValue) {
                        setState(() {
                          select = newValue;
                        });
                      },
                      items: selectList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Column(
          children: [
            for (int i = 0; i < 4; i++)
              InkWell(
                onTap: () {
                  navigationController.navigateTo(eventsFileScreenPageRoute);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  width: getWidth(context),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(10))),
                    child: Wrap(
                      children: [
                        Image(
                          image: AssetImage(Images.eventImage),
                          height: 120,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 15),
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  text: "JAN.", size: 22, color: darkred),
                              CustomText(
                                  text: "25",
                                  size: 30,
                                  weight: FontWeight.bold),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          width: getWidth(context) * 0.55,
                          height: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: getWidth(context) * 0.55,
                                child: Wrap(
                                  alignment: WrapAlignment.spaceBetween,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    CustomText(
                                        text: "Event Name",
                                        size: 22,
                                        color: darkred,
                                        weight: FontWeight.bold),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12, right: 12),
                                      child: Wrap(
                                        runSpacing: 10,
                                        children: const [
                                          EventGoingButton(text: "Going"),
                                          EventGoingButton(text: "Maybe"),
                                          EventGoingButton(text: "Not going"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CustomText(
                                  text: "project • location ",
                                  weight: FontWeight.w700),
                              SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                child: CustomText(
                                    text:
                                        "location location Description (two lines) Description (two lines) Description (two lines) Description (two lines)",
                                    weight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        )
      ],
    );
  }
}
