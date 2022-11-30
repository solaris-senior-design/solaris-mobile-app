import 'dart:async';

import 'package:flutter/material.dart';
import '../globals/globals.dart';
import '../models/network_helper.dart';
import '../models/record.dart';
import '../models/user.dart';
import '../utils/constants.dart';
import '../utils/date_formatter.dart';
import 'metric_card_builder.dart';

class MetricCardSection extends StatefulWidget {
  final User user;
  const MetricCardSection({Key? key, required this.user}) : super(key: key);

  @override
  State<MetricCardSection> createState() => _MetricCardSectionState();
}

class _MetricCardSectionState extends State<MetricCardSection> {
  late DateTime time;
  late Future<Record> record;
  late Timer _timer;

  Future<Record> fetchMetricCardData() async {
    time = DateTime.now();
    Map<String, dynamic> data = await NetworkHelper.getData(
      httpClient,
      Uri(
          scheme: 'https',
          host: 'solaris-web-server.herokuapp.com',
          path: 'records/most_recent/1'),
    ); // 'https://solaris-web-server.herokuapp.com'
    // Map<String, dynamic> data = json.decode(await getLocalMetricCardJson());
    return Record.fromJson(data);
  }

  @override
  void initState() {
    super.initState();
    record = fetchMetricCardData();
    _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      setState(() {
        record = fetchMetricCardData();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        MetricCardBuilder(
          futureRecord: record,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
      ],
    );
  }
}
