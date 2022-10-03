import 'package:solaris_mobile_app/models/record.dart';
import 'package:solaris_mobile_app/utils/date_formatter.dart';

class MetricBarChart {
  final Map<DateTime, List<Record>> _dataPoints;
  MetricBarChart(this._dataPoints);

  factory MetricBarChart.fromJson(Map<String, dynamic> json) {
    List<Record> points =
        (json["records"] as List).map((e) => Record.fromJson(e)).toList();

    Map<DateTime, List<Record>> groupedByDate = {};
    for (Record r in points) {
      if (groupedByDate.containsKey(r.createdAt)) {
        groupedByDate[r.createdAt]!.add(r);
      } else {
        groupedByDate[r.createdAt] = [r];
      }
    }

    return MetricBarChart(groupedByDate);
  }

  List<String> getMetricTimeStamps() {
    return _dataPoints.keys.map((e) => monthDayFormatter.format(e)).toList();
  }

  List<double> getPowerSpots() {
    List<List<Record>> mapValues = _dataPoints.values.toList();
    List<double> powerVals = [];
    for (List<Record> l in mapValues) {
      double sum = 0;
      for (Record r in l) {
        sum += r.voltage * r.current;
      }
      sum = sum / l.length;
      powerVals.add(sum);
    }
    return powerVals;
  }
}
