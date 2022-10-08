import 'dart:async';
import 'package:flutter/material.dart';
import '../globals/globals.dart';
import '../models/metric_line_chart.dart';
import '../models/network_helper.dart';
import '../utils/constants.dart';
import 'metric_line_chart_builder.dart';

class MetricLineChartSection extends StatefulWidget {
  const MetricLineChartSection({Key? key}) : super(key: key);

  @override
  State<MetricLineChartSection> createState() => _MetricLineChartSectionState();
}

class _MetricLineChartSectionState extends State<MetricLineChartSection> {
  late Future<MetricLineChart> futureLineChart;

  @override
  void initState() {
    super.initState();
    futureLineChart = fetchLineChartData();
    Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        futureLineChart = fetchLineChartData();
      });
    });
  }

  Future<MetricLineChart> fetchLineChartData() async {
    // Map<String, dynamic> lineChartData =
    // json.decode(await getLocalLineChartJson());
    Map<String, dynamic> lineChartData = await NetworkHelper.getData(
      httpClient,
      Uri(
          scheme: 'https',
          host: 'solaris-web-server.herokuapp.com',
          path: 'records/list_of_recent_records/1'),
    ); // 'https://solaris-web-server.herokuapp.com'
    return MetricLineChart.fromJson(lineChartData);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Real-time Data',
          style: kDashboardHeadingTextStyle,
        ),
        MetricLineChartBuilder(
          futureLineChart: futureLineChart,
        ),
      ],
    );
  }
}
