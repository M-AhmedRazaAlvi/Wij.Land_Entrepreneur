import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../../utils/controller.dart';
import '../../office/widgets/add_text_button_widget.dart';

class VisualizationGraphScreen extends StatefulWidget {
  const VisualizationGraphScreen({Key? key}) : super(key: key);

  @override
  State<VisualizationGraphScreen> createState() =>
      _VisualizationGraphScreenState();
}

class _VisualizationGraphScreenState extends State<VisualizationGraphScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(() => SizedBox(
                child: CustomText(
                  text: menuController.activeItemRoute.value,
                  size: 14,
                ),
              )),
          SizedBox(width: 50),
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
                      text: 'Graph',
                      color: third,
                      size: 30,
                      weight: FontWeight.bold,
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6.0, left: 6),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            text: 'Farms of farmName',
                            color: Colors.black87,
                            size: 24,
                            weight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: !Responsive.isDesktop(context) ||
                        !Responsive.isDesktop(context)
                    ? getWidth(context)
                    : getWidth(context) * 0.25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AddTextButtonWidget(
                      text: 'Cancel',
                      onPress: () {
                        setState(() {
                          //   isUpdate = false;
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
                          // isUpdate = false;
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
    );
  }
}
