import 'package:solaris_mobile_app/models/metric.dart';

class Irradiance extends Metric {
  Irradiance({parameter, value, units}) : super(parameter, value, units);

  factory Irradiance.fromJson(Map<String, dynamic> json) {
    return Irradiance(
        parameter: "Irradiance",
        value: (json.containsKey("irradiance"))
            ? json['irradiance'].toDouble()
            : 0.0,
        units: "Lumens");
  }
}
