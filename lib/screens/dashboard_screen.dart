import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:solaris_mobile_app/widgets/metric_card.dart';
import '../models/metric.dart';
import '../models/network_helper.dart';
import '../models/record.dart';
import '../utils/constants.dart';
import '../utils/get_local_json.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Future<Record> record;
  late DateTime time;

  @override
  void initState() {
    super.initState();
    record = fetchData();
  }

  Future<Record> fetchData() async {
    time = DateTime.now();
    NetworkHelper networkHelper = NetworkHelper(
      Uri(
          scheme: 'https',
          host: 'solaris-web-server.herokuapp.com',
          path: 'record'),
    ); // 'https://solaris-web-server.herokuapp.com'
    // Map<String, dynamic> data = json.decode(await getLocalJson());
    Map<String, dynamic> data = await networkHelper.getData();
    return Record.fromJson(data["data"]["record"]);
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

  Widget createDashboardView(context, snapshot) {
    Record record = snapshot.data as Record;
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.start,
          children: [
            for (MetricCard m in getMetricCards(record.getDataMetrics())) m,
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Record Timestamp:',
                style: kDashboardTimeHeadingText,
              ),
              Text(
                '${record.timestamp}',
                style: kDashboardTimeBodyText,
              ),
              const Text(
                'Last Refreshed:',
                style: kDashboardTimeHeadingText,
              ),
              Text(
                '$time',
                style: kDashboardTimeBodyText,
              )
            ],
          ),
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
                      const Text(
                        'Metrics',
                        style: kDashboardHeadingTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                record = fetchData();
                                time = DateTime.now();
                              });
                            },
                            icon: const Icon(
                              Icons.refresh,
                              size: 30.0,
                            ),
                          ),
                          const Icon(
                            Icons.account_circle_outlined,
                            size: 30.0,
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
                        return createDashboardView(context, snapshot);
                      } else {
                        return const Text(
                            'No data could be fetched! Check the Solaris web server for more info.');
                      }
                    },
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
