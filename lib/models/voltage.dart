import 'package:solaris_mobile_app/models/metric.dart';

class Voltage extends Metric {
  Voltage({parameter, required value, units})
      : super(parameter, units, value: value);

  factory Voltage.fromJson(Map<String, dynamic> json) {
    return Voltage(
        parameter: "Voltage", value: json['voltage'], units: "Volts");
  }
}
