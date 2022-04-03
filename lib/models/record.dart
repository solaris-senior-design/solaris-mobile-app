import 'package:solaris_mobile_app/models/metrics_model.dart';
import 'metric.dart';

class Record {
  final DateTime _timestamp;
  final MetricsModel _metricsModel;

  Record(this._timestamp, this._metricsModel);

  factory Record.fromJson(Map<String, dynamic> json) {
    DateTime time = DateTime.parse(json["date_time"]).toLocal();
    MetricsModel metricsModel = MetricsModel.fromJson(json);

    return Record(time, metricsModel);
  }

  DateTime get timestamp {
    return _timestamp;
  }

  MetricsModel get metricsModel {
    return _metricsModel;
  }

  List<Metric> getDataMetrics() {
    return [
      metricsModel.voltage,
      metricsModel.current,
      metricsModel.temperature,
      metricsModel.batteryCapacity
    ];
  }
}
