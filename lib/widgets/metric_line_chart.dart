import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class MetricLineChartCard extends StatefulWidget {
  const MetricLineChartCard({
    Key? key,
  }) : super(key: key);

  @override
  State<MetricLineChartCard> createState() => _MetricLineChartCard();
}

class _MetricLineChartCard extends State<MetricLineChartCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
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
                    gridData: FlGridData(show: true),
                    titlesData: FlTitlesData(show: true),
                    borderData: FlBorderData(show: true),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          const FlSpot(0, 0),
                          const FlSpot(1, 5),
                          const FlSpot(2, 2),
                          const FlSpot(5, 7),
                          const FlSpot(6, 0),
                          const FlSpot(7, 0),
                          const FlSpot(8, 0),
                          const FlSpot(9, 3),
                          const FlSpot(10, 8),
                          const FlSpot(13, 0),
                          const FlSpot(14, 9),
                          const FlSpot(15, 0),
                          const FlSpot(18, 12),
                          const FlSpot(19, 4),
                          const FlSpot(20, 0),
                          const FlSpot(21, 5),
                          const FlSpot(22, 0),
                          const FlSpot(23, 0),
                        ],
                        isCurved: true,
                        barWidth: 3,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                        ),
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
