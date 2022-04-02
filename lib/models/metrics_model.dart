import 'battery_capacity.dart';
import 'metric.dart';
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
      voltage: Voltage.fromJson(json["sensor_data"]),
      current: Current.fromJson(json["sensor_data"]),
      temperature: Temperature.fromJson(json["sensor_data"]),
      irradiance: Irradiance.fromJson(json["sensor_data"]),
      batteryCapacity: BatteryCapacity.fromJson(json["sensor_data"]),
    );
  }

  List<Metric> getDataMetrics() {
    return [voltage, current, temperature, batteryCapacity];
  }
}
