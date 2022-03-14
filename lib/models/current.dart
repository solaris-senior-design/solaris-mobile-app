import 'package:solaris_mobile_app/models/metric.dart';

class Current extends Metric {
  Current({parameter, required value, units})
      : super(parameter, units, value: value);

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(parameter: "Current", value: json['current'], units: "Amps");
  }
}
