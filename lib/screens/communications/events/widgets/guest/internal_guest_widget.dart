import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../utils/functions.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/responsive.dart';
import '../../../../../utils/styles.dart';

class InternalGuestWidget extends StatefulWidget {
  const InternalGuestWidget({Key? key}) : super(key: key);

  @override
  State<InternalGuestWidget> createState() => _InternalGuestWidgetState();
}

class _InternalGuestWidgetState extends State<InternalGuestWidget> {
  bool isEvent = false, isProjects = false, isGroups = false;

  List isEventList = [],
      isProjectsList = [],
      isGroupsList = [],
      addGuestList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isEventList = List.filled(10, false);
    isProjectsList = List.filled(10, false);
    isGroupsList = List.filled(10, false);
    addGuestList = List.filled(10, false);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction:
          !Responsive.isDesktop(context) || !Responsive.isDesktop(context)
              ? Axis.vertical
              : Axis.horizontal,
      alignment: WrapAlignment.spaceBetween,
      children: [
        Container(
            padding: const EdgeInsets.all(8.0),
            width: getWidth(context) * 0.3,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (!isEvent) {
                          isEvent = true;
                          isProjects = false;
                          isGroups = false;
                        } else {
                          isEvent = false;
                          isEventList = List.filled(10, false);
                        }
                      });
                    },
                    child: Container(
                      width: getWidth(context),
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              isEvent ? Color(0xff00FA9A) : Color(0xff333333),
                          width: isEvent ? 4 : 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(1)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Events',
                              style: TextStyle(fontSize: 20),
                            ),
                            FaIcon(
                              isEvent
                                  ? FontAwesomeIcons.arrowUp
                                  : FontAwesomeIcons.arrowDown,
                              size: 14,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  isEvent
                      ? ListView.builder(
                          clipBehavior: Clip.hardEdge,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: isEventList[index]
                                    ? Color(0xff00FA9A)
                                    : Color(0xfff2f2f2),
                                width: isEventList[index] ? 2 : 1,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xfff2f2f2),
                                  blurRadius: 2.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(2.0,
                                      2.0), // shadow direction: bottom right
                                )
                              ],
                            ),
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  if (isEventList.contains(true)) {
                                    isEventList = List.filled(10, false);
                                    isEventList[index] = true;
                                  } else {
                                    isEventList[index] = true;
                                  }
                                });
                              },
                              contentPadding: EdgeInsets.zero,
                              visualDensity: VisualDensity(vertical: 2),
                              leading: Image.asset(
                                Images.mapImage,
                                fit: BoxFit.fitHeight,
                              ),
                              title: Text('Name'),
                              trailing: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text('date'),
                              ),
                            ),
                          ),
                          itemCount: 10,
                        )
                      : SizedBox.shrink(),
                  SizedBox(
                    height: 6,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (!isProjects) {
                          isProjects = true;
                          isEvent = false;
                          isGroups = false;
                        } else {
                          isProjects = false;
                          isProjectsList = List.filled(10, false);
                        }
                      });
                    },
                    child: Container(
                      width: getWidth(context),
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isProjects
                              ? Color(0xff00FA9A)
                              : Color(0xff333333),
                          width: isProjects ? 4 : 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(1)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Projects',
                              style: TextStyle(fontSize: 20),
                            ),
                            FaIcon(
                              isProjects
                                  ? FontAwesomeIcons.arrowUp
                                  : FontAwesomeIcons.arrowDown,
                              size: 14,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  isProjects
                      ? ListView.builder(
                          clipBehavior: Clip.hardEdge,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: isProjectsList[index]
                                    ? Color(0xff00FA9A)
                                    : Color(0xfff2f2f2),
                                width: isProjectsList[index] ? 2 : 1,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xfff2f2f2),
                                  blurRadius: 2.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(2.0,
                                      2.0), // shadow direction: bottom right
                                )
                              ],
                            ),
                            width: getWidth(context),
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  if (isProjectsList.contains(true)) {
                                    isProjectsList = List.filled(10, false);
                                    isProjectsList[index] = true;
                                  } else {
                                    isProjectsList[index] = true;
                                  }
                                });
                              },
                              style: ListTileStyle.drawer,
                              contentPadding: EdgeInsets.zero,
                              visualDensity: VisualDensity(vertical: 2),
                              leading: Image.asset(
                                Images.mapImage,
                                fit: BoxFit.fitHeight,
                              ),
                              title: Center(
                                child: Text(
                                  'Property Scan Project $index',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                          itemCount: 10,
                        )
                      : SizedBox.shrink(),
                  SizedBox(
                    height: 6,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (!isGroups) {
                          isEvent = false;
                          isProjects = false;
                          isGroups = true;
                        } else {
                          isGroups = false;
                          isGroupsList = List.filled(10, false);
                        }
                      });
                    },
                    child: Container(
                      width: getWidth(context),
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              isGroups ? Color(0xff00FA9A) : Color(0xff333333),
                          width: isGroups ? 4 : 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(1)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Groups',
                              style: TextStyle(fontSize: 20),
                            ),
                            FaIcon(
                              isGroups
                                  ? FontAwesomeIcons.arrowUp
                                  : FontAwesomeIcons.arrowDown,
                              size: 14,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  isGroups
                      ? ListView.builder(
                          clipBehavior: Clip.hardEdge,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Container(
                            width: getWidth(context),
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: isGroupsList[index]
                                    ? Color(0xff00FA9A)
                                    : Color(0xfff2f2f2),
                                width: isGroupsList[index] ? 4 : 1,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xfff2f2f2),
                                  blurRadius: 2.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(2.0,
                                      2.0), // shadow direction: bottom right
                                )
                              ],
                            ),
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  if (isGroupsList.contains(true)) {
                                    isGroupsList = List.filled(10, false);
                                    isGroupsList[index] = true;
                                  } else {
                                    isGroupsList[index] = true;
                                  }
                                });
                              },
                              style: ListTileStyle.drawer,
                              visualDensity: VisualDensity(vertical: 2),
                              contentPadding: EdgeInsets.zero,
                              title: Padding(
                                padding:
                                    const EdgeInsets.only(left: 18.0, top: 4),
                                child: Text(
                                  'Wij.land Team $index',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Color(0xff008000)),
                                ),
                              ),
                            ),
                          ),
                          itemCount: 10,
                        )
                      : SizedBox.shrink(),
                  SizedBox(
                    height: 6,
                  ),
                ],
              ),
            )),
        SizedBox(
            child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              CustomText(
                text: 'Select Guest',
                size: 28,
                color: darkBlue,
                weight: FontWeight.w300,
              ),
              SizedBox(
                height: 12,
              ),
              DataTable(
                showBottomBorder: true,
                headingRowHeight: 80,
                dividerThickness: 0.5,
                dataRowHeight: 80,
                horizontalMargin: !Responsive.isDesktop(context) ? 6 : 6,
                headingTextStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                columnSpacing: 1,
                columns: <DataColumn>[
                  DataColumn(
                    label: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 100),
                      child: CustomText(
                        text: 'Name',
                        size: 16,
                        weight: FontWeight.w600,
                        color: ivoryBlack,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 200),
                      child: CustomText(
                        text: 'Farm/Organization Name',
                        size: 16,
                        weight: FontWeight.w600,
                        color: ivoryBlack,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 140),
                      child: CustomText(
                        text: 'Role',
                        size: 16,
                        weight: FontWeight.w600,
                        color: ivoryBlack,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 80, minHeight: 40),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.yellow),
                        child: Text(
                          'Add all',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          setState(() {
                            addGuestList = List.filled(10, true);
                          });
                        },
                      ),
                    ),
                  ),
                ],
                rows: <DataRow>[
                  for (int i = 0; i < 10; i++)
                    if (isEventList.contains(true) ||
                        isProjectsList.contains(true) ||
                        isGroupsList.contains(true))
                      DataRow(
                        cells: <DataCell>[
                          DataCell(ConstrainedBox(
                            constraints: BoxConstraints(minWidth: 100),
                            child: CustomText(
                              text: '$i Name',
                              size: 14,
                              weight: FontWeight.w400,
                              color: ivoryBlack,
                            ),
                          )),
                          DataCell(ConstrainedBox(
                            constraints: BoxConstraints(minWidth: 200),
                            child: CustomText(
                              text: '$i farm name',
                              size: 14,
                              weight: FontWeight.w400,
                              color: ivoryBlack,
                            ),
                          )),
                          DataCell(ConstrainedBox(
                            constraints: BoxConstraints(minWidth: 140),
                            child: CustomText(
                              text: '$i Representative',
                              size: 14,
                              weight: FontWeight.w400,
                              color: ivoryBlack,
                            ),
                          )),
                          DataCell(ConstrainedBox(
                              constraints: BoxConstraints(minWidth: 100),
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addGuestList[i] = true;
                                    });
                                  },
                                  icon: FaIcon(
                                    addGuestList[i]
                                        ? FontAwesomeIcons.checkCircle
                                        : FontAwesomeIcons.plus,
                                    size: addGuestList[i] ? 20 : 16,
                                    color: addGuestList[i]
                                        ? Color(0xff2EBBA0)
                                        : Color(0xff333333),
                                  )))),
                        ],
                      ),
                ],
              ),
            ],
          ),
        )),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          height: getHeight(context),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                CustomText(
                  text: 'Guest List',
                  size: 28,
                  color: darkBlue,
                  weight: FontWeight.w300,
                ),
                SizedBox(
                  height: 12,
                ),
                Column(
                  children: [
                    DataTable(
                      showBottomBorder: true,
                      headingRowHeight: 80,
                      dividerThickness: 0.5,
                      dataRowHeight: 80,
                      horizontalMargin: !Responsive.isDesktop(context) ? 6 : 6,
                      headingTextStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      columnSpacing: !Responsive.isDesktop(context) ? 4 : 4,
                      columns: <DataColumn>[
                        DataColumn(
                          label: ConstrainedBox(
                            constraints: BoxConstraints(minWidth: 100),
                            child: CustomText(
                              text: 'Name',
                              size: 16,
                              weight: FontWeight.w600,
                              color: ivoryBlack,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: ConstrainedBox(
                            constraints: BoxConstraints(minWidth: 200),
                            child: CustomText(
                              text: 'Farm/Organization Name',
                              size: 16,
                              weight: FontWeight.w600,
                              color: ivoryBlack,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: ConstrainedBox(
                            constraints: BoxConstraints(minWidth: 140),
                            child: CustomText(
                              text: 'Role',
                              size: 16,
                              weight: FontWeight.w600,
                              color: ivoryBlack,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: ConstrainedBox(
                            constraints: BoxConstraints(minWidth: 100),
                            child: Text(''),
                          ),
                        ),
                      ],
                      rows: <DataRow>[
                        for (int i = 0; i < addGuestList.length; i++)
                          if (addGuestList[i])
                            DataRow(
                              cells: <DataCell>[
                                DataCell(ConstrainedBox(
                                  constraints: BoxConstraints(minWidth: 100),
                                  child: CustomText(
                                    text: '$i Name',
                                    size: 14,
                                    weight: FontWeight.w400,
                                    color: ivoryBlack,
                                  ),
                                )),
                                DataCell(ConstrainedBox(
                                  constraints: BoxConstraints(minWidth: 200),
                                  child: CustomText(
                                    text: '$i farm name',
                                    size: 14,
                                    weight: FontWeight.w400,
                                    color: ivoryBlack,
                                  ),
                                )),
                                DataCell(ConstrainedBox(
                                  constraints: BoxConstraints(minWidth: 140),
                                  child: CustomText(
                                    text: '$i Representative',
                                    size: 14,
                                    weight: FontWeight.w400,
                                    color: ivoryBlack,
                                  ),
                                )),
                                DataCell(ConstrainedBox(
                                    constraints: BoxConstraints(minWidth: 100),
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (addGuestList[i]) {
                                              addGuestList[i] = false;
                                            }
                                          });
                                        },
                                        icon: FaIcon(
                                          FontAwesomeIcons.times,
                                          size: 14,
                                        )))),
                              ],
                            ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
