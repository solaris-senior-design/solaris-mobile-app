import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class MetricLineChartCard extends StatefulWidget {
  final String title;
  final String parameter;
  final Color color;
  final List<String> xLabels;
  final List<FlSpot> metricPoints;

  const MetricLineChartCard(
      {Key? key,
      required this.title,
      required this.parameter,
      required this.color,
      required this.xLabels,
      required this.metricPoints})
      : super(key: key);

  @override
  State<MetricLineChartCard> createState() => _MetricLineChartCard();
}

class _MetricLineChartCard extends State<MetricLineChartCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4.0,
          )
        ],
      ),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: kMetricLineChartHeadingText,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        splashRadius: 20,
                        icon: const Icon(
                          Icons.chevron_right,
                          size: 30.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 10.0, top: 5.0, bottom: 5.0),
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: LineChart(
                    LineChartData(
                      lineTouchData: LineTouchData(enabled: true),
                      gridData: FlGridData(
                        drawHorizontalLine: true,
                        drawVerticalLine: true,
                        getDrawingHorizontalLine: (value) => FlLine(
                          color: kThemeBorderLineColor,
                          strokeWidth: 1,
                        ),
                        getDrawingVerticalLine: (value) => FlLine(
                          color: kThemeBorderLineColor,
                          strokeWidth: 1,
                        ),
                      ),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                              showTitles: true,
                              interval: 1,
                              getTitlesWidget: (value, meta) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 6.0),
                                  child: Text(
                                    widget.xLabels[value.toInt()],
                                    style: kMetricLineChartBorderText,
                                  ),
                                );
                              }),
                        ),
                        leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 35,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toStringAsFixed(2),
                                    style: kMetricLineChartBorderText,
                                  );
                                })),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                      ),
                      borderData: FlBorderData(
                          border: Border.all(color: kThemeBorderLineColor)),
                      lineBarsData: [
                        LineChartBarData(
                          spots: widget.metricPoints,
                          color: widget.color,
                          isCurved: true,
                          barWidth: 3,
                          dotData: FlDotData(show: true),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
