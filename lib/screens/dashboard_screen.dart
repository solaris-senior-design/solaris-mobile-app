import 'package:flutter/material.dart';
import 'package:solaris_mobile_app/widgets/metric_card.dart';

import '../utils/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Map<String, dynamic>> dataMetrics = [
    {"parameter": "Voltage", "value": 57.4, "units": "Volts"},
    {"parameter": "Current", "value": 12.3, "units": "Amps"},
    {"parameter": "Temperature", "value": 34.5, "units": "Celsius"},
    {"parameter": "Irradiance", "value": 2.4, "units": "Lumens"},
    {"parameter": "Battery Capacity", "value": 56.0, "units": "Percent"},
  ];

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
                children: [
                  const Text(
                    'solaris',
                    style: kDashboardLogoTextStyle,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MetricCard(
                            parameter: dataMetrics[0]["parameter"],
                            value: dataMetrics[0]["value"],
                            units: dataMetrics[0]["units"],
                          ),
                          MetricCard(
                            parameter: dataMetrics[1]["parameter"],
                            value: dataMetrics[1]["value"],
                            units: dataMetrics[1]["units"],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MetricCard(
                            parameter: dataMetrics[2]["parameter"],
                            value: dataMetrics[2]["value"],
                            units: dataMetrics[2]["units"],
                          ),
                          MetricCard(
                            parameter: dataMetrics[3]["parameter"],
                            value: dataMetrics[3]["value"],
                            units: dataMetrics[3]["units"],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MetricCard(
                            parameter: dataMetrics[4]["parameter"],
                            value: dataMetrics[4]["value"],
                            units: dataMetrics[4]["units"],
                          ),
                        ],
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
