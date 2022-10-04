import 'package:solaris_mobile_app/models/record.dart';
import 'package:solaris_mobile_app/utils/date_formatter.dart';

class MetricBarChart {
  final Map<String, List<Record>> _dataPoints;
  MetricBarChart(this._dataPoints);

  factory MetricBarChart.fromJson(Map<String, dynamic> json) {
    List<Record> points =
        (json["records"] as List).map((e) => Record.fromJson(e)).toList();

    Map<String, List<Record>> groupedByDate = {};
    for (Record r in points) {
      String date = monthDayFormatter.format(r.createdAt);
      if (groupedByDate.containsKey(date)) {
        groupedByDate[date]!.add(r);
      } else {
        groupedByDate[date] = [r];
      }
    }

    return MetricBarChart(groupedByDate);
  }

  List<String> getMetricTimeStamps() {
    return _dataPoints.keys.toList();
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
