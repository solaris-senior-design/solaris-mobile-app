import 'package:solaris_mobile_app/models/metric.dart';

class BatteryCapacityCurrent extends Metric {
  BatteryCapacityCurrent({parameter, value, units})
      : super(parameter, value, units);

  factory BatteryCapacityCurrent.fromJson(double value) {
    return BatteryCapacityCurrent(
        parameter: "Battery Capacity Current",
        value: (value > 7.0) ? 7.0 : value,
        units: "Amp Hours");
  }
}
