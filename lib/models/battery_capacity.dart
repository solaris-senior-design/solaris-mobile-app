import 'package:solaris_mobile_app/models/metric.dart';

class BatteryCapacity extends Metric {
  BatteryCapacity({parameter, required value, units})
      : super(parameter, units, value: value);

  factory BatteryCapacity.fromJson(Map<String, dynamic> json) {
    return BatteryCapacity(
        parameter: "Battery Capacity",
        value: json['battery_capacity'],
        units: "Percentage");
  }
}
