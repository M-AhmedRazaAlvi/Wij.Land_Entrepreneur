import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wij_land/screens/farm_networks/visualization/widgets/add_visualization_farms_widget.dart';
import 'package:wij_land/screens/farm_networks/visualization/widgets/add_visualize_farm_dialog_widget.dart';
import 'package:wij_land/screens/farm_networks/visualization/widgets/update_visualization_farms_widget.dart';
import 'package:wij_land/screens/farm_networks/visualization/widgets/visualization_farm_data_table_widget.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../../utils/controller.dart';
import '../../office/widgets/add_button.dart';
import '../../office/widgets/add_text_button_widget.dart';

class VisualizationScreen extends StatefulWidget {
  const VisualizationScreen({Key? key}) : super(key: key);

  @override
  State<VisualizationScreen> createState() => _VisualizationScreenState();
}

class _VisualizationScreenState extends State<VisualizationScreen> {
  bool isVisualize = false, isUpdate = false;
  String? farmName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Obx(() => SizedBox(
                    child: CustomText(
                      text: menuController.activeItemRoute.value,
                      size: 14,
                    ),
                  )),
              SizedBox(width: 50),
              isUpdate
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          runSpacing: !Responsive.isDesktop(context) ? 16 : 0,
                          children: [
                            SizedBox(
                              width: !Responsive.isDesktop(context)
                                  ? getWidth(context)
                                  : getWidth(context) * 0.7,
                              child: Row(
                                children: [
                                  CustomText(
                                    text: 'Visualization',
                                    color: third,
                                    size: 40,
                                    weight: FontWeight.w600,
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 6.0, left: 6),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: CustomText(
                                          text: 'Farms of $farmName',
                                          color: darkBlue,
                                          size: 24,
                                          weight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: !Responsive.isDesktop(context)
                                  ? getWidth(context)
                                  : getWidth(context) * 0.25,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  AddTextButtonWidget(
                                    text: 'Cancel',
                                    onPress: () {
                                      setState(() {
                                        isUpdate = false;
                                      });
                                    },
                                    colors: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  AddTextButtonWidget(
                                    text: 'Update',
                                    onPress: () async {
                                      setState(() {
                                        isUpdate = false;
                                      });
                                    },
                                    colors: Colors.yellow,
                                    textColor: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          child: UpdateVisualizeFarmWidget(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: !Responsive.isDesktop(context)
                              ? getWidth(context)
                              : getWidth(context) * 0.45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AddTextButtonWidget(
                                text: 'Cancel',
                                onPress: () {
                                  setState(() {
                                    isUpdate = false;
                                  });
                                },
                                colors: Colors.white,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              AddTextButtonWidget(
                                text: 'Update',
                                onPress: () async {
                                  setState(() {
                                    isUpdate = false;
                                  });
                                },
                                colors: Colors.yellow,
                                textColor: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : !isVisualize
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: CustomText(
                                  text: 'Visualization Farms',
                                  color: third,
                                  size: 40,
                                  weight: FontWeight.w600,
                                )),
                                ButtonWithAddIcon(
                                  text: 'Visualization',
                                  onPressed: () async {
                                    var result = await showDialog(
                                        context: context,
                                        builder: (_) =>
                                            AddVisualizeFarmDialogWidget());
                                    setState(() {
                                      isVisualize = true;
                                      farmName = result;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Card(
                              child: VisualizationFarmsDataTableWidget(
                                  callBACK: (result) {
                                setState(() {
                                  farmName = result;
                                  isUpdate = true;
                                });
                              }),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              runSpacing: !Responsive.isDesktop(context) ||
                                      !Responsive.isDesktop(context)
                                  ? 16
                                  : 0,
                              children: [
                                SizedBox(
                                  width: !Responsive.isDesktop(context)
                                      ? getWidth(context)
                                      : getWidth(context) * 0.7,
                                  child: Row(
                                    children: [
                                      CustomText(
                                        text: 'Visualization',
                                        color: third,
                                        size: 40,
                                        weight: FontWeight.w600,
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 6.0, left: 6),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: CustomText(
                                              text: 'Farms of $farmName',
                                              color: darkBlue,
                                              size: 24,
                                              weight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: !Responsive.isDesktop(context)
                                      ? getWidth(context)
                                      : getWidth(context) * 0.25,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      AddTextButtonWidget(
                                        text: 'Cancel',
                                        onPress: () {
                                          setState(() {
                                            isVisualize = false;
                                          });
                                        },
                                        colors: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      AddTextButtonWidget(
                                        text: 'Save',
                                        onPress: () async {
                                          setState(() {
                                            isVisualize = false;
                                          });
                                        },
                                        colors: Colors.yellow,
                                        textColor: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Card(
                              child: AddVisualizeFarmWidget(),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: !Responsive.isDesktop(context)
                                  ? getWidth(context)
                                  : getWidth(context) * 0.45,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  AddTextButtonWidget(
                                    text: 'Cancel',
                                    onPress: () {
                                      setState(() {
                                        isVisualize = false;
                                      });
                                    },
                                    colors: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  AddTextButtonWidget(
                                    text: 'Save',
                                    onPress: () async {
                                      setState(() {
                                        isVisualize = false;
                                      });
                                    },
                                    colors: Colors.yellow,
                                    textColor: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
