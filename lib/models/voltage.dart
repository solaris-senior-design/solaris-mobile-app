import 'package:solaris_mobile_app/models/metric.dart';

class Voltage extends Metric {
  Voltage({parameter, value, units}) : super(parameter, value, units);

  factory Voltage.fromJson(Map<String, dynamic> json) {
    return Voltage(
        parameter: "Voltage", value: json['voltage'] ?? 0.0, units: "Volts");
  }
}
