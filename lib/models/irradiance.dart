import 'package:solaris_mobile_app/models/metric.dart';

class Irradiance extends Metric {
  Irradiance({parameter, required value, units})
      : super(parameter, units, value: value);

  factory Irradiance.fromJson(Map<String, dynamic> json) {
    return Irradiance(
        parameter: "Irradiance", value: json['irradiance'], units: "Lumens");
  }
}
