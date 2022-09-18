import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:solaris_mobile_app/models/record.dart';
import 'package:solaris_mobile_app/utils/date_formatter.dart';

class MetricLineChart {
  final List<Record> _dataPoints;
  MetricLineChart(this._dataPoints);

  factory MetricLineChart.fromJson(Map<String, dynamic> json) {
    List<Record> points =
        (json["records"] as List).map((e) => Record.fromJson(e)).toList();
    return MetricLineChart(points);
  }

  List<String> getMetricTimeStamps() {
    return _dataPoints.map((e) {
      return currentDayFormatter.format(e.createdAt.toLocal());
    }).toList();
  }

  List<FlSpot> getVoltageSpots() {
    List<FlSpot> spots = [];
    for (int i = 0; i < _dataPoints.length; i++) {
      spots.add(FlSpot(i.toDouble(), _dataPoints[i].voltage.value));
    }
    return spots;
  }

  List<FlSpot> getCurrentSpots() {
    List<FlSpot> spots = [];
    for (int i = 0; i < _dataPoints.length; i++) {
      spots.add(FlSpot(i.toDouble(), _dataPoints[i].current.value));
    }
    return spots;
  }

  List<FlSpot> getBatteryCapacitySpots() {
    List<FlSpot> spots = [];
    for (int i = 0; i < _dataPoints.length; i++) {
      spots.add(FlSpot(i.toDouble(), _dataPoints[i].batteryCapacity.value));
    }
    return spots;
  }

  List<FlSpot> getTemperatureSpots() {
    List<FlSpot> spots = [];
    for (int i = 0; i < _dataPoints.length; i++) {
      spots.add(FlSpot(i.toDouble(), _dataPoints[i].temperature.value));
    }
    return spots;
  }
}
