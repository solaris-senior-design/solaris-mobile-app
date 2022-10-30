import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:solaris_mobile_app/widgets/power_bar_chart_builder.dart';
import '../models/metric_bar_chart.dart';
import '../models/user.dart';
import '../utils/constants.dart';
import '../utils/get_local_json.dart';

class PowerBarChartSection extends StatefulWidget {
  final User user;
  const PowerBarChartSection({Key? key, required this.user}) : super(key: key);

  @override
  State<PowerBarChartSection> createState() => _PowerBarChartSectionState();
}

class _PowerBarChartSectionState extends State<PowerBarChartSection> {
  late Future<MetricBarChart> futureBarChart;

  @override
  void initState() {
    super.initState();
    futureBarChart = fetchBarChartData();
  }

  Future<MetricBarChart> fetchBarChartData() async {
    Map<String, dynamic> barChartData =
        json.decode(await getLocalBarChartJson());
    // Map<String, dynamic> barChartData = await NetworkHelper.getData(
    //   httpClient,
    //   Uri(
    //       scheme: 'https',
    //       host: 'solaris-web-server.herokuapp.com',
    //       path: 'records/weekly_records/1'),
    // ); // 'https://solaris-web-server.herokuapp.com'
    return MetricBarChart.fromJson(barChartData);
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
              children: const [
                Text(
                  'Summary',
                  style: kDashboardHeadingTextStyle,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    '(last 7 days)',
                    style: kMetricsHeadingTextStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
        PowerBarChartBuilder(
          futureBarChart: futureBarChart,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
      ],
    );
  }
}
