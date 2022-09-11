import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:solaris_mobile_app/widgets/metric_card.dart';
import 'package:solaris_mobile_app/widgets/metric_line_chart.dart';
import '../models/metric.dart';
import '../models/network_helper.dart';
import '../models/record.dart';
import '../utils/constants.dart';
import '../utils/get_local_json.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Future<Record> record;
  late DateTime time;
  final currentDayFormatter = DateFormat('h:mm a');
  final recordDateFormatter = DateFormat.yMd().add_jm();

  @override
  void initState() {
    super.initState();
    record = fetchMetricCardData();
  }

  Future<Record> fetchMetricCardData() async {
    time = DateTime.now();
    NetworkHelper networkHelper = NetworkHelper(
      Uri(
          scheme: 'https',
          host: 'solaris-web-server.herokuapp.com',
          path: 'findRecentRecord'),
    ); // 'https://solaris-web-server.herokuapp.com'
    // Map<String, dynamic> data = json.decode(await getLocalJson());
    Map<String, dynamic> data = await networkHelper.getData();
    return Record.fromJson(data);
  }

  List<MetricCard> getMetricCards(List<Metric> metrics) {
    return List.generate(
        metrics.length,
        (i) => MetricCard(
              parameter: metrics[i].parameter,
              value: metrics[i].value,
              units: metrics[i].units,
            ));
  }

  Widget createMetricCardView(context, snapshot) {
    Record record = snapshot.data as Record;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Record Timestamp: ${recordDateFormatter.format(record.createdAt)}',
          style: kDashboardTimeBodyText,
        ),
        Wrap(
          alignment: WrapAlignment.start,
          children: [
            for (MetricCard m in getMetricCards(record.getDataMetrics())) m,
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThemeOffWhiteColor,
      body: LayoutBuilder(
        builder: (context, constraints) => ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'solaris',
                      style: kDashboardLogoTextStyle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          const Text(
                            'Metrics',
                            style: kDashboardHeadingTextStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              '(refreshed at ${currentDayFormatter.format(time)})',
                              style: kMetricsHeadingTextStyle,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                record = fetchMetricCardData();
                                time = DateTime.now();
                              });
                            },
                            splashRadius: 20,
                            icon: const Icon(
                              Icons.refresh,
                              size: 25.0,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  FutureBuilder(
                    future: record,
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
                        return createMetricCardView(context, snapshot);
                      } else {
                        return const Text(
                            'No data could be fetched! Check the Solaris web server for more info.');
                      }
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const MetricLineChartCard(
                    parameter: 'Voltage',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
