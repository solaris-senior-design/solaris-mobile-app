import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class MetricLineChart {
  final List<Map<String, dynamic>> _dataPoints;
  MetricLineChart(this._dataPoints);

  factory MetricLineChart.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>> points = (json["voltageDataPoints"] as List)
        .map((e) => Map<String, dynamic>.from(e))
        .toList();
    return MetricLineChart(points);
  }

  List<Map<String, dynamic>> get dataPoints {
    return _dataPoints;
  }

  List<FlSpot> getMetricFlSpots() {
    return List.generate(dataPoints.length,
        (i) => FlSpot(i.toDouble(), dataPoints[i]["voltage"])).toList();
  }

  List<String> getMetricTimeStamps() {
    return dataPoints.map((e) {
      final dateFormat = DateFormat('h:mma');
      String date = dateFormat.format(DateTime.parse(e["createdAt"]).toLocal());
      return date;
    }).toList();
  }
}
