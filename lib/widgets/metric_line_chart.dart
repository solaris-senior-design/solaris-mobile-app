import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:solaris_mobile_app/utils/mock_line_chart_data.dart';

import '../utils/constants.dart';

class MetricLineChartCard extends StatefulWidget {
  const MetricLineChartCard({
    Key? key,
  }) : super(key: key);

  @override
  State<MetricLineChartCard> createState() => _MetricLineChartCard();
}

class _MetricLineChartCard extends State<MetricLineChartCard> {
  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 0:
              text = '12:00';
              break;
            case 1:
              text = '12:15';
              break;
            case 2:
              text = '12:30';
              break;
            case 3:
              text = '12:45';
              break;
            case 4:
              text = '1:00';
              break;
          }

          return Text(text);
        },
        interval: 1.0,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8.0,
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
                  const Text(
                    'Voltage',
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
              AspectRatio(
                aspectRatio: 1.5,
                child: LineChart(
                  LineChartData(
                    lineTouchData: LineTouchData(enabled: true),
                    gridData: FlGridData(
                        drawHorizontalLine: true, drawVerticalLine: true),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    borderData: FlBorderData(show: true),
                    lineBarsData: [
                      LineChartBarData(
                        spots: mockLineChartData,
                        color: kThemeSecondaryColor,
                        isCurved: true,
                        barWidth: 3,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: true),
                      ),
                    ],
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
