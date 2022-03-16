import 'package:flutter_test/flutter_test.dart';
import 'package:solaris_mobile_app/models/voltage.dart';

void main() {
  test("creates a valid voltage instance", () async {
    final Map<String, dynamic> testJson = {"voltage": 21.2};
    Voltage voltage = Voltage.fromJson(testJson);
    expect(voltage.parameter, "Voltage");
    expect(voltage.value, 21.2);
    expect(voltage.units, "Volts");
  });

  test("creates an valid voltage instance from empty JSON key", () async {
    final Map<String, dynamic> testJson = {"current": 12.2};
    Voltage voltage = Voltage.fromJson(testJson);
    expect(voltage.parameter, "Voltage");
    expect(voltage.value, 0.0);
    expect(voltage.units, "Volts");
  });
}
