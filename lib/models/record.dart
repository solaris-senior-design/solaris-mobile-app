import 'package:solaris_mobile_app/models/metrics_model.dart';
import 'metric.dart';

class Record {
  final DateTime _createdAt;
  final MetricsModel _metricsModel;

  Record(this._createdAt, this._metricsModel);

  factory Record.fromJson(Map<String, dynamic> json) {
    DateTime time = DateTime.parse(json["createdAt"]).toLocal();
    MetricsModel metricsModel = MetricsModel.fromJson(json);

    return Record(time, metricsModel);
  }

  DateTime get createdAt {
    return _createdAt;
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
