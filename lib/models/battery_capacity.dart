import 'package:solaris_mobile_app/models/metric.dart';

class BatteryCapacity extends Metric {
  BatteryCapacity({parameter, value, units}) : super(parameter, value, units);

  factory BatteryCapacity.fromJson(Map<String, dynamic> json) {
    return BatteryCapacity(
        parameter: "Battery Capacity",
        value: json['battery_capacity'] ?? 0.0,
        units: "Percentage");
  }
}
