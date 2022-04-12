import 'battery_capacity.dart';
import 'temperature.dart';
import 'current.dart';
import 'irradiance.dart';
import 'voltage.dart';

class MetricsModel {
  final Voltage voltage;
  final Current current;
  final Temperature temperature;
  final Irradiance irradiance;
  final BatteryCapacity batteryCapacity;

  const MetricsModel(
      {required this.voltage,
      required this.current,
      required this.temperature,
      required this.irradiance,
      required this.batteryCapacity});

  factory MetricsModel.fromJson(Map<String, dynamic> json) {
    return MetricsModel(
      voltage: Voltage.fromJson(json),
      current: Current.fromJson(json),
      temperature: Temperature.fromJson(json),
      irradiance: Irradiance.fromJson(json),
      batteryCapacity: BatteryCapacity.fromJson(json),
    );
  }
}
