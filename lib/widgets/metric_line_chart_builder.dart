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
                parameter: 'voltage',
                graphColor: kThemeRedLineColor,
                lineChartController: lineChart),
            MetricLineChartCard(
                parameter: 'current',
                graphColor: kThemeYellowLineColor,
                lineChartController: lineChart),
            MetricLineChartCard(
                parameter: 'batteryCapacity',
                graphColor: kThemeGreenLineColor,
                lineChartController: lineChart),
            MetricLineChartCard(
                parameter: 'temperature',
                graphColor: kThemePinkLineColor,
                lineChartController: lineChart)
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
