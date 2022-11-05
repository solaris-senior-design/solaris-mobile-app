import 'dart:async';
import 'package:flutter/material.dart';
import '../globals/globals.dart';
import '../models/metric_line_chart.dart';
import '../models/network_helper.dart';
import '../models/user.dart';
import '../utils/constants.dart';
import 'metric_line_chart_builder.dart';

class MetricLineChartSection extends StatefulWidget {
  final User user;
  const MetricLineChartSection({Key? key, required this.user})
      : super(key: key);

  @override
  State<MetricLineChartSection> createState() => _MetricLineChartSectionState();
}

class _MetricLineChartSectionState extends State<MetricLineChartSection> {
  late Future<MetricLineChart> futureLineChart;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    futureLineChart = fetchLineChartData();
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        futureLineChart = fetchLineChartData();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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
