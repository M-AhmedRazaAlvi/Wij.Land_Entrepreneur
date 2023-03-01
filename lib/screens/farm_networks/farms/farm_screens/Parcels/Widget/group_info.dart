import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/Widget/dialog_block.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Parcels/Widget/dialog_parcel_group.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../app_common_widgets/icon_text_container.dart';
import '../../../../../../../../../utils/styles.dart';
import '../../../../../office/office_programes/Widgets/on_hover_button_widget.dart';

class ParcelGroupInfo extends StatefulWidget {
  const ParcelGroupInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<ParcelGroupInfo> createState() => _ParcelGroupInfoState();
}

class _ParcelGroupInfoState extends State<ParcelGroupInfo> {
  bool upclickedButton = false;
  bool onclickedBorder = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20 * 20,
      child: ListView(
        children: [
          for (int i = 0; i < 2; i++)
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      onclickedBorder = !onclickedBorder;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: onclickedBorder
                              ? Colors.greenAccent
                              : Colors.black,
                          width: onclickedBorder ? 4 : 2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomText(
                            text: "GroupName",
                            size: 18,
                            weight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              CustomText(
                                text: "0",
                                size: 20,
                                weight: FontWeight.bold,
                                color: hoverColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              CustomText(
                                text: "Blocks",
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Wrap(
                            alignment: WrapAlignment.end,
                            //mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconAndTextContainer(
                                addText: "Block",
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      barrierColor: Colors.transparent,
                                      builder: (BuildContext context) {
                                        return BlockDialogWidget();
                                      });
                                },
                              ),
                              OnHoverButtonWidget(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return ParcelGroupDialog(
                                            
                                            submitText: "Update Group",
                                          );
                                        });
                                  },
                                  icons: Icons.edit),
                              OnHoverButtonWidget(
                                  onTap: () {
                                    setState(() {
                                      upclickedButton = !upclickedButton;
                                    });
                                  },
                                  icons: upclickedButton
                                      ? Icons.arrow_upward
                                      : Icons.arrow_downward),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
