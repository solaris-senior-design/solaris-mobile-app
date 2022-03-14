import 'package:flutter/material.dart';
import 'package:solaris_mobile_app/models/metrics_model.dart';
import 'package:solaris_mobile_app/widgets/metric_card.dart';
import '../models/metric.dart';
import '../utils/constants.dart';

class DashboardScreen extends StatefulWidget {
  final MetricsModel metricsModel;

  const DashboardScreen({Key? key, required this.metricsModel})
      : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    List<Metric> dataMetrics = widget.metricsModel.getDataMetrics();

    List<MetricCard> metricCards = List.generate(
        dataMetrics.length,
        (i) => MetricCard(
            parameter: dataMetrics[i].parameter,
            value: dataMetrics[i].value,
            units: dataMetrics[i].units));

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
                    children: const [
                      Text(
                        'Metrics',
                        style: kDashboardHeadingTextStyle,
                      ),
                      Icon(
                        Icons.account_circle_outlined,
                        size: 30.0,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Wrap(
                        alignment: WrapAlignment.start,
                        children: [for (MetricCard m in metricCards) m],
                      ),
                    ],
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
