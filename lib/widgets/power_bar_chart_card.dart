import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class PowerBarChartCard extends StatefulWidget {
  const PowerBarChartCard({
    Key? key,
  }) : super(key: key);

  @override
  State<PowerBarChartCard> createState() => _PowerBarChartCard();
}

class _PowerBarChartCard extends State<PowerBarChartCard> {
  final List<double> _barVals = [100, 125, 75, 50, 150, 100, 25];

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
                  const Text(
                    "Power Generated",
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
                  child: BarChart(
                    BarChartData(
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
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 25,
                            getTitlesWidget: (value, meta) {
                              return Text(value.toStringAsFixed(1),
                                  style: kMetricLineChartBorderText);
                            },
                          ),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              String day = '';
                              switch (value.toInt()) {
                                case 0:
                                  day = 'Sun';
                                  break;
                                case 1:
                                  day = 'Mon';
                                  break;
                                case 2:
                                  day = 'Tue';
                                  break;
                                case 3:
                                  day = 'Wed';
                                  break;
                                case 4:
                                  day = 'Thu';
                                  break;
                                case 5:
                                  day = 'Fri';
                                  break;
                                case 6:
                                  day = 'Sat';
                                  break;
                              }
                              return Text(day,
                                  style: kMetricLineChartBorderText);
                            },
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                          border: Border.all(color: kThemeBorderLineColor)),
                      barGroups: [
                        for (int i = 0; i < _barVals.length; i++)
                          BarChartGroupData(
                            x: i,
                            barRods: [
                              BarChartRodData(
                                fromY: 0,
                                toY: _barVals[i],
                                color: kThemePrimaryColor,
                                width: 20,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                ),
                              ),
                            ],
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
