import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wij_land/screens/farm_networks/pilot_contracts/widget/pilot_contract_edit_farm.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../app_common_widgets/on_hover.dart';

class PilotContractProfileScreen extends StatefulWidget {
  const PilotContractProfileScreen({Key? key}) : super(key: key);

  @override
  State<PilotContractProfileScreen> createState() =>
      _PilotContractProfileScreenState();
}

class _PilotContractProfileScreenState
    extends State<PilotContractProfileScreen> {
  bool onEditButton = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: getWidth(context),
          child: Column(children: [
            
            SizedBox(height: 30),
            Card(
              margin: EdgeInsets.all(20),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: CustomText(
                            text: "Contract",
                            size: 25,
                            weight: FontWeight.bold,
                            color: third,
                          ),
                        ),
                        Row(
                          children: [
                            OnHover(
                              builder: (isHovered) => InkWell(
                                onTap: () {
                                  setState(() {
                                    onEditButton = !onEditButton;
                                  });
                                },
                                child: Card(
                                    color:
                                        isHovered ? hoverColor : Colors.white,
                                    child: SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: Icon(
                                          Icons.edit,
                                          size: 15,
                                          color: Colors.grey,
                                        ))),
                              ),
                            ),
                            Card(
                              child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: PopupMenuButton(
                                      icon: Icon(
                                        FontAwesomeIcons.ellipsisV,
                                        size: 12,
                                        color: Colors.grey,
                                      ),
                                      // iconSize: 15,

                                      itemBuilder: (context) => [
                                            PopupMenuItem(
                                                value: 1,
                                                child: Row(
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              2, 2, 8, 2),
                                                      child: Icon(
                                                        Icons.delete,
                                                        size: 12,
                                                        color:
                                                            Colors.greenAccent,
                                                      ),
                                                    ),
                                                    Text('Delete',
                                                        style: TextStyle(
                                                            fontSize: 12))
                                                  ],
                                                )),
                                            PopupMenuItem(
                                                value: 2,
                                                child: Row(
                                                  children: const <Widget>[
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              2, 2, 8, 2),
                                                      child: Icon(
                                                        Icons.download,
                                                        size: 12,
                                                        color:
                                                            Colors.greenAccent,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Download CSV',
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    )
                                                  ],
                                                )),
                                          ])),
                            )
                          ],
                        )
                      ],
                    ),
                    onEditButton
                        ? SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              RowTextWidget(
                                fText: "Contract Type:",
                                sText: "Pilot Contract",
                              ),
                              RowTextWidget(
                                fText: "Organization Involved:",
                                sText: "Pilot Contract",
                              ),
                              RowTextWidget(
                                fText: "Contract Date:",
                                sText: "12/6/2018",
                              ),
                              RowTextWidget(
                                fText: "Prople Involved:",
                                sText: "Pilot Contract",
                              ),
                              RowTextWidget(
                                fText: "Contract Expiration:",
                                sText: "Pilot Contract",
                              ),
                              RowTextWidget(
                                fText: "Description Contract:",
                                sText: "Pilot Contract",
                              ),
                              RowTextWidget(
                                fText: "Pilot year:",
                                sText: "Pilot Contract",
                              ),
                              RowTextWidget(
                                fText: "Contract Status",
                                sText: "Signed",
                              ),
                              RowTextWidget(
                                fText: "Pilot Invoice",
                                sText: "No",
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2)),
                                    border: Border.all()),
                                height: 200,
                                width: 250,
                                child:
                                    Center(child: Icon(Icons.image_outlined)),
                              )
                            ]),
                          )
                        : PilotContractEditFarm()
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class RowTextWidget extends StatelessWidget {
  final String fText;
  final String sText;
  const RowTextWidget({
    Key? key,
    required this.fText,
    required this.sText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: CustomText(
                  text: fText,
                  size: 18,
                  weight: FontWeight.w900,
                  color: Color.fromARGB(221, 39, 37, 37),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: CustomText(
                  text: sText,
                  size: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
