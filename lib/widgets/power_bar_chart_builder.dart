import 'package:flutter/material.dart';
import 'package:solaris_mobile_app/models/metric_bar_chart.dart';
import 'package:solaris_mobile_app/widgets/power_bar_chart_card.dart';
import '../utils/constants.dart';

class PowerBarChartBuilder extends StatefulWidget {
  final Future<MetricBarChart> futureBarChart;
  const PowerBarChartBuilder({
    required this.futureBarChart,
    Key? key,
  }) : super(key: key);

  @override
  State<PowerBarChartBuilder> createState() => _PowerBarChartBuilderState();
}

class _PowerBarChartBuilderState extends State<PowerBarChartBuilder> {
  Widget createMetricBarChartView(context, snapshot) {
    MetricBarChart barChart = snapshot.data as MetricBarChart;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PowerBarChartCard(
          xLabels: barChart.getMetricTimeStamps(),
          metricPoints: barChart.getPowerSpots(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.futureBarChart,
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
          return createMetricBarChartView(context, snapshot);
        } else {
          return const Text(
              'No data could be fetched! Check the Solaris web server for more info.');
        }
      },
    );
  }
}
