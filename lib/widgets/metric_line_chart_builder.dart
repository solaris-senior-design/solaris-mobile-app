import 'package:flutter/material.dart';

import '../models/metric_line_chart.dart';
import '../utils/constants.dart';
import 'metric_line_chart.dart';

class MetricLineChartBuilder extends StatefulWidget {
  final Future<MetricLineChart> futureLineChart;
  const MetricLineChartBuilder({
    required this.futureLineChart,
    Key? key,
  }) : super(key: key);

  @override
  State<MetricLineChartBuilder> createState() => _MetricLineChartBuilderState();
}

class _MetricLineChartBuilderState extends State<MetricLineChartBuilder> {
  Widget createMetricLineChartView(context, snapshot) {
    MetricLineChart lineChart = snapshot.data as MetricLineChart;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          alignment: WrapAlignment.start,
          children: [
            MetricLineChartCard(
                title: 'Voltage',
                parameter: 'voltage',
                color: kThemeRedLineColor,
                xLabels: lineChart.getMetricTimeStamps(),
                metricPoints: lineChart.getVoltageSpots()),
            MetricLineChartCard(
                title: 'Current',
                parameter: 'current',
                color: kThemeYellowLineColor,
                xLabels: lineChart.getMetricTimeStamps(),
                metricPoints: lineChart.getCurrentSpots()),
            MetricLineChartCard(
                title: 'Battery Capacity',
                parameter: 'batteryCapacity',
                color: kThemeGreenLineColor,
                xLabels: lineChart.getMetricTimeStamps(),
                metricPoints: lineChart.getBatteryCapacitySpots()),
            MetricLineChartCard(
                title: 'Temperature',
                parameter: 'temperature',
                color: kThemePinkLineColor,
                xLabels: lineChart.getMetricTimeStamps(),
                metricPoints: lineChart.getTemperatureSpots()),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.futureLineChart,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(
              color: kThemePrimaryColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          return createMetricLineChartView(context, snapshot);
        } else {
          return const Text(
              'No data could be fetched! Check the Solaris web server for more info.');
        }
      },
    );
  }
}
