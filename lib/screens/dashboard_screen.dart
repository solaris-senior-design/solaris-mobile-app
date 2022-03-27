import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:solaris_mobile_app/models/metrics_model.dart';
import 'package:solaris_mobile_app/widgets/metric_card.dart';
import '../models/metric.dart';
import '../models/network_helper.dart';
import '../utils/constants.dart';
import '../utils/get_local_json.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final Future<MetricsModel> metricsModel;

  @override
  void initState() {
    super.initState();
    metricsModel = fetchData();
  }

  Future<MetricsModel> fetchData() async {
    NetworkHelper networkHelper = NetworkHelper(
      Uri(
          scheme: 'https',
          host: 'solaris-web-server.herokuapp.com',
          path: 'record'),
    ); // 'https://solaris-web-server.herokuapp.com'
    // Map<String, dynamic> data = json.decode(await getLocalJson());
    Map<String, dynamic> data = await networkHelper.getData();
    return MetricsModel.fromJson(data["data"]);
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
                  FutureBuilder(
                      future: metricsModel,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          MetricsModel mModel = snapshot.data as MetricsModel;
                          return Wrap(
                            alignment: WrapAlignment.start,
                            children: [
                              for (MetricCard m
                                  in getMetricCards(mModel.getDataMetrics()))
                                m
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        return const Center(
                          child: CircularProgressIndicator(
                            color: kThemePrimaryColor,
                          ),
                        );
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
