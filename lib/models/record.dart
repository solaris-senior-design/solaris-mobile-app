import 'temperature.dart';
import 'voltage.dart';
import 'battery_capacity.dart';
import 'current.dart';
import 'irradiance.dart';
import 'metric.dart';

class Record {
  final DateTime _createdAt;
  final Voltage _voltage;
  final Current _current;
  final Temperature _temperature;
  final Irradiance _irradiance;
  final BatteryCapacity _batteryCapacity;

  Record(this._createdAt, this._voltage, this._current, this._temperature,
      this._irradiance, this._batteryCapacity);

  factory Record.fromJson(Map<String, dynamic> json) {
    DateTime time = DateTime.parse(json["createdAt"]).toLocal();
    Voltage voltage = Voltage.fromJson(json);
    Current current = Current.fromJson(json);
    Temperature temperature = Temperature.fromJson(json);
    Irradiance irradiance = Irradiance.fromJson(json);
    BatteryCapacity batteryCapacity = BatteryCapacity.fromJson(json);

    return Record(
        time, voltage, current, temperature, irradiance, batteryCapacity);
  }

  List<Metric> getDataMetrics() {
    return [_voltage, _current, _temperature, _batteryCapacity, _irradiance];
  }

  DateTime get createdAt {
    return _createdAt;
  }

  double get voltage {
    return _voltage.value;
  }

  double get current {
    return _current.value;
  }

  double get temperature {
    return _temperature.value;
  }

  double get irradiance {
    return _irradiance.value;
  }

  double get batteryCapacity {
    return _batteryCapacity.value;
  }
}
