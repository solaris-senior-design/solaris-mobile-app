import 'package:solaris_mobile_app/models/metric.dart';

class Temperature extends Metric {
  Temperature({parameter, required value, units})
      : super(parameter, units, value: value);

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(
        parameter: "Temperature", value: json['temperature'], units: "Celsius");
  }
}
