import 'package:flutter/material.dart';
import '../models/metric.dart';
import '../models/record.dart';
import '../utils/constants.dart';
import '../utils/date_formatter.dart';
import 'metric_card.dart';

class MetricCardBuilder extends StatefulWidget {
  final Future<Record> futureRecord;
  const MetricCardBuilder({
    required this.futureRecord,
    Key? key,
  }) : super(key: key);

  @override
  State<MetricCardBuilder> createState() => _MetricCardBuilderState();
}

class _MetricCardBuilderState extends State<MetricCardBuilder> {
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
    return FutureBuilder(
      future: widget.futureRecord,
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
    );
  }
}
