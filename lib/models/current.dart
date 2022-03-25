import 'package:solaris_mobile_app/models/metric.dart';

class Current extends Metric {
  Current({parameter, value, units}) : super(parameter, value, units);

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
        parameter: "Current", value: json['current'].toDouble(), units: "Amps");
  }
}
