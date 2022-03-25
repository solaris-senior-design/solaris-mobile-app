import 'package:solaris_mobile_app/models/metric.dart';

class Temperature extends Metric {
  Temperature({parameter, value, units}) : super(parameter, value, units);

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(
        parameter: "Temperature",
        value: json['temperature'].toDouble(),
        units: "Celsius");
  }
}
