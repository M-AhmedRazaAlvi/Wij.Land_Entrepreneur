
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../utils/functions.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
class KpiGraphWidget extends StatelessWidget {
  KpiGraphWidget({
    Key? key,
    required this.data,
    required this.heading,
  }) : super(key: key);

  final List<_SalesData> data;
  String heading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.0, right: 12, left: 12),
      height: 300,
      width: !Responsive.isDesktop(context)
          ? getWidth(context)
          : getWidth(context) / 2,
      child: Card(
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Chart title
            title: ChartTitle(
                text: heading,
                alignment: ChartAlignment.near,
                textStyle: TextStyle(
                  fontSize: 28.0,
                  color: darkBlue,
                  fontStyle: FontStyle.normal
                ),
                borderWidth: 12.0),
            // Enable legend
            legend: Legend(isVisible: false),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ColumnSeries<_SalesData, String>>[
              ColumnSeries<_SalesData, String>(
                  dataSource: data,
                  xValueMapper: (_SalesData sales, _) =>
                  sales.month,
                  yValueMapper: (_SalesData sales, _) =>
                  sales.value,
                  name: 'Sales',
                  // Enable data label
                  dataLabelSettings:
                  DataLabelSettings(isVisible: false))
            ]),
      ),
    );
  }
}

class _SalesData {
  String? month;
  int? value;

  _SalesData(this.month, this.value);
}

List<_SalesData> data = [
  _SalesData('Jan', 35),
  _SalesData('Feb', 28),
  _SalesData('Mar', 34),
  _SalesData('Apr', 32),
  _SalesData('May', 40),
  _SalesData('Jun', 12),
  _SalesData('Jul', 4),
  _SalesData('Aug', 10),
  _SalesData('Sep', 20),
  _SalesData('Oct', 60),
  _SalesData('Nov', 70),
  _SalesData('Dec', 90),
];

