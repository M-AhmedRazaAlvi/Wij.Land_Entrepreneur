import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/screens/reporting/kpi/widget/kpi_data_table_widget.dart';
import 'package:wij_land/screens/reporting/kpi/widget/kpi_graph_widget.dart';
import 'package:wij_land/screens/reporting/kpi/widget/kpi_hover_button_widget.dart';
import 'package:wij_land/screens/reporting/kpi/widget/kpi_wrap_widget.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/on_hover.dart';
import '../../../../utils/styles.dart';

class KpiDetailsScreen extends StatefulWidget {
  const KpiDetailsScreen({Key? key}) : super(key: key);

  @override
  State<KpiDetailsScreen> createState() => _KpiDetailsScreenState();
}

class _KpiDetailsScreenState extends State<KpiDetailsScreen> {
  List<bool>isHover = [false, false, false];
  bool isBack = false;
  bool isForward = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            KpiWrapWidget(),
            Wrap(
              children: [
                KpiGraphWidget(data: data, heading: 'New Each Month'),
                KpiGraphWidget(data: data, heading: 'Total'),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Card(
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(
                        text: 'Data',
                        size: 28,
                        weight: FontWeight.w300,
                        color: darkBlue,
                      ),
                    ),
                    KpiDataTableWidget(),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 30.0, right: 20, top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          KpiHoverButtonWidget(icon:  CupertinoIcons.back,
                               onPress: (){}),
                          for (int i = 0; i < 3; i++)
                            OnHover(
                                builder: (hover) {
                                  return Card(
                                    elevation: 0,
                                    semanticContainer: false,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            6.0),
                                        side: BorderSide(
                                            width: 0.5, color: Colors.black26)
                                    ),
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      color: Colors.white,
                                      hoverColor: Colors.green,
                                      onPressed: () {},
                                      icon: Text('${i + 1}', style: TextStyle(
                                        color: hover ? Colors.white : Colors
                                            .black54,
                                        fontSize: 16,
                                      ),
                                      ),
                                    ),
                                  );
                                }
                            ),

                          KpiHoverButtonWidget(icon:CupertinoIcons.forward,onPress: (){},),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}




