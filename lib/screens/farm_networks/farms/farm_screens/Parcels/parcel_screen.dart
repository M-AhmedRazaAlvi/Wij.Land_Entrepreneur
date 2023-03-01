import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/Widget/dialog_add_parcel.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/Widget/dialog_parcel_group.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/Widget/group_info.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/Widget/parcel_info_row.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/icon_text_container.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../../office/widgets/search_widget.dart';


class ParcelsScreen extends StatefulWidget {
  const ParcelsScreen({Key? key}) : super(key: key);

  @override
  State<ParcelsScreen> createState() => _ParcelsScreenState();
}

class _ParcelsScreenState extends State<ParcelsScreen> {
  List<String> titleFarmButtonList = <String>[
    "Parcel List",
    "Block View",
  ];
  List<bool> titelBool = <bool>[];

  @override
  void initState() {
    super.initState();

    titelBool = List.filled(2, false);
    titelBool[0] = true;
  }

  bool checkAll = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        width: getWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: getWidth(context),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  CustomText(
                    text: "Parcels",
                    size: 30,
                    color: hoverColor,
                    weight: FontWeight.bold,
                  ),
                  titelBool[0]
                      ? Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            IconAndTextContainer(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AddParcelDialog();
                                    });
                              },
                              addText: "Parcel",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ClickIconButton(
                              clickcolors: Colors.yellowAccent,
                              icon: Icons.rotate_right,
                              onPressed: () {},
                            ),
                          ],
                        )
                      : titelBool[1]
                          ? IconAndTextContainer(
                              addText: "Group",
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ParcelGroupDialog(
                                        submitText: "Save Group",
                                      );
                                    });
                              },
                            )
                          : Container(),
                ],
              ),
            ),
            Container(
              width: getWidth(context),
              padding: EdgeInsets.all(20),
              child: Wrap(
                children: [
                  for (int i = 0; i < 2; i++)
                    Container(
                      padding: EdgeInsets.only(right: 15, bottom: 15),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: titelBool[i] == true
                              ? hoverColor
                              : Colors.grey[100],
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                color: titelBool[i] == true
                                    ? Colors.white10
                                    : Colors.black26,
                              )),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),),
                        child: CustomText(
                          text: titleFarmButtonList[i],
                          color: titelBool[i] == true
                              ? Colors.white
                              : Colors.black,
                          size: 16,
                        ),
                        onPressed: () {
                          setState(() {
                            if (titelBool.contains(true)) {
                              titelBool = List.filled(2, false);
                              titelBool[i] = true;
                            } else {
                              titelBool[i] = true;
                            }
                          });
                        },
                      ),
                    )
                ],
              ),
            ),
            titelBool[0] ? ParcelInfoRow(checkAll: checkAll) : Container(),
            titelBool[1] ? ParcelGroupInfo() : Container(),
          ],
        ),
      ),
    );
  }
}
